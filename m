Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7F1C8F1
	for <linux-staging@lists.linux.dev>; Fri, 14 Jul 2023 07:52:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C03DB1FDA2;
	Fri, 14 Jul 2023 07:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689321123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=85l2ukO3ODIPQ6vFxAUAj342VQosexDKbJyC6X6EE14=;
	b=EnsEcGyfqq0kOkgwSp2971OUagS9I6Kq3FS3QoesQxzxxLFVVx7d6xBi6ikOmovOlN0UFl
	cjgzkl1ESK0UmYPNzY73WQ70pkDJypVKOM2bSx2KDpzLrGwL26zXVu/xcKIWG5P7lQbg0u
	Ukuv1XG9Sa1kuFa7aM8m2neGM9vAJD8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689321123;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=85l2ukO3ODIPQ6vFxAUAj342VQosexDKbJyC6X6EE14=;
	b=XobNV/Jyb9yCeCLMoY/RztAO2gLUJ7Y86K4bpgtvqUqM9MRG0fSo/a+bslAULLcDQ+y/T9
	j4E7DndDgNbWCZBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 77CB513A15;
	Fri, 14 Jul 2023 07:52:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YJt0HKP+sGQCQwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Fri, 14 Jul 2023 07:52:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Cc: linux-sh@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-geode@lists.infradead.org,
	linux-nvidia@lists.surfsouth.com,
	linux-hyperv@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 16/18] fbdev/pxafb: Remove flag FBINFO_FLAG_DEFAULT
Date: Fri, 14 Jul 2023 09:49:42 +0200
Message-ID: <20230714075155.5686-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714075155.5686-1-tzimmermann@suse.de>
References: <20230714075155.5686-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The flag FBINFO_FLAG_DEFAULT is 0 and has no effect, as struct
fbinfo.flags has been allocated to zero by devm_kzalloc(). So do not
set it.

Flags should signal differences from the default values. After cleaning
up all occurrences of FBINFO_DEFAULT, the token will be removed.

v2:
	* fix commit message (Miguel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/pxafb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index c8c4677d06b4..beffb0602a2c 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -888,7 +888,6 @@ static void init_pxafb_overlay(struct pxafb_info *fbi, struct pxafb_layer *ofb,
 	ofb->fb.var.vmode		= FB_VMODE_NONINTERLACED;
 
 	ofb->fb.fbops			= &overlay_fb_ops;
-	ofb->fb.flags			= FBINFO_FLAG_DEFAULT;
 	ofb->fb.node			= -1;
 	ofb->fb.pseudo_palette		= NULL;
 
-- 
2.41.0

