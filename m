Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97EC4A2A55
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 13:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613787; cv=none; b=C8Z48elp7AgeYUE+LNYATplXPJkJ8FV7+yN6E0zFB+iPbbMs4uARBsYBB7+Rlf0wsKPJZpPOW5VsOld676rKB3BeD9xvopd/ilw05QwAJxqrR0P+wnKt+yFiBJrXCx4zpU4SKCRd0TM3rIVw7+fWIMTX7ee045vQ46B8x5OP+Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613787; c=relaxed/simple;
	bh=9oavKokRiGlYKumk2qr2nWS7TMcpdvvTbgd4joGd2sk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZZo3BZKgJduVWAoLFBsZHjCPup4XFaVbMK7aF6J4prPoCbAgxCzkaIp+LiflF1EPo2/E66L4THW+YFdq140WthayGu5pkGwm/WVHsFgOrr4Ia+/N0QdtumzBXbcq6CBuIhoJPcEbD13brHtCYAK4HqHpZ+oLexh4ic76BlMHJmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pTkembgl; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pTkembgl"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7855bfd6ab6so601842137.1
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 06:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788613784; x=1789218584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EzzJgiv2Lpk9t8SNtDocd6qJ1tIEeCqMQeAGgeJvM0=;
        b=pTkembglHt5mTNAovLRS0RQo24xF1Qiiw1nsodH8tTL3yZSOvkHq8NLtoO8jYKlIZ8
         0mMuCnFN4wrnU9i1Vq5YA1n5qWZF+fxExrWooX8AoWisne2b/OtotLUz1I8IRTERxTsO
         pKKB+hSFJCpijPGGGJGmZLbpn/M/f0jufygV2T/h8Rdzdk9J44HScWFufkGyMIIZCrtQ
         sfC9L4fx7PljMgUaJtTWqCQSTlnCjSlBgFeCe1qHns4kxMkHMt6itc1xa3K98Fxvp1I9
         99MceW66V83e/XaY3bBt6/+5DXaiq+TwOtc0Pp+8Adm3q7JbwOMHzxhG+8cx7PauxtDG
         q2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788613784; x=1789218584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7EzzJgiv2Lpk9t8SNtDocd6qJ1tIEeCqMQeAGgeJvM0=;
        b=cC02I8cUeFskFPFeyBHzQjLdDtxM4+yFqQpaaYYZuK03IqyBttMpOsLOC8Dxzgdy67
         JlNfdIZ5JrPtaKBo08uLyPcV9hM0xRISbY4148HnlXalDiPM9fBDjpaFHeZY1NdSmIYS
         VMsmpPg28P9+YMw9kl3tLvzWcQ7YKytZ+KTVEl2mprkEQAXQEqsZGf0j0GuCsMPsUpJo
         UQKNT58gntr38mlkes29+x04Pv2m6jG+cdVVJ1YKo2cntE8emcHryap+cKgur4r+9aST
         0zf8KC7Tz5j6/RNZzDUkG6QNbJHVxU8lBH1jEgXy1itUtU3XCdgOHH1lpvO7s3K8TSZf
         PebA==
X-Forwarded-Encrypted: i=1; AKwUvByKu97UYAM6Z3uaql0A6vNTuet8BonmPmFIuOCeMkfwTP7TE5bx73ewwPhXhLCsm00ocWy7BffySayP29+q@lists.linux.dev
X-Gm-Message-State: AFuF++lLuP1A3cRq+JawpZXOyGDSadrG6OxkeanNEPAf+SOf26zKihk2
	niyLyzRWMWBDFUtzX31+sJMVjukedCSM1NrdE6ggvD+RDbGBDRivNfXM
X-Gm-Gg: AYBFou1evz9FnUpl7BkdqFAejaYIenmnHFdChLrO6OGG5ovxKhw6J8LzWx/u1BOFH77
	ZgXEj9qWiAd5dXotlKtGADAqjkFMG4hTM+SEpSvcbiCmBwOl8bi5WwtWuri9He4068ZDJsxvekk
	Me161BEQ7WWZxcWQvyQhS2uIfkN16BE/s/NttNxrmiZ8f8MBn+1wu5mOPBMDX5hz1z8DIIDeEbJ
	Q0l2kstsMHmHIKXUorDoPKmRhME6ec9TqBJSv/VsZeoAXRtFFCXEFZLG/iFvNrFr5dNvV/b3ggP
	+xYYTeueWY6+uOpdwvbIwT/VsWKxBENyBH6Md4Xb6cgTAeMlzKrdsE4ZJeBuTfdI+64NH6j2u0A
	XhTYjQqNaBVzwI+NjzzbMjghi+d2T4cFdycAXamGX5IRDX0d41qVwIvAP4uldYZwEvqlCrd1UPc
	oVKQEkqBFd6X8m+BcpNKookuVHViStoUOqL4bPYQmWYN16JSlFPHgYk4cazRIkuAOUEyeXmQbcA
	uajY6TTGEOXwhLJLojol8IDBMeJEACC
X-Received: by 2002:a05:6102:441b:b0:784:d83f:2a59 with SMTP id ada2fe7eead31-78a4aa99295mr3711296137.9.1788613783614;
        Sat, 05 Sep 2026 06:09:43 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76487sm3719782137.5.2026.09.05.06.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:09:43 -0700 (PDT)
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
Subject: [PATCH v9 3/3] media: dvb-core: extirpate defective and unsafe ULE debug block
Date: Sat,  5 Sep 2026 10:09:25 -0300
Message-ID: <20260905130925.7115-3-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905130925.7115-1-breno3011alves@gmail.com>
References: <20260905130925.7115-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Completely purge the unmaintained DVB_ULE_DEBUG code block from
dvb_net.c and its Kconfig definition to eliminate severe lockless race
conditions and clean up unused function parameters.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/media/dvb-core/Kconfig   | 11 --------
 drivers/media/dvb-core/dvb_net.c | 46 --------------------------------
 2 files changed, 57 deletions(-)

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
index a2159b2bc..29f99dfe2 100644
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
@@ -823,12 +783,6 @@ static void dvb_net_ule(struct net_device *dev, const u8 *buf, size_t buf_len)
 			__be16 ulen = htons(h.priv->ule_sndu_len);
 			__be16 utype = htons(h.priv->ule_sndu_type);
 			const u8 *tail;
-			struct kvec iov[3] = {
-				{ &ulen, sizeof ulen },
-				{ &utype, sizeof utype },
-				{ h.priv->ule_skb->data,
-				  h.priv->ule_skb->len - 4 }
-			};
 			u32 ule_crc = ~0L, expected_crc;
 			if (h.priv->ule_dbit) {
 				/* Set D-bit for CRC32 verification,
-- 
2.43.0

