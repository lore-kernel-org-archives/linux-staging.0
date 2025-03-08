Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0FC217650
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458947; cv=none; b=ZmC7yrkipPyR5NThEFDSEoU6umKSzWS7Nw2fJMZKuzM0e0cMCTyNVa9/bXkv2Odp88cvthwlmuA44Yc2tBZm1RFyigH0iuT8bs2RZZNbih/Rj7L/ho2U5U+ytodUEj6yiD+5dpMJfhmQVlfCqxjjodrmedW/y1epIZq3peJSYC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458947; c=relaxed/simple;
	bh=ht5ypYiEkwHxwMKy5bQfucXh4XtSV3csZ6nPeORtxLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UILQPyFh2Xp7bCgH1iSgJYOiTgDxv3ld0a2KOwt3p0gY3Jea0mzckjVV2pucUVkXLoA0K4tN/d3tS+n0ene4XhkdWfUAu4GGrNhFJ4/1+zKpsD5G/gjUebwvyNZBn0l+WLfmRfObJmvYQ/LYaG7utSH08y237LkV8MbEJS6YUMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kf206maw; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kf206maw"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5e1a38c1aso2193792a12.2
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458943; x=1742063743; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAHmn6rG6ETfCx5uG55oa9NiQsZ2fVF1iLru44ItkPk=;
        b=kf206mawyZkHr1Rt1pqLevESzYowbr0sRSium0RnB9wjwnDxoVTTmtO+YIMV7YnECr
         v4JX5plbFKHOl8Qxof/L3T7Nn5YoAGK3S34I1rHjd49X9aer87KPUENHrb58pecpv35G
         smVDSZib+/JUxDwMwwSwOysfZQaV+qEuNvt1AHkpR6WK3nFiQ9RWw8kCj4RU6h/h2tcP
         uILh//lF4aoOtivJedChwKzxAFc4nKICEWUP8xgN0eDm1euEes0ABQIT942F+hwMeCoU
         CR0p/OP15DugEqHKh7dyZPL5oOPxmme8Op71vc22jAj9DZTMN4jBT1UenBH7aJ+OntrI
         2KHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458943; x=1742063743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAHmn6rG6ETfCx5uG55oa9NiQsZ2fVF1iLru44ItkPk=;
        b=uE8XHMz06+xkWpbPeR+h6KOZkubvC8Qj/B3w5+jxowUTOJ16S8bZHqdZPOh1LpBYab
         4XKi98Wkxc/cj1CDAqzL0SI0uYc7tADSQxw21Fx9EXiQ1x2kIhgYC++RY+Kr7GLQHeEO
         +KbiHWVi/0HUCTGWaP5LiFpddJ8s+GDfAnXDtTndQN6T93ycTxUPWkbcVNWp4/u0Ecj0
         Sq9iDQ77axrOuIkx8ySZGMeOu1x3dtGhXGDza9YjVk6nLSTZnHHuJl2PFP9zC7XOBXv7
         YCN1U6JssaIWCDHW3mNZIStOml5h85FnHXVECTOq6tA0Fh+gzcd3KE+clnWDtCK9ncKP
         eysQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFTRsjLuNzThuzaDB4c2CZADSf2g4O+5777Rxadl0KpTykhYhftbBpY+XjwIAvIqm6TOxKpwVzJDEWNCUa@lists.linux.dev
X-Gm-Message-State: AOJu0Yy516vGouc+QLSAc07C4lF6HRlhYJqZg8erO0laxAWHcq/nDVxj
	tOxKOnUcmJSGg7YHc1gMF1+549Ijg8V7J4yhZ8TLpTxEVNHV1TFg
X-Gm-Gg: ASbGnct8tGiePzk9WZUlltqlre4Td5YN1UtIyLxTSOBN4uq3qGCejzjDwvhNonI/edP
	JmC3anNjiq8rZ2sj4cHxMkAdTM5DSWeHL6NiDUrjlpApHuzdkdw2OLKGZGpxJ39C9H0aovIgRkm
	CkxRGTZsGgzyPzDtVT3s2MfkrxxvUXI6snVPchILAZSBBsTB4SVWxztZSWG9o2X+3belcZN7wJN
	W08ybNCL3tqZ4I/G6JBNfHvkPkmMGT5YdHi6m/S4HodAkcylZtHc0eLmBF0mr/FY8yf2Ymz5v8V
	u6D+wvpZxiMZg8kwrfPyUFJ4kI2cVpcM+YAzOuY1pB5x9mCPFlZ8G8r1/g==
X-Google-Smtp-Source: AGHT+IGrMwcZh0pY9ViCetXCuLx6l8flR98nHFGVJmFE5NhrBR9RFuGiHgNwfMO7DQSkLgJr5+3lrA==
X-Received: by 2002:a05:6402:845:b0:5e5:c76f:c019 with SMTP id 4fb4d7f45d1cf-5e5e22d8d92mr22199896a12.17.1741458942777;
        Sat, 08 Mar 2025 10:35:42 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:42 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 17/24] dt-bindings: media: i2c: max96712: increase number of output ports
Date: Sat,  8 Mar 2025 20:33:46 +0200
Message-ID: <20250308183410.3013996-18-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
the selected PHY configuration.

Document this possibility by increasing the number of output ports.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96712.yaml        | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 148d196b9acc..52b5603c2f53 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -45,10 +45,10 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: GMSL Input port
 
-      port@4:
+      port@[4-7]:
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
-        description: CSI-2 Output
+        description: CSI-2 Output port
 
         properties:
           endpoint:
@@ -66,8 +66,15 @@ properties:
               - data-lanes
               - bus-type
 
-    required:
-      - port@4
+    anyOf:
+      - required:
+          - port@4
+      - required:
+          - port@5
+      - required:
+          - port@6
+      - required:
+          - port@7
 
 required:
   - compatible
-- 
2.48.1

