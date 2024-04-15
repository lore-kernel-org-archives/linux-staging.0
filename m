Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D8A161900
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 19:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209701; cv=none; b=Qw+9Itl3nDT5o3ihzu3EnoNKZlzSnuzc/cZ0OOWV/DFKYdxxfcqC4DyYmP+kN2x01KK/L2cI090YkWBAiRU58L/k/QiztXHhZdlPK7xWtxc2p5igWCY6WYpK+7aOIyrmGnlhNTAhoyhRwZZgebkBigidKh0+Mi98FB31OK7qia4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209701; c=relaxed/simple;
	bh=z4PclDFur+vwHypm0cCW/dzU3Xu+onrV7HrMrh+lG0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ORXqN20kq2EN42hqu/Kfm30w6ZQkJrs0iW+OQ175hwhCa+vBeh7Q1f5KlqpW5FHVWn07ETNvlCG+diCuNTda8IOrZwe7+eH3olPXRC3C3EOFXAeHlgG+gNpWLz/qlLhc52EBf2QnzAyAN32awPwWm21e8Se5nQ8uqQ65BLbRjFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mk1TSwHZ; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mk1TSwHZ"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-78ecacab93bso327497185a.3
        for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 12:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209697; x=1713814497; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iRxS0Wfwa66zl/9FdFOMvCFtgSuuwnNLZrwXVx0B2s=;
        b=mk1TSwHZWPHt7Goa9mSWtTBL5NVS9bmDgOAdup1JMD7JrA8YQ09iVyG/HJN+jY38XS
         PHG6wbfB/c81494KsPJj9XBbwoROZm54JLbfyD2ufCAshfP4kN+TOlnw5MSuvuSfsej8
         qdBzBYQvUjyHjNDRzm2W/Rz8wYYLZIkOqvoX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209697; x=1713814497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9iRxS0Wfwa66zl/9FdFOMvCFtgSuuwnNLZrwXVx0B2s=;
        b=gtEFTUSgQ8FRYMa7QOYSDp+aMwX5cEBPD0C9joArJZVZH9hRfvqDnj20ghDeEDYMl9
         KcVeQ6f1w4m/KqJcbj/HY8pry8dlrfUqPnNFT/LnAiZjuFIFxig0KB49mkG+2DgthKoo
         OaBMdkMlHZWx9D7vReduty2MZlhro/lhVdX+AZw24/5lI3JBsyuFBfwb/TscJpQRExPb
         EPVJUzCNFhR+v6gg5KzmVgCmk1VboCNsedLeW08MomW/FHDUjVcTRSfup1o7pYZeuCN4
         0FIYL8fGkhFXblRuX1oL0ZMXromr8uGLj998VREChQhuAKhgJsiciFJrfOqVNRuj+lnq
         hzwg==
X-Forwarded-Encrypted: i=1; AJvYcCV3lJpfiVKXhc5U8kkdWL7e+j2JFwICfWkgnkFOUzgo8Xhrt0cA/w4BD2g1hlaBSffA0HvDX5oQLjIGkkBYs4UrbDvzBp1KFCkCFzsWcA==
X-Gm-Message-State: AOJu0YxnToNI/ExDQL/2FfUO1AEXJXYgXO4Ro+qyMKE7HHwsrRY8cqY2
	jv8AOr9FRG9XkUO1B8Tct3feLGvvzYFK1ScZq0S7NiGs4LTAJrdCMUXtst7a3A==
X-Google-Smtp-Source: AGHT+IGwiJ5/vTLqYTTLWbehOkrG3Z1CC3Ai73ckOtHPinOfOxtyAdhFhhrjbccK1nhZt1UUqJLF7A==
X-Received: by 2002:a37:e10a:0:b0:78e:d2a6:63e0 with SMTP id c10-20020a37e10a000000b0078ed2a663e0mr9260421qkm.4.1713209697430;
        Mon, 15 Apr 2024 12:34:57 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:43 +0000
Subject: [PATCH 26/35] media: venus: Refator return path
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-26-477afb23728b@chromium.org>
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

drivers/media/platform/qcom/venus/vdec.c:672:12-13: WARNING opportunity for min()
drivers/media/platform/qcom/venus/vdec.c:650:12-13: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 1dffeb7de76e..2bc7aecb35e5 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -647,7 +647,9 @@ static int vdec_pm_put(struct venus_inst *inst, bool autosuspend)
 
 	mutex_unlock(&core->pm_lock);
 
-	return ret < 0 ? ret : 0;
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static int vdec_pm_get_put(struct venus_inst *inst)
@@ -669,7 +671,9 @@ static int vdec_pm_get_put(struct venus_inst *inst)
 error:
 	mutex_unlock(&core->pm_lock);
 
-	return ret < 0 ? ret : 0;
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static void vdec_pm_touch(struct venus_inst *inst)

-- 
2.44.0.683.g7961c838ac-goog

