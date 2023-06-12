Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D011B91C
	for <linux-staging@lists.linux.dev>; Mon, 12 Jun 2023 14:14:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CA1C02283D;
	Mon, 12 Jun 2023 14:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1686579242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZMezLYvd1wM4r2U5/PT+E1dmbhnJeOMuc4XP7gGAyts=;
	b=pos53zcO3/7qNVyViUFnRcWKhP5plrKrze/JvjwKxn8GCfYQA8qH/Uo9OF/pHPgJ2U8PWe
	+UAmY2CDeLJWlQVQv9U7ustyi+70xxhrdngHuM0nW+ziQRpTbcAdUhjut6iSHOwt4x7Kec
	VkgHiAAvJnhLnqC/KrZV0ATDTKea1HU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686579242;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZMezLYvd1wM4r2U5/PT+E1dmbhnJeOMuc4XP7gGAyts=;
	b=N7FSzby/wxuYdzkiF+jH2GY6MlRjrhrIYQKfeIFzxZEcoBUt+c5a+Gz0cFdVBRSJXb+DF8
	g39ye9qbPWa4MEBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 793521357F;
	Mon, 12 Jun 2023 14:14:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qDmsHCooh2RwGQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 12 Jun 2023 14:14:02 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>,
	Antonino Daplas <adaplas@gmail.com>
Subject: [PATCH v2 23/38] fbdev/rivafb: Reorder backlight and framebuffer init/cleanup
Date: Mon, 12 Jun 2023 16:08:01 +0200
Message-ID: <20230612141352.29939-24-tzimmermann@suse.de>
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

The driver's backlight code requires the framebuffer to be
registered. Therefore reorder the init and cleanup calls for
both data structures.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Antonino Daplas <adaplas@gmail.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/riva/fbdev.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index 41edc6e794603..e328b2d39e2b6 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -2031,9 +2031,6 @@ static int rivafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
 
 	pci_set_drvdata(pd, info);
 
-	if (backlight)
-		riva_bl_init(info->par);
-
 	ret = register_framebuffer(info);
 	if (ret < 0) {
 		printk(KERN_ERR PFX
@@ -2041,6 +2038,9 @@ static int rivafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
 		goto err_iounmap_screen_base;
 	}
 
+	if (backlight)
+		riva_bl_init(info->par);
+
 	printk(KERN_INFO PFX
 		"PCI nVidia %s framebuffer ver %s (%dMB @ 0x%lX)\n",
 		info->fix.id,
@@ -2084,9 +2084,9 @@ static void rivafb_remove(struct pci_dev *pd)
 	kfree(par->EDID);
 #endif
 
+	riva_bl_exit(info);
 	unregister_framebuffer(info);
 
-	riva_bl_exit(info);
 	arch_phys_wc_del(par->wc_cookie);
 	iounmap(par->ctrl_base);
 	iounmap(info->screen_base);
-- 
2.41.0

