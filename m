Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E2031EFB
	for <linux-staging@lists.linux.dev>; Tue, 13 Jun 2023 11:10:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0EF4B1FDAC;
	Tue, 13 Jun 2023 11:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1686654606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1BuztNQSgsuQs3xHFrmB515HWtrc7sc9NpbsuatwBeo=;
	b=xYlSFG6CqucP0AReBtnHoo9yOCqWmGRx8GiCt5Gl58QihD8IuNDmW8CKS8A31iXb6fJ0RS
	eA04EwkVntJVCWq1v5ccReJin3qLpPO5q9lbtp6VsRnJL5aYmpQmAFAaF1BSYIXPB3fcru
	z/js7oMGW+T8ByW/8u7MYj6rNxOsmmA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686654606;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1BuztNQSgsuQs3xHFrmB515HWtrc7sc9NpbsuatwBeo=;
	b=MjJP+zQHwfGIHEIKvXvJwGD1mOWq2Pl3tjwOzzD3olGhg/J6xuIu2PdQewP/5i/xU66Izm
	X35Ljej+qj7Kg5Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B1E4513483;
	Tue, 13 Jun 2023 11:10:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aJ+qKo1OiGR8CQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 11:10:05 +0000
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
	Steve Glendinning <steve.glendinning@shawell.net>
Subject: [PATCH v3 30/38] fbdev/smscufx: Detect registered fb_info from refcount
Date: Tue, 13 Jun 2023 13:07:05 +0200
Message-ID: <20230613110953.24176-31-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230613110953.24176-1-tzimmermann@suse.de>
References: <20230613110953.24176-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Detect registered instances of fb_info by reading the reference
counter from struct fb_info.read. Avoids looking at the dev field
and prepares fbdev for making struct fb_info.dev optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Steve Glendinning <steve.glendinning@shawell.net>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/smscufx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index 17cec62cc65db..adb2b1fe8383c 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -1496,7 +1496,7 @@ static int ufx_setup_modes(struct ufx_data *dev, struct fb_info *info,
 	u8 *edid;
 	int i, result = 0, tries = 3;
 
-	if (info->dev) /* only use mutex if info has been registered */
+	if (refcount_read(&info->count)) /* only use mutex if info has been registered */
 		mutex_lock(&info->lock);
 
 	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
@@ -1610,7 +1610,7 @@ static int ufx_setup_modes(struct ufx_data *dev, struct fb_info *info,
 	if (edid && (dev->edid != edid))
 		kfree(edid);
 
-	if (info->dev)
+	if (refcount_read(&info->count))
 		mutex_unlock(&info->lock);
 
 	return result;
-- 
2.41.0

