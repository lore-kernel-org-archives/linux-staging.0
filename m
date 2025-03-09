Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3282B1C2324
	for <linux-staging@lists.linux.dev>; Sun,  9 Mar 2025 08:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510138; cv=none; b=eKGKKuI8F5ZiOR7OY926K9vMV+J1dLfioCbX18IXfnZE+fRSHQJzPY9yf6L1+H6hpysFXPYTeYbZYQOOWDVE9P1Lp/ahVW6JQnKBKms8DWBFZ9cuEX9jkKImhZ+HtPQhRXXpN59AVl5nyaB58kjuT4mYneZZOtvBFCSNVx0jXMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510138; c=relaxed/simple;
	bh=PEXQRR5MIciIEUGd4xGFdf3IYjMGvIzyL0quXHDtWHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DQ37vDZoss/iy7JyhPQ04EDWwBDVIBRmu0/T7HLJvPzV3Gl/qfLCr6g3KFsXKVKBQjDUtw+Myibap1w/VuFEXWyrXSAb5n2ebrLN3YYUMBXQ37i914S+etLpxdwjy7MFgCvJtnRzBmnie8cjtt07jqCDNbPGWVysHz/ItAntUig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fB0yFQOb; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fB0yFQOb"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaecf50578eso582082366b.2
        for <linux-staging@lists.linux.dev>; Sun, 09 Mar 2025 00:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510135; x=1742114935; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7binUbZaUuDaOb3p2Eu7VlTLMfhBcoFyA3aW55N69bM=;
        b=fB0yFQObVv2R2P5Lhptmlki4RensCmwWCBqm0XfxvM/CPyx7pqnRfxwsyktJGpdbkb
         XreZZIBEQyCfz7WPjaIgzHHGp1p+jBK1PqkXWMVuX0Yed0L7LSk9z6HFg2OoWu2LQcTD
         /dT25d2FwtousjtXYm0BvMYks2RW3y71UxGsa2K8EHO3N/aIgLMafAKSFIyjK9uHvvvV
         ky4bLeOUCIK1x0DLgAqgbzn1ibTioiJObipsPEzfujQWTw+TkHyZ7OpNSCCF7wTIvzLH
         KygJMmM6oKIGGoRK7uyFCP9ff0CTGCqPCSR/cQWfA5S9Z7Irhf5Dfw2itYicuyZ+gmKm
         1VLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510135; x=1742114935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7binUbZaUuDaOb3p2Eu7VlTLMfhBcoFyA3aW55N69bM=;
        b=oKeL6mrYlCkofQSuDu2kDAvAyLiGgNuL/vrldNthE3NMQFIhBG8FjS9YRUcdArsX10
         NBLRJoDdpXCzhA+9l44QiSm3j+P7EtgskbM/Tijt4pCB3NDnI9U0si6CeZHnlpY9fD2E
         Bn3JUjRoOfjlPpHBrphlP6ZdbguqVjGLiTzLuyjnldXrR57gEiHxX8eiCLCPYzoUUg1h
         A8nkuWEHhi9pFxo5qjWYtEJeCGeQCi3V/yRDB3xb+zKSperPuCHm5w04r0AWMfq9vGnm
         ZS5cPkIV6P6BRA/GXMIcLjLUAz1sTWx2XXav1XnkwDNBc99ItVxlV9xW3KI8VmpBCnaN
         QnKA==
X-Forwarded-Encrypted: i=1; AJvYcCVW3Glm64M3wlNTHtj55QJbltMOjqXlkhfTDfh/VXc4jUKPvq+0sV9/LJlpNIY5uqB42BqKKZRETJ3L3Hrl@lists.linux.dev
X-Gm-Message-State: AOJu0YzbJxUz2ReCMDLA5OotAFNaUGOMxb8x3ztKtckpaYZzNuQIZdvw
	SfutnyH+AloozpmrQ9YkMClvx0cm9D0Of+B8llhLy9VZiixssMWp
X-Gm-Gg: ASbGnctHJaFhDohstykhjlBD29lamhnGzl81llY/cszpSjYaxicqkgH9HxUy7neoguI
	8NX/EItUh52tY0iKWQdQOp2QwOymDpf/+esEDZj6kzoGCaHIyIh01Bt91yYy7blxaEKLnlIwLF0
	owVllR9DyTRrSromoXkn9dJEejmU5cT1cjnbvLyJQQB5HE4n/GWkZhiiuaNe0em4ka55De0vxPL
	Inqy+7bviQaVoG3Wvbdg3yRHv/+X1C5qeGDOuMA3FM1jFBaRo+f4RFawu3cXc9UwiQqUIfyKVEx
	4ktgxPBAp44yDARCf5hXElZMMlZ6LXs7FjpA5voqGw0s/nJOw2+LoLsydw==
X-Google-Smtp-Source: AGHT+IHmESnp20S37aW3Ui2usQAvY/2Y8u4CD0NZ6eDoOr+o1EaAHluADrNw5wzWwlijBh6ABetEoQ==
X-Received: by 2002:a17:906:6a29:b0:abf:40ac:4395 with SMTP id a640c23a62f3a-ac252bb26b7mr1238784266b.31.1741510135400;
        Sun, 09 Mar 2025 00:48:55 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:54 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
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
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH v2 10/16] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Sun,  9 Mar 2025 10:48:02 +0200
Message-ID: <20250309084814.3114794-11-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 9e27568e0105..a497c7af645e 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -85,6 +85,10 @@ properties:
       - required: [port@6]
       - required: [port@7]
 
+patternProperties:
+  '^port[0-3]-poc-supply$':
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg
-- 
2.48.1

