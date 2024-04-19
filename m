Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E00129A75
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 09:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520179; cv=none; b=ARrQuwS/+GkDPrCG0ZSqueyLsJQPQITkGmkiO+eZ1gsS80G5E7Vj6ncxxs+FNy/P+JhwunbBdCbSYEHKUdc1CAZaFZkMSvqnHWZaaazNmvAOx680exlAjzKJ1YoJL5Ft0knqrVs8YLVY25j8foa8VObXSOhMmbmOnDiwsM0pZuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520179; c=relaxed/simple;
	bh=JRKd3ofdoG2gsB+v1DyPD2MPqmJ2Z54LhqVVoekb6tU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=stVJXSzEYZCHSi/gCxjTEguvkY0gbO7FprPxQk/B9Dgt/A7iPhprv81znkc5RZh26y61Z7KjWiiEUIPy4fY5/uMqd/uCt05IvTQJvFRliNpLL8w84teFPGEygNacBhDAY1T0HE/2q4hBB21s/M9vuuX/gOX/1hXZ9pvPJQivrdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n1RKxmKH; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n1RKxmKH"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-78f04924a96so130040485a.0
        for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 02:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520176; x=1714124976; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o87/x+VFy7QdGpzFKB0wOlVC4lrWjoCcMvbEo+2HMvU=;
        b=n1RKxmKHFbRqdZPDLGyMzVib2lVKs/aqTXr5Az6pnNp8oGPJba9Mf5JQzvsOJYZDuD
         nYng56Q3i4CU+wgkwU4i+R8TLJry9MfRBAPrpJQdayWSOluxdQ0h3JnOwiJXFYANCrkA
         LuTnMS0a60gxKGDvJ8XQ2dXdcPLf5C6L3kX9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520176; x=1714124976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o87/x+VFy7QdGpzFKB0wOlVC4lrWjoCcMvbEo+2HMvU=;
        b=Znwb8YLBP6HodJPFeglY1nW6YXVPlLusq2/8TJj1FSD+lU/I/uAyBvmfC0fqI1bxUO
         2gmRQptzZNyZS3wOr1wyUMNiOFiqCwr+2UQjbJrJ9YwxvOicp8GvpKbSU1xB5/pV0TvK
         gtK0AYLSX/sxPpZAwtq4IarDJ7h+rvcXEG7SaF38dkuFUhqPjotgKMNarTQSzhbmmSUP
         z6GELN/qBle4FCro65SkNB+4p8kGG2/0WTU/k0ZJ1iigT/D9vHQsekYzIChWRvcqfj2v
         IvplYZep74xIGF3qRCYWMtLAtkkwcBuNMoq18oD2KoOGvgb+mgldiWcnso/E/yCJvjSn
         8/Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWm8TfQalzwTqjG/x7YRF+UpvAMIz+nijT4YNtO41V6LbZAbDBjfC5grkl7qW3L6KJqlFKxuc2kEl/Xm68I1CAYwTOVfJdH/RKkBkSL4w==
X-Gm-Message-State: AOJu0YyFqrpqlcKZTPrDqx5tZezhApQbi/cYiQKWK94DUZCA/3Zf0Pyg
	ZwQQeLSlb72ce4R6h/WhJs6aZ4bAh+S89gcZn4st2/dfej3jK1cH0lO0Llwbaw==
X-Google-Smtp-Source: AGHT+IF61myZQzLIJtZThv3LhAjLCPCU5PGkGLiYz8SZp337r7gQKsKEDGbkUPSHG1pPHq3o/FKykg==
X-Received: by 2002:a05:620a:47c2:b0:78d:6ef5:f10d with SMTP id du2-20020a05620a47c200b0078d6ef5f10dmr1532638qkb.65.1713520175867;
        Fri, 19 Apr 2024 02:49:35 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:35 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:00 +0000
Subject: [PATCH v2 14/26] media: dvb-frontends: drx39xyj: Use min macro
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-14-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Simplifies the code.

Found by cocci:

drivers/media/dvb-frontends/drx39xyj/drxj.c:1447:23-24: WARNING opportunity for min()
drivers/media/dvb-frontends/drx39xyj/drxj.c:1662:21-22: WARNING opportunity for min()
drivers/media/dvb-frontends/drx39xyj/drxj.c:1685:24-25: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/drx39xyj/drxj.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index 1ef53754bc03..6fcaf07e1b82 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -1445,8 +1445,7 @@ static int drxdap_fasi_read_block(struct i2c_device_addr *dev_addr,
 
 	/* Read block from I2C **************************************************** */
 	do {
-		u16 todo = (datasize < DRXDAP_MAX_RCHUNKSIZE ?
-			      datasize : DRXDAP_MAX_RCHUNKSIZE);
+		u16 todo = min(datasize, DRXDAP_MAX_RCHUNKSIZE);
 
 		bufx = 0;
 
@@ -1660,7 +1659,7 @@ static int drxdap_fasi_write_block(struct i2c_device_addr *dev_addr,
 		   Address must be rewritten because HI is reset after data transport and
 		   expects an address.
 		 */
-		todo = (block_size < datasize ? block_size : datasize);
+		todo = min(block_size, datasize);
 		if (todo == 0) {
 			u16 overhead_size_i2c_addr = 0;
 			u16 data_block_size = 0;
@@ -1682,9 +1681,7 @@ static int drxdap_fasi_write_block(struct i2c_device_addr *dev_addr,
 				first_err = st;
 			}
 			bufx = 0;
-			todo =
-			    (data_block_size <
-			     datasize ? data_block_size : datasize);
+			todo = min(data_block_size, datasize);
 		}
 		memcpy(&buf[bufx], data, todo);
 		/* write (address if can do and) data */

-- 
2.44.0.769.g3c40516874-goog

