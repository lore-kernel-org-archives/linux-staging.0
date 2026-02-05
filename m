Received: from mvsmtppost05.nm.naver.com (mvsmtppost05.nm.naver.com [61.247.196.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8055C125D0
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 02:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.247.196.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770257798; cv=none; b=mvn2Y5NZtwPMB/2aUmv9axBcWKGAwncMfswjvP0AS+Ie4gRJNngSA87QipMhBs8fy7Q5051XjGyfBT+BYKfEJUZmYHeQG31T8uqIAVP0u8Db39gANG4A6KMP5xvbxcqh+1GZtG6Wyhpa/Nn6EEuyh+e1l47YkyutZ8oCfVAwh6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770257798; c=relaxed/simple;
	bh=rF94Rhgmfo1To7G0XsdkQ4mNAHhsNiOQe8QwinAsW0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UlVlWLoCROhY2h8czkmfDkF8N2SgXRGR19HAHzCiBU78NQ3k6WRQleAqJCPz46tYjFn/hYyIh6nsjZeQAUKPrD2c3t4Xfo2zY+RGD61dzFmH7h776/+3khth1KGAzBuzrGdrUewsJAqRWkXC9iIQEE7CyQLS+8o5jZqlUfMIR/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=M7c1E5FB; arc=none smtp.client-ip=61.247.196.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="M7c1E5FB"
Received: from cvsendbo008.nm ([10.112.24.37])
  by mvsmtppost05.nm.naver.com with ESMTP id MYuiDpohS0y86ciz17E3HA
  for <linux-staging@lists.linux.dev>;
  Thu, 05 Feb 2026 02:16:29 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1770257789; bh=rF94Rhgmfo1To7G0XsdkQ4mNAHhsNiOQe8QwinAsW0g=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=M7c1E5FBmTJMAEHtv+5yOeMfoH7oDmQDRFpMlnrCsT3/DaHSJqfcLr0TiLsdB1QGs
	 6O9t8/kG1NUN/gHyJDx8JYA2l1FNSdllzTbvaz6EZQMwpTiMug/XUyzaagHzVLMDLa
	 rB0m7GUH5q2zInzfkJbS9Ep7VOrW0uiBKeuV91yLlXa3H3LW2PuLwBnr+fuwY84Saa
	 MbI40k7/JHWFze9wR8zqJcV7tYxqC3dN2a8xzRt0C8XafLT1NaOIFfWyVNhEVJiiUF
	 L7X03ESstOm3iy3XpWc3P6qIH9n9TaZ6rgMET2G3JHug0OZ8qSNmaqV1/etWJ3WFRw
	 I7QQ5N+zB0u9Q==
X-Session-ID: gavzAvxnTSe3k7nP5XBf7w
X-Works-Send-Opt: p/Y/jAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: q9KZKogXFqJZ+Hm/aAK9+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp007.nm.naver.com with ESMTP id gavzAvxnTSe3k7nP5XBf7w
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 05 Feb 2026 02:16:28 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org,
	christian.gromm@microchip.com,
	parthiban.veerasooran@microchip.com,
	dan.carpenter@linaro.org
Cc: hverkuil+cisco@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v2] staging: most: video: fix potential race in list iteration
Date: Thu,  5 Feb 2026 11:16:20 +0900
Message-ID: <20260205021620.1165137-1-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aYMS_9xQ4LGgMS-j@stanley.mountain>
References: <aYMS_9xQ4LGgMS-j@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a pattern in the loops where the lock is dropped
to call a specific function and then re-acquired.

The list can be exposed during this short gap, creating a potential
race condition. This patch fixes the problem by replacing the list
head with a local free list using list_replace_init(), instead of
using the lock/unlock pattern in the loop.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
Changes in v2:
- Use list_replace_init() instead of moving one-by-one.
  (suggested by Dan Carpenter)

 drivers/staging/most/video/video.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 32f71d9a9cf7..8eeae209ff1c 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -121,6 +121,7 @@ static int comp_vdev_close(struct file *filp)
 	struct comp_fh *fh = to_comp_fh(filp);
 	struct most_video_dev *mdev = fh->mdev;
 	struct mbo *mbo, *tmp;
+	LIST_HEAD(free_list);
 
 	/*
 	 * We need to put MBOs back before we call most_stop_channel()
@@ -133,13 +134,14 @@ static int comp_vdev_close(struct file *filp)
 
 	spin_lock_irq(&mdev->list_lock);
 	mdev->mute = true;
-	list_for_each_entry_safe(mbo, tmp, &mdev->pending_mbos, list) {
-		list_del(&mbo->list);
-		spin_unlock_irq(&mdev->list_lock);
+	list_replace_init(&mdev->pending_mbos, &free_list);
+	spin_unlock_irq(&mdev->list_lock);
+
+	list_for_each_entry_safe(mbo, tmp, &free_list, list) {
+		list_del_init(&mbo->list);
 		most_put_mbo(mbo);
-		spin_lock_irq(&mdev->list_lock);
 	}
-	spin_unlock_irq(&mdev->list_lock);
+
 	most_stop_channel(mdev->iface, mdev->ch_idx, &comp);
 	mdev->mute = false;
 
@@ -554,6 +556,7 @@ static int __init comp_init(void)
 static void __exit comp_exit(void)
 {
 	struct most_video_dev *mdev, *tmp;
+	LIST_HEAD(free_list);
 
 	/*
 	 * As the mostcore currently doesn't call disconnect_channel()
@@ -562,16 +565,15 @@ static void __exit comp_exit(void)
 	 * This must be fixed in core.
 	 */
 	spin_lock_irq(&list_lock);
-	list_for_each_entry_safe(mdev, tmp, &video_devices, list) {
-		list_del(&mdev->list);
-		spin_unlock_irq(&list_lock);
+	list_replace_init(&video_devices, &free_list);
+	spin_unlock_irq(&list_lock);
 
+	list_for_each_entry_safe(mdev, tmp, &free_list, list) {
+		list_del_init(&mdev->list);
 		comp_unregister_videodev(mdev);
 		v4l2_device_disconnect(&mdev->v4l2_dev);
 		v4l2_device_put(&mdev->v4l2_dev);
-		spin_lock_irq(&list_lock);
 	}
-	spin_unlock_irq(&list_lock);
 
 	most_deregister_configfs_subsys(&comp);
 	most_deregister_component(&comp);
-- 
2.43.0

