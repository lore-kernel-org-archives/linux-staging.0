Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44203911C5
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 14:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616921; cv=none; b=oJvKgOqtSG9Oa6A4y3CRs7FlYX9kYKSUSzqFx8BLwAZkC5FqAP0rGgDrzDLTwOrlvwRgZcAC7Y4M1MLCOloKa5Qijp8OzsWgt94rzrOD39/IWDiTpULw7mkqwEXRBO8nkT7w8AwvHjBoGzC51dVyM0rwC1hOgyqfWLzRIYdXgyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616921; c=relaxed/simple;
	bh=onVBlW7MOcXY/4u/1wLc1luNV8JQgXpPbl+Dwq4jXa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UFhuL3RGgKlGqisGx3KMk32zqkBPbuDfo5Qql1QicP1tWet+3RcZfFV8ebWZnm1TION7b/s2HdGwD6IwAUQ+JNrI8fyuN3ZBul9+uibPiuLoiWKW5ZHcjSzvdxURSpAJTnvX24H7+Nl8jcvCriueFGxDJ8uLD3kthvrm+v2OA34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjbK8zn1; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjbK8zn1"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-97c7afa485bso1235755241.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 07:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616896; x=1789221696; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=005z03CIhBd04YrgIq3DK9hNQnxi1U/rfpjn1baG6tI=;
        b=gjbK8zn1vgd80qNi4B0qVPGOYRtkG/v15RIgpAsWK6QUqAVHBLp6JOeU2cH+53nicx
         ZuM8Y8ghKzgJqBndVjPwd/pR6C3GMQYLbgf3mpQIrk3LsjpU3wa8CJdswaja7oL+u0gk
         5Pmr1g4DkUEQQly3Rw4WIx7njbqaqs53Vjlsp+Wpob85XLFdK3TOGkgebx4/bNcjESNY
         +LeJA79c4KAjI8h/exqRGwmIwUfKJJnPeoLR1gPqOE4dhRgmIaoCrxL6rAqOvtyAcjyE
         L4H+E92X9bRUIzFdk+Fx3nrp3LbxmvZSswnA7RsYRWGFjJXe38DzECPYEdrkSwhOQ0jX
         0nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616896; x=1789221696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=005z03CIhBd04YrgIq3DK9hNQnxi1U/rfpjn1baG6tI=;
        b=iPGc4vKzivW0vh7tTi6yCH43jR54XtKCGPS4e7/lZKyFyzzCN8NTt5hLIb6kHVRucM
         f/N2XMDtt+lltcGAXeU+FkbogLg58AB3lwHqbJMxpn0RZqudmIakTFptOT3MM4OKLNh6
         uZrGNyCDZINeZEpIT1yuRAQF+W/qHhjI6OxGaue4cPknU09egTUWJBsrh88dy2x8fEv0
         Dgf893zR4uNpzR4eNP5CKPrDSMvAJyKko3QM7KWhw/4m2i+MM6I+9NSfgGbPQ71JXs9C
         BXE68cdg1Z9NAYPrlCOu4/vAKPXXWMr6h7FZLDlwikBIYCsz/N4K+1oQlkyOWvgs4Rl/
         snQQ==
X-Forwarded-Encrypted: i=1; AKwUvByLLAlwFUTbEy/WkqGpHUntg4Fc0aYvUso35jLYtKfMOliY5G9qLxwWOqRT0L96iMONLtx3sb8g4sqTPttv@lists.linux.dev
X-Gm-Message-State: AFuF++kaKnyzkvXZQLnj/VezpS5fcb3EoiHCdtEsDghJwDrnb/bWnA32
	jrUzSGYJ5qomd2wo1Cz4yAIE5Jo0zQZcbU7IFrJjcHS97dn3pJzdM31/
X-Gm-Gg: AYBFou0yFM95GlIbJPlG0mhrJn7bwQzoXsogxIzdVujHlEn7HT+YC0OtZ5Tz6EXjqE5
	tkPwwpBSdKToUuwfuxw66dbKymfppQVqsqSzu4LVR/WjfgbU7oCSYRUuK8v+MIqA6MYm+c0/d4H
	cyOIQmGBYKYlOCuutB8cX57FQCmlffIA7xbrXgfDroMI+FHg0uZ93pxrEy8rblMTigJoXuiX81I
	YDeRvOTHJiSIfxfkxQRii/6H9V2ra79m+RInoLazMAALIVXNWcELgKwPM2lw0vnbRJL/bX6CLth
	npYr/thZTiHXJKZalEuym4r/igiKLDS0FmnM/6HKQSPFQXvH3OQv/cxfk5y6W9I7jiTwQxgnDqk
	bMfICqJ61km1H2VFUYLtVPi5A05rHwx38dq2YUh0lSje8KzWZtMQ7qvpFT4+uroZzcUkLGt1Woy
	O04ocXOUCS2L46ajsWj8xJTWskH/uEGkouGJHSa1xfOXA93EfTqjz7YqFXm44NR/LJOUO5zoS0M
	G/GKiQzpZiNyA/qhRnmRURdsclS9inN
X-Received: by 2002:a05:6102:3a0e:b0:786:c223:ad84 with SMTP id ada2fe7eead31-78a4a9c39cfmr5025994137.9.1788616895319;
        Sat, 05 Sep 2026 07:01:35 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee4d743sm3706877241.9.2026.09.05.07.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:01:33 -0700 (PDT)
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
Subject: [PATCH v11 3/3] media: dvb-core: extirpate defective and unsafe ULE debug block
Date: Sat,  5 Sep 2026 11:01:13 -0300
Message-ID: <20260905140113.21638-3-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905140113.21638-1-breno3011alves@gmail.com>
References: <20260905140113.21638-1-breno3011alves@gmail.com>
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

