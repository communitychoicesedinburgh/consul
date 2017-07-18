module FollowsHelper

  def show_follow_action?(followable)
    current_user && !followed?(followable)
  end

  def show_unfollow_action?(followable)
    current_user && followed?(followable)
  end

  def follow_entity_text(followable)
    entity = followable.class.name.underscore
    t('shared.follow_entity', entity: t("activerecord.models.#{entity}.one").downcase)
  end

  def follow_entity_title(followable)
    entity = followable.class.name.underscore
    t('shared.follow_entity_title', entity: t("activerecord.models.#{entity}.one").downcase)
  end

  def unfollow_entity_text(followable)
    entity = followable.class.name.underscore
    t('shared.unfollow_entity', entity: t("activerecord.models.#{entity}.one").downcase)
  end

  def entity_full_name(followable)
    followable.class.name.parameterize
  end

  def follow_link_wrapper_id(followable)
    "follow-expand-#{entity_full_name(followable)}-#{followable.id}"
  end

  def unfollow_link_wrapper_id(followable)
    "unfollow-expand-#{entity_full_name(followable)}-#{followable.id}"
  end

  def follow_link_id(followable)
    "follow-#{entity_full_name(followable)}-#{followable.id}"
  end

  def unfollow_link_id(followable)
    "unfollow-#{entity_full_name(followable)}-#{followable.id}"
  end

  def follow_drop_id(followable)
    "follow-drop-#{entity_full_name(followable)}-#{followable.id}"
  end

  def unfollow_drop_id(followable)
    "unfollow-drop-#{entity_full_name(followable)}-#{followable.id}"
  end

  def entity_title(title)
    t("activerecord.models.#{title.underscore}.other")
  end

  def entity_icon(entity)
    {
      proposals: 'Proposal',
      budget: 'Budget::Investment'
    }.invert[entity]
  end

  def entity_partial(class_name)
    class_name.parameterize.gsub('-','_')
  end

  private

    def followed?(followable)
      Follow.followed?(current_user, followable)
    end

end
