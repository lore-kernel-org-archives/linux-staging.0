Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF35125B0
	for <linux-staging@lists.linux.dev>; Mon, 10 Jul 2023 13:01:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AA9DB1FF87;
	Mon, 10 Jul 2023 13:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1688994081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBN05KgHaY0sMx1l1iBUjP749OE7Z5F7kgfPD8riQ2g=;
	b=SuQ5e90aJch45HVzdyRHmRbbrzuHmO1SiTYMooQuvASBPdLqlTlVilzOBrVfV3XDxhivqO
	BljjcN4Jyhf8bKj4o6lQrdesOVKLRNCvIG62NlYjtHiRrPJQ+Oi7z7go3R/fHNCwVTBrbS
	EnLnpzZX5+qqT+i1TQVfz5Vbh+G68vQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688994081;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBN05KgHaY0sMx1l1iBUjP749OE7Z5F7kgfPD8riQ2g=;
	b=HMr8eJJ2iAGo8mdPxjB2hyPQv7w8MHRS1RtWaIIBe31IMfopJy4lG5GeGEKarxz7bk1cY8
	17E3SBnQgzcfSCDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5E68F13A05;
	Mon, 10 Jul 2023 13:01:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id mIUrFiEBrGTTFAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 10 Jul 2023 13:01:21 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 16/17] fbdev/pxafb: Remove flag FBINFO_FLAG_DEFAULT
Date: Mon, 10 Jul 2023 14:50:20 +0200
Message-ID: <20230710130113.14563-17-tzimmermann@suse.de>
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

The flag FBINFO_FLAG_DEFAULT is 0 and has no effect, as struct
fbinfo.flags has been allocated to zero by devm_kzalloc(). So do not
set it.

Flags should signal differences from the default values. After cleaning
up all occurences of FBINFO_FLAG_DEFAULT, the token can be removed.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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

