Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9830929995B
	for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 21:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085332; cv=none; b=IIIsL5v9lOWAhkYJubjXQAx8D+pCo4jM8XMD19Avfit8B5xsqdHxfGcyIlgDG01H0JjMyq22MWkszFFScOcCCNo1OZlHxe68AJaIficIq8DX41efE5qIBVvTDQ3PxtyCgwQZtNwxhdlXQsDfObNixZ+EsvykhqLYq3VYb7iS05c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085332; c=relaxed/simple;
	bh=BbfNlYyIq6bfD8iWwyjMF+VezLL/5HH50K5s2pADmws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XopIa4Yen6Rp3mXEtGW/t0uqvZZ1OUlTvvF28cSYjSWM2oNH52IkGqlkrtPRsrKo9z8CfLDxRwQNjf62hfYbM8zbCG78e/ip4l+0Sy/vnMfcaX8HciRHKm5ssehYsPuDGQjGKs7oHuUvS5gP6eKyRQpoATrkzoo+dk7dOBUz0j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ch28mBq9; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ch28mBq9"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5fbee322ddaso9163574a12.0
        for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 14:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085329; x=1747690129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKrPGYo6r8jTfHw6fTsyOidOITDoSW91H73atx2WSvo=;
        b=ch28mBq94Mj8ewGfAwrEQNrUfXaqWjznjGu+FubltXvPoI1vAUVv0A1XLRGuboJ6S2
         B2ppuGCes53IB6OH1Ae6LzP5jX5qeGUGmOT8SELlnO7NnOtPQjU3h2Dz+Xy0LvuxfiuA
         erW66Bev6hfMOxCzWwBtLOOWQMGsfTxTRdAlDXsp/5/pRlTvnq+QPFKku9+NB0i3IuKd
         fgoFj65kJqgqdtTAn6UtwSRUN/97vVA2O8FZansP0NztZ3UkbNH1PcMEOGZUhWmjZL96
         tC1F4NvLOCjrsqtLHOEeK78NmqZolKL5DJr7YdKuX4d82zVEXJ/bOHU/784aEchva8Un
         iGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085329; x=1747690129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKrPGYo6r8jTfHw6fTsyOidOITDoSW91H73atx2WSvo=;
        b=VT6FlK70f0wrNSeNGa+2qeZg0NFMwE0CEh8Vyi5wVucgHhgmztPCpSEuaxC5tzZUPA
         /6MhhMPvhVdBaTsjHPFIumxkQpr35ie0VAr9WJ7RBwR22Hr+SymlkKb5z8kcQGQriNCI
         8KGKoY3d2WrOMuv4gedRgSkZifi4OHXFu3F75PiBLGPjLg6ahzWcLQSCOpSKA2oOfM/R
         JPJMmfNY+57mlYK2dnUqULuDVHxS2jMZ7OuzYvqaGjZa3tjdM4QN9Nkgvs6C61vRju+H
         z7JoPl3QhMFwbFehFlLwxoA4TkaUGab8HdRwTcUb5xRoZxeW8Qv+Rq7q0KSEoAhwUcje
         +icQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwPoW/yrbKfNAtxJrZ3Q3tXP1jJpLSyqfsz6SPyvdlQxdqaRR29T/SKh+Eb+/7QTbaALa3Ps2dyOU15Sm+@lists.linux.dev
X-Gm-Message-State: AOJu0YxadRjgiwDPbkOEYn/zdUQns7v+jxtMIjRrYHkIVY+D37JqmcLY
	UVO19fy7afjzxkDeY8QuFXtRjw8VjcbJFI3zWV8bfq7n9pPPu0uU
X-Gm-Gg: ASbGncu0e4hA75uPPombDvjykIGLEJwsfXdilnx51+19ep9MS7deAmpaBHAjN1FXZ7o
	O/d5zvJJRLDiVSP0hzo49FvablKbB2DcJ0cg67hjTVuqgwzOuiOpSBJkNyl1jHFuS6WRgoeUwUj
	Rx+/yuVM1m2IBcqEp2UKy+ykQKOYQXZOELJVJ6UX+k3+KUY+bnOH+Dk2/EeA0TJd8jtxYO7yFeH
	96HU/MwOpM0fEkBaS51YXskhOWSvAUY+qMvcV9xMGOiup4ej7lNb3m7E4+ZjKydn8ulvimsokON
	xWrCzwpwj858CS6QtsvSGsOtQ2mt9tHjyjanr5WN1KJyQteLddgycWoeUUHX7pPCh4jJcVdGzg=
	=
X-Google-Smtp-Source: AGHT+IFpt22qZHel8pg/VMN2FxBOpRn/l+5KBVuDEFumIWkq54C5p/vidB0Hx0vw1cOpJ8lTlDD8Pg==
X-Received: by 2002:a17:907:7f05:b0:ad4:d069:324b with SMTP id a640c23a62f3a-ad4d06934ebmr188335466b.10.1747085328447;
        Mon, 12 May 2025 14:28:48 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:28:48 -0700 (PDT)
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
Subject: [PATCH v3 01/19] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Tue, 13 May 2025 00:28:10 +0300
Message-ID: <20250512212832.3674722-2-demonsingur@gmail.com>
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
2.49.0

