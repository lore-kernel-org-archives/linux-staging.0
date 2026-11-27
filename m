Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762535;
	b=gu9WILCHN/s5mn15OG0lvr9IfhrU5SFJxWPXpqcAE2Hy5juH+8o86CRHR2mKnorQegqD
	 5+cgsd9QYImbieQVfnpmqUX84oCIixS7B6fGjPPm+sfFfCbQ/SXVq0OweyW4zzb8XrncJ
	 1fguxEvN9nN7gxcA9UnxdtC0eh4CBoWQNnxfXI/4wQ7GHdWkUCHTakIMGDS8+fZ3vOuXn
	 pAcAhwOdzZdmUu29/EimWqZK953q5vaQ/7xYUiNxLnL4K5YTFeByFEXxZdgDtRjbCFQTV
	 Y78xGPINNgX0zqeXboVkIO/OFCukzHXShKQ92DyspcW3dgzm2bOe4a5OA6qQZkyyZKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6QJZTVYdROR6mS1avmG65kFgpH2ZO1NmsyxFw2KO3To=;
	b=mBeBKVjqOk6lQHdZyQfTIdqQrN48ypuGxHbZ4bHzxdX3miuQ/AbEe2R6I2GT/uesEN/N
	 psPGIoD7YYMm4bKURiTSIBNyHl08woJ5OaBrZB6y+zRLDgMtgSwdWnWDkkEAdKE3WePMx
	 d/sJUYrHpNHkL4+8/VMTIMHQYHHdQ04pxzpH1JDT8Zls8XJ/P67ZLQyK+b92K8Yy6eizU
	 SWT0blYek9HcTdyfRTBsU1z9n1XuP+vURWIWtLJsqxiWlA8DcP+IqmlM3tFcYD7QKdAjk
	 wQRLkfRMUfvts0g/flRfZfiJ/N7p6u+0huhPMomABEW4ZOhuOdmcMn1Ig7QqQdC8D7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7bbK2Xo;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4765F606A33C
	for <linux-staging@lists.linux.dev>; Fri, 27 Nov 2026 06:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4765F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7bbK2Xo
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491846221ffso6791511f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Nov 2026 22:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762533; x=1796367333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QJZTVYdROR6mS1avmG65kFgpH2ZO1NmsyxFw2KO3To=;
        b=E7bbK2Xo2GUI/0gRB1Vj4gHIFsyaWxpyy6xLSYYENHM4WoM7KtH+07KMMyV10qr7VD
         uCJh4Rav5GI7NZXjqhA4LS8974U3MQJO5Y6IGRrhoK8G5FqOhysViDsTbtnj8uhGGUU5
         MUeQYXNfr3gSj+fB+6SOvsdPt76FGU4NGbAO6aqN00y2q4ctaGUl5gejFjkBfoUQ7D9S
         g5S3JjlAqo0VvQd21Fxqnu/81yAAVlT+OwccvPrPKPiYezc/tzHDJ32kqULmyRjgnZK0
         f8C02+Wm8tNaNl1FaHPZ22B2tDPrpnZCnXe7vo+cXt1q1Re0jw4s5Zfb2hi61vcaB7+A
         YKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762533; x=1796367333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6QJZTVYdROR6mS1avmG65kFgpH2ZO1NmsyxFw2KO3To=;
        b=Jg79h8DeNcjAjb1nOh/oYVzwZl+YKuSTXh/u2kbGlEXKp+dPKQrmJBxekIFmZWF1KR
         gJwS/W6zfy9134vBqbV+lZfD1S5+D7oXXEffiRBGL/x60vUvrD1DNedABh25zSgGWtrN
         8dBSMQ9iTdtaYkDl4M1EvYMu/FZs3QftANJLMj/z/rPJpAtOodhRx6OVXycQcFIFaCdA
         p4jmszrAkk0bL+6flYf45tZygwW2JxN5CRF2ClRmKYuerF4oUeMyDCKouTI8oxhWXTqw
         PnQqm20dBdPB58sXLLJBv6rjXm6n375lXdfaEGdPWMm9rru1NvNJ8LtVgr9XJEKK9cOL
         C4Cw==
X-Forwarded-Encrypted: i=1; AL+hErHjBBn33FN8JWgcT3z3h48G3K/T9xJLdbtaKlPQ7sTX9ymoDMmMBjXbsAaQwbaTECCNEzSNJVINsciy2G78@lists.linux.dev
X-Gm-Message-State: APuU4Z9BcsoX2ku9Ff5yf/vzsCr7zYSWRy+0qdQ5L2pyCUnyGR6UxAZB
	8RmzEL8vikcnea8wWgxSj1G8HLQrFDaFH8FWz6CcWBvfbZPsulvc8IKv
X-Gm-Gg: AZFdTZeTqpltics7hfTvaHlEO7IfgL9Mz7MOxM/596frevlAfGWZ7kTUGpfHxXZFjpF
	cIhNK++2j03nzYf1kQz6MRkt+w/CbHhxwAEfq1D0hAIfS4GHxtBqMQQEUBBJMvStTbV4IkAa7mB
	nxOykzv/eqBANgGrkVpKsoVLl4OauIx1JSnBTtzoSTGmh1uULE/WTmwjmvWiFJCADU/d4kcekF0
	od2OynpmDv5qXym/9hzVCyUE9qCH6GuS/XjK2WgBmKTHD6gITvZBI0w54MEWWPNd6Yq9vcVG0zZ
	c883yUNIavHYQ4quXNjVFJuXlUza47ThGepmnqsjxNvhbRv/7Edj9hNrtZHKtpOVxDlVSF4CkKu
	NhVjz5kv2wYQCkkn2Kw9DXUvVS2fGHU7DQk32uu18aAgrSd5JVHcDwAaBJi4HDU7x7DTXPsi3yg
	G5jCamq7ptnSHh/wUaSrwxZ7x4uhHCWTGQzntYHdB9GFozJ5i/CGJXI6rh4J2sHKRlVWsFmV2W1
	vLW8+DdOGdEUFIg9JrctA8j9XePX5Gb2UPWT/cMSVEXWgdlW00oN0Uzl3fO//UDxkB5ZPhZIyir
	VMSXrKynhKmLhZI50iYxPv3O/Cf0B5ihoxI1X5/MwrqwXBslTNll8R6Dld6HTivYaoYuRNmqDbn
	Bp6TQx/gv1i7prWtHbDGZE82nTlh+ek0IMrK22Q3jwSYShsqne2iWfCr8gWrAsqvFFnvuQqDhZt
	fn3TpKDAOFU8SeAusc7y02VikLUlI4ncst57PobjHKz3pCBG16mMQpomlp+GNF1uHaXVVKSRUWj
	EKWYHk/k0SW0crgG/lNYabhYXWTrJ6oArLaTD+eI54=
X-Received: by 2002:a5d:5f86:0:b0:4a5:ba8b:e00e with SMTP id ffacd0b85a97d-4abb4f5a324mr44654273f8f.45.1795762532450;
        Thu, 26 Nov 2026 22:55:32 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm42574611f8f.34.2026.11.26.22.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:55:31 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/3] staging: media: cedrus: factor out the format check
Date: Fri, 27 Nov 2026 07:55:22 +0100
Message-ID: <20261127065523.3685726-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
References: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
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

cedrus_find_format() and cedrus_enum_fmt() check the capabilities and
the direction of a format in the same way. Move the check into a
helper, so that the VP9 decoder, added later, can exclude formats in
one place.

No functional change.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_video.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 2521315abdb7..a46820a90d87 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -78,6 +78,17 @@ static struct cedrus_format cedrus_formats[] = {
 
 #define CEDRUS_FORMATS_COUNT	ARRAY_SIZE(cedrus_formats)
 
+static bool cedrus_check_format(struct cedrus_ctx *ctx,
+				const struct cedrus_format *fmt,
+				u32 directions)
+{
+	if (!cedrus_is_capable(ctx, fmt->capabilities) ||
+	    !(fmt->directions & directions))
+		return false;
+
+	return true;
+}
+
 static struct cedrus_format *cedrus_find_format(struct cedrus_ctx *ctx,
 						u32 pixelformat, u32 directions)
 {
@@ -88,8 +99,7 @@ static struct cedrus_format *cedrus_find_format(struct cedrus_ctx *ctx,
 	for (i = 0; i < CEDRUS_FORMATS_COUNT; i++) {
 		fmt = &cedrus_formats[i];
 
-		if (!cedrus_is_capable(ctx, fmt->capabilities) ||
-		    !(fmt->directions & directions))
+		if (!cedrus_check_format(ctx, fmt, directions))
 			continue;
 
 		if (fmt->pixelformat == pixelformat)
@@ -191,10 +201,7 @@ static int cedrus_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
 	index = 0;
 
 	for (i = 0; i < CEDRUS_FORMATS_COUNT; i++) {
-		if (!cedrus_is_capable(ctx, cedrus_formats[i].capabilities))
-			continue;
-
-		if (!(cedrus_formats[i].directions & direction))
+		if (!cedrus_check_format(ctx, &cedrus_formats[i], direction))
 			continue;
 
 		if (index == f->index)
-- 
2.43.0

