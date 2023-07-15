Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAD58BFA
	for <linux-staging@lists.linux.dev>; Sat, 15 Jul 2023 18:53:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D870521ADB;
	Sat, 15 Jul 2023 18:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689447228; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tx/aqv++WTiG+HB9fsdEKxv/jL2xUmStLjqk656Qv/M=;
	b=LGM/xwriYhu/JYpY/sODdROIjIyyy4kVYhF39qehbDsi52Wo4/A5Xwt5gHp3bNTBUvDGjm
	KHW9iKiIXw6YcNDrLXWDjzgSio7xU/BrCpk3Xcj5AZsa9WbTKg/xeCjY/Zuz9hO/rJ+KcA
	plKcHOaFWWJSG/wxnf4jLwoRDKV5oF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689447228;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tx/aqv++WTiG+HB9fsdEKxv/jL2xUmStLjqk656Qv/M=;
	b=woCXRKUVmk86zkWeBPg6WvuxHcR74zbx0Gs2Ji3xe0q/vz0IA5pgv4tcLnvzSdaeEkIsnp
	hs6HaThBjdubAYBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 78A90133F7;
	Sat, 15 Jul 2023 18:53:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GF+AHDzrsmQCBwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Sat, 15 Jul 2023 18:53:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com,
	geert@linux-m68k.org,
	dan.carpenter@linaro.org
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
	linux-hyperv@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sam Ravnborg <sam@ravnborg.org>,
	Kirti Wankhede <kwankhede@nvidia.com>
Subject: [PATCH v4 07/18] vfio-mdev: Remove flag FBINFO_DEFAULT from fbdev sample driver
Date: Sat, 15 Jul 2023 20:51:49 +0200
Message-ID: <20230715185343.7193-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230715185343.7193-1-tzimmermann@suse.de>
References: <20230715185343.7193-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The flag FBINFO_DEFAULT is 0 and has no effect, as struct fbinfo.flags
has been allocated to zero by framebuffer_alloc(). So do not set it.

Flags should signal differences from the default values. After cleaning
up all occurrences of FBINFO_DEFAULT, the token will be removed.

v2:
	* fix commit message (Miguel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Kirti Wankhede <kwankhede@nvidia.com>
---
 samples/vfio-mdev/mdpy-fb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/samples/vfio-mdev/mdpy-fb.c b/samples/vfio-mdev/mdpy-fb.c
index 3c8001b9e407..cda477b28685 100644
--- a/samples/vfio-mdev/mdpy-fb.c
+++ b/samples/vfio-mdev/mdpy-fb.c
@@ -162,7 +162,6 @@ static int mdpy_fb_probe(struct pci_dev *pdev,
 	}
 
 	info->fbops = &mdpy_fb_ops;
-	info->flags = FBINFO_DEFAULT;
 	info->pseudo_palette = par->palette;
 
 	ret = register_framebuffer(info);
-- 
2.41.0

