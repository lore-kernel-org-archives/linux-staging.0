Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DC929ACC5
	for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 21:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085347; cv=none; b=ni69QMXUCE2hUpbdedQvEpSExvzPYrkoAG6G9hZH0Zny2Ad71ws6tI7Gj20jeEaq1PS2sDdb88VFYG67qQZCm5JJEMdGFrptt6ivM2p9pxojmRCx/ev2Thq8vjNOejGoHbqYwZDVgbMRiBq/oQT1aqb1hLfy5m3zbwj+7jUDdVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085347; c=relaxed/simple;
	bh=WOZHxr1JPl5MhxAXvir0pT2I7EGKgta9DVSDIll+ckc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WTUTfGx4QmLo+RNnxfVD6XBpoh/C9mFzScPZmbA19TdDbA5RDS1oGIPr3OsDSH7R368e0bgj4jBT7ZUxi5erNbucgkqFXTGkEhctNv24teNZfgkHvfRM+HEVN/KHJovn3CdB0+4BhlfXqqQxwwHFUuMnvpofvnhwbeCDgg1oOAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCPEWsq2; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCPEWsq2"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5fd1f7f8b25so3849301a12.0
        for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 14:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085344; x=1747690144; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAz48FYkFVpYXUdYC+Su9R3w9TkApJmckQAewQrh2nQ=;
        b=iCPEWsq2VOxjUcFGNkTfYMhBc2eBqnOiFBXyw3BjJNhHIKVfRgDRFfzLS2OL2vwUyp
         9oBH8SozDWvvEQW5y29XVdMqqqjFh3aeZ//nV2QQYsvr6P8yY6B6obf2+uycJIdDtCNl
         M96gyt6VY8x0g5KWFYfAzP16MxA8LiwB7DJyZR1BGRJitMRHLBKgDEi+b1KN1NOPFmWI
         bNA4u85CBfg9BeXJp3tzcEQXGzVy974L51aHUbZQobFtAkrqK3tvXhTITOScrO+NzbJe
         LR1He8G1K8cuSPmif2/mnj81wAdESVhWo9BM7WlU9NZ8SCgY0q80+jQxXnnorRDCElFt
         Weeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085344; x=1747690144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAz48FYkFVpYXUdYC+Su9R3w9TkApJmckQAewQrh2nQ=;
        b=XSB0GyyvkyozF0TATdtKmso7k9FRoP0zJjrWPngUXhvzCs+spdVxf/RrBqo29llQMN
         u9Kc5jvTAZy3R23NqZBclZuRMg3hF/SXSIDy1cNC2rXTHbs1MJFZ0I9Ni4pWLPmyWZ46
         apo2wHl81dGTo8iCXFccomZXk/MveU31hbI3EiYXdIRjlwKz/A6QALaq5FAI8o7fAYRA
         DR4XR784mPhIEgsIO2hSp/1AvLDrU/ZnAVp0VKvrL1yABw0rUvy0SM0J7DpmicaSHzWb
         MWUm1K375Ia7NQRT4Pb/wRcVRGLyUvbFTbPN5Igo7Y0NLWL8mFJEpy0hlMI0cFdNuD4/
         wB8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmkC6rvP1iJh5agt6opcNC+qY+ed86C1vVlo4Nu6smHklwTxo5B/Bew3r2lru2LlUHOUvmUkCDxxNPjqoW@lists.linux.dev
X-Gm-Message-State: AOJu0YzYfcMm2IyxJ0T3K0WL0cqO4HVhFbQgpITk5V+zqN4gWHhJCFLa
	xbcZOM2aG5/GuIFOGggi7crRTjLKMGWb28deWZ8F4lqdVrqNoRup
X-Gm-Gg: ASbGncs7Vr/m1kWp0b35XEF2qq9xIsmJLxo7/wR3zBGVzpPZQwwCSC9ETbKlgXXQ8ZA
	W9uWuaiE8FycGC9A02FUIW981wOoq6hLdMqT/JsoIgGEEiD8CCPoQeTCBiQQVigWyOCMlftB+39
	2j9fmPJRxj5yAa0Md1gkmcUFEEmIN3pIU+ajC23N/SvO1pHYMqdz9Kx8qYCOhnAZkepYacX4DAD
	2E0AncISCDPwy/J+VL1IAq5s3JmOykMuNuSoiJvUojH6AD/A9UCKiNMJ5p6ww5AQWYy6bUgot1Z
	9wMFT7LZ2Py4APtJHxy4XvYCj2WsAiXR0TkR2CkIkefxexi+FFkr01/0Ydk/UNbXbkk1wJlp5Q=
	=
X-Google-Smtp-Source: AGHT+IF3wDuYJ+g7Mgxi4N3TDw1mN1R3uL1whx6mbYJx3067WhAjCO2lvksHmND2LByrVN06I2Xi0Q==
X-Received: by 2002:a17:907:1c91:b0:ad2:3eab:4998 with SMTP id a640c23a62f3a-ad23eab4c5cmr884411566b.32.1747085344105;
        Mon, 12 May 2025 14:29:04 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:03 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
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
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 06/19] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Tue, 13 May 2025 00:28:15 +0300
Message-ID: <20250512212832.3674722-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 26f85151afbd..efdece2b33b9 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -9,6 +9,7 @@ title: Quad GMSL2 to CSI-2 Deserializer with GMSL1 Compatibility
 
 maintainers:
   - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description: |
   The MAX96712 deserializer converts GMSL2 or GMSL1 serial inputs into MIPI
diff --git a/MAINTAINERS b/MAINTAINERS
index f8ffb7cff9c5..abf3afc95fc9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14184,6 +14184,7 @@ F:	drivers/media/i2c/max9286.c
 
 MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
-- 
2.49.0

