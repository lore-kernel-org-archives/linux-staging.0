Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386F012D77D
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520182; cv=none; b=GJBU+DuyhBFbXR/msz9gmRQAxXVDr79UmhwAo7WwFPBodSbKfo2bhlrV7BWiq4DawMWQjkA6S5xKgCyGQiXDFcfbT3svXRh3BCo7ff1KJDUfY3pYTEQuk2Z2c7HaJEWDTRAn4XLOPVBVJ2DJ5IqIEdE/ZSOhVEKnFJgO99RrQ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520182; c=relaxed/simple;
	bh=eTdkYl0bkVdX9TmC/TdAsDLTwgelc7ol4/8WiAm6VoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZtY2YwmzMfjZK6Vo+IWuos/HDuGhtFtR4GOgLG+hTl25LpPD9ahGpfDOAVO021/JTsEtGgL4DbDizAjU+YM5vxIZktdSL/HXF4MxxZUu2P05KUIUVx9FXydM9rSt55QGA6iCe8OMm6PkbjAeQbDVVO9tKN/G3yObzarb41a0w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BfTGTHPZ; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BfTGTHPZ"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-78f043eaee9so106774685a.3
        for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 02:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520179; x=1714124979; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejR4SFor1DGbZO07N+L+RxXvAXTkN+sOOOYtcWWVXb0=;
        b=BfTGTHPZlskg/SRRiKMFXP7/NSCdc9OruSRiSz0pvohB/GQ1xIT5QLCCg8Zkt5O/ru
         WINZRTMyaFbiKxpy9q8ySYeIdMi5c03Z6WONrNRoNtLg3UyUAjcEhbDMGYfQ6XHyr/4X
         qlHKxr+e/ckXSghy791G7r6P7799z4TpCCX7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520179; x=1714124979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejR4SFor1DGbZO07N+L+RxXvAXTkN+sOOOYtcWWVXb0=;
        b=mAO6KGVYkTu3ZLSTIyCVSfq/X0HSmvoJe+mdMiNE2scW3O3M+OsW5orWaDwBlWsa0C
         WdXR+CAe9dN5emHbdv7+0T/3PbZZquz/+IKtLATtCuF2vP1Pkv4GbsbSaUmRPX3FDXll
         mrCgKLF61KlawVwwMYu4OEddty6wB7UxqQAxlXK5yYyIwwtUAbKWUDl1ckS2g+a8LHmN
         OXYuCW9P5NPRE1yBKz8Xn3s3pdcQyb38XgRFgA8ELDXWPfNZmA31deFof59tMLhtRfmF
         qBi41deASOIaANGY0KN7PWdky8LtFBAA4ukaZthE5stIDr66bTJ2LGmAqU/7qO/sMH/c
         r6CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSfTsRX71dO+t6DOO3CISrTt58koD6KUMUhExIHWWhf5MRHDAi3nlpF7Ml8lnoDENA+dYzG2Ul7JPKc+7tsuzmfw1151JuCeIKInIxew==
X-Gm-Message-State: AOJu0Yzplzd2RUQ4a7Yrp1pgid3Xma7gG5BhZi8sthC2L+z89jBZ3a1u
	IOe8QtBSfhoKEfns+UI3nToRs/y5fMICCeN0wc6SiNLstNIU6TDMG6IXBgdrKg==
X-Google-Smtp-Source: AGHT+IGpZ3ldVVwdiWjuIy5SwcAIMUaAxjtBaGve9bP2/gGFY6jCFymehsQebGC3Yx4JbEu/ovs54w==
X-Received: by 2002:a05:620a:d94:b0:78e:fe1b:a601 with SMTP id q20-20020a05620a0d9400b0078efe1ba601mr2205140qkl.0.1713520179012;
        Fri, 19 Apr 2024 02:49:39 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:38 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:03 +0000
Subject: [PATCH v2 17/26] media: flexcop-usb: Use min macro
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-17-2119e692309c@chromium.org>
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
drivers/media/usb/b2c2/flexcop-usb.c:201:8-9: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/b2c2/flexcop-usb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index 790787f0eba8..3ba6a5ed7167 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -197,10 +197,7 @@ static int flexcop_usb_memory_req(struct flexcop_usb *fc_usb,
 		return -EINVAL;
 	}
 	for (i = 0; i < len;) {
-		pagechunk =
-			wMax < bytes_left_to_read_on_page(addr, len) ?
-				wMax :
-				bytes_left_to_read_on_page(addr, len);
+		pagechunk = min(wMax, bytes_left_to_read_on_page(addr, len));
 		deb_info("%x\n",
 			(addr & V8_MEMORY_PAGE_MASK) |
 				(V8_MEMORY_EXTENDED*extended));

-- 
2.44.0.769.g3c40516874-goog

