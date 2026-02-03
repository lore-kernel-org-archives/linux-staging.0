Received: from cvsmtppost08.nm.naver.com (cvsmtppost08.nm.naver.com [114.111.35.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512FF337B97
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 11:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770118105; cv=none; b=dtuKHajlB3Q8937p1N3Wcddba0SHA8n5XMHn+GH3AYmimdkqccDMwMtAMFN++lnzL7eNeHPEM5MQxKkseQCFz2seHgiVaYia8aFcvoZ1/UuuKT0d6K1DZaO7qD5qYBt0CXg82k/whMgG3/4uP/YTGOHNqB4W/DfRMjGy4aUF8a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770118105; c=relaxed/simple;
	bh=EuNLaHfH5LJWPJaic7aqjD5pcArbN1+ZuPnkHZ2XDug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DRYEpFDZO8amvUSvIV0RsFLmE6agU6Findd8f7o1VLs3jb9mKrrzjkKFA7vMabJ9qTP5uja81F9wB7m3F4P6fvAT5pfc8KmFMm2bLYNuUkbrKnVBOi/R81zudwJRImYbzWoZxg8GA/00QSpFblX/llQVS58VdkgcpUzLm3mIQjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=El7QtPf/; arc=none smtp.client-ip=114.111.35.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="El7QtPf/"
Received: from cvsendbo014.nm ([10.112.20.45])
  by cvsmtppost08.nm.naver.com with ESMTP id aAp63xIvSEy+FbikA5RrfQ
  for <linux-staging@lists.linux.dev>;
  Tue, 03 Feb 2026 11:28:13 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1770118093; bh=EuNLaHfH5LJWPJaic7aqjD5pcArbN1+ZuPnkHZ2XDug=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=El7QtPf//sAVUAR9XzRQBRJui3943nxCj0PQKBKea2zLa+i8Zlsc2aeLeHyOrOyDZ
	 UoXOmzq7YxoRwhLHWrPh/hssvPxGCsxOAoTBSdrqrKbHDuRcejdGOI+Cq2cORcBLz7
	 /RO+zFS8d7IECOhLjeskFsRbmzv/8p4N/rGVRjslL5OGy0q0/Qn0+0TzBbAPMqBjtR
	 pnJJxcJQpwziY2Oy6wAAZrOBIBudowCmi79gvrjtyLJKRHPFvgrdTVxKZlhvc1qszR
	 pD9gT2mk2Al1olgHKiS0b8gUFEqlzm5cOJXp7FR8Dz652jrJvGJktofGOctg8FlXTm
	 8cfy0IvPApY6A==
X-Session-ID: z3XcyRXtQGiXR3bR-ow6tw
X-Works-Send-Opt: M/YXjAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: Xdn/KAgXFqJZ+HmZaxM9+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp012.nm.naver.com with ESMTP id z3XcyRXtQGiXR3bR-ow6tw
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 03 Feb 2026 11:28:12 -0000
From: Minu Jin <s9430939@naver.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: hverkuil+cisco@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH] staging: most: video: fix potential race in list iteration
Date: Tue,  3 Feb 2026 20:28:00 +0900
Message-ID: <20260203112800.3351763-1-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
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
race condition. This patch fixes the problem by moving nodes to a
local list while holding the lock, instead of using the
unlock/lock pattern in the loop.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/most/video/video.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 32f71d9a9cf7..e7db58e5746a 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -121,6 +121,7 @@ static int comp_vdev_close(struct file *filp)
 	struct comp_fh *fh = to_comp_fh(filp);
 	struct most_video_dev *mdev = fh->mdev;
 	struct mbo *mbo, *tmp;
+	LIST_HEAD(free_list);
 
 	/*
 	 * We need to put MBOs back before we call most_stop_channel()
@@ -134,12 +135,15 @@ static int comp_vdev_close(struct file *filp)
 	spin_lock_irq(&mdev->list_lock);
 	mdev->mute = true;
 	list_for_each_entry_safe(mbo, tmp, &mdev->pending_mbos, list) {
-		list_del(&mbo->list);
-		spin_unlock_irq(&mdev->list_lock);
-		most_put_mbo(mbo);
-		spin_lock_irq(&mdev->list_lock);
+		list_move(&mbo->list, &free_list);
 	}
 	spin_unlock_irq(&mdev->list_lock);
+
+	list_for_each_entry_safe(mbo, tmp, &free_list, list) {
+		list_del_init(&mbo->list);
+		most_put_mbo(mbo);
+	}
+
 	most_stop_channel(mdev->iface, mdev->ch_idx, &comp);
 	mdev->mute = false;
 
@@ -554,6 +558,7 @@ static int __init comp_init(void)
 static void __exit comp_exit(void)
 {
 	struct most_video_dev *mdev, *tmp;
+	LIST_HEAD(free_list);
 
 	/*
 	 * As the mostcore currently doesn't call disconnect_channel()
@@ -563,15 +568,16 @@ static void __exit comp_exit(void)
 	 */
 	spin_lock_irq(&list_lock);
 	list_for_each_entry_safe(mdev, tmp, &video_devices, list) {
-		list_del(&mdev->list);
-		spin_unlock_irq(&list_lock);
+		list_move(&mdev->list, &free_list);
+	}
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

