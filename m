Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11EB129A71
	for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 15:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403111; cv=none; b=p0jvW92fFr7FpWMZ07elnzs2N0b4dyQq3/aLOIrdo3OzGYZd37tVT4sbFUCHk6ktIFi5ji/vwgrPyXo3zkrvrPe13xfGjqEEBaMKa5K9shX+YanVpkCt0NtX1aIjR/zmB11G7DLLydR7FMK1dewbGAJgiLNF+lsfJfZjNbwpEXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403111; c=relaxed/simple;
	bh=jlNXpmWLkhoBvAVUnCnFp5WG/uIoSkDxDimhD2tWIcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uqcpRZW6oOxMq3J415r2daxteYWbM7p5N3dH0qx87G6WR3yCHAGhBI+YpuIIhpob6YgOz6MRiWgj7z8MgOBFhvZEix79ott8j6kgVcf2sBXOdPHgnrapw+/WEuDpyLdIO8XhrAqJwrsballNPt/I3M5UflKLz4RVxypPeEtRqC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NMVjqtFB; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NMVjqtFB"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-78f05341128so332493485a.0
        for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 08:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403104; x=1715007904; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OKO6D6+Uymjr7y5phUxNbL6FrIK2B37/+KaDSdt/b8=;
        b=NMVjqtFB9LJld+BF87Y8LopKuJk+0ksb8fTmD6aL561SN4yQxFDXoT7wmpdWbw7/PX
         f7hZOx5hJSj/FHcCc8GGZn+j2bhwGonESMqBZ253DR3qFdtZtdQE8mI2mC+58oeECKCQ
         u72Vew2KqPsEObJPm3aVPQGzLz6VZ/aoeM59o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403104; x=1715007904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OKO6D6+Uymjr7y5phUxNbL6FrIK2B37/+KaDSdt/b8=;
        b=e7UBr8ONu868lqH+YHqd9iqfNDpkqPNdfkT68Q8RUISwvACTefCYJLFBubB5e5T+iq
         aNfrmD3F1CPqZtI3wTaYQhaEFB2CFrHGpBn1mTUXbXoABikrxmH6YAi+1ymKetIx0Iar
         b7LCClZC+WI0pS4kpG1njdvXU8urWcg23SwF6yG1stpwQPiGN0jBktMn0G3Q4e2GqJOh
         DGfBVjTbk9/QrYmdvNYca10KcUFFL9W5Fs031sjufW1I5wyyJ/I28mNBcU6edw6sFrWQ
         YE7NRWJYIYHn/bkAESidVARmNLrkpJHJEHEVYmwoYze34UhxrfML24+qPl1sKDFy/HqP
         kmiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqG6C1FzsBWPuLIMFTVczitb6+MDvaotgmaGaDRfiXiWIBz+h7qG0wJBcI0GqQJogIv9I54u274uhaD8fjcz/u0mW2YYoxkj8VmJxeVA==
X-Gm-Message-State: AOJu0YwjpNRgO5zdlfydn5XJRc5aZGaPsqt4qot+/TDVdcJnB7Cn0h8S
	BUEaFsQPtNIqnRXKXjBfS8am8PPhHk6ueXyBuLUjSXTSCcpE37b4UZz6CFj6fA==
X-Google-Smtp-Source: AGHT+IFaMtke8GiK3PVK81BO+wCQ6+s/afNMwPPBZtmDsaryJW0dODmZmCJQPhu+Legma0gxWaBb/A==
X-Received: by 2002:a05:620a:561c:b0:78e:d4f6:3949 with SMTP id vu28-20020a05620a561c00b0078ed4f63949mr12152221qkn.25.1714403104299;
        Mon, 29 Apr 2024 08:05:04 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:05:00 +0000
Subject: [PATCH v3 21/26] media: i2c: st-mipid02: Use the correct div
 function
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-21-3c4865f5a4b0@chromium.org>
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

link_freq does not fit in 32 bits.

Found by cocci:
drivers/media/i2c/st-mipid02.c:329:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_s64 instead.

Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/st-mipid02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index f250640729ca..b947a55281f0 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -326,7 +326,7 @@ static int mipid02_configure_from_rx_speed(struct mipid02_dev *bridge,
 	}
 
 	dev_dbg(&client->dev, "detect link_freq = %lld Hz", link_freq);
-	do_div(ui_4, link_freq);
+	ui_4 = div64_u64(ui_4, link_freq);
 	bridge->r.clk_lane_reg1 |= ui_4 << 2;
 
 	return 0;

-- 
2.44.0.769.g3c40516874-goog

