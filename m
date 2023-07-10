Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B06811CBA
	for <linux-staging@lists.linux.dev>; Mon, 10 Jul 2023 13:01:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 042211FF7A;
	Mon, 10 Jul 2023 13:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1688994078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/zUoLo2iOzomOZ9vT6lH81AsiLcKSFTf6r6yeZLXs+I=;
	b=XOuadsPfz67AOSh7Ed7yHanRtTkDg8+PQa5iqXvtYgoQ13QNaWanlTvotm22780rhMVc5c
	XMZ5B5u7dGHYW1r6KrvKRtIBSeSQ9zvLvgzbuZZ6PwL5ac+OiNkeICP1qMsOV59reVFZic
	/4J6NeP1sx0oElFAXxuxXMYooJuJ2rI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688994078;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/zUoLo2iOzomOZ9vT6lH81AsiLcKSFTf6r6yeZLXs+I=;
	b=grGc3342L/FzeU0I0LmlEHzF8hTY8FFCaYR9DhKTHgmez1voinzZf/yiixCQrBjCiOz0Fx
	V4hMFgMLnvYfh2Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9C3FA13A05;
	Mon, 10 Jul 2023 13:01:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2MfgJB0BrGTTFAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 10 Jul 2023 13:01:17 +0000
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
	Kirti Wankhede <kwankhede@nvidia.com>
Subject: [PATCH 07/17] vfio-mdev: Remove flag FBINFO_DEFAULT from fbdev sample driver
Date: Mon, 10 Jul 2023 14:50:11 +0200
Message-ID: <20230710130113.14563-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710130113.14563-1-tzimmermann@suse.de>
References: <20230710130113.14563-1-tzimmermann@suse.de>
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
up all occurences of FBINFO_DEFAULT, the token can be removed.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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

