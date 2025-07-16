Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA0C2E1753
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 19:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694314; cv=none; b=jBDA/EqGbe2M2t6QCT3k+KQoTjUHcgOYwKQF69y5a55B/ccfXNSU6j4oucUZDvHg6h0KZznIaMvpL5UVsLt52N6PHJ/LQhtvyX7pZaUHuOET9XIebd03azB1P1LI7+YLlqPyL8KIFwI4wznPRYwdn0YBwW0FSucA4YutcShsMSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694314; c=relaxed/simple;
	bh=A8TElTk1Fj3is2z75X3heqyGoQRmHGTT2JdVWiyMUYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ME4ga+bLJG2OV2iuFTA0zBG2jrKNDUypTVNARe/GywIEXCTrJj34HgNfAdCpsRP2UEB+G0Sff1hO1nd6NzWi9rsO0q9VyUKyYSt2lJtUwGyRGvFv5yf4AMQ5H7tylGIOVL8oNcU8vbwY5RLYCAfeZkp6wQQaDrQYsqq4ZgRQXOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/FKaPSp; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/FKaPSp"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acb5ec407b1so36348766b.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694311; x=1753299111; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKwNNCz2eG9U29ALEDHAFId45pOA3pYtpGo8B4QYY6k=;
        b=F/FKaPSpXUM7L8FWVIjrguMlHWn9sxFpyU5dlGRq6sR/djrXJdkoCyUPxCBL6qpjoO
         iCitvmGs20Iu50Ue7CFl5ItBl8XkHQPmf5gr8kz9DuMuVaoTA1GLGxHuYs/cF+cXq3T+
         cAmAFrgCkLa6ljnwypTF/HXvwOQRad9DqP5ppWQjMpFEzdQ6KUuk47n7ysGP/6W5DYw9
         G72W7TvEOOOO9krzMIkiBQ/XJRvi9VFTSsrazXQUzXzdya0gl+32hO/6LzDcvr65AOi+
         fEOr+nu9PIjk2yHMnvsDNRUDxsEYUF2MCHDbaQS+pYmW7xZ+ZkjFbl8J9xnDG3BspkA6
         ttpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694311; x=1753299111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKwNNCz2eG9U29ALEDHAFId45pOA3pYtpGo8B4QYY6k=;
        b=pOiT22O1JwLO75sp5I2ANVt2ANupVBU7VBeX0CxDq7nl9K0M7BwXDIbhnAu1cjAMS5
         zmPL2ytNO234jDGoExznDn8sNwggFm1NAjH3Yquwg2J6chtp7zD4G5Opr1aWgLwMX4/m
         oBS/4B77PBMfhtdMXQZc2/HHGfNVC9QaIX48m2FNFPIxVeSAzvK2n8TT0WDN6Xx4mhLg
         CR0hzmpWVo2zystdTqA96M5/iEsWOjAbxBmOJOg/TSUI1O1DTNUmuRKQqnJhBE3Gb5Ce
         JwpBtpN6JEwUG/fWExPDDrLp3P87V6VlawsvqQKx6STEWMdPjnvjrM0mCf8zp4Fib5zN
         q9sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVffn/tTfnbDhWcwTzO4m+Un4jGQ4t9Nv9xq9Q/lXsg83ky4R7yn161frhODj0L5D4xGwCPyHiK8L4vPEFa@lists.linux.dev
X-Gm-Message-State: AOJu0YxzMiyxTWodJyYYL/Ijlb5pGnlsdFopwDto0ORwcVXyOdXNiQgD
	Q5Ex/yjTtLv7S/NqNz9/ypXwIwVKSxqbGFQa0uHkmr3QUfNGqvz76FZl
X-Gm-Gg: ASbGncu2mBAJYfZm8PAHRf3a4mh9Hgs+QoepzoElUGakDSLZn8AsVehdtYwe93pbuZz
	CvPhUo5bSEiR0JQCIX5/od/3L6DNK7en7JO4e6myxh7uelAQoAh5IcDjmjwL5p0Lq4STtZT2J2r
	Tmlopujwk9qhFgu25skn6nM2qHTZfIrpEuNVfP2r1ND9M+4fD2py1e9KQJRGMTxNNF658qoz0cf
	V4cJBuq68MiSJWb2rWPw8qNANVgvKoGK0vaNGwUUaQcuFbZbi9nfV6ZKcrgNjfXwIBGp7Ei1RXr
	zGM4eNNiz1ETQ6qJ1iIF7/sgFGy3+iM5HZi0VhFdagxVEzXcpjL+ylKrjY1sP22F5O4HdqD38HB
	RYB2ft5sKeXHhpk6SCx67nLm/skwLBVgNjEY=
X-Google-Smtp-Source: AGHT+IHD/AwWxhtp/H4zB8WMrDAL/c1Jp0cZ6659LBasVTEyBTwEa2yNp3U+zRNJMI5sOrDoJGRF4A==
X-Received: by 2002:a17:907:d40e:b0:ade:c108:c5bf with SMTP id a640c23a62f3a-ae9ce10ca5amr316243266b.43.1752694310837;
        Wed, 16 Jul 2025 12:31:50 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:50 -0700 (PDT)
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
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v6 13/24] dt-bindings: media: i2c: max96714: add support for MAX96714R
Date: Wed, 16 Jul 2025 22:30:58 +0300
Message-ID: <20250716193111.942217-14-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96714R is a lower capability variant of the MAX96714 which only
supports a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96714.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index f53c72e5c5727..1c97624833ebd 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -23,7 +23,9 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-  MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
+
+  MAX96714F and MAX96714R only support a fixed rate of 3Gbps in the forward
+  direction.
 
 properties:
   compatible:
@@ -32,6 +34,7 @@ properties:
       - items:
           - enum:
               - maxim,max96714
+              - maxim,max96714r
           - const: maxim,max96714f
 
   reg:
-- 
2.50.1

