Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55F7127B70
	for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 15:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403103; cv=none; b=dBDAm8DbbYY0SoQLwBOc9Qrfs+woeiLePcq6RpqCdvbyBDk0Kr04YVSpEsCeinTePBtBQaCLEEGaf78lreLB4j5mGcDQSsN3ixqX5wQnhiFhX+4Zk1wd9zsg79C6mD8xx3QqdBAh+VSeCoQD4Wn1tqF3qdITUPpagyoZ4pdmY/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403103; c=relaxed/simple;
	bh=eTwz8g9CAKdFfcMUb1pEl/K4JXk6NTjbKJcjx2VRsnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GWaT7c8ZUvrSHq63enrUpl4NccM8Z3Wd2l8NRqX1sF2cJkTALNJdMvs9OmnhJ/7diLFm0TdS18Odc4nOUL54guZIRNghdQa8DLFLkobG3f00mihPhHbJkEcEnPr+Px5vF3r6ORJseypbpaRFXTYg5koorGOGm1sQEDNjRYPc6TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RJYb+tds; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RJYb+tds"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-78f103d9f64so358663585a.0
        for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 08:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403097; x=1715007897; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7WgC2+IPrCSABKNTDoDmq5evIyXV522VQOG0leEbcc=;
        b=RJYb+tdsjTSkNNGAiBOBBuhAZ5hx+gXcUGHy/bWyY9Yc45SmJgdfj3VloaJHls0Hi0
         l/3BxpPFWzSbaSr+fSPH6pFKQ0sPD1eZE5s6Uj87hCKzEPwbhg4HqudP3OxVCu0UfB8i
         DpwUvmVY0r/iXyzpC4wsKz05mNFV5dr0RfaOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403097; x=1715007897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7WgC2+IPrCSABKNTDoDmq5evIyXV522VQOG0leEbcc=;
        b=VmJN8v1mbiSwqI6rouNsjdvXBGMZwJjxvX8z4FiBLoYwvqjcVVaB+tNj9wAwTOWfi1
         iMPb4UP8RS6znW+8h+T4A3Z0hCRQ1/CgtwfmmD45KQ9MAjUhACMOAZX1ZDy+YcwpX5uu
         fw5grq8JdsMotdFBVNT+i4GlIktHHe9W8E/Hnnapiwc1zvcjw8Fv6gndpc2ezaqA82wl
         nfSdBIYz9DptbPET7UHxCMAsWJt8KV9c8SK7On0f7Nh4Itcr01Uex8qdKyXHj87whGRc
         raUaB3DXLdkm/f2AqFTnmKXLyFXV/mqgqd7ivZKDxE3CiU9R3uVRuZdaTdQZuNgtHwLG
         9ekQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj1gjNFud+WK2oWnJptugW2ICO5CZZ9IoUGhnWHfwM2OGNcCzMPDlHwMFHjtIjPo4z19SJefrxD2hRDZNcH2CYkjT1iD7AS6Fj3Mwxzw==
X-Gm-Message-State: AOJu0YyNi/av88FvXyeJ2eQ2TS9zxv9ZDW9iDummfxmPtwiAlL+J+uGc
	RI/2oQJbdO2PGv3PnadxP5yobkIgRbWnJplayonn397bfw4gUHgqemfhhwzczQ==
X-Google-Smtp-Source: AGHT+IF5XTR9AvencoZ/44RX25g9bUhd0pibp8Bru1gSUBx9gDRO27bIj/oJhNJSOtkZAwqzS5pcnA==
X-Received: by 2002:a05:620a:29d4:b0:790:8656:8427 with SMTP id s20-20020a05620a29d400b0079086568427mr12321977qkp.7.1714403097437;
        Mon, 29 Apr 2024 08:04:57 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:53 +0000
Subject: [PATCH v3 14/26] media: dvb-frontends: drx39xyj: Use min macro
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-14-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
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

Replace ternary assignments with min() to simplify and make the code
more readable.

Found by cocci:
drivers/media/dvb-frontends/drx39xyj/drxj.c:1447:23-24: WARNING opportunity for min()
drivers/media/dvb-frontends/drx39xyj/drxj.c:1662:21-22: WARNING opportunity for min()
drivers/media/dvb-frontends/drx39xyj/drxj.c:1685:24-25: WARNING opportunity for min()

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

