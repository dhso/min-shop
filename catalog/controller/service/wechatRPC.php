<?php
class ControllerServiceWechatRPC extends Controller {
    public function index() {
        $this->load->model('catalog/product');
        $this->load->model('tool/image');
        if (!isset($this->request->get['type'])) {
            $this->redirect($this->url->link('common/home', '', 'SSL'));
        }
        switch ($this->request->get['type']) {
            case 'bestseller':
                $this->bestseller(10);
                break;
            case 'featured':
                $this->featured(10);
                break;
            case 'latest':
                $this->latest(10);
                break;
            case 'search':
                if (isset($this->request->get['keyword'])) {
                    $this->search(10, $this->request->get['keyword']);
                } else {
                    $this->bestseller(10);
                }
                break;
            default:
                $this->redirect($this->url->link('common/home', '', 'SSL'));
        }
    }
    private function search($limit, $keyword) {
        $products = array();
        $data = array(
            'filter_name' => $keyword,
            'sort' => 'p.date_added',
            'order' => 'DESC',
            'start' => 0,
            'limit' => $limit
        );
        $results = $this->model_catalog_product->getProducts($data);
        $row = 0;
        foreach ($results as $result) {
            $row++;
            if ($result['image']) {
                $width = ($row > 1) ? 80 : 640;
                $height = ($row > 1) ? 80 : 320;
                $image = $this->model_tool_image->resize($result['image'], $width, $height);
            } else {
                $image = false;
            }
            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $price = false;
            }
            if ((float)$result['special']) {
                $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $special = false;
            }
            $products[] = array(
                'product_id' => $result['product_id'],
                'thumb' => $image,
                'name' => $result['name'],
                'price' => $price,
                'special' => $special,
                'href' => $this->url->link('product/product', 'product_id=' . $result['product_id']) ,
            );
        }
        $this->response->addHeader('Content-type: application/json');
        $this->response->setOutput(json_encode($products));
    }
    private function featured($limit) {
        $products = array();
        $results = explode(',', $this->config->get('featured_product'));
        $results = array_slice($results, 0, (int)$limit);
        $row = 0;
        foreach ($results as $product_id) {
            $row++;
            $product_info = $this->model_catalog_product->getProduct($product_id);
            if ($product_info) {
                if ($product_info['image']) {
                    $width = ($row > 1) ? 80 : 640;
                    $height = ($row > 1) ? 80 : 320;
                    $image = $this->model_tool_image->resize($product_info['image'], $width, $height);
                } else {
                    $image = false;
                }
                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
                } else {
                    $price = false;
                }
                if ((float)$product_info['special']) {
                    $special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
                } else {
                    $special = false;
                }
                $products[] = array(
                    'product_id' => $product_info['product_id'],
                    'thumb' => $image,
                    'name' => $product_info['name'],
                    'price' => $price,
                    'special' => $special,
                    'href' => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
                );
            }
        }
        $this->response->addHeader('Content-type: application/json');
        $this->response->setOutput(json_encode($products));
    }
    private function latest($limit) {
        $products = array();
        $data = array(
            'sort' => 'p.date_added',
            'order' => 'DESC',
            'start' => 0,
            'limit' => $limit
        );
        $results = $this->model_catalog_product->getProducts($data);
        $row = 0;
        foreach ($results as $result) {
            $row++;
            if ($result['image']) {
                $width = ($row > 1) ? 80 : 640;
                $height = ($row > 1) ? 80 : 320;
                $image = $this->model_tool_image->resize($result['image'], $width, $height);
            } else {
                $image = false;
            }
            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $price = false;
            }
            if ((float)$result['special']) {
                $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $special = false;
            }
            $products[] = array(
                'product_id' => $result['product_id'],
                'thumb' => $image,
                'name' => $result['name'],
                'price' => $price,
                'special' => $special,
                'href' => $this->url->link('product/product', 'product_id=' . $result['product_id']) ,
            );
        }
        $this->response->addHeader('Content-type: application/json');
        $this->response->setOutput(json_encode($products));
    }
    private function bestseller($limit) {
        $products = array();
        $results = $this->model_catalog_product->getBestSellerProducts($limit);
        $row = 0;
        foreach ($results as $result) {
            $row++;
            if ($result['image']) {
                $width = ($row > 1) ? 80 : 640;
                $height = ($row > 1) ? 80 : 320;
                $image = $this->model_tool_image->resize($result['image'], $width, $height);
            } else {
                $image = false;
            }
            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $price = false;
            }
            if ((float)$result['special']) {
                $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $special = false;
            }
            $products[] = array(
                'product_id' => $result['product_id'],
                'thumb' => $image,
                'name' => $result['name'],
                'price' => $price,
                'special' => $special,
                'href' => $this->url->link('product/product', 'product_id=' . $result['product_id']) ,
            );
        }
        $this->response->addHeader('Content-type: application/json');
        $this->response->setOutput(json_encode($products));
    }
}
?>
