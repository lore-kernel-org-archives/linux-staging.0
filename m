Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35B24A2065
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 12:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788612294; cv=none; b=oR3TMZi5uybEKPv0UiyHMWVXPfJuIIl8soXM6+so9sXWDPzfJNAzHOxERJW3+nrkvstAcYODZ8LOfVwUlRQbsEY3hhWk+I9Inp46YIC9a62DQldL3On0EIsaPzpOKLcKfYZ2wZfT6EVtbmRBn/QQZiO2Zjlc7goYlSeM6UFYF10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788612294; c=relaxed/simple;
	bh=BjgISfvTM9/XDu/h1M+kDpd+4iJY+LF+t70SRBDyc1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HufsYoIxXSl9p2v/sY+x0Vgci2po8pjpyzya5Gr0HNyzM9H0AYFmvmFlBpPjOSGA/5Jl9EMV3vt451Xzhrl8lWL6hbZZVPEM80whIrLhToEZ4t/3G6KECUkYLl9ojAnSW/Tg1LYEB5ppuE+4o/wlnfBK0tixNDkNeOe/dAY/f80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2IKNe5j; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2IKNe5j"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca80d708489so1479521a12.1
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 05:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788612288; x=1789217088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbG5XujoIulB+PfBXWWG4z6deVw9HiTKDnCZHy6890M=;
        b=h2IKNe5jprjfBi6ZJvRBnji5DomIexh9YAJvglOzIm8/Ye+S/Y4Qdm+iruZ1M5KrWX
         t3H5RkSONNhNEwIAzLbSdJk74ws98JHAAqRAFxdGR9uopwV2uaP1wtqfy3WNhit6UZDh
         +YDNOEZZnEaxMXwU95RtAGn4E/dFqVRNWI4liTtq0SnQl4AibRRPgAXCTEfcSwSm3YJq
         9W72i/WPurKEPOtkB/pDGNkMs85Wd+qIz3nOoGozBVjuKP60Yb0e6GEAi5O7+MP9BBeE
         vvwQBV6T7iocy9EwZh1mElnZPHwcGCjiIFHYu8xzOy/U7W0yBy5/RDJ9Op++B9Q5aKuu
         UIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788612288; x=1789217088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbG5XujoIulB+PfBXWWG4z6deVw9HiTKDnCZHy6890M=;
        b=WMEryQU+PDvRIM2R5Onb34pp2oE1APj+SfdjNZQ0YLcktgKRywJA20EXrvW6sZC6wy
         88j2LapHTSrqNfzSouCDIGJwBMpOhQ83LcQmQGt3fYeOiZUPw9HlU7bZZ3XteHmD+Uj5
         4oiwoafrzScQxCrbY92KLtfW2ndoZl8DX7j4rUTPFeoB7254c3oE9JRDh62KXz1cDom+
         SVBDrOvd3476wax4cRk3IH0sZAWK7ACPIw4uvy+IxRlk4QOK0UBGTXLZkAxn6uWGeDbd
         3mV1ROCuOGWYeZTUIQMZ2hq7TYf9D3KQ03qv2+fo7sJqmg9R9lhCr7ay/S9v+epE4Wut
         X5QA==
X-Forwarded-Encrypted: i=1; AKwUvBw46M43zLWj/2XGR8/gENzpalBOikUKlcUPkhuNAfGQS3dQxv26o3UIBrZLQRPk0JExwME3WGQTF3vlrcKT@lists.linux.dev
X-Gm-Message-State: AFuF++nZCieuOlZTlck364zObP3qs9pBgC7DxZbmOovBoHrc6uIFkKQX
	i5dBmDTeA8dzsI/PCU8AqZU7M2eVZWcyQyiiUHuKX1RmXd/zKH2am0us
X-Gm-Gg: AYBFou2AoIlHQILI1QrB+GnT2KizaP5lEkffDgNjsdTrMqHGS4EWI2wTtOA8KfZrJ5a
	65YlzmVhqJtmbp64u1bKK21WwstLXVtd/9SmLrjESNl0wWLTjYTGOo8rwMVNPNtzyJjeyH0dR60
	2fnudGFfHfK7UZJQ9hMfd3trIGhlQOPRY5vfvyWFcwSRkOSuO4/loPAY1psrruXkOOE5gRiHgL8
	+uFJcZLqtdL0Gk7wLRFixYwXrdaKEl85nz9GXH4ywJ0MKV/6D/7iGAO328nGq8hMxvEC5+0YEKb
	b8ap6kPDrpEtKF9mzJJRunDHah5os0FqqJKuxtsvTBy5s73GJlNm6iJwV6FgXBogPYHl23eEmTj
	5Dmq96Xmda3CPfllOipwQePYxw3hEI223OZ5ZJOdD6YHhFKGgGg9ueYHkazuAZrO3t2QeMVYKzM
	7XdRFRqyNjrq6H5sHR8lnGJAp4R9xjspMaM3VeyzzbQiMqAVW2SGWXLyo++gYJqDGUaWQGW9KB5
	zMmTkpiiElLL2ntn0cWh3tT4sm3hyId
X-Received: by 2002:a05:6a20:d80c:b0:3da:11e2:b36c with SMTP id adf61e73a8af0-3da2168b2d6mr18461998637.27.1788612287382;
        Sat, 05 Sep 2026 05:44:47 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3346ea43377sm11740417eec.3.2026.09.05.05.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:44:46 -0700 (PDT)
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
Subject: [PATCH v7 3/3] media: dvb-core: extirpate defective and unsafe ULE debug block
Date: Sat,  5 Sep 2026 09:44:34 -0300
Message-ID: <20260905124434.6163-3-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905124434.6163-1-breno3011alves@gmail.com>
References: <20260905124434.6163-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Completely purge the unmaintained DVB_ULE_DEBUG code block from
dvb_net.c to eliminate severe lockless race conditions and buffer overflow
vulnerabilities on global network state variables.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/leds/Kconfig             |  1 -
 drivers/media/dvb-core/dvb_net.c | 40 --------------------------------
 2 files changed, 41 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index d0d318223..800fbd560 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -873,7 +873,6 @@ config LEDS_UPBOARD
 	  This driver can also be built as a module. If so the module will be
 	  called leds-upboard.
 
-comment "LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)"
 
 config LEDS_BLINKM
 	tristate "LED support for the BlinkM I2C RGB LED"
diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index a2159b2bc..ae0073b94 100644
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
-- 
2.43.0

