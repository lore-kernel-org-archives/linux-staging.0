Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A5F288C8F
	for <linux-staging@lists.linux.dev>; Wed,  2 Jul 2025 13:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462485; cv=none; b=jzosjb6u7KCjC7f0my1hVd46uwb6cBOWIRM+G5sFzSj6Lm0ox/79cGzU8aHcJ2D7BlmrCNWnMshC8HNl9j6QMpugbbmEgsWSgaykBKAeqIOsr7dE/lBoMm4Xp1MkhhgnPcrDG2SYhgvvEJ9wsLcYmNQJM4UYT1a+IfNi5Lnfr7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462485; c=relaxed/simple;
	bh=ErbiQmBj6FNnOV7BCy10DaJ1fSc1GsI4D/uamtkaohM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1wimgbmJ2vQ8CTIFC9dzuRzmqENmeqC/G35BdRp7V0PNoGyr+NcB0TOnUWpj5+5uy3i0dqhXhV9728NkgMUSETJlVT+v7O3V3zFkmCcOB9Wkmavj+lT/y8IOWCRlkxqvqTCfUBsgb9CPaLnuw5ZZbQj04fCHk93jlRpfZnLGjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYHH5enP; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYHH5enP"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0c4945c76so642655366b.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Jul 2025 06:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462482; x=1752067282; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0CDggb+22rjwlKD7Gu+xnJm3wuYcuGX4gjvXqvIn0Y=;
        b=LYHH5enPyp1pz3T2PG+IHgiVVzjTgSEEqxL/tsJJP4U2xI5gjPjzd46WSLXx6B/iBv
         62G9rOZ9t4Qi5gVfw0cRV+7f0hXAlqTteyGdJR4DVQSVms1xE8Z2U9Zj90cOeu/OD3P6
         jWhffZDOQuoY/hVaSPDzIFFDFbI+CXAg5Gq2YgfCrNKy5mgtFF6iTgvy4BW31gV3ZeUj
         MmJokWDCZFKDijN3Q4vFT/6jFUbPFXx4stwKAbGO6aZoiJMYuQ74cMkOmQUqptLNwShl
         RbB54WdyneHHO0cRxhrpXO/pgxaQ4bfqZ/GeqB6DEevnbH/i3Tx0Ns8z+AF+a+ck+QZ3
         RHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462482; x=1752067282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u0CDggb+22rjwlKD7Gu+xnJm3wuYcuGX4gjvXqvIn0Y=;
        b=UgGUIQbnBHHxV792aZNnVeNIy1htiyMIS8EQjJYARiaHPXxrIwJzt7SMm5Gc6Nm0us
         tFmlC7uW5M9ZplVJ+k8TGrsDSYacy/OxXCtW9FA6CliuDIaZ4Fotg8eUb/zJj+izbpud
         SsbqMVLhJLmQfFzon46KsVVfkR+Q6re43Ibl8uIHLRIBNbhulSFc7evBVGZu3qOInF6K
         U+y0DdF3F/VRYz7oQne/SVQOvM49lSaw65IyQnh2Q+oAfe2lins6R/SOtWFI3vxzFaR9
         4Y3WhIuBR9d7JuDIGPbH8aNAlA92S28P/u1tGj77X/y4Hv0IYY82qIeCrLkuhUc/jL8y
         qGag==
X-Forwarded-Encrypted: i=1; AJvYcCXyeOx8VT5wNSmjA0koP/5CvnQ02oMwwlni5kdDtg7e3lw+o+AAlNdUFrkrzuwELHJLxLmQdUdZayIyjbDG@lists.linux.dev
X-Gm-Message-State: AOJu0YyQbHMdxS87wO4/s2aDt4Fretpzs//kXBef/AM/keRTLSYGr7fa
	STl3q7hXyqUYR3WNEY/IEIyPkgf8csgbs6iC4w+A6AAm3Llfi67BZ9+Z
X-Gm-Gg: ASbGncv9ZIqeL8A5DCKL4sd4LFhox/PTJxc0Lf0l4hSkLCNWCBcIhp44jk2i72PJ8s9
	PQE/FjBiOyqsdzxd3kOQx25pZVfwjD2YnIspknWgfsJUvLueoyPyScRbBMbuH5uZYENvXikbLTa
	q2o0TaXambJADevxDU3OAZjtQBEFuMAwqQ0gJlT6QyNWRRrfB+SrtA4ozcdbpQO9wQylijZOL7d
	ZdJcUdgR9LRASx0DZZKOJSeqgs/VY5Yw19jumEq5yg9kv7BlRnhCJygAiHLkhd9tTu76W5Ea96Y
	UXsVacHZl6V00pQgJS88mdKMwr1woVHhH091JLYWDMwJwxy+sk58aTV4zjfFoPwNadZ5YBRNb3I
	=
X-Google-Smtp-Source: AGHT+IEwIV5Blqx17B9jiMC5uhIhf2/2xb+WOogVA9BwtlKTuRFKbLAhdj1v6eSRtnrWjGQF4goQWg==
X-Received: by 2002:a17:906:9f96:b0:ae0:bbd2:68d5 with SMTP id a640c23a62f3a-ae3c2a6c6bbmr270964366b.2.1751462481909;
        Wed, 02 Jul 2025 06:21:21 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:21 -0700 (PDT)
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
Subject: [PATCH v5 05/24] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Wed,  2 Jul 2025 16:20:31 +0300
Message-ID: <20250702132104.1537926-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX9295A is an older variant of the MAX96717 which does not support
tunnel mode.

Document the compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml      | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 9afaa8a7a3f5..78ecbab8205a 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -25,12 +25,17 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
 
+  MAX9295A only supports pixel mode.
+
 properties:
   compatible:
     oneOf:
-      - const: maxim,max96717f
+      - enum:
+          - maxim,max9295a
+          - maxim,max96717f
       - items:
           - enum:
               - maxim,max96717
-- 
2.50.0

