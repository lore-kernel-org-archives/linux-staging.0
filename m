Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0E11EFF86
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458939; cv=none; b=D+U/o0c2xpgkbrbzcskaw5sIXQh3CL1d/ocpym1WsNILSl/SM6HZ6QQ3GspRRFsHtr1zrmukklmSKB8G75Kb3gKum4+etY1N9kPHNk1gN/0K0trJBDzO3XWY/4QK9k95DsB2oRFTQWdjBuY8/PXTkmgxdkUaUq25T/eQjDyuAkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458939; c=relaxed/simple;
	bh=C3puY2gKJR/vIUjpUr7LiUyw0554VXVmNsc0xT2yhyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aun2JeUuMzTsmsTpmVKz72v1W6GUqVj7fdzNuNgk4f+hc+ggfF0faEL82I4p2vpTCohykol6wLSlGB3Inhip68td769K5Huh9HHSCqyAH0vlvuqEojzvO2G97tinSNMbkJ0Q/ucj4huoZIQfwgzai0Xw9mmoV38fBnP9jn7bwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqNG3Uwm; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqNG3Uwm"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so3498362a12.1
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458936; x=1742063736; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCsk/rfL/dXjGmxlvAv4Wmgs717Q0qsPD356Vdw2nxQ=;
        b=MqNG3Uwm8XfcZ6dfvjiNsHxxbKUjjfavRDQ3pu2QABiC8adnKhLpjd8MRndHtLS9CB
         hjLwISelrH2hBEce3j0uIsX2cbZg7bouY4ntu07v56nEPQEDS+cwvBwSgXX9fGKiCDR1
         zp5j6+ahqbIJsRWabIm5rKmchdG9cV5uLnDUIag1CpB2t69Hwa7zbMvL5uD4iT00XCRl
         w2C3BMKECrRipGnkdVVvSMuYdh8UBKUbSbM+GGP8aVfUXdnVXcr2HAZXY7x7yqReHzMR
         4kcfRipEwzF1uKCJpfBhq96BqOtZl4EY34vAKre9uV7t/mGuEyt6cEHZKm/JS8RMBlsl
         iVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458936; x=1742063736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCsk/rfL/dXjGmxlvAv4Wmgs717Q0qsPD356Vdw2nxQ=;
        b=nJJNarHs4ZR5jU35Fy48o+yO5d0z/H546spIlRctY0eBNs1uP3Xe5m3P5KzuCUAyYp
         rSVcPZche1Icfv9MEYQanZPFSFgZn529iJcxy/wAVefVnrEzjeL0veEEYqND7w12v1Qv
         BH+uW/ZAXt7QBGvp9cermbPYu9kQncXzaYbN2FuqnlkJEblJKQKE4bOwXaEtj1ywo5+N
         kgHt9NBqPJ3iIPJfALcq3qcbpfVQvBalA2XVcgx+mZ7NrBiyZZMPsc24LuWF4g3fvOV5
         RCEGnkTaUNkz9sKsvRetJsGymSMKy4/nWQUOK1UK+WFoeCE4sWqaN6aPMEiFRiWJikp+
         +Nvg==
X-Forwarded-Encrypted: i=1; AJvYcCX3yMmTNlPKenb+bZSsLHBoqlsdeEjABaAgk+0E4sMf1ECYPuYxgXyFuM+Op0TP0fI86pAIRQ95MgPEWIM0@lists.linux.dev
X-Gm-Message-State: AOJu0YxXm3waA7nkJRI1s3OtGJRn4GI2Ym3m/+T8gfOoxoW7fSLA4R9j
	iVA5NDLakTwj0peYGPY4tlskj84SBALnIGJ8PseUwVfWADeSyW/Y
X-Gm-Gg: ASbGncvvD1ZC7kfaT/139EdanoDk6JuuADa1cmt81E7EOdkNY1Ll8jrsY1h6ELLoXrQ
	5i9hlwQAH2cI7cTYRPqW3ZWBdm2Hqg8ZeRySMxdLuJHk9I3tLF0jlnNxZCi6rl7OLvc5Pjyf6yY
	3mxCpC3Kz7OrdTBbtSkWxNMIp/7wPYwJm+fDPqOWuFotxkj6xyjezsY9L79NfZXLTo2AL1EIIcZ
	xf0VBD+dsDnEx7NDpBi2/SHeOdF0AXhHCK1yKR++6F2W3Lt+Bd64BYFwbSwyHaxZN5gQy0fgO5W
	kUaM1mpscxjl1Sm92FncTG+SJ07YnV9PcKgdwkk6T8AqMjo++5muo28uOw==
X-Google-Smtp-Source: AGHT+IGuZkxoe/YU55gAOydwcd3lXHtaguNyV0TNC5ENcmXJiPj/O25J37irkr3OZx/XpOJhzTPfZQ==
X-Received: by 2002:a17:907:1c9c:b0:abf:69e6:438b with SMTP id a640c23a62f3a-ac2525e040bmr1055808066b.9.1741458935572;
        Sat, 08 Mar 2025 10:35:35 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:35 -0800 (PST)
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
Subject: [RFC PATCH 15/24] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Sat,  8 Mar 2025 20:33:44 +0200
Message-ID: <20250308183410.3013996-16-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
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
index 7fcdcc57c8ba..84078626ed5a 100644
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
2.48.1

