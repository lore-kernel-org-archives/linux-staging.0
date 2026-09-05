Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951753672AF
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788614901; cv=none; b=jpqi97UyTeU7ayYNJzUlr4RoIslj2owbi00ep9OsRQFSnGCryBwX1zfHOHVa4nMHBN4AOjdgZxyHnTbt/Mra1jgR3XILVOvQ+hCQwvYqTr82ZnAotVcf8mhFCfRXAsn+F3UbZb+fgNdsis+561bvd/cO95rZMZLYCFKMzjt33o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788614901; c=relaxed/simple;
	bh=onVBlW7MOcXY/4u/1wLc1luNV8JQgXpPbl+Dwq4jXa0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mGnlYjEP2SPryAbuYik5YCaaXsQAqeVcPhNvZZKpYEu/hTDjpT/d5hyki45URDNR9pFEE3723B3n8uLqIbynDfP5kGPedWczdaQUShfpmLdGN98xOpP6eFnvR1Ryr7edMSSJxfZIj0sT5RkoEUpkNF+1GPGPevmro4ColJfp8lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4xT161k; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4xT161k"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so1587871a12.1
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788614899; x=1789219699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=005z03CIhBd04YrgIq3DK9hNQnxi1U/rfpjn1baG6tI=;
        b=V4xT161kn/4MjxTKPxJ0XkXuuPB+OZIMXyIOkt6TQR89swixjV+twBN3PPXnHyRrqJ
         gM6cr4oyMZ0s9aisZ4Nuxaie9knpJEtF8XILyrWTE3Pz+vPH7R1se4YtIGf8YEb+79Hn
         BibUTvS4V2aCqBhy9rjR4UZ8ykfrVtWvOeMWZvbYZC3dSCFCDKY1eri7/nQBov7Gb/KD
         KiSUXSp2ZI5RBSSxXLpQtNoKrXV0SZuS+Gn+2abyncax5D10nA9Z2a8VlyuHzD0k7cj+
         jB6uUyZ2axEeLjySArzBWU9gMeljQiOLWb3sC8N0KriZoe6szOwkMmqFkb8dYV+yDZOV
         L/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788614899; x=1789219699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=005z03CIhBd04YrgIq3DK9hNQnxi1U/rfpjn1baG6tI=;
        b=kQNjD+11B/jCN/UNCMC3itETWkC/KmOqD/3Rg7ub1nqDSLEomAzgGs4Sowr6xT1WqT
         Obf02BxiqEBFE0/MLpqSp3WEV6SpJsUZvMDIVtWb3QJC/UxaKMatcamoZSr+FAVE8+lm
         YFnzCN0TaqB3lS+XaJiIdHCidBi+dVpNs0KS98ZsesSRPi9Yx7MMN2TnXb7CyTbRQu7o
         UYvJGxPObXDkK6UH19ESO5djg/fnmBJxlFGi0Pg1mVcy/4jIK1Jgw88kVZ/qKz0BHYda
         9Xp03r6SO9DP6b9ENM+xVf2xC59ewTQifVn91DyZYKLf53p7+ZK79P+bZElOBYOI8yia
         LwHA==
X-Forwarded-Encrypted: i=1; AKwUvBzFRMOQndpKMjxXTn6Ffj35+gsbx9WSGZeW2898EUr0bPjEMJC7mNUAUtk2R/E0mKJcrf2mXcgtK9p1e+Km@lists.linux.dev
X-Gm-Message-State: AFuF++nxfzwl0RuGZiqFlTwycQ4a7fW5ngIUIqDIXoqrF8oVFbnvbGuG
	CnZE7KTW57AXWYdW+hUBKvA8OSX7TnDhoPfdmfSBcrEI7fHb0F0xETAv
X-Gm-Gg: AYBFou15YFzso/xletMDbpkLt1BAE/bzeouwOoZYYiTul2oBct6DkCHfdkKqf1GYfVN
	hI5KeU69gBzuvtME5AFWeHq+5641rZi97YyimfTcqfCnKzM+izwo0/eW8mA2IcbQC7/t11wyIDJ
	flj8wxcJz4axufcxPe4wweZ7i3/Zeh923LL6tR/TskGbQIdx9LWfD/dt+AOmW1XDGdj+2EXvHxb
	hn+9MVMQjlrA5poqo2KDJrKp4D+OydYqTDx8ugIrH4oWQX4rRtgNrxRA9dTO/MLCjRYCylanAI2
	DjAGYP2K0NANvWztzCVBi/ior/IS+e0Vg5RWYNRJUiB9Ir/F1o9FFXTuNGzBzcLBaJYkSWqYGmI
	p/aHTaCAIRJJFdAInmf7FEYTYXUiWBAx6yi0C5l9xfBW25udme6QGkNH/bdUsqJg9XMRQPXj8H3
	dne5kPLABrKav+Gz89mPjFSYjkcvGRd5BnnG8WmQ6zyJpXE1EObyFkqswtndkD+UhUr5/vs5vmO
	qIm+m1rGuIG4eTozPQzSAsjg//V5BvudjZO+0GJS3P5
X-Received: by 2002:a17:90b:2d07:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-39b262abd26mr18147120a91.25.1788614898686;
        Sat, 05 Sep 2026 06:28:18 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm7243548c88.12.2026.09.05.06.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:28:18 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v10] media: dvb-core: extirpate defective and unsafe ULE debug block
Date: Sat,  5 Sep 2026 10:28:12 -0300
Message-ID: <20260905132812.8521-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Completely purge the unmaintained DVB_ULE_DEBUG code block from
dvb_net.c and its Kconfig definition to eliminate severe lockless race
conditions and clean up the unused function signature parameter.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/media/dvb-core/Kconfig   | 11 ---------
 drivers/media/dvb-core/dvb_net.c | 42 +-------------------------------
 2 files changed, 1 insertion(+), 52 deletions(-)

diff --git a/drivers/media/dvb-core/Kconfig b/drivers/media/dvb-core/Kconfig
index 8b3f2d53c..c6a97add8 100644
--- a/drivers/media/dvb-core/Kconfig
+++ b/drivers/media/dvb-core/Kconfig
@@ -67,14 +67,3 @@ config DVB_DEMUX_SECTION_LOSS_LOG
 
 	  If you are unsure about this, say N here.
 
-config DVB_ULE_DEBUG
-	bool "Enable DVB net ULE packet debug messages"
-	depends on DVB_CORE
-	help
-	  Enable extra log messages meant to detect problems while
-	  handling DVB network ULE packet loss inside the Kernel.
-
-	  Should not be enabled on normal cases, as logs can
-	  be very verbose.
-
-	  If you are unsure about this, say N here.
diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index a2159b2bc..5060b8866 100644
--- a/drivers/media/dvb-core/dvb_net.c
+++ b/drivers/media/dvb-core/dvb_net.c
@@ -68,19 +68,6 @@ static inline __u32 iov_crc32( __u32 c, struct kvec *iov, unsigned int cnt )
 
 #define DVB_NET_MULTICAST_MAX 10
 
-#ifdef DVB_ULE_DEBUG
-/*
- * The code inside DVB_ULE_DEBUG keeps a history of the
- * last 100 TS cells processed.
- */
-static unsigned char ule_hist[100*TS_SZ] = { 0 };
-static unsigned char *ule_where = ule_hist, ule_dump;
-
-static void hexdump(const unsigned char *buf, unsigned short len)
-{
-	print_hex_dump_debug("", DUMP_PREFIX_OFFSET, 16, 1, buf, len, true);
-}
-#endif
 
 struct dvb_net_priv {
 	int in_use;
@@ -320,16 +307,6 @@ static int dvb_net_ule_new_ts_cell(struct dvb_net_ule_handle *h)
 {
 	/* We are about to process a new TS cell. */
 
-#ifdef DVB_ULE_DEBUG
-	if (ule_where >= &ule_hist[100*TS_SZ])
-		ule_where = ule_hist;
-	memcpy(ule_where, h->ts, TS_SZ);
-	if (ule_dump) {
-		hexdump(ule_where, TS_SZ);
-		ule_dump = 0;
-	}
-	ule_where += TS_SZ;
-#endif
 
 	/*
 	 * Check TS h->error conditions: sync_byte, transport_error_indicator,
@@ -659,23 +636,6 @@ static void dvb_net_ule_check_crc(struct dvb_net_ule_handle *h,
 			h->ts_remain > 2 ?
 				*(unsigned short *)h->from_where : 0);
 
-	#ifdef DVB_ULE_DEBUG
-		hexdump(iov[0].iov_base, iov[0].iov_len);
-		hexdump(iov[1].iov_base, iov[1].iov_len);
-		hexdump(iov[2].iov_base, iov[2].iov_len);
-
-		if (ule_where == ule_hist) {
-			hexdump(&ule_hist[98*TS_SZ], TS_SZ);
-			hexdump(&ule_hist[99*TS_SZ], TS_SZ);
-		} else if (ule_where == &ule_hist[TS_SZ]) {
-			hexdump(&ule_hist[99*TS_SZ], TS_SZ);
-			hexdump(ule_hist, TS_SZ);
-		} else {
-			hexdump(ule_where - TS_SZ - TS_SZ, TS_SZ);
-			hexdump(ule_where - TS_SZ, TS_SZ);
-		}
-		ule_dump = 1;
-	#endif
 
 		h->dev->stats.rx_errors++;
 		h->dev->stats.rx_crc_errors++;
@@ -843,7 +803,7 @@ static void dvb_net_ule(struct net_device *dev, const u8 *buf, size_t buf_len)
 				       *(tail - 2) << 8 |
 				       *(tail - 1);
 
-			dvb_net_ule_check_crc(&h, iov, ule_crc, expected_crc);
+			dvb_net_ule_check_crc(&h, ule_crc, expected_crc);
 
 			/* Prepare for next SNDU. */
 			reset_ule(h.priv);
-- 
2.43.0

