module ApplicationHelper

  ROOT_NODE=[1,1]

  CONTROLLER_MAP={
      'page1' => 1,
      'page2' => 2,
      'page3' => 3,
      'page4' => 4,
      'page5' => 5,
      'page6' => 6,
      'page7' => 7,
      'page8' => 8,
      'page9' => 9,
      'page10' => 10,
  }


  VIEW_MAP={
      'page1' => {
          'view1' => 1,
          'view2' => 2,
          'view3' => 3,
          'view4' => 4,
          'view5' => 5,
          'view6' => 6,
          'view7' => 7,
          'view8' => 8,
          'view9' => 9,
          'view10' => 10,
      },
      'page2' => {
          'view1' => 1,
          'view2' => 2,
          'view3' => 3,
          'view4' => 4,
          'view5' => 5,
          'view6' => 6,
          'view7' => 7,
          'view8' => 8,
          'view9' => 9,
          'view10' => 10,
      },
      'page3' => {
          'view1' => 1,
          'view2' => 2,
          'view3' => 3,
          'view4' => 4,
          'view5' => 5,
          'view6' => 6,
          'view7' => 7,
          'view8' => 8,
          'view9' => 9,
          'view10' => 10,
      },
      'page4' => {
          'view1' => 1,
          'view2' => 2,
          'view3' => 3,
          'view4' => 4,
          'view5' => 5,
          'view6' => 6,
          'view7' => 7,
          'view8' => 8,
          'view9' => 9,
          'view10' => 10,
      },
      'page5' => {
          'view1' => 1,
          'view2' => 2,
          'view3' => 3,
          'view4' => 4,
          'view5' => 5,
          'view6' => 6,
          'view7' => 7,
          'view8' => 8,
          'view9' => 9,
          'view10' => 10,
      },
      'page6' => {
          'view1' => 1,
          'view2' => 2,
          'view3' => 3,
          'view4' => 4,
          'view5' => 5,
          'view6' => 6,
          'view7' => 7,
          'view8' => 8,
          'view9' => 9,
          'view10' => 10,
      },
      'page7' => {
          'view1' => 1,
          'view2' => 2,
          'view3' => 3,
          'view4' => 4,
          'view5' => 5,
          'view6' => 6,
          'view7' => 7,
          'view8' => 8,
          'view9' => 9,
          'view10' => 10,
      },
      'page8' => {
          'view1' => 1,
          'view2' => 2,
          'view3' => 3,
          'view4' => 4,
          'view5' => 5,
          'view6' => 6,
          'view7' => 7,
          'view8' => 8,
          'view9' => 9,
          'view10' => 10,
      },
      'page9' => {
          'view1' => 1,
          'view2' => 2,
          'view3' => 3,
          'view4' => 4,
          'view5' => 5,
          'view6' => 6,
          'view7' => 7,
          'view8' => 8,
          'view9' => 9,
          'view10' => 10,
      },
      'page10' => {
          'view1' => 1,
          'view2' => 2,
          'view3' => 3,
          'view4' => 4,
          'view5' => 5,
          'view6' => 6,
          'view7' => 7,
          'view8' => 8,
          'view9' => 9,
          'view10' => 10,
      },
  }

  def construct_path(controller, action)

    controller_url= CONTROLLER_MAP.invert[controller]

    view_url=nil
    VIEW_MAP.each do |key, value|
      if key==controller_url
        value.each do |nkey, nvalue|
          if nvalue==action
            view_url=nkey
          end
        end
      end
    end

    return "/sampleapp/#{controller_url}/#{view_url}"

  end


end
