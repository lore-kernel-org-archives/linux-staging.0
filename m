Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A3B165FAE
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 19:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209708; cv=none; b=CRU9ci/Ktl7WvMSjzDcLDTWTabjTjUOODwgpOXJIL9cT03CAnQ7Sv8nBnNruiGKXm5/fibgCMQNLTgwxSvKn6g/2edw37rJv1Fs0/umgY34gamD+TbkcVdVF9p3Vu3qTDFULfmUhEPnox8io9BcwSn7xaA65G4Hodx8Cc7fde0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209708; c=relaxed/simple;
	bh=qwJnKU3Adz8cA71PPhU/Bxyy2mqr5yPU03Dfu92Wqso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uLID1DC8ipIRebeO+UJUCN+IDTYYZ97FQPKU9WIBZPsEHcGVlsF5ddEf+sLOsTpZoIwi1hlxsuUZNWJA/vsq6ZycY+jwHnzyUsd7k9k7WZ0mFGLD/DTrbiUotYF8qdlf0h7R8E34H1uaFcJeIwSusH6GTbyFZsVJLHAwuRQnFOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RvQT3l5i; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RvQT3l5i"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6ea26393116so2998835a34.0
        for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 12:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209702; x=1713814502; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HU2Q8r5u9tJlP6QMXdfGI/fLu0DCpsTU5mW0ctKluKw=;
        b=RvQT3l5iE3uIa/g2yk5RyOdb/3XzNFwyvPQe4rrkxLSIH20Y+29qvcFAQe3qUfWZsJ
         jyFUTivkoarqqACofsTEbXZovKrL14sDXehK1A+zS77NRs6ahrvbZ+gHlqGOvdNmoLHr
         gKUu1O4NHFaGquKk0SqGLpeT/G4By3uQmzXcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209702; x=1713814502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HU2Q8r5u9tJlP6QMXdfGI/fLu0DCpsTU5mW0ctKluKw=;
        b=rr5DFXwX3waH//i77RDGbXgxC08OVldM2i+d2JvnjJWgjHuTRpS/Sy87OJ9lnFtrXY
         cVeMI5r0nMOq+j9IDGsESH4KeUPmghCutnOxd1pKWHd4IyJZJ9Ob7d92FZ8CNCJcWCVu
         brlhW9+rLNR12TciOOvKnhm5LF2rAQ8yGE/MDzLD9fOc9/0rmchxc6FLWI20v6hVyDb9
         1RyzHMVs6RwLVaWn/gxcavxwX/8ueOTStPlyrOFVwZRNot3vKNqghHBoljx/cQ4M/vfZ
         Sdf2UD+FD/n/s6yRv+svNVGci5WdP1g0OTrvCk1m89lXoba8w0fNTL2N1OrRxypWws7B
         IF6w==
X-Forwarded-Encrypted: i=1; AJvYcCXS14ORMxlpeCM0VWjQ8v7UV5Eb/D9HU19Sf4p+lnS/8nukhkRLOIZvJlCzPIvWOEqW0ZaElBSRdF0eSfqZXdez9TaRZsOnUFD71LfdTg==
X-Gm-Message-State: AOJu0YwzCse5cO1jtkE2icFOcqUBd/2Qz95js2XZm9F2PTxaSKMqiBSd
	m4EKVKwESKw5vMutQ2Y83fBf+gkBmxCMrOT5hfX5nt6Q8lZU/JekJPLI6YkJgg==
X-Google-Smtp-Source: AGHT+IFpNLbWkYy4T2kNtWWO3Krrkln4WZhxhxOvSx17rkc4ihK9bZ3DdjfUrMbHC9Tqsq3KJ+SA1g==
X-Received: by 2002:a9d:6a15:0:b0:6eb:7c52:ed04 with SMTP id g21-20020a9d6a15000000b006eb7c52ed04mr5573331otn.5.1713209702690;
        Mon, 15 Apr 2024 12:35:02 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:35:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:48 +0000
Subject: [PATCH 31/35] media: cx231xx: Refator return path
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-31-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

This is a nop, but let cocci now that this is not a good candidate for
min()

drivers/media/usb/cx231xx/cx231xx-i2c.c:353:15-16: WARNING opportunity for min()
drivers/media/usb/cx231xx/cx231xx-i2c.c:262:15-16: WARNING opportunity for min()
drivers/media/usb/cx231xx/cx231xx-i2c.c:326:15-16: WARNING opportunity for min()
drivers/media/usb/cx231xx/cx231xx-i2c.c:176:15-16: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/cx231xx/cx231xx-i2c.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-i2c.c b/drivers/media/usb/cx231xx/cx231xx-i2c.c
index c6659253c6fb..28de72856c90 100644
--- a/drivers/media/usb/cx231xx/cx231xx-i2c.c
+++ b/drivers/media/usb/cx231xx/cx231xx-i2c.c
@@ -173,7 +173,9 @@ static int cx231xx_i2c_send_bytes(struct i2c_adapter *i2c_adap,
 		status = dev->cx231xx_send_usb_command(bus, &req_data);
 	}
 
-	return status < 0 ? status : 0;
+	if (status < 0)
+		return status;
+	return 0;
 }
 
 /*
@@ -259,7 +261,9 @@ static int cx231xx_i2c_recv_bytes(struct i2c_adapter *i2c_adap,
 		status = dev->cx231xx_send_usb_command(bus, &req_data);
 	}
 
-	return status < 0 ? status : 0;
+	if (status < 0)
+		return status;
+	return 0;
 }
 
 /*
@@ -323,7 +327,9 @@ static int cx231xx_i2c_recv_bytes_with_saddr(struct i2c_adapter *i2c_adap,
 	/* usb send command */
 	status = dev->cx231xx_send_usb_command(bus, &req_data);
 
-	return status < 0 ? status : 0;
+	if (status < 0)
+		return status;
+	return 0;
 }
 
 /*
@@ -350,7 +356,9 @@ static int cx231xx_i2c_check_for_device(struct i2c_adapter *i2c_adap,
 	/* usb send command */
 	status = dev->cx231xx_send_usb_command(bus, &req_data);
 
-	return status < 0 ? status : 0;
+	if (status < 0)
+		return status;
+	return 0;
 }
 
 /*

-- 
2.44.0.683.g7961c838ac-goog

