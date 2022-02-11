Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507157D
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 09:46:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 736981F38B;
	Fri, 11 Feb 2022 09:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1644572802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hWkSlUqmvqatphDrQbtqrs0TOgMUCOXaEkFWSy0KgDk=;
	b=h/kVSTb3vhQtZK+zgStLmNwTpJ57fiDU+/rp+KR9SNzkLAEVNrYlmgIQlSbZ5FSGKMsqqk
	CYolu8WU7Tn1n300He3nrzmyhwgC0p6xMrw/r0b0wtwboP0/oGLI29iLaOZqlGZxOWdqp+
	CwELrMZr+AJom+1bHtV4GHHpR6S+9DQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1644572802;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hWkSlUqmvqatphDrQbtqrs0TOgMUCOXaEkFWSy0KgDk=;
	b=VazQaEGt2MZRxX9i4HqAvveVE+YoXNHkeuAsaO6UlK3QZqbIsi04Imv/kNGkD/q5WQGKqW
	3oZ9BxTFHNkow6Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2CC9213BC3;
	Fri, 11 Feb 2022 09:46:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id zJbzCYIwBmKMHQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Fri, 11 Feb 2022 09:46:42 +0000
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
Subject: [PATCH v2 0/2] fbdev: Significantly improve performance of fbdefio mmap
Date: Fri, 11 Feb 2022 10:46:38 +0100
Message-Id: <20220211094640.21632-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the bubble sort from fbdev defered-I/O page tracking. Most
drivers only want to know which pages have been written to. The exact
order is not important.

Tested on simpledrm.

v2:
	* make sorted page lists the special case (Sam)
	* improve several comments (Sam)

Thomas Zimmermann (2):
  fbdev/defio: Early-out if page is already enlisted
  fbdev: Don't sorting deferred-I/O pages by default

 drivers/staging/fbtft/fbtft-core.c  |  1 +
 drivers/video/fbdev/broadsheetfb.c  |  1 +
 drivers/video/fbdev/core/fb_defio.c | 48 ++++++++++++++++++++---------
 drivers/video/fbdev/metronomefb.c   |  1 +
 drivers/video/fbdev/udlfb.c         |  1 +
 include/linux/fb.h                  |  1 +
 6 files changed, 38 insertions(+), 15 deletions(-)

-- 
2.34.1

