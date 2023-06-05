Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BD81F936
	for <linux-staging@lists.linux.dev>; Mon,  5 Jun 2023 14:48:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C734421B6F;
	Mon,  5 Jun 2023 14:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1685976499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bjpLFAWdF0yER4mnrBkCq7vFgQ0JTP5z6F6p7e1mM9U=;
	b=km69xxB4PdrqCTECx7m8EHWFkc2X5/R1+CN0gdynqgCmuI/mgJpAkPKuYh12Ia/okoWjZy
	teKL1DiijUw4H9H5Sj6SsJkuxHR+g2CdM2wK5LN0V/qdUJztwKmUCfc7Qkhj5ZKX/RalPW
	mtfJUjCURdv6QYe46aEm2M3cyADfJ8g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1685976499;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bjpLFAWdF0yER4mnrBkCq7vFgQ0JTP5z6F6p7e1mM9U=;
	b=uFq1LukV0Kym8gOi0rwaZ43pgOXMYM9VlhGRh2FElM2VBGEB3fA1Nohy2BGQO6QCYGWFoJ
	5Svye+rFQFny88BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81CB713A3C;
	Mon,  5 Jun 2023 14:48:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +NG8HrP1fWQvXwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	javierm@redhat.com,
	sam@ravnborg.org,
	deller@gmx.de,
	geert+renesas@glider.be,
	lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-sh@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 17/30] fbdev/radeonfb: Reorder backlight and framebuffer cleanup
Date: Mon,  5 Jun 2023 16:47:59 +0200
Message-Id: <20230605144812.15241-18-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605144812.15241-1-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver's backlight code requires the framebuffer to be
registered. Therefore reorder the cleanup calls for both data
structures. The init calls are already in the correct order.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/video/fbdev/aty/radeon_base.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index 972c4bbedfa3..8f2a527c26eb 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -2517,9 +2517,8 @@ static void radeonfb_pci_unregister(struct pci_dev *pdev)
 
 	del_timer_sync(&rinfo->lvds_timer);
 	arch_phys_wc_del(rinfo->wc_cookie);
-        unregister_framebuffer(info);
-
         radeonfb_bl_exit(rinfo);
+	unregister_framebuffer(info);
 
         iounmap(rinfo->mmio_base);
         iounmap(rinfo->fb_base);
-- 
2.40.1

