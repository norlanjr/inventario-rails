require 'test_helper'

class DetailInvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detail_invoice = detail_invoices(:one)
  end

  test "should get index" do
    get detail_invoices_url
    assert_response :success
  end

  test "should get new" do
    get new_detail_invoice_url
    assert_response :success
  end

  test "should create detail_invoice" do
    assert_difference('DetailInvoice.count') do
      post detail_invoices_url, params: { detail_invoice: { article_id: @detail_invoice.article_id, bill_id: @detail_invoice.bill_id, cantidad: @detail_invoice.cantidad, sub_total: @detail_invoice.sub_total } }
    end

    assert_redirected_to detail_invoice_url(DetailInvoice.last)
  end

  test "should show detail_invoice" do
    get detail_invoice_url(@detail_invoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_detail_invoice_url(@detail_invoice)
    assert_response :success
  end

  test "should update detail_invoice" do
    patch detail_invoice_url(@detail_invoice), params: { detail_invoice: { article_id: @detail_invoice.article_id, bill_id: @detail_invoice.bill_id, cantidad: @detail_invoice.cantidad, sub_total: @detail_invoice.sub_total } }
    assert_redirected_to detail_invoice_url(@detail_invoice)
  end

  test "should destroy detail_invoice" do
    assert_difference('DetailInvoice.count', -1) do
      delete detail_invoice_url(@detail_invoice)
    end

    assert_redirected_to detail_invoices_url
  end
end
