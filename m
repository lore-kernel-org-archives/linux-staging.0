Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8797B1B90E
	for <linux-staging@lists.linux.dev>; Mon, 12 Jun 2023 14:14:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 81C4020462;
	Mon, 12 Jun 2023 14:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1686579238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LdFYt/qoASITAY52DE6HZWdcNBV1SGXn2DcIPAfGew4=;
	b=App3xnd/PWP0Xs9iyWZuToNef4BTZlbLklZguTbxU4RJC8xXv4JLiO9FRTtxnZ1cEYtEh/
	3WV2Ep6TB6tCCdrFtcGpZf8iqaYD+mhmjYasnC8dELJYzMAobZ44gVC/OgnAirQ8jAc8Xn
	pWWh3RuXpclvXmwe6HUCnCJg38am17Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686579238;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LdFYt/qoASITAY52DE6HZWdcNBV1SGXn2DcIPAfGew4=;
	b=cVlodZvwWfCYOUvMHommz91hfORQOgDv3GTcQQ4PR/S7Yyrt0yLFdCFWheikmqenw7RhRw
	OH0fG1axuLAu33Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 363FE1357F;
	Mon, 12 Jun 2023 14:13:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YOo1DCYoh2RwGQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 12 Jun 2023 14:13:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	javierm@redhat.com,
	sam@ravnborg.org,
	deller@gmx.de,
	geert+renesas@glider.be,
	lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	dan.carpenter@linaro.org,
	michael.j.ruhl@intel.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-sh@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 11/38] fbdev/broadsheetfb: Call device_remove_file() with hardware device
Date: Mon, 12 Jun 2023 16:07:49 +0200
Message-ID: <20230612141352.29939-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230612141352.29939-1-tzimmermann@suse.de>
References: <20230612141352.29939-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call device_remove_file() with the same device that has been used
for device_create_file(), which is the hardware device stored in
struct fb_info.device. Prepares fbdev for making struct fb_info.dev
optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/broadsheetfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/broadsheetfb.c b/drivers/video/fbdev/broadsheetfb.c
index 5f18af88e7408..5a5fe4bbc10b0 100644
--- a/drivers/video/fbdev/broadsheetfb.c
+++ b/drivers/video/fbdev/broadsheetfb.c
@@ -1200,7 +1200,7 @@ static void broadsheetfb_remove(struct platform_device *dev)
 	if (info) {
 		struct broadsheetfb_par *par = info->par;
 
-		device_remove_file(info->dev, &dev_attr_loadstore_waveform);
+		device_remove_file(info->device, &dev_attr_loadstore_waveform);
 		unregister_framebuffer(info);
 		fb_deferred_io_cleanup(info);
 		par->board->cleanup(par);
-- 
2.41.0

