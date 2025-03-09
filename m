Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA04192D7E
	for <linux-staging@lists.linux.dev>; Sun,  9 Mar 2025 08:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510111; cv=none; b=a2sfbOgs08boOWEnaV28jik8TO4QwOm3WWDQqZxQkoFRjY8dQvWDxL6+d2VyJFE6ozJ8ZLeUcF+yJw554yFgoIFPM9GLiEWE8s0fHVoqE290XRHu/rDZTErGg3wIP7oSK9dGTwkefgRwduewFV2oMFIURCDd1jU1hwnzrtwzCAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510111; c=relaxed/simple;
	bh=7z6smvZGWZK5IVexMzCPUepQOMHvMOYKwZikRSdeV8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MfItMhIKGsr6bbDcx4OZLGn5Ys+jhtcwcWs93Ou61LrHRby0cOJFoac8TKGRXDNIBFm0TLpBb7p4ztHQfSQEBZIJGkk0PZKyYw0ljtqTmIoWE+GaPISP/YFGjplWJFuK9Mv0gYy7AAZKyLyCvD3cEXhitd6bVy0Gf/wVtkGTpro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxNQMLzS; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxNQMLzS"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abf57138cfaso618594566b.1
        for <linux-staging@lists.linux.dev>; Sun, 09 Mar 2025 00:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510108; x=1742114908; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLwWoHn8W9MlyVlWzzyNuJFztVqL0l+N+say9TiSqnw=;
        b=gxNQMLzSGAlFeeWjCEuCOPdooYQ4SXg0bFMLGceDlEmrVAABLIo2p1UemcNGbwfyNI
         wJkouu7p+gy3+jzKyJBm4nlirIo+b0H+/6U1VX7W5cOGkZk0v+IeGXC6H/8gW1n83Y9z
         UaV1FaCu9Sk6MarhEdT2a/xaULHvyTE3GTgyqCLXAg0nJdyxfR9H9tL82WC4Ynqr2ZFc
         /C8xDMimABBbcgYdOBTAtF63Px6NIxxjbJan6CqPhQRGfaFW7pCTr4XiS0rarhEHA26I
         s0ml/z0bXqOWtC0eBmQrfa7UbgEfPc2jI+W3+N95cBKrohi54KbHkNUQDtkbesR6S5Pa
         JAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510108; x=1742114908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLwWoHn8W9MlyVlWzzyNuJFztVqL0l+N+say9TiSqnw=;
        b=gnqZGm1xmJ6+wo7Q6q2jdmwPypGK8FLCnpMuEpLqVA5SDg8m2oTyDpctQ4oiRMBPRn
         +cjVeTs/8C92MudNOuiyAYcw+hqQjgnjNrSKMRBVXv57t1rV2G/3L62cT/vaAixhDqL+
         oG9CPUCim6wFH6120OMcLv6MZD/CyfuzrRLS7Ciqoa0+oEjCFfrf7w3pJGznTKrKfHD6
         IV2cp8U+2gK7LQC6lPHfWZVw9kHofVaapIQ9BP1JhqoKDRb4031ZgNdb83/fyoOwIS1Y
         Tb8tOvkX6ynHCRhthsgowowuhyitYcf5NnDZmCZn0dbAqe5pSwujwDA59ptWy7J3ZkNP
         q8Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUU5+1H48/EuWZAyAbiCIYJt1QonK6L37T8EVagt9oLphRTI0zWuhqwVbgk0lzDM+tpErA4VYZUnhWRj6YG@lists.linux.dev
X-Gm-Message-State: AOJu0YxRSB5B302YOQ+piFajen8nfLAhfD5FUbB+vZWchHEI+Oi6no/m
	G4ht06HMDog8L0S/saSuFjJHzGyQRxUTPQVGJ4JFsH/ksRdtCxTn
X-Gm-Gg: ASbGnct1GXkPMCWiuW+l5KL8+WW4i62kLD7HwLdXLUCPW61J+fWZ26PXcMBjFemTJND
	wnyeY40O+LQGfDjTIqjHkNJfWhkLjqtAp25plnu+spbvfwBfARb9cSAFaH/k6zrTUM3e9tOL47Y
	zVR060wxk1S5/dvvILjc0OKPkpmN05aNochORYjITD/sLWNDNOp0IyOf5QooGaxthzuyUSLyJVh
	TV7Lp718R7F6OCVmLCaQPPP3N4vBhxvDn1sLfxkyjD1YKwbFRwuF+lCeigwZRZ0xqCml/0hgWUg
	/KZdEy55jk7dJ2/0TUIG2q2e9JkvaG6iBwUVKzTssxtFNf96PoWLgJBnLQ==
X-Google-Smtp-Source: AGHT+IGVFkKRzT6+IwXblZWULuiCcIjFTpIaLv4LnJDpvJxC9xj4WrXnY/iTgXKB48kvflgou5SSnw==
X-Received: by 2002:a17:907:7255:b0:abf:51b7:608a with SMTP id a640c23a62f3a-ac252738131mr996109666b.5.1741510107207;
        Sun, 09 Mar 2025 00:48:27 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:26 -0800 (PST)
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
Subject: [RFC PATCH v2 01/16] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Sun,  9 Mar 2025 10:47:53 +0200
Message-ID: <20250309084814.3114794-2-demonsingur@gmail.com>
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

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index d1e8ba6e368e..15ab37702a92 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -9,6 +9,7 @@ title: MAX96717 CSI-2 to GMSL2 Serializer
 
 maintainers:
   - Julien Massot <julien.massot@collabora.com>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
   The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
diff --git a/MAINTAINERS b/MAINTAINERS
index 1916d0636408..8f463ebca056 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14198,6 +14198,7 @@ F:	drivers/media/i2c/max96714.c
 
 MAX96717 GMSL2 SERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
-- 
2.48.1

