Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141BE206F31
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458879; cv=none; b=I2frqs/ZO7a0E00NjHjTp7pOiFSOTGbQix/i5guQsS1hYgXHifRWV2xoMtJchZUZPa/R01rznp0Wqo5XqNNtS3N5lONncrUB9SNris5foqHz/zUntHGifNMw3zObvYyQ2nTxUAC6ojy/MTvhm4kIz7r1e6A+1WjHWx4zwojeM8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458879; c=relaxed/simple;
	bh=AbuPWLIU45qyQVYNe0RinxFUH4fVcFJyxnkCgDaB8A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hx2aJAnw76rvZi/fXqOxHmViCdYiwMzeJOOpYpQw3QcXpRiJQVsU2JanY5XqlwKzOG51t+i4sOuNhqx1BC5hZR6afSruk7x+2GKAM/7siGbW1lvqKTroFhXD2BfQLaLv1DOvJAR4d9Uhu8swUF54QIxAF9ViTrPLUyuIJX/UHqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2MoMctn; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2MoMctn"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5e1a38c1aso2193172a12.2
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458876; x=1742063676; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkDL/nUvpfh1eHpxumsRvR86QwXqar6N/bhFMrxJa6g=;
        b=Q2MoMctnz+6CxmpVVLEcSwanQvYcVrLkjdZMDikx387NpYyfd7CS0x8VoIXARe+uG4
         UDju1fO3Iez18KJvT41MHza0FxDW3vy3OqKyJ1qwT1Z5uoEjP6FyNWdjRLNT/l+ii4eT
         fgYGt10Z3W7hMXeEiyYkj/Q9bUregRov/9JCrV8NH6yFOjknZmfdmAEQaqAzxH8wljSe
         5Sp4sak4Ah+OIgsxw+Jybh+riW2OrfyF4hkGu/AS8q5o3gyoNgzF4ysKqIRZm9QfM77u
         CVadryLX7f4zPHIJDzoy7962Oz3wnNF7FNAacjjpKsavhNLkRA5nNhJfRo3cgVb6TQM4
         9VBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458876; x=1742063676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkDL/nUvpfh1eHpxumsRvR86QwXqar6N/bhFMrxJa6g=;
        b=Yl5gyFcrQpEgRvHg5QHQ58khyHaAi6q3KwsQN4zUAQMNyfpKb2m1fXRiUWvdzbdE9u
         i3t0uy0Zxf1NsJaosWS9EdNBr357SKWRT5ynfhEQ/WT0dnAU7+U5delSoAnbrKbqFiuU
         5ys9Zg5DA5Vlvzb6XqR+1jB8kAhb5Y3PABQegLat7dz/QlKAcdkPWGvDVIOZuy5BQCrN
         Y2WbFl3Zd3pMOXy9ZO2qaNx5x/ElVtxMmET9UDp9z94G0O1k5K8LzGsCgS8nu0otkgV0
         pS+EH2zuMbnnc4BxHWGRO9QLojDLzu28XdkcnrODAFKw7z6g9UnVUZpwrVL/mgZkS4xZ
         bDhg==
X-Forwarded-Encrypted: i=1; AJvYcCXYBbWU541gPOrmr+b1chgKq70LhOsZnxumy/rsq0cONBUKBXnt2lz3sPF4TZGI8jb6Kp3vZ8f2FnQ1d4HX@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6spNqT6GRs0ywTX5pYlBsFzJ3oZTLJA2UbCPPzVhtJRhbFaKi
	XroiSklcRWbwiQlExOnJ4TtmzBQ3dNKhmw5lpaq+ClwtdZXftvzJ
X-Gm-Gg: ASbGncuiienLYSlOv+hj9mcSNp0wOt5ZyQhS3wbWcXrEh2YorPx5w/kdZtpm921RMWx
	sDbOKNeBLt4+kUgITtwEJbV1wBs21WRAj8+u8T7/rt9GgG03b/NVsoR5fJ5a0rrzPsUT24anhAa
	XwC0uI31uAyN54F9DZCuvQBHXyXtVNx1aF6SXy4Taq+8qkeqaYq7LStmQ0mjWXAZ9DdPgtdykAg
	nU+gQYQUVj6vnPlWdQTkDCetkxUPBI+S7Ch237NUYLwaRW8gK1prrtkhyueT5PnS7wdhTEmXseC
	SF8sntz+OR65ID0Jt395UPeeHIxFujMRjBZM48Z584R44FxMq/fG1LWxGCXxJ2Al+RNh
X-Google-Smtp-Source: AGHT+IEFo+JxS1fGfKbCZ1KRjt4dKQZjHo5NR/dqzrNE9XeFG/awZJXR120fbdrpTpOmQk9ld8OSKA==
X-Received: by 2002:a05:6402:518f:b0:5dc:6e27:e6e8 with SMTP id 4fb4d7f45d1cf-5e5e246875fmr19328628a12.24.1741458876037;
        Sat, 08 Mar 2025 10:34:36 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:35 -0800 (PST)
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
Subject: [RFC PATCH 02/24] dt-bindings: media: i2c: max96717: reflow text
Date: Sat,  8 Mar 2025 20:33:31 +0200
Message-ID: <20250308183410.3013996-3-demonsingur@gmail.com>
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

This text is using weird line lengths. Fix it.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 15ab37702a92..1026678a17a7 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -12,16 +12,15 @@ maintainers:
   - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
-  The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
-  into GMSL2 serial outputs. The device allows the GMSL2 link to
-  simultaneously transmit bidirectional control-channel data while forward
-  video transmissions are in progress. The MAX96717 can connect to one
-  remotely located deserializer using industry-standard coax or STP
-  interconnects. The device cans operate in pixel or tunnel mode. In pixel mode
-  the MAX96717 can select the MIPI datatype, while the tunnel mode forward all the MIPI
-  data received by the serializer.
-  The MAX96717 supports Reference Over Reverse (channel),
-  to generate a clock output for the sensor from the GMSL reverse channel.
+  The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input into GMSL2
+  serial outputs. The device allows the GMSL2 link to simultaneously transmit
+  bidirectional control-channel data while forward video transmissions are in
+  progress. The MAX96717 can connect to one remotely located deserializer using
+  industry-standard coax or STP interconnects. The device cans operate in pixel
+  or tunnel mode. In pixel mode the MAX96717 can select the MIPI datatype, while
+  the tunnel mode forward all the MIPI data received by the serializer.
+  The MAX96717 supports Reference Over Reverse (channel), to generate a clock
+  output for the sensor from the GMSL reverse channel.
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-- 
2.48.1

