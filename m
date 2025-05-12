Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50A129A33F
	for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 21:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085341; cv=none; b=A1JRj4c/O99YTzAGLGRqOGPbMD6ONvMVZ6SK5BP48Agbv6XseJrL7rt1AIHU/XWAuE+RsHP7SVyZAWYltb1+qU7XYb9rWSlQZcFrh9r+XPWtVlbw2+qT1R6QJZGovziCvWVSOPxVx/VZF17cPWGNHNS67ikhmL6hh5mYh5oeb+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085341; c=relaxed/simple;
	bh=v8JZPPCmGx4DwUJ2EJxFmzLgmKrI+p/Zffgpv0LqZdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m9OvQwL3WTOPoV+TNKGEIOtNS87TsApBvgbXIw4H6Bg3M2woeEnSdH3i4iz/XLlS42S7hNI6SyxKaGheE29k0G1bn5cOlbPHGTDuXMVjNTzoo1jNHvbA0S29j6QzqHa7ZwFmBOlzc1CfR1yF3+H98hKTL/JSZEEAsd/jt1MwSuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CX40eEl7; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CX40eEl7"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5fbf534f8dbso7594967a12.3
        for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 14:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085338; x=1747690138; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kUjFgmSm1aq3i57OyhvioiCKoKiPrbZ5ktvNV9Nzik=;
        b=CX40eEl7ZbtEib29hBYc9efGaPJK781i25hIMvB2oi76EMnKlKzUjQF4GHrW/LtLEC
         wFaLu3sPp0T7080fnK222tvY3L3Yn1oyG95TEJMS+MpZ46fex6kao39ke0y1JMmq1SF/
         KrcCyghD4KOqMO4Ot608H956TiwF9r1TB4D2Sz8VYzqCC6nPggPECRV4UJx/bN2unYk6
         OOqyyF5yat+3wLM8Z9tXeKUVMrJdyDsNHLZ//y5aTqVILQz4QJlut/QT0Ts/9u8rh/qE
         2aCAmEYEInLyyheGBKdA1Q5keLIRHh9OznHB7FKXINpsmzGZLpHr7gHflAHO5JCLmIhS
         1gkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085338; x=1747690138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kUjFgmSm1aq3i57OyhvioiCKoKiPrbZ5ktvNV9Nzik=;
        b=DpY+NMw5VXCxiyffTGC+IhWDqerniJMT/GOBi85JuTIoyPIk2b7hn72x2X08gIfQD1
         FpiJ+UG0cQ6SIDixwU686CsEz/KQ8WoqbpFujAJQasKVss/BRMBuOl2fM9aE2eKwVaX4
         nhg+5QZKv4Td5zN6xh3R7qMVTk2sCBDKFpe0XPQqDk8rC22VHzmFWggZwKMNlyQThuO0
         xJI2uJObXeRlJqblwiglPmOqYB4zlq48nEAc6XDts58F22M0hRUnbIcVtMuUGHJu/5pq
         0EOsijfRv/276JRiRx8RL59E9h/zc3W8EdgQwhSEdbvGjH878MuA/l73e1WddqsSJtFF
         qzDw==
X-Forwarded-Encrypted: i=1; AJvYcCUJznHRZnPSnbsv+EHjcLw2SLhrpH2bXUXoIWLRf1SHPXxxx0qabeqCWDgcIu/WlBdUx42GRs7OnUUujbwB@lists.linux.dev
X-Gm-Message-State: AOJu0YxRjoxwTK5GNQsTskVFhy9S+HSwuByVcQK9m2+RoKAjWpltdqwV
	lUb9h1RSxIOMLD24LEkPWPLJtAL7x0WWtqB0wXm3f4RMypXqxDBL
X-Gm-Gg: ASbGncsFW368owgAe2QM62/OZYV0/rvI2YfRwFoTmE4XngfAPXR+Xma3C4P8MwwpFWg
	s8IO6LCYRh8Zaqt8IYnF2/MwStDtHtFRc9kyI+n+ux0xdT53jcmFz/uQDsQxf2Fg3DS51SrRoeE
	X/TRhOCSkuy4EKynuGVZpsjM7ySu4WG4LjYjkKSHT0HHhR47ckKjhc3tKoazwYKLqwS3ehkwMuJ
	IUU0rqnpQgmuMCSt5Fsn7gKZKXGIcCfsm9M8gHDqRv5vJMp2DECMNw61ZI0HxertG4pQioxOhiQ
	kledzzaI+xDTntE24ogiuMUSsa+0qSVC04ay5ty1R0Q5MujX2a+e+bNXGYmbhiA=
X-Google-Smtp-Source: AGHT+IEAPVafudDeKA7IZ+hp3781+KmAJJInbgDkuJoHFCm7mtISYKOW0uPGJOyF57LmU+R37Wj7OQ==
X-Received: by 2002:a17:906:4796:b0:acb:b1be:4873 with SMTP id a640c23a62f3a-ad218e54d32mr1432739566b.2.1747085338068;
        Mon, 12 May 2025 14:28:58 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:28:57 -0700 (PDT)
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
Subject: [PATCH v3 04/19] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Tue, 13 May 2025 00:28:13 +0300
Message-ID: <20250512212832.3674722-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
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
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml      | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 5998e2518be9..ab46a5f0bd7e 100644
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
2.49.0

