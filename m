Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A011F92E
	for <linux-staging@lists.linux.dev>; Mon,  5 Jun 2023 14:48:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3B1101FE67;
	Mon,  5 Jun 2023 14:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1685976497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7fXCeGayswbRa4n5Bq4gPzRcbgkQ+/kxTRiftd6E8SI=;
	b=lCrrbzudHur7FR9jlI8IQi8KANzeQsKq1QukvB+zGqj8UOT73iR2yjttLsCvV3B67PuBHQ
	x1oz5449YqaBtYJhTrp+tVk1Wsis7B+1giHJOjr2wydvki6zkDovMBbpZYGXWlH0Ye8qM/
	wj7VaAH2xdFp0WcXu9S4ilPFEtgKkeU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1685976497;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7fXCeGayswbRa4n5Bq4gPzRcbgkQ+/kxTRiftd6E8SI=;
	b=Xxc3nGIZOoKfJIbomg/jDPkjTX6wYzPl+BcnJIL4XaMTzjfZ0sqoAynjk4Yu6t6Ao16pF2
	e5a9S+RcyAcmUmCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F1C6713A3C;
	Mon,  5 Jun 2023 14:48:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ACMqOrD1fWQvXwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:16 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 08/30] fbdev/broadsheetfb: Call device_remove_file() with hardware device
Date: Mon,  5 Jun 2023 16:47:50 +0200
Message-Id: <20230605144812.15241-9-tzimmermann@suse.de>
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

Call device_remove_file() with the same device that has been used
for device_create_file(), which is the hardware device stored in
struct fb_info.device. Prepares fbdev for making struct fb_info.dev
optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/broadsheetfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/broadsheetfb.c b/drivers/video/fbdev/broadsheetfb.c
index e9c5d5c04062..72743a3e8772 100644
--- a/drivers/video/fbdev/broadsheetfb.c
+++ b/drivers/video/fbdev/broadsheetfb.c
@@ -1200,7 +1200,7 @@ static int broadsheetfb_remove(struct platform_device *dev)
 	if (info) {
 		struct broadsheetfb_par *par = info->par;
 
-		device_remove_file(info->dev, &dev_attr_loadstore_waveform);
+		device_remove_file(info->device, &dev_attr_loadstore_waveform);
 		unregister_framebuffer(info);
 		fb_deferred_io_cleanup(info);
 		par->board->cleanup(par);
-- 
2.40.1

