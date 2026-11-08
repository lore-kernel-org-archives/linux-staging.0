Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794140945;
	b=xmtbEgPU8n/QcranJJTtabhuimPeIb1OtrwWcdGuT4ePJlwxDt6y48+sZzJxU/wAeU34
	 Bo3tcRqiJED/E0hJkrIEbhhmi+lW4bfNRWp++m/d+wQmqVQclmqcjP5lUdxaoUh80JV8U
	 0vqDZytuwFS9JJoAMY4tSaBg4sBe30YgMVeUdTx/hEiYaop7enyf+69jWMHTWtKADQlKA
	 qCrGrFaE4rWthJc1tVjcaiUT0CeocgpHrodie9yR3YDCDoQuCz4wxysdJZT4EbQYTTHti
	 nWp0dc6fhGepeyt9nbiYdQz4Wo93gXMwplA39THlJGkvF/vJszFovsBaBlXjrb9xQ+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794140945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8Si8+elJrOqJ4FlfCJWkOKmX5QdVoxka9MT8fi02MVY=;
	b=5nd+z+3Jm8QdTFsyUHcA4Uhy3VJ5kyY35KaW68/Mm55KmaUTu4jDczUgkAfXjg2fUheN
	 eoEULM2fSvfMftmWsiS/7r9DTgYRNpqm9MUPiqJ90YNksrYz8axFzOx6TA50NZBizC0Qw
	 uzEu5sNzTB7KcVUECcpVHNTM4G+wmafOjl96NadqPjNuIwRBzKojSmCmZPQhB23183/o0
	 K94h41BVmF2d8Jum6MR0Kkgg7QuIstuh8szt7meuBF9q1gmzAKXtWeDdNFn/d5qElY0O9
	 nWPLmStvTIEAlnw0cp+qpsweIK1lz5VyZLm5Y9cYWej9ZlHyedXs2j9YwpnSAr2il3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KhscNWp1;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FEA606A31C
	for <linux-staging@lists.linux.dev>; Sun,  8 Nov 2026 12:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29FEA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KhscNWp1
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37071c0f42aso166250eec.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Nov 2026 04:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794140944; x=1794745744; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Si8+elJrOqJ4FlfCJWkOKmX5QdVoxka9MT8fi02MVY=;
        b=KhscNWp1AM1hdxhrMM4nEJt8UcYkk3bMY7rh1HH3SUwGu1VweNe07ljIHHIDJ3zDqe
         oFqnw6CRtAGguO3zE1nrVVDmcxS7mCcFEmiNXDbk8t7J3+lZhkRfH+sDIvtp26+Hc/TK
         54oj7Tz/toAZzB/5uLt6iYv7S1jJ/CmYH4B0v/6wMIWcHn8DvTN4LMWTJr2Oco4X86+F
         iRYcHOp8q+KTEAExRxmM/o1HsHebsY50kK7lpyKt63mJu72xgzAfrQ2s3q799fE7dkLD
         zsK2oKFDGGjbghFZ3bN86uulSwsFJicnCDIR/QsG/dnpr9CfhRUET8OdDjUcFrMcFrc0
         PtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794140944; x=1794745744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Si8+elJrOqJ4FlfCJWkOKmX5QdVoxka9MT8fi02MVY=;
        b=C7vZd8zfqQklI0YN/+EWC1mLwlrA5DlDQdsAQCmyc2ll6Rj1z4yjgWQfF5Hd19YPZq
         PcaIj8C9luiLg9I58c3liioShnVJJV3W6oaz07ZrlGQ1ZjLLDCrLrue4jLs6nTiQ1o0R
         FXUGkYQG3whLYZml3qP1fNi1ArLKnU08VneWK36zNGd/W+eWvdkTbqBj0/AbpYNNtU7Q
         sSzduIJGiZydHP7/mZR2/fzEXah/6/23JB2k5YtAEO3IiZfbqAv0eth7VqrwVlxFjgIW
         RBrgd5RT3Kiop4Zr64iEHhrJLHEeejciG/fgqvXrRGwQpLWUZakSRtB5Cy/uCckRoHjY
         UOSQ==
X-Forwarded-Encrypted: i=1; AL+hErHsnLToh7iF8IWpT4e3mnTOR4zmVrMBEEll2+C58ggN5XiBs3UyGdfmOMW4Rx10K0vypRAMobq9bSMEr/JN@lists.linux.dev
X-Gm-Message-State: APuU4Z9PiAAH4PQMOo570TC6m05iO18J0N2IlHjGeQx4X3K0GopzDFTk
	h6iK96SZus/I30076AZkGNT9d0MJopd4ypZREDew5zmrIMDsdLzirZL4
X-Gm-Gg: AYBFou0ou1ojAwuyTx8LO8iu8ylyoHQDuPnZpI+xqzhZ+QhJaKcdsJIztgrKNzb0yIw
	nIZE+xG88youycilxRkZas+WOhg4BOhd7U/mLuFxLS9+M3BNYyjUywvvLqVv5Llx4pXk0h1kBEw
	8mNSsirfdINruxoFfdpr5e0XPj7ZqcKtgQQVA+A8AU3HOKYoVLrHrpIUBrx4VzHffeXO5xRweP3
	1Hdo1HieFov4rl9VSbyMhEuGLV4rtG7R1v+c2yOBLF6TA5hoCAqUdnuzsgaOdK4cc5HLKtlGHxA
	uHAnpw49/0TlgYq2hJaMZQeqoWSHcxlLsFn3+r7M5/EAgeRxrBhUkrtBoIeS+87BaC+jkB0DvO4
	jskW4F4asCnsC5TIFp2olNyPoiAhGsNvuLvllagr/8Fl61dxyUctAnnvrKC0m1JBf4yyIHJUAwl
	8fkJUEMVbfDQFJ5mdQBc45ANVTZqwRullFazmFZAREbtBUQlg81GtBapOLPYuI/heqPQ+i8kL6M
	XEIuW++iHdhBtwQ89s15WyVaUPttUif7dO7yZMU76xai8vNL/ov3P0lOvcRXL6VpMZ8jiviHLgK
	GgE3O/iSU2VBOJSKJ0mj2IujjTJ0s8obJIO5JLP3opcZokbs0QCGNga35jGdQvE+YdEz/za0h4+
	YJl7yVKdjZBoY9BNcoCOOftNaxG6Zxon6
X-Received: by 2002:a05:7022:418c:b0:1b2:3448:840f with SMTP id a92af1059eb24-1b39fecac01mr3000460c88.7.1794140944129;
        Sun, 08 Nov 2026 04:29:04 -0800 (PST)
Received: from codespaces-88e7e5.2t4prynt4dlezbzls5ze3dxsqg.rx.internal.cloudapp.net ([13.71.3.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3731487edsm6036253c88.2.2026.11.08.04.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:29:03 -0800 (PST)
From: Lame Morupisi <lamemorupisi12@gmail.com>
To: hansg@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lame Morupisi <lamemorupisi12@gmail.com>
Subject: [PATCH] staging: media: atomisp: Fix block comment formatting
Date: Sun,  8 Nov 2026 12:28:40 +0000
Message-ID: <20261108122840.85622-1-lamemorupisi12@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Align the multiline comment describing the MIPI frame memory
layout with the kernel coding style.

Move the opening comment delimiter to its own line and align
the subsequent lines consistently. This is a formatting-only
change and does not affect driver functionality.

Signed-off-by: Lame Morupisi <lamemorupisi12@gmail.com>
---
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 971b685cd..57179298d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -130,21 +130,22 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 		even_line_bytes = odd_line_bytes;
 	}
 
-	/*  a frame represented in memory:  ()- optional; data - payload words.
-	*  addr		0	1	2	3	4	5	6	7:
-	*  first	SOF	(SOL)	PACK_H	data	data	data	data	data
-	*		data	data	data	data	data	data	data	data
-	*		...
-	*		data	data	0	0	0	0	0	0
-	*  second	(EOL)	(SOL)	PACK_H	data	data	data	data	data
-	*		data	data	data	data	data	data	data	data
-	*		...
-	*		data	data	0	0	0	0	0	0
-	*  ...
-	*  last		(EOL)	EOF	0	0	0	0	0	0
-	*
-	*  Embedded lines are regular lines stored before the first and after
-	*  payload lines.
+	/*
+	 * a frame represented in memory: () - optional; data - payload words.
+	 * addr         0       1       2       3       4       5       6       7:
+	 * first        SOF     (SOL)   PACK_H  data    data    data    data    data
+	 *              data    data    data    data    data    data    data    data
+	 *              ...
+	 *              data    data    0       0       0       0       0       0
+	 * second       (EOL)   (SOL)   PACK_H  data    data    data    data    data
+	 *              data    data    data    data    data    data    data    data
+	 *              ...
+	 *              data    data    0       0       0       0       0       0
+	 * ...
+	 * last         (EOL)   EOF     0       0       0       0       0       0
+	 *
+	 * Embedded lines are regular lines stored before the first and after
+	 * payload lines.
 	*/
 
 	words_per_odd_line = (odd_line_bytes + 3) >> 2;
-- 
2.56.0

