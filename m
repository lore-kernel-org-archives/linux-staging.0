Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762532;
	b=yS4d+BQIM6eKtDI51uCB8qhh17ZaVJx805aOS5O65nIMJ50vTGxELf4iKatudGqxqk7Y
	 xFw+AtCHXHD1spRgmO0rg0hqICb7T+azW7R/2t4vynNQ5KxzVg9sv2TRiT0qezWuxWhAV
	 aJBqk/u7b1JH5dTnZOsU5tOT6oJWD/xwTBfASgqk/EiAqO3SqX/awdWdhq4Pu2TNtuNlF
	 yfmfGXf+pRpTbPrHilG+dPx17oEO+4x7JCvOIVlS2+IbDZ5duXfWk43LqvJpal+2Oq8sw
	 +ybp8Os1QfHnJLDhOacoAfXUlTvVSGcNgHe1e+XnMW1FEhBIqrsu85Em00EgQd0kPYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AaDlPP9AgpeRRzKJsnNMnsNsKii7YPU68T/y3zRCJcQ=;
	b=M4Qc1GX2qynMmhT11BKpGnURW0DMnw8b8Rnh5T8eHpCn3fvMMOJUm3UEFJZ3rpLjxLcF
	 TbEQVR+RLXL8DLpAdqorO8JYa2o6aXWVsMOye2bWrd2N2aRptevXWGGwK5/bnRUIMzS8f
	 A04i2l5VAv1AgZZT7O6kFTmKHi7SqcKpS8ha5p2Bg0bU6Qww9jcT+hrsmJ+uarLpMwouZ
	 qxQykAkrcCGgEt64GWnSiwWYvzVEGFjGHpb/DXJ+2WqWQNztZZEdfvWEMsEWBUveWmOQR
	 uyWTlLTYbVWXs3anWygiVPWLaOG2X1wHSsPjsr4/9hzEjXtLS+5CYtFHNgSTdJ5D4xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QfSUXlVt;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D9D606A336
	for <linux-staging@lists.linux.dev>; Fri, 27 Nov 2026 06:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D9D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QfSUXlVt
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dee593f18so7246205f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Nov 2026 22:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762531; x=1796367331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaDlPP9AgpeRRzKJsnNMnsNsKii7YPU68T/y3zRCJcQ=;
        b=QfSUXlVtibj9URBrAG4ddeklDZnRA3U8rHJiI7AfxdqEwPX6sXuvuH4RzTZjB5EG1u
         8VCTki59gpsxvEk3Y4TUkiFy2ITHUuRPhTvjcFtSPpXqe8kzOJDyXnRUyPkBzm/n9dB3
         C5r9cdkqV6X79+h4qY2H5bfndk1Hrg8awVdJMfRmi/13iEAyVzz7yKR7iGbtQwdBbh9m
         M1aTAuCnzlKwCzrEji9BPP62SuBtETkYkvRMaYarn1Qk2yTaW0gCk8ByQd689PX3sWMC
         C3X201efclYz2rtpmWvZo218fqcwgWhyJzXRLKsN8PlVB28Z4L517/L9EDWNyc2y3KiQ
         zOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762531; x=1796367331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AaDlPP9AgpeRRzKJsnNMnsNsKii7YPU68T/y3zRCJcQ=;
        b=Sl5PrOHDX44r5kEnOFl6Bne7JxeYwKkE2O10kXGgAyssfXsg7Tb3T/OumPJsCHgqEe
         jb0970vVEFX38i85fAyi8PiSpjSzWOw5xN5Fv+yTFvan054U4Hs77DAPE4rdI4KaPrZo
         yhBXZ+HGTgMlBalwuzVpSiRq6dJsdKf2FLqHyg+PD3czzorvIw9OHAr35+KXOGL8pg3C
         JqyxWmC4qsNZJlHzkyePxiqmZr9qYp/GFv3F2mpnXgAnoBBjygpbC6bzjwBeh2ZZD9F1
         2h2JYEMi9PwuFNPpht92WWfxSkE6QDyxjmXq3EEgXMNfBrSJc4ziNNvw7pgrFsxuDuMk
         1XsA==
X-Forwarded-Encrypted: i=1; AL+hErF9ELhZOlLLnXjDc0OTvmoRpaAggyMVSHRQ61KDvnjjy6cDmBfdotSIKccVU5ySmF0loUTeaxeOKkDXd/cn@lists.linux.dev
X-Gm-Message-State: APuU4Z9GsFWXTkUysLv89Rn5b5MmWYX+UsKnrUkD6+IzRTrgtEHSAnu0
	GeGVV0t6cCnslBHQMgn9pDC01fM6HNRlCyGFVbLqkaJhyScPS3pRQM4K
X-Gm-Gg: AZFdTZduigBCjiTXiqj1HrI9pSvaszkqMLbSD24jL6xKz/aYavblJPhPHdU91TuOr11
	F+iClRfr4oXZu6ggOvlAmr8f096fUuOL2K0jOSl2eak1XX3D5fs+vsQ1Sjy1F4HhQmbK/ULB17Q
	MNnsPNkdtvAYY4oOfVIcQ25/LN+QC0q9I8GVI61Thnyz9P/UQkEm4+3VbH0tMRPHAZkUtKXn9sF
	wH7IJm5EWrLjeLOIn5yhNHzrH1Ul1QJh9BGeHam4HAxR4ygk/ExcxyPkRI36Wxy+qMI4nvgzQAY
	dh+QdCKmBsdRar9ErYy3wKMn+Yfr5flx7sLsVHtitvCze2NMGtJIKLYqo3LRVkv4OJ/R/0d3lKo
	688Z6/99Rm1wWGYD9jfSswSW3CQaud/XCkMz+Um5KiOKdehBkeGrxPoIiSK1TgS4R07n+Hzk1+d
	glZYyVCmPNOzLr53hLyciWQLFq8zPmLCA+GsQTOyD7yO2V5SmhUHTuWmzEWlO+5cv+WivJ5z8n2
	DLBAKGr+V9AvjFRxxlrjGx6I+1rmQ+ffyf5xMg1Bt+odig3jsL8Y6G8939V1/kJbni/08XVRCf1
	CCRlTNjp6NsaFLxsiMhDEtoKabJnbNRduMW8vB8iB7icHavjjSTCg29FBXUKBEpZ9ihQGBI/CuB
	gOOJGZZCqkYBXr81E6Q+5zZEkWjhuTB1EykalzWqLS/e16mm8z13w7P5Ne0ho/BbSZ8V/4KZsMF
	rH+PXBOjK9UHfJJEUuJedMwxO94M8oOJR2rrhe9XMojdcCzxiOQBjZgg2m+2A+VcmSay/8L7Tfw
	gxG90TQVid0ypcpb7pIIb80medBPDwLCJhhAI2JyEvI0zd33fEdG3z7PLthE20=
X-Received: by 2002:a05:600c:3b99:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4bb8880b984mr542353575e9.14.1795762530660;
        Thu, 26 Nov 2026 22:55:30 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm42574611f8f.34.2026.11.26.22.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:55:30 -0800 (PST)
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
Subject: [PATCH 1/3] staging: media: cedrus: take the output line stride from the capture format
Date: Fri, 27 Nov 2026 07:55:21 +0100
Message-ID: <20261127065523.3685726-2-jernej.skrabec@gmail.com>
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

cedrus_dst_format_set() programs the line stride of the untiled output
formats as the width aligned to 16, which is the bytesperline that
cedrus_prepare_format() gives these formats. Program bytesperline
itself instead, so that a decoder can use a larger stride, and so that
the stride is the one of the buffer when a decoder sets the format up
for a frame smaller than it.

Likewise, take the height as it is: cedrus_prepare_format() already
aligns it to 16 for these formats.

No functional change.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index b66d855daaf8..7e742cbb1cdd 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -84,7 +84,7 @@ void cedrus_engine_disable(struct cedrus_dev *dev)
 void cedrus_dst_format_set(struct cedrus_dev *dev,
 			   struct v4l2_pix_format *fmt)
 {
-	unsigned int width = fmt->width;
+	unsigned int bytesperline = fmt->bytesperline;
 	unsigned int height = fmt->height;
 	u32 chroma_size;
 	u32 reg;
@@ -94,7 +94,7 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
 	case V4L2_PIX_FMT_NV21:
 	case V4L2_PIX_FMT_YUV420:
 	case V4L2_PIX_FMT_YVU420:
-		chroma_size = ALIGN(width, 16) * ALIGN(height, 16) / 2;
+		chroma_size = bytesperline * height / 2;
 
 		switch (fmt->pixelformat) {
 		case V4L2_PIX_FMT_NV12:
@@ -116,8 +116,8 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
 		reg = chroma_size / 2;
 		cedrus_write(dev, VE_PRIMARY_CHROMA_BUF_LEN, reg);
 
-		reg = VE_PRIMARY_FB_LINE_STRIDE_LUMA(ALIGN(width, 16)) |
-		      VE_PRIMARY_FB_LINE_STRIDE_CHROMA(ALIGN(width, 16) / 2);
+		reg = VE_PRIMARY_FB_LINE_STRIDE_LUMA(bytesperline) |
+		      VE_PRIMARY_FB_LINE_STRIDE_CHROMA(bytesperline / 2);
 		cedrus_write(dev, VE_PRIMARY_FB_LINE_STRIDE, reg);
 
 		break;
-- 
2.43.0

