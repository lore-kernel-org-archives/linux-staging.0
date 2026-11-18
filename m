Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995608;
	b=PM3uingXmMJd9VeD2lnKViqbEocsuKOkalhzd9wqvESpWysM/nRRX0J1ibnjIVTKbXKS
	 XCK+3RS+az1Egv4ywygOv5rvUZ2MvjLbEELytPmvg9DENFmLqioWEj1hBprcYQJc+8BXW
	 GLG0S2rbJZqb6pVMD5Lp0v8rQDig5cvOm3uNRReQ3J6fBrNzhI2Sx8N+fYDCxrjRxtlZQ
	 UXpMEeOLTZADAe/0gBtCJNTBYGbKms8b1jkYQwLj7yP3fD1CejWNAr1BzprdBAX6IRkdI
	 WJioyVVL7mdfFvWsnhnOoVWHhPt1Lx6eyFY6vdF2eahQnEjqce1DWhIm6nbutKlpG6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1voa5gtURoefFDtWXtSo9MgtUtxO1bQT8LxoPwj5oTQ=;
	b=ePYK0PvE4fuspGO6rTjMBCDbD9SOgs4K1BuX+LQ49gDKyOC2Tx2lJNbxcIEIRxG2j1Ht
	 0PsebREw7NoIwbYbTr8/H6oLRwduz+N2NwGsAJ/6ggHEnUqpLzKTAMjmQ/u/MF1UCTwJO
	 jDWqUez26dqamtOpCGpyllGmspRSBjozZYb4EhlPKFYISF9AY9SNkqKsle6yGXKxlmEGd
	 qOG14iRO/hL04MhEPsWHNKs/r1STqMoV5Nn+/w/IJMcwQkFxHAcbw2UycZ2Mg0QQSpliR
	 /1yX1NDTFshi7yiGHgDsYUgWgCwGW0OB0gBsrT3tw4Wt9uZqJCqi+vmFm91tK+X+SuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EbLkfXzv;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A12606A320
	for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 09:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20A12606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EbLkfXzv
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38190551625so1472380eec.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 01:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794995607; x=1795600407; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1voa5gtURoefFDtWXtSo9MgtUtxO1bQT8LxoPwj5oTQ=;
        b=EbLkfXzvghriPKYp0qCswLo5YeoEZxc9YqskRNVBEEH2yl/+zbflIes3s/U/u4G4+G
         Q0wOIkBFbIT9VH3IaSXevYy8QYC9lHmfLc0HUdadnWznalbTwv2z1Vl80q8U4rGaQQ2i
         eXZzHzfvWEqTICILm4rAKB9lLSjEyM0j+zfoaUi24OosdBYUtNE3U/Dkx9QNSQli3FF1
         hupag0Dj4XHJD4U/dFqXM51wL5pTlnZZ3v2eHjXGxW/0EIt6OohQ19bswoVBJuq5Pwz1
         9khP6pjMJtTqX0aU8RossLkz2wLeN96sPH0DBPKr6M0jn1DBYFeXqRYoSF+5EW2z0jtz
         sqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995607; x=1795600407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1voa5gtURoefFDtWXtSo9MgtUtxO1bQT8LxoPwj5oTQ=;
        b=AzrNmnxnVBQ3TZbfB1mK4dKXQ5fztQCOi52uctoG5vt3ShKaH8QWeqp9X3cSRCa9oA
         270W4MRR9Dtxxo2dpF63jI57qZA46rRO3irpxLn/djL+eFOL6P1LNHbklhDLgwWDkiSK
         w2ZFeTl0X49Dt2IgLTdjLD0928xKT1zr/N5CcVjJODLHw3zrvUhZJyJAm/N2H/oI5WVq
         wpflyG4vQ80CA2Y+U8g0FlHEnbwS9wlHQiKgzb7dasOH0LKuIGHdrDUOJAY7n5ULFX9/
         18F2hF1wVN9BhayjY8vyhcbFobqbEMxYMYVESOBwhbrVwnUPH4YD2Kt7nWqyZGxqvt3F
         VfDQ==
X-Forwarded-Encrypted: i=1; AL+hErH6NcnSTizynx6SoCrNSiN/+Nk+1qzuJDhkJhJxSPWt4junwUjxFtkfGgHYEnfVH8O7jQNeOuoKmti3Ro8n@lists.linux.dev
X-Gm-Message-State: APuU4Z85echhgw77medRmurgHqIzh0mMF7xLsBLkumCC06urv9aCyolk
	TsV41KYiSsxy/kMsv3o7QND+EGmIBNIOZ+X51wFlWtFsS6w8YQIpjh26
X-Gm-Gg: AZFdTZcdsD9oBeK0jrqowoXNyyYSvgwMr4zKeVcdMu7WgBwqSO1zISpz4K/MelBQHoJ
	o+lgibVp0VoijBfuQFjkr2L9Ri5RhYB5VGTQ3GXgN335iP9QiXTSn8DzdtnHFf3ZgJONV7fZqPf
	aaCnORirr68n9QaBCGzh1eF7buLSTGb3R1nJpt2fFIaaDazxbvK3ADP67i0vqNopEXN6scp6Jjc
	IpdX73Ad8WHfh00oSnYGtrnRxMfiDuzi2QfwL//DFJ7maJEDexpAsXCGyl6W8kQW90MBayDZu97
	/Dmb5nnc++lmOHbTsvvQuTu/OjEUmjk0X315ns9oHJFfew5JIUloEcQpHR+yBnjXx1/RDBZGSiO
	VOD9qeh+u8h94+FihSJy1vAG0Cr74CD8uk041mUSpqrPrRd+WGOledFOIqNvIBzh0mk/GOEA842
	TcP6lCNz8LLM1bsFqXl/FzKol6+DozHt7lD6MNzLQaVKZF0gclVO6CccbnUdRVlqilt25BEyOl+
	8yTUf9XfunA0OqhzqeiYgWKSukbHJg96UAVbxkyVVVvhAq1gp0Q+wJTChl+VFkfjrB5Ir4TBi+S
	O69yWuCz5g3rp2kGHvbNWjrPcrbLEsGgVBZyyCUSJxrHnt7LwM8QKmK+tLu0EP5w88mAVAKUGzH
	0+59XM2OJqCKQ+LRc3C68xZR/cZthXn2cQ2cxFF/DRtVn6x+7
X-Received: by 2002:a05:7301:fc84:b0:370:1e50:a485 with SMTP id 5a478bee46e88-3828190e7d4mr1883449eec.37.1794995606974;
        Wed, 18 Nov 2026 01:53:26 -0800 (PST)
Received: from localhost.localdomain ([103.107.26.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm6800826eec.24.2026.11.18.01.53.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 01:53:26 -0800 (PST)
From: Shivani Patel <patelshivani2283@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shivani Patel <patelshivani2283@gmail.com>
Subject: [PATCH] staging: media: atomisp: Deduplicate and reformat atomisp_find_in_fmt_conv_by_atomisp_in_fmt()
Date: Wed, 18 Nov 2026 15:23:14 +0530
Message-ID: <20261118095314.42769-1-patelshivani2283@gmail.com>
X-Mailer: git-send-email 2.50.1
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

atomisp_subdev.h contains duplicate declarations of
atomisp_find_in_fmt_conv_by_atomisp_in_fmt() under ISP2400 and ISP2401
comments. Both declare the exact same function with broken formatting
(lines ending with open parenthesis, leading spaces, and awkward line
breaks).

Furthermore, the definition in atomisp_subdev.c uses the same broken
formatting with leading spaces and a line ending with an open
parenthesis.

Remove the duplicate declaration in atomisp_subdev.h, place the return
type on its own line, and shorten the parameter name to 'fmt' so that the
prototype and definition adhere to the 80-character line limit and
Linux coding style.

Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |  6 +++---
 drivers/staging/media/atomisp/pci/atomisp_subdev.h | 10 ++--------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index bdd2d9b18..6af8a42a6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -95,13 +95,13 @@ const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv(u32 code)
 	return NULL;
 }
 
-const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_by_atomisp_in_fmt(
-    enum atomisp_input_format atomisp_in_fmt)
+const struct atomisp_in_fmt_conv *
+atomisp_find_in_fmt_conv_by_atomisp_in_fmt(enum atomisp_input_format fmt)
 {
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(atomisp_in_fmt_conv) - 1; i++)
-		if (atomisp_in_fmt_conv[i].atomisp_in_fmt == atomisp_in_fmt)
+		if (atomisp_in_fmt_conv[i].atomisp_in_fmt == fmt)
 			return atomisp_in_fmt_conv + i;
 
 	return NULL;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index b12bb65be..c4a3bce6f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -300,14 +300,8 @@ u32 atomisp_subdev_uncompressed_code(u32 code);
 bool atomisp_subdev_is_compressed(u32 code);
 const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv(u32 code);
 
-/* ISP2400 */
-const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_by_atomisp_in_fmt(
-    enum atomisp_input_format atomisp_in_fmt);
-
-/* ISP2401 */
-const struct atomisp_in_fmt_conv
-*atomisp_find_in_fmt_conv_by_atomisp_in_fmt(enum atomisp_input_format
-	atomisp_in_fmt);
+const struct atomisp_in_fmt_conv *
+atomisp_find_in_fmt_conv_by_atomisp_in_fmt(enum atomisp_input_format fmt);
 
 const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_compressed(u32 code);
 bool atomisp_subdev_format_conversion(struct atomisp_sub_device *asd);
-- 
2.50.1 (Apple Git-155)

