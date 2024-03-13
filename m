Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E7546BA6
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 15:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710344945; cv=none; b=qiLPt6HS6tPiZEv5zKv7zV+Jp/mse5lRLVlkOg7RZe2luzMP7fukAlZL1fENVbQU/N9bWPhuCdhpz1f8HYrkStdP9Zq6Qknb97NwkBdVu0jh0nV9b8RS0L7+Zmw29ZjjCNd75IlaWm1p/KgRdwQ2EOh6bGldCQPAuzyOkPHOK24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710344945; c=relaxed/simple;
	bh=BpXtIomxBoqRRW7yfeB4qH6/qSggk08LUZc3d9Rb+08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L29D29VpklFI0UHQzyXJdAuv1bm48X4gokJmbehaKT1wiN7C1I8n2sg7jdQMmDSqYtF73M/YN3asEfXwtmGtsNRvoO0talcpGvBuybbzx6j7mfVb7GZpniW31LjGy5INh7IWFMCmEMmMOg696cRX9XYa1wIG//W40MZ4s7FMTFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B2E841F7CE;
	Wed, 13 Mar 2024 15:49:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7549E139B1;
	Wed, 13 Mar 2024 15:49:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OHU8G+3K8WUhfQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 13 Mar 2024 15:49:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	deller@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/6] fbdev/omap2/omapfb: Replace use of fb_blank with backlight helpers
Date: Wed, 13 Mar 2024 16:45:03 +0100
Message-ID: <20240313154857.12949-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313154857.12949-1-tzimmermann@suse.de>
References: <20240313154857.12949-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: B2E841F7CE
X-Spam-Flag: NO

Replace the use of struct backlight_properties.fb_blank with backlight
helpers. This effects testing if the backlight is blanked and reading
the backlight's brightness level.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c | 6 +-----
 .../fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c   | 9 ++-------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
index adb8881bac285..47683a6c00767 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
@@ -356,11 +356,7 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
 
 static int dsicm_bl_get_intensity(struct backlight_device *dev)
 {
-	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
-			dev->props.power == FB_BLANK_UNBLANK)
-		return dev->props.brightness;
-
-	return 0;
+	return backlight_get_brightness(dev);
 }
 
 static const struct backlight_ops dsicm_bl_ops = {
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
index 685c63aa4e030..9d3ce234a7874 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
@@ -340,11 +340,7 @@ static int acx565akm_bl_update_status(struct backlight_device *dev)
 
 	dev_dbg(&ddata->spi->dev, "%s\n", __func__);
 
-	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
-			dev->props.power == FB_BLANK_UNBLANK)
-		level = dev->props.brightness;
-	else
-		level = 0;
+	level = backlight_get_brightness(dev);
 
 	if (ddata->has_bc)
 		acx565akm_set_brightness(ddata, level);
@@ -363,8 +359,7 @@ static int acx565akm_bl_get_intensity(struct backlight_device *dev)
 	if (!ddata->has_bc)
 		return -ENODEV;
 
-	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
-			dev->props.power == FB_BLANK_UNBLANK) {
+	if (!backlight_is_blank(dev)) {
 		if (ddata->has_bc)
 			return acx565akm_get_actual_brightness(ddata);
 		else
-- 
2.44.0

