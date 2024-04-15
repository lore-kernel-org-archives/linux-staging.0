Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17101635C7
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 19:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209705; cv=none; b=rqFuSU/EoG5f77nX90A28U2qdOKS260XifcyNd2M/CKNUteztQXhIw5oQt8kD4UfvtmgnvWT2SHXZj+R7dlifGL0H/XhqhBukeaMa7sQeYCYUu10A0eFAqcrzI0j1Sgc6qcA+b7s5g1qzqayuqI7ykBN25iMMM1Y5QSz6j1xmjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209705; c=relaxed/simple;
	bh=VhbJFqc8QmLlbHWJnEENrvmuq+ozcGe5o6fFyH1YYQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E5gnjfO1hjAcyqAbLqVBgcPzDW0/n/6mV1l2TfFMhg8zbeu8M8SR2tpLDjST0/QQXYbKg55BIKPImM4RkivkPZmrLh5C50v3eWLjPmbBCjTiYwZj5SDPNq9rHUIS7Lqf/q0aJJTCQMEktrkXt7FO1GAkhbRkG4eyq1Z5z3sC8jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RLbT3G3F; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RLbT3G3F"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-78d543db3a4so272591185a.0
        for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 12:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209700; x=1713814500; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhmQYYxWMuudLBjdJjOGHKHYUzO1QQEhFUDY1X02X9Q=;
        b=RLbT3G3FDaCei90P2L1hWHfihk15W8LK+29r4xMRvffWX4mhSBgvhsfDk385PQHtDm
         bPNWT9lWQD8eEKTxTkFGjVRYjjkzPkG4AVujR35SWe6AnyxY4b2Gh9ZNLrtW1mLHURUm
         R8F9Fjfyn2cs6Fp3uFyBOsa5RjWdHSFfpCtBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209700; x=1713814500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhmQYYxWMuudLBjdJjOGHKHYUzO1QQEhFUDY1X02X9Q=;
        b=WBoEx1g8Y6a3GUaxxNZcT9kEzJawj42BbMG19NbmY6dktvGnyk50VUEP/HP1ojeMm6
         rrBDoRuy40mvUYjjIMwwV/F7ZQWk18tudYUqtIRUYvbMgzPZbw0tjMsDFpGKjaBb3aU9
         83aCPz5kHflmn2YaT1bUTrxLESI789CcxU1ML7FIBbOZAqOMHcqeH2qbLmnZamln5CHB
         qoSYUW6RXNIL0eK0u1OS7wy2k704w5FhM4QnMYCq82oFifuWg/UVm5pAbFYu82dXjX3L
         VHDu7KQxuymArGGZfrY2eGrM3C2qtekROrsiLjUtNr2GnIneGCixt0cCHseZt7a+M1re
         clOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlQ5bH0c0RQY7d+HpZv0/Yqb/9mDulkGrKw0KE7SsGCYpXLzI+D556vFkCANUxIlKw+ZNNNRaER5Fnv0DBl7d8G++CJ7waHiE+9XeLkQ==
X-Gm-Message-State: AOJu0YwzjwAiRoBj+vqMX2XwPk5x5cOy4xhXxj1o+b9vWiW/TPHTuWUR
	YyVuUml4jFkGJz0kOhoN+9MGmJNHqG6p2cdxQS1jTgIG/S53xXYWbBwWqWyK1w==
X-Google-Smtp-Source: AGHT+IExc3kiGm+hEFRw+kQDfViul4woHzF6WRs96subTZ4c8qoJuWqvczLaOhJGq/Hyw06BNYyVfg==
X-Received: by 2002:a05:620a:3182:b0:78e:dcc4:339e with SMTP id bi2-20020a05620a318200b0078edcc4339emr7592795qkb.11.1713209700585;
        Mon, 15 Apr 2024 12:35:00 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:35:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:46 +0000
Subject: [PATCH 29/35] media: i2c: rdacm20: Refator return path
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-29-477afb23728b@chromium.org>
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

drivers/media/i2c/rdacm20.c:363:12-13: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/rdacm20.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index b4647bda8c21..b40d40b0cdd4 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -360,7 +360,10 @@ static int __ov10635_write(struct rdacm20_device *dev, u16 reg, u8 val)
 	dev_dbg(dev->dev, "%s(0x%04x, 0x%02x)\n", __func__, reg, val);
 
 	ret = i2c_master_send(dev->sensor, buf, 3);
-	return ret < 0 ? ret : 0;
+
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static int ov10635_write(struct rdacm20_device *dev, u16 reg, u8 val)

-- 
2.44.0.683.g7961c838ac-goog

