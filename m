Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0105BAFD
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 23:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310974; cv=none; b=l8sdUrKlwa+xykYLXiu0+JueyqD9v13b2UGk1bKtCQvhCH4y4s/Khb1xhhBFltWyWDUxnHsYAi+zE/e3RoUPujHn7fAulrQP8eT9j8cleoycxaGgYgB6zpeyqHYixC/w2Of+jelgXNxkfj8OKVmQxlxxRl0RpFy4jFfkJdWusmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310974; c=relaxed/simple;
	bh=uKwiWzeO0xFAMIWvpeHxHonS+sA78lVm8Pf7e/oU4ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NJQ0+NR3WPP1TiDMX6dx+a83EpGCidDv2E+otLhe2jBSC7ZDM2YrEb6a4oHiVW+ug71mtiAjsz52LRyX2n1PPtvGakND075iZjdFr70/9VCDBgf8bDGzpPxgalC1WiMB6U8Z3ioGMJU09YWdgQzPnpvm7IzhzSW2GGA32JPFvU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eAqt4qFC; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eAqt4qFC"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-783cd245ec0so73626385a.3
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 15:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310971; x=1706915771; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0dgr7uAnKOP7T5XfeX17z97swkwNkCZ42zeC6YgDi/s=;
        b=eAqt4qFCFi7Gl1DvilDxws/WgkX+AiUwxXGUjKrHbYCwFX+QPJyEV7lnMzlQ6byz/w
         h/ro2a/0bAZEfMDJbEMhRezzNJRbfHWQY3+7oTFcHBWfanS3HtWEG5VhQCcOHw8xFbwY
         V1RjsKeIaevXSi3BELiUQ7yrXHwXJcpTDz7As=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310971; x=1706915771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dgr7uAnKOP7T5XfeX17z97swkwNkCZ42zeC6YgDi/s=;
        b=dV9EUsFht8XxupACD/Ty5goYaSiulUyq6xkvhfqBeLf1ADl24D6aMdmgYgZPqE3WNQ
         K/oIMv8TarxrhnatKYQnzQELIWHBbo8g6rMIFy6hXVEMYHhRosXQHXjGCWyzpGatx1L3
         mmFaAqiIdM02wehaRocxYKkv98lIbgHRn8PeJjqo18Lk+V8EMfG2z+pvoecr+BbeTlHI
         ntoLfZLmk1l5aGm6odQBRnwe4BfFZN30XTXhGsGcYjV4aiIcDknFq1BEedtg8h6Nsue7
         8b30YJKufnGwZ1gCLRLE0o8xSFaiIKwEwdDMcRBFvusHNrTSVNScoLx4SvIxNCtE6SWj
         aMVQ==
X-Gm-Message-State: AOJu0Yzsm0mGxVPW8QsQJXraJGJqwWPkE8If7cZaLb1sLmnXC7oYZhsu
	0bktnDlD0jgGhvCNSy4QhdoE4ZzqQNkDYAPrs7oE7Ox2HsvKmDi5TVBJdSSQpQ==
X-Google-Smtp-Source: AGHT+IHsMkOc7Y1zxu9ngxPBQ4/Ve5FRbTtg/VBTpnZVoIwUFy4DQtcLLUh2LbUFnAzoTvCw0KH84Q==
X-Received: by 2002:ae9:e917:0:b0:783:4dfb:11ae with SMTP id x23-20020ae9e917000000b007834dfb11aemr522337qkf.63.1706310971522;
        Fri, 26 Jan 2024 15:16:11 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:11 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:05 +0000
Subject: [PATCH 06/17] media: i2c: css-quirk.h: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-6-eed7865fce18@chromium.org>
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
In-Reply-To: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Bin Liu <bin.liu@mediatek.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.3

Kerneldoc does not seem to understand that embed doc:
drivers/media/i2c/ccs/ccs-quirk.h:50: warning: Excess struct member 'write' description in 'ccs_quirk'
drivers/media/i2c/ccs/ccs-quirk.h:50: warning: Excess struct member 'reg' description in 'ccs_quirk'
drivers/media/i2c/ccs/ccs-quirk.h:50: warning: Excess struct member 'val' description in 'ccs_quirk'

Convert into a standard doc.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ccs/ccs-quirk.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-quirk.h b/drivers/media/i2c/ccs/ccs-quirk.h
index 0b1a64958d71..392c97109617 100644
--- a/drivers/media/i2c/ccs/ccs-quirk.h
+++ b/drivers/media/i2c/ccs/ccs-quirk.h
@@ -28,11 +28,11 @@ struct ccs_sensor;
  * @reg_access: Register access quirk. The quirk may divert the access
  *		to another register, or no register at all.
  *
- *		@write: Is this read (false) or write (true) access?
- *		@reg: Pointer to the register to access
- *		@value: Register value, set by the caller on write, or
+ *		-write: Is this read (false) or write (true) access?
+ *		-reg:   Pointer to the register to access
+ *		-val:   Register value, set by the caller on write, or
  *			by the quirk on read
- *		@return: 0 on success, -ENOIOCTLCMD if no register
+ *		-return: 0 on success, -ENOIOCTLCMD if no register
  *			 access may be done by the caller (default read
  *			 value is zero), else negative error code on error
  * @flags: Quirk flags

-- 
2.43.0.429.g432eaa2c6b-goog

