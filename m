Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B1AD30A
	for <linux-staging@lists.linux.dev>; Fri, 14 Jul 2023 07:52:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 25F2622161;
	Fri, 14 Jul 2023 07:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689321124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IsudHL+kPXRnJx5x/UKWrjHzIvsH1WJ679RIcWPHmtc=;
	b=otBrxq3T4CulYsnRCs+iQc7IGtuWC/N+sUZavM3yydEjG8vt7IhtVAOuvkEMlU0CfJYWFx
	kwCRQghUfRgZYpDL3j+EyNUi0KY1YcYrIHeahVFuRUbZa1j0pO1mJBJtTJi1h7VSxnUQj4
	sR/sRb1rOEBC/tbeaYZT54FgrDq8Vpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689321124;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IsudHL+kPXRnJx5x/UKWrjHzIvsH1WJ679RIcWPHmtc=;
	b=2jQQkl6TZszbkDXBuShxp72O5rB+emNtFGZSWmDo6DnQ4nuuTwVk/f0HgKK7yUENuTQPpw
	1dhePVctm2xAwOBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C701013A15;
	Fri, 14 Jul 2023 07:52:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id QLCtL6P+sGQCQwAAMHmgww
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
Subject: [PATCH v3 17/18] fbdev: Remove FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT
Date: Fri, 14 Jul 2023 09:49:43 +0200
Message-ID: <20230714075155.5686-18-tzimmermann@suse.de>
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

Remove the unused flags FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Helge Deller <deller@gmx.de>
---
 include/linux/fb.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 1d5c13f34b09..43458f582f35 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -383,7 +383,6 @@ struct fb_tile_ops {
 #endif /* CONFIG_FB_TILEBLITTING */
 
 /* FBINFO_* = fb_info.flags bit flags */
-#define FBINFO_DEFAULT		0
 #define FBINFO_HWACCEL_DISABLED	0x0002
 	/* When FBINFO_HWACCEL_DISABLED is set:
 	 *  Hardware acceleration is turned off.  Software implementations
@@ -504,8 +503,6 @@ struct fb_info {
 	bool skip_vt_switch; /* no VT switch on suspend/resume required */
 };
 
-#define FBINFO_FLAG_DEFAULT	FBINFO_DEFAULT
-
 /* This will go away
  * fbset currently hacks in FB_ACCELF_TEXT into var.accel_flags
  * when it wants to turn the acceleration engine on.  This is
-- 
2.41.0

