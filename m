Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754BB2BD024
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240791; cv=none; b=FZFNKtLkmpXD8hYjhCWXMTxA9wdzQhR5hnDhwPwCgalIrZ8So/uY06X721R+bC3lRwbpTK/9w5AKUCK5PTLE8i9TMH4R5VAu4JPkDYnzcf1acDbCDAoYPoIH+p4ctDKvs6Rlz3buXoQdVrklZ6IP5ecvQuaa6Nzx1g6j9ndgMEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240791; c=relaxed/simple;
	bh=7azAzYVJQIJvbMOuSKi/0/feviMdwgddFDT5sAMjhd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pRj/3MymUlW0tD2vwl4CjOjgd10IA3jGMZnBdSeZ6RkH52V0GPEePAzOZZ1zd4wLK8UZLQV7Y+hIhl4ZoM4nDls5/dYakl5lhABSBD55dhG6yR00o5UA0NoQuKfUA8EtNJULOzaglt+e0B0Mt9iXN9dCAUm4ApZ72VqItWjg88w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ao6FNzGC; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ao6FNzGC"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60780d74bbaso1005506a12.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 02:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240788; x=1750845588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nX9uBVNO9qs42Kxb8fqv2jV0nxF10U+H6s6O+nbAUxY=;
        b=ao6FNzGCDj1UBSdDPoMrZ5S/i18V9ZLHoUMwIyaroLvffp+WI5nAHWzXhVoBncIeMw
         ZdhzyX9ft9iDxx7IT5y15SuV8B/Zdmi4AXstKLsWTnMtQ0C6roK85X/Fj+bPWPNmHOgT
         7b3YrXcaaXnpkeEoQgyZSypPt+11yhEzqhOz1dEtgqqzG1u1DKk43r0UuiRmI+sJlcjp
         tSegu6/yyyWTyyBNCLMX537EUUasy1Fb7LXo+DOazjd/VXsHJqxQSMBUiMCmeiiguDkp
         y/h/ELks6dnOU1Z+QC5gwncjV6c4x2uXfFix7cINnaIhAQGaqlv4CNGIQTpCZDiQJ5Nj
         V+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240788; x=1750845588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nX9uBVNO9qs42Kxb8fqv2jV0nxF10U+H6s6O+nbAUxY=;
        b=Fc/dmgi7aoCKcm4yfDt/YG7UhEJBxsO1ESMYdO2wVbwm4uqt5ei5jgaGu/E09nLK45
         A/DUg49RnZpuFAJRQk4YO7H0rLOYOM2DpdgAe61R4yPsKWTNWekp9dxWKBOPXg0r+Gor
         bysJvcLdvaKBPNnGmD70+t5kWE/L6b5kfS902Y1O/z1HQKoq05gx3pRVOUY8klWaaWCK
         3F0OLPqSifYxy6aOtnBNN3qKwXFDLhxIeBDoRC2Bzyg8ztrdt1T9DgInc8WExtAvuQlJ
         sDWQx4Xfm/v+xgOz5f1fAA5f3Q4vfcgYbIR+6GE98orUY5tNmDj4JaFPBBpNtAzJ27+v
         5niA==
X-Forwarded-Encrypted: i=1; AJvYcCXh+Rq12hzg3IhyfQXBW3irIq5VV/QsUi9maK3uKy9XCS1B+tZsjDfctNVkT5XjCERLevrsMB5oikb9n5mD@lists.linux.dev
X-Gm-Message-State: AOJu0YwxXwJpoK4r9xXCH67veaI5GFfsz1kxlRMuBEkIsCmXS0mPwBLt
	eHHO5nfN6ufExAqUFHlvx8j3Kt6PJ/vxJygSz8d4bEb8wyB+BJb94uFG
X-Gm-Gg: ASbGncvW6ffBRW5u18JLufnETr2DJKV8mrCn4w40ZkuxCK6RfOW7OmbEiFybE6GLAst
	Awde4MlKSAH9sbL3U2SjF4K4oposs/xNS/rIA144hhaXRwLDfO2rn64vbn3ki19xrpXa4uicb36
	bWpe8l0yyFP6S3+L5rOIqL84RkFI03zxIHWo6YrwfKziViw/5QVDI6NshccrBZPHOqebKIPKt3s
	YjTziBYOkcv9PyrK9t6aLjz7RL0g0wuQyDQ/kxORlsVT1eu61PuGLjbMNFxUN8V6yHPSu7b/Thp
	zfp/Z84ghlSFHUxEnUhukwCIelZcjcTEUX8bo01dcTixly5qES/cPrXqfkuS+IVMkL4nkjZxngo
	=
X-Google-Smtp-Source: AGHT+IFKNSYCXHMXpMiW1D3ujznnkUIaiaR6vPPjrEqq56F/D3dCZHy5fYRRHjPkLHsCOyGrvhDTXA==
X-Received: by 2002:a50:d68d:0:b0:607:2e08:f3e6 with SMTP id 4fb4d7f45d1cf-609c1b9438fmr1253767a12.17.1750240787842;
        Wed, 18 Jun 2025 02:59:47 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:47 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 11/19] dt-bindings: media: i2c: max96712: add support for MAX96724F/R
Date: Wed, 18 Jun 2025 12:58:47 +0300
Message-ID: <20250618095858.2145209-12-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96724F/MAX96724R are a lower capability variant of the MAX96724 which
only support a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index b345305acc4c..5dcafd46344c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -24,12 +24,17 @@ description: |
   MAX96712 can be paired with first-generation 3.12Gbps or 1.5Gbps GMSL1
   serializers or operate up to 3.12Gbps with GMSL2 serializers in GMSL1 mode.
 
+  MAX96724F and MAX96724R only support a fixed rate of 3Gbps in the forward
+  direction.
+
 properties:
   compatible:
     items:
       - enum:
           - maxim,max96712
           - maxim,max96724
+          - maxim,max96724f
+          - maxim,max96724r
 
   reg:
     description: I2C device address
-- 
2.49.0

