Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F274C45D18D
	for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 15:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821889; cv=none; b=kxmLomBEcB8NFSsVPaLvSxM1CkAot0S4mnJx0S45m4GZ7DEMgYT1YKiO+tYTfzU9qNzjpOEtZ9ac8+6RfvQsbN/g6j6QrP7lHZcQQl2EB44gzfdMtqzn9bElnilzbH8jq5DBfTCOlTh/nKQXUeTX1l+la1bS4FDHNEA86kJ0rys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821889; c=relaxed/simple;
	bh=54LgF6y60oBprhX2JNd2LD9/7EEhFqrkMPDkETdy5RA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G/5Xpl5O/4+0DSlahCVHOomIFtTbXDELpr1gl4cK/U50hbu8X5SDCBbBcevxdiDd6NjTUl/XOtK9s4fvL4JLwoDzk/vurnslKVZ1ZdH52SJkHX3Ku77Xzy2g3CrqAc8YuLTfFF+nyRQt0I7L+PHQlzhIhI+IGWvkK9Xxuru8XZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=lbC+8J4T; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="lbC+8J4T"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5E41B8498F;
	Thu, 23 Jul 2026 17:51:23 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zPcpabtT-PHZ; Thu, 23 Jul 2026 17:51:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784821882; bh=54LgF6y60oBprhX2JNd2LD9/7EEhFqrkMPDkETdy5RA=;
	h=From:To:Cc:Subject:Date;
	b=lbC+8J4ThF81g3O0QMYw6oDSku6ngYX2eKp9Yt0yJwBQ+HPZ7FK0483QhImndvtYt
	 9/jLQGEAx4a8biBi05YQexV0r/XRlmi9gaway3hVUpvPV0IqOfKOwocrm/MQ7X3BUv
	 Vxz9k+P9iBO/sXq3HOypLAJn3eMxh4dY7nKu+BG8bGAXN4esgdT240q/mMU/5QjVVq
	 L1JYhxOftueodDH7JX/Rb2pU3hzO+POVXrWyQYal+ykaStX50pbqVRLhn4sxBonz/i
	 +bXTd9PDECYUE1c8yM8qbjWtKxqzXpKl/kF/Of09XAHbDij0pUqIFwy+sFgIsLwGa7
	 +DpKoGun1R6Mw==
From: Sergei Stepanenkov <sergei_stepanenkov@disroot.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Sergei Stepanenkov <sergei_stepanenkov@disroot.org>
Subject: [PATCH] staging: media: atomisp: move constant to the right side of comparisons
Date: Thu, 23 Jul 2026 12:50:20 -0300
Message-ID: <20260723155027.124722-1-sergei_stepanenkov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix all checkpatch warning occurences
"WARNING: Comparisons should place the constant on the right side of
the test" in folder drivers/staging/media/atomisp/pci

Signed-off-by: Sergei Stepanenkov <sergei_stepanenkov@disroot.org>
---
Hey, this is my first patch, I appreciate any feedback, thanks!
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 4 ++--
 drivers/staging/media/atomisp/pci/sh_css.c               | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 0ee52637ea30..1e9f7d96f18c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2301,8 +2301,8 @@ int atomisp_get_css_frame_info(struct atomisp_sub_device *asd,
 			       ATOMISP_INPUT_STREAM_VIDEO :
 			       ATOMISP_INPUT_STREAM_GENERAL;
 
-	if (0 != ia_css_pipe_get_info(asd->stream_env[stream_index]
-		.pipes[pipe_index], &info)) {
+	if (ia_css_pipe_get_info(asd->stream_env[stream_index]
+		.pipes[pipe_index], &info) != 0) {
 		dev_dbg(isp->dev, "ia_css_pipe_get_info FAILED");
 		return -EINVAL;
 	}
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 00082276f1db..3399e6793628 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -7708,7 +7708,7 @@ ia_css_pipe_override_frame_format(struct ia_css_pipe *pipe,
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
 	}
-	if (0 != pin_index && 1 != pin_index) {
+	if (pin_index != 0 && pin_index != 1) {
 		IA_CSS_ERROR("pin index is not valid");
 		err = -EINVAL;
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
-- 
2.47.3

