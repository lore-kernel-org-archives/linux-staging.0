Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1522101A0
	for <linux-staging@lists.linux.dev>; Thu, 12 Dec 2024 10:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733998011; cv=none; b=b3+ITcWthW5J4qvCKPn0sM8CTDn1WTz7AnpvcTg/1RgW0aIXYIC/lhQbkJq2T3HYZGZbQA+MzJHjntSDDR4ML8pWrUROHyfxyFEKphnFCKc6VPrzNyfWfrM2lwnWLH2zCJssSrcFUuLFKJ/LV70HpojYhhydS5jCVJhWcS8X/Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733998011; c=relaxed/simple;
	bh=H93dtME6CYXCCEc2CsbpJ2T4qp6jY2MN8VQ96gZcwvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qx92wBLTzIT8dqIa/QgOThgzv54j/iKngy+C9k9rUZMz0DIdyyPFn1HhuPv7YZjtaw4BZWEsEJYp3LTsPFpuqVj5/B4myG0nj7nKW0QSsW7UWMAIKvfDfJsu5pYcG9OhdVhiKXVe+LGnZ8sRd8ByVcVMlFJ1+Eo9MFJjhJ2XNkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 84DC61F6E6;
	Thu, 12 Dec 2024 10:06:48 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 412F313939;
	Thu, 12 Dec 2024 10:06:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oPy9Dri1WmeaGwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 12 Dec 2024 10:06:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	arnd@arndb.de,
	deller@gmx.de,
	simona@ffwll.ch,
	airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/3] drm/fbdev: Select FB_CORE dependency for fbdev on DMA and TTM
Date: Thu, 12 Dec 2024 11:04:44 +0100
Message-ID: <20241212100636.45875-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212100636.45875-1-tzimmermann@suse.de>
References: <20241212100636.45875-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 84DC61F6E6
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

Select FB_CORE if GEM's DMA and TTM implementations support fbdev
emulation. Fixes linker errors about missing symbols from the fbdev
subsystem.

Also see [1] for a related SHMEM fix.

Fixes: dadd28d4142f ("drm/client: Add client-lib module")
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/series/141411/ # 1
---
 drivers/gpu/drm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 9abb41da4e3a..55ce61a46984 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -293,6 +293,7 @@ config DRM_TTM_HELPER
 	tristate
 	depends on DRM
 	select DRM_TTM
+	select FB_CORE if DRM_FBDEV_EMULATION
 	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	help
 	  Helpers for ttm-based gem objects
@@ -300,6 +301,7 @@ config DRM_TTM_HELPER
 config DRM_GEM_DMA_HELPER
 	tristate
 	depends on DRM
+	select FB_CORE if DRM_FBDEV_EMULATION
 	select FB_DMAMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	help
 	  Choose this if you need the GEM DMA helper functions
-- 
2.47.1

