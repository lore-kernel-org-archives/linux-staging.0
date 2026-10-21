Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792566095;
	b=slsCY9v1f1+Nfq5wljKo1sCCxspQTu3M9VRkFu8wIWOzJnOXrazp7/aXz/ed5/2fh8Zd
	 J+U+IrBj016cxPUR0PmauvehiE09KSPV2QsGRHkvAm4dUkfY0tnWOdipr5I3l4vhn9ESx
	 Wi/AB+SE2MWH/0Exq5i703Tegm93qvwz1TQCulJ8cwSWcTdipnLfNOE15hg22N5Qtwp1K
	 KbIB4tsDA7Mi8ZScoehA/CHNVBLn/EYs5lGjjeLjMSa2aZOrkhlm9iOJQqi7Tfl9sGcuy
	 tuz4/lcsTbtLOGBiVPjQ7B+xscek/cA/J9ts7veDou9HSuDAUG5RYiA6gFcriPuK/xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8MqW7A/5BexXieJFDl0KMi6tB2cgsccB+PD3z7gY37w=;
	b=381SOCjL5W6uo0vcQX6otcVwXyyKM6aRm1JblTurXYQssAKwYEAm/qkwZlJ8uinnzmdg
	 wC2hUaL/p0PlvGxQOcvLFjb33NEVqf02/CyDFgMGFH4reTfI2w5dYE9OaHGnMu+fvBuHS
	 62FL9o/D1qX4L7oL2zN0W5A0DiC78sIPr+gICSlqyqo0E1goNCHOaEEjMKKYkEhHEq4Zi
	 hgRJOKqIuP5L51em/szvSjuVTUpXN8KK1YANAJ4qTReFfLh75yOFxA/IBh2XdRM9JCp6M
	 /ViU4/UfXHhRyX8D2gI7MVOyegs8J7Bo/t7OKJt8dalv0DF61J+HS8mZn3dx32Ehcug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fCRJBBAM;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6908B606A319
	for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 07:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6908B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fCRJBBAM
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1ddc7c9beso1527315e9.1
        for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 00:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792566094; x=1793170894; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8MqW7A/5BexXieJFDl0KMi6tB2cgsccB+PD3z7gY37w=;
        b=fCRJBBAM+Je17SVrTpMq2uah0yyQ/+RTf0xCCrcRLa7VwHeVqq+fG/PvQW9B98iItJ
         sDKGcFekCxAjA1aQpHo7/K6reKnL00Ww+kPww9PecIeXwQRilS5H3+XuqHuJy7bFSqoL
         xKB8VwKoQXNW3p3gkia+NAj8LZqLaSNAG8OiqdjoKEBToAQYpJFTEERZG7ZQQQhcmyUL
         YnYL6xXX5ZaSrt2mrCmqPBb5qHSQpDzbGvq1UJ17lW+JVM7Ag9nYWwIjq/lVvFnpm7Ek
         4zxTQLo4gdqt8p9g6saAvrIDSaXrzfdmFT2lkFhmBNiiMOXC+nOykAs9LNefs66G2r1B
         E9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792566094; x=1793170894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MqW7A/5BexXieJFDl0KMi6tB2cgsccB+PD3z7gY37w=;
        b=wr6RYpotDtZOiPGzgBiqOfdokatLvuxzQp4QnNCH5JNm5miBgl86UI44Qoa1h8k0cU
         082MjgbMeMeZsWklOGLqNctJkKeZSPyDHM0bAqUg/TpcKi6SYXJCGmaMQ1toyvNW6x+1
         hoQF+iuVUSjWX+RD+2hNvGQVm/bVqznsd9nh7JEEu+5D/X1p13biQhf0zbv5Gqz5c/pf
         HVDReun0aUVsSX9RCvfzqkMZpn5gUVonig1lLGRm7lkckXdk2NS9guBXepbwjCBO+dRM
         Y0cfWk7ZJdGizFF0eaZYl12/3Lj4DCk/rsITCbJYm21XiJXvNEo6x7YG5bxREVb5D2iQ
         O1mw==
X-Gm-Message-State: AFq9FYKg3l2Ywqnn2NLEQnH0OhywlG0Ms55Ct2D2SUrBnBaLg7x3WWoL
	B03bme0NSv9T8+uWWMTL5ab3NluifEgARSTIX0xa++QP1frG3KdtmjWVR6ZtcMKd
X-Gm-Gg: AYBFou2kKZIM5Qze4SCa51KQ7muZNFM2vV/pJRMgIR5yhwWDCOsZP5YJZF/EUpx6j6Y
	ML4szZw6C4S9gRjUXHRVGGBamoKzkbCEr3wlANlVhF0ORFfEfEQfYdFO5V0uwQ+7q8sI4cHow/L
	/yHYvQUxZsxdkRzJKOfjANplw/I9v8yfk6wfZizPDAO6NXV79IBoqXe1rboxYaz0Nt0Vr4I9jUC
	7ZEcAKz9aUyu/5HiLs0X8zh/6+aaOFhLKCwCCUbDf0Ad4FcYKRqr2m+UsYEvQp28pGE9Ci1SRq7
	69EocPCJxG8RPXyzPDguyP83SPw6Mqs6XbbNuY0iO6nRwu/YE5tiQsDxHvQrp/Y2DJ5eeZehOhT
	qr1JpF6nMrjSE5ouySip9l2ZLNAjjclAHMnSrj9v6oY6kNZZYtIznuZjcFeM/WU2xRC0YHZz0XZ
	87Z7GbV//kwZY95fMc2J/jNWHE2mrHViFi9chO4j/a6eQJKhlLrIx4Olr5dv5/ZzbQeI9iFqkqW
	yP4IGyc4OR0axcXx6/+Y5gTChOw6NunhE2yI/pVQcZ5ZCyuoP8UzuShP5d1sUULvwyCEbaGQvXL
	hOn8/hHVHMI=
X-Received: by 2002:a05:600c:1391:b0:4a1:fc0a:8b75 with SMTP id 5b1f17b1804b1-4a1fdd483a6mr18830225e9.24.1792566093715;
        Wed, 21 Oct 2026 00:01:33 -0700 (PDT)
Received: from DESKTOP-0KSTGNI.localdomain ([156.213.246.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d41c8asm128162135e9.8.2026.10.21.00.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:01:33 -0700 (PDT)
From: Temitope obabi <obabitemitope765@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Temitope obabi <obabitemitope765@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Remove extra blank line in os_intfs.c
Date: Wed, 21 Oct 2026 09:59:40 +0300
Message-ID: <20261021065940.863-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a duplicate blank line. Reported by checkpatch.pl.

Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index c15056ee207c..231a863317f2 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -18,7 +18,6 @@ static int rtw_chip_version;
 static int rtw_rfintfs = HWPI;
 static int rtw_lbkmode;/* RTL8712_AIR_TRX; */
 
-
 static int rtw_network_mode = NL80211_IFTYPE_ADHOC;/* infra, ad-hoc, auto */
 /* struct ndis_802_11_ssid	ssid; */
 static int rtw_channel = 1;/* ad-hoc support requirement */
-- 
2.53.0

