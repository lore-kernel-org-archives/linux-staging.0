Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89142E1C44
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 19:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694309; cv=none; b=BklP6+DGx7H2UWnlgwlf/8NqZyXDS3B8s41PUmWi7lWpyO4QBo06FvGIZ/E0lXb6s5Ih8TIcZ3qpGLDQ8kNcP3DPh2tAFzbmIscKXLHubxJVszFmkwGo+mwvJ8LTPu+OpjdqW6ghaPKkDV9OcdfzLKumxUuZX/Sj7Zi5tm5+oqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694309; c=relaxed/simple;
	bh=P//8vOwQWbcKu1kVR/H3otGF8zqkQSkNHGIA2UNKsxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RGDZOHwiEgHQiSg5QRs73+HfKJeE17dUei1+Twg7PQ/m0bNmPJdUWcZ/WVweMdCve/7BJV5j6kyojVmHhuZC2P3dins7Mx2CEw4y/WZYaZrFgzp1maaFOAsvt4YPKBaBRi3y7lLn0d8mIHJALeDfJ0bk4RhdyDVpHNGmtPbokmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nht8m+f5; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nht8m+f5"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0d7b32322so33924866b.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694306; x=1753299106; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdBDnL7BrH+Qd3yEtV/VsVDERkiLaY1kbfNQ5MlWHRY=;
        b=Nht8m+f5uYVSuk/0N0+PWO5FwgNjcOCOTh48r3z2Sn+FYrGBZWx37WoeG/XWljg1TP
         JD2msuJKRm+VTBQmJ5SGjVqot1W43iN+O7Lbs8iscbIp29X84ShIGCXBCZEfvu8LR/M6
         CSrdkAr7kKCDA/UmmVgP+3RcYCOmSmCQH8z0AhMmiP9rtUYis6wgkfIX4gqTW1/meZxm
         vVN8fPgYUmNN1qvUfy738+spJU7WXjnoDGfy9rvznzYj6W9KLxEnyBEMuo3SuTCdLjoW
         uog+k4eICLxDospOmms8byYF3g1KsKS5ruK5Dl6kkScEQfw6aFeOQSyvKWe3etuT1bob
         M2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694306; x=1753299106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdBDnL7BrH+Qd3yEtV/VsVDERkiLaY1kbfNQ5MlWHRY=;
        b=N8RD551IBAoOmnnz6CsF0pKZ9KPHm0ryztx0qA4H7/n/SsiRkb8nI3ZWo98E5AobK2
         YvGnZOAIhiESGJy0t4VWeXlY/+SbqEg00TVJrqXy+xTcNJ2KWPn9j9rmxZbq+6Tp4cKl
         fdsQpl/YjX7hz+NCSo6E4Qkfaqh1j0444ZfZZqlt/KbLf2x/TB/OQLEx9I/kG4lxCoKW
         r1Oyzkr+mEVwYes7yk46rJToVFaVwft7JvPM7aVBA9+gn1l3xMHSPGB3pwsXSQOETLKQ
         Xx/p2xC8bAlQEcKTdoXqmqgsPdzlqLp4XOmO8TD4f0sWqEQ6C6daL7viQhEjj1KPyJBe
         obqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwBxOYPrebVZMFuCxCVa5d/snunFnuEKJIUopEJnD+DDBtp4Dp6s0flIK1ZaZezGhqHb13y6l4sIm5IM9m@lists.linux.dev
X-Gm-Message-State: AOJu0YykXw11g+sR7jy98UM/7VD16N+/l0BUDdMBV+s/351uMT1QF7L/
	KN2+aEDLrJFUNglK51waKIv6S17IATaSKKeVqdts7MZI2CM4TYxZUFEO
X-Gm-Gg: ASbGncughLoKQm0hJJIIWHgM/vgM2wbFS7NR3imzm5hfsfpGsQClMfu5lHKLETiR5Fc
	KIDm+/tA3Fq485+vafk6IHJHghdyF9YO9mwLeCjMsSL3D+L0K9wnxpBcFDBqglaOc7IMcFEZDb4
	E2V5+2F97cwyedHeKJ9wXRRB2oFrbt1DIVo9hgT96bM6jBn08Bt8zs1ai17rungGdW7C3NcatgF
	xSERUSoM3joLeu8X8gCwVfVEveuGPnxP8y1rpkh/iREpy8DVngJmvZ9sjUDfiY8nYOmBA0xnZ48
	hhOlS4SqtFxgWrt3FpHTuGqLN6h4ff8JtYXLRMMNDD4wFdtCtLYyQOI6L1gm0T8mXLcU8cxLmJ7
	AQ3prMBtH6vAivqcnisjaPEBjdE3C7KZDAoI=
X-Google-Smtp-Source: AGHT+IFaK/OXpvsJKvME49U7HD+Bha/pUwWnsP3IoA6+d5T4dj66SFhtOG3KA8dw/D4IcnhUOjtIwg==
X-Received: by 2002:a17:907:60cf:b0:ae6:dfa0:ec12 with SMTP id a640c23a62f3a-ae9ce0f930emr389145166b.41.1752694305979;
        Wed, 16 Jul 2025 12:31:45 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:45 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v6 11/24] dt-bindings: media: i2c: max96712: add support for MAX96724F/R
Date: Wed, 16 Jul 2025 22:30:56 +0300
Message-ID: <20250716193111.942217-12-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MAX96724F/MAX96724R are a lower capability variant of the MAX96724 which
only support a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index b345305acc4c3..5dcafd46344cc 100644
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
2.50.1

