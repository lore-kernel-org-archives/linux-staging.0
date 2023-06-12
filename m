Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA5B1B8F0
	for <linux-staging@lists.linux.dev>; Mon, 12 Jun 2023 14:14:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B6B6822850;
	Mon, 12 Jun 2023 14:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1686579241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NeJmBMc+qN1qkXnt7g1RgqrFwwNflzArnjihi3rx4yI=;
	b=gFIK1qv7+3u09sRVdTlSN5i09/FxajAi9k1XcX9W9wJtKgypvNDNKBjpr+FOUC/NJqMWB7
	em0yUyIGDQPuQSO9qp8XcdMexBu08G4vF679LV3ISLJoCvt1Ag+5BMT/YTKSupbuJA6oe8
	UN+BI9+CsGTbb4bvxIdBbcM4UAhwxX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686579241;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NeJmBMc+qN1qkXnt7g1RgqrFwwNflzArnjihi3rx4yI=;
	b=UZGQhraaK4JGeU/nXzIZQfBQi9ePVMq7ByjtD5xJoq08BQMjbwViCPjbhuns9T0rayM7n/
	EheOXx5OIeI2dWDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6535F1357F;
	Mon, 12 Jun 2023 14:14:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8By4Fykoh2RwGQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 12 Jun 2023 14:14:01 +0000
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
Subject: [PATCH v2 20/38] fbdev/pxa168fb: Do not assign to struct fb_info.dev
Date: Mon, 12 Jun 2023 16:07:58 +0200
Message-ID: <20230612141352.29939-21-tzimmermann@suse.de>
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

Do not assign the hardware device to struct fb_info.dev. The
field references the fbdev software device, which is unrelated.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/pxa168fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/pxa168fb.c b/drivers/video/fbdev/pxa168fb.c
index 79f3384630926..82cb9ffe52908 100644
--- a/drivers/video/fbdev/pxa168fb.c
+++ b/drivers/video/fbdev/pxa168fb.c
@@ -629,7 +629,7 @@ static int pxa168fb_probe(struct platform_device *pdev)
 	fbi = info->par;
 	fbi->info = info;
 	fbi->clk = clk;
-	fbi->dev = info->dev = &pdev->dev;
+	fbi->dev = &pdev->dev;
 	fbi->panel_rbswap = mi->panel_rbswap;
 	fbi->is_blanked = 0;
 	fbi->active = mi->active;
-- 
2.41.0

