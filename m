Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7582F28E0
	for <linux-staging@lists.linux.dev>; Wed,  3 Sep 2025 09:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756891692; cv=none; b=WCxv1NGzD+5oVbVYrtDkwQBfX143gyuWE9VsqszmntaitYhfPssZXKRb3Geg0vsgvi8zVei3haRseMiPelT5aWEsSCf4xD2lzfIOAQbSVR2ZsncKOUgkMxUFnEaeyffIR3Ko5JXgdoBeKd96IMtSa1YoSINN5dzqscbJ35r6WQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756891692; c=relaxed/simple;
	bh=A5vcUWyTNwMbDp1MNbwQOdKbahZxhtxWOywqDTIsHvw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HWEwvZhErDlI17JzrPOSo1ZhbCgMuQgBcXlP/eN7+hAH5Enzj6cKiMB1pKyYnxwHRF7b0u+w8t4xPpdS19rT8u+kghN2QZbKUH14Yia4a10d/tlLlQqsTG56RbFNctQ+uvo9ilinkSrtJ4pHtuYrD5IAEKIchDzLxgVbGywnyr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TYCboAXS; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TYCboAXS"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b046fc9f28bso20415166b.0
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 02:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756891689; x=1757496489; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KT71c78aJnytQMhNF1V9yN1z/KSnqChOn4nmn+TcdAw=;
        b=TYCboAXSi8kXwIJuaWKGYlHQxu2cR56jIuoJ2O4xwju8hr1yY/Xf7ffBgcytfuFk6P
         yi/gkkbrZvocxhh4mkcY4JgK0CyU6TJEuZeOMuUqQIPk+G0x+J1rM9ulQPRiHHRj0mJG
         xPCw1u5M+ljywoqdFXFl/XDTwkrr261Ve+aZHIrim0T7fcoCoaGke4JoIv96rx+vXXJh
         TfeXFRN83/xL0WvRXM69KZlGwS0ZHl1g7E4K9N/DqWlNK9VI3KwtZnfqlKk7uARtfo1q
         0HAA+OZdHeybegtBtNvDkYEA7H249KLD5zZAYcd24K5nGoMJnqeVf3278vMbsLjb7OUo
         WKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756891689; x=1757496489;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KT71c78aJnytQMhNF1V9yN1z/KSnqChOn4nmn+TcdAw=;
        b=juLSEwaHULaN2QvKhRxIQir1Y0vss7xElMhr484+oVzM8jycryLsQpfRnzP607+uYd
         fNve+Ji0r4moxZUyHc7dYQv+t5fCEdgItEO0llljA/5tR3AaNYfvsyAsx5PHlbH7oOp1
         QROZqZORHLVz07yOBmApZ4IQucCvarJYhi73ZGZZ3i8yrGzg5jkfcjdgyDAPTxHAu84h
         1PNj/4D5VHHr/yVH9cgLHzPS8wRoIX3EpZ5eQN7L1WO/NkQl7ACiTjC7xpTpa9DRAw5l
         fHCIG9c7gJ4eLZi2DileetTfnCrSHEh6HY0F67RuUGFmQIhKyS+DMzhKWp5ig0U3/2zb
         moQw==
X-Forwarded-Encrypted: i=1; AJvYcCWFQFRRx6g6eg5L7Pk88xrnicVnSS1SyDudQoTEy8lABwjyjccOCIG2qQuOZQkFlU1hixqnRTs1lu/hl0Z/@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2glSL1JFZKW/QZi5yTPkIMlxODfoeHPofG8gxJwprJAfDvTtt
	msMl757BFRH0mHbCHtWFGPOG9DqMtdcpHkEp48x1uv7VS25/tvyctaENz5n93fBsfeZcvFgvnhL
	cl5l9ng46fA==
X-Google-Smtp-Source: AGHT+IG4wDv4iN79+PvNL0JjzGDy88GyRihU0bcbVv8rwThsva9C9fXSGG3sjrAuIStIyVDmt3DIgqVwN1pH
X-Received: from ejchw16.prod.google.com ([2002:a17:907:a0d0:b0:b04:c21:7f49])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:2682:b0:afd:d9e4:51e7
 with SMTP id a640c23a62f3a-b01f20bde04mr1591474166b.63.1756891689701; Wed, 03
 Sep 2025 02:28:09 -0700 (PDT)
Date: Wed,  3 Sep 2025 09:27:53 +0000
In-Reply-To: <20250903092754.2751556-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250903092754.2751556-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250903092754.2751556-2-abarnas@google.com>
Subject: [RFC PATCH v2 1/2] staging: media: atomisp: Change name to better
 follow its behavior
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Change name to clearly states what function does.
Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../atomisp/pci/hive_isp_css_common/host/vmem.c  | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vme=
m.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index 547cc480c105..a3fe03216389 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -22,9 +22,9 @@ subword(unsigned long long w, unsigned int start, unsigne=
d int end)
 	return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
 }
=20
-/* inverse subword bits move like this: MSB[xxxx____xxxx]LSB -> MSB[xxxx00=
00xxxx]LSB */
+/* clears subword bits like this: MSB[xxxx____xxxx]LSB -> MSB[xxxx0000xxxx=
]LSB */
 static inline unsigned long long
-inv_subword(unsigned long long w, unsigned int start, unsigned int end)
+clear_subword(unsigned long long w, unsigned int start, unsigned int end)
 {
 	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1)=
);
 }
@@ -45,16 +45,16 @@ static void move_subword(unsigned long long *target, un=
signed int target_bit,
=20
 	if (subword_width + start_bit > uedge_bits) { /* overlap */
 		unsigned long long old_val1;
-		unsigned long long old_val0 =3D inv_subword(target[start_elem],
-							  start_bit, uedge_bits);
+		unsigned long long old_val0 =3D clear_subword(target[start_elem],
+							    start_bit, uedge_bits);
=20
 		target[start_elem] =3D old_val0 | (src_subword << start_bit);
-		old_val1 =3D inv_subword(target[start_elem + 1], 0,
-				       subword_width + start_bit - uedge_bits);
+		old_val1 =3D clear_subword(target[start_elem + 1], 0,
+					 subword_width + start_bit - uedge_bits);
 		target[start_elem + 1] =3D old_val1 | (src_subword >> (uedge_bits - star=
t_bit));
 	} else {
-		unsigned long long old_val =3D inv_subword(target[start_elem], start_bit=
,
-							 start_bit + subword_width);
+		unsigned long long old_val =3D clear_subword(target[start_elem], start_b=
it,
+							   start_bit + subword_width);
=20
 		target[start_elem] =3D old_val | (src_subword << start_bit);
 	}
--=20
2.51.0.355.g5224444f11-goog

