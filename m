Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBADD2F24
	for <linux-staging@lists.linux.dev>; Thu, 10 Feb 2022 14:11:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DD83C21114;
	Thu, 10 Feb 2022 14:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1644502273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NqZX/R1rW0u9OuXptlIh/Izf+d0bGZuqQpKWsBEQtWw=;
	b=c7enywIuPfBT8b4t4bdZIJ6TZBGPg2H24iG6J8HVpgnWft3l6StNQJp3VkA80jFXngI8Ji
	gpbTtHyUYG8DYKUv1uyiXzk4uY8skdFhyCiCQY0jTM14kEKp2AtHb21Eg1dBbRzHIam7In
	9B7hlpojYPluhCWotyaf3E+P3VLhJpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1644502273;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NqZX/R1rW0u9OuXptlIh/Izf+d0bGZuqQpKWsBEQtWw=;
	b=V5O0ngVfdN4/qyCuSxuQCTjLS7kbzLEWoGY0Pt5UP8AJ2EGuO8bwWtisApt9UkiyLH0Kyz
	5o0eqnmJCRev7zDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9594C13B9E;
	Thu, 10 Feb 2022 14:11:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aIqKIwEdBWIPaQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 10 Feb 2022 14:11:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	javierm@redhat.com,
	noralf@tronnes.org,
	andriy.shevchenko@linux.intel.com,
	deller@gmx.de,
	bernie@plugable.com,
	jayalk@intworks.biz
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] fbdev: Significantly improve performance of fbdefio mmap
Date: Thu, 10 Feb 2022 15:11:09 +0100
Message-Id: <20220210141111.5231-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the bubble sort from fbdev defered I/O page tracking. Most
drivers only want to know which pages have been written to. The exact
order is not important.

Tested on simpledrm.

Thomas Zimmermann (2):
  fbdev/defio: Early-out if page is already enlisted
  fbdev: Don't sorting deferred-I/O pages by default

 drivers/staging/fbtft/fbtft-core.c  |  1 +
 drivers/video/fbdev/broadsheetfb.c  |  1 +
 drivers/video/fbdev/core/fb_defio.c | 38 +++++++++++++++++------------
 drivers/video/fbdev/metronomefb.c   |  1 +
 drivers/video/fbdev/udlfb.c         |  1 +
 include/linux/fb.h                  |  1 +
 6 files changed, 28 insertions(+), 15 deletions(-)

-- 
2.34.1

