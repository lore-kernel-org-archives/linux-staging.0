Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA10131E3C
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 09:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520192; cv=none; b=lT45eTW9u43M5HigUBOl0YXsEdt1iGI9mL2Lo0u/Q4P1a7DAKJWWNH0ueyEG2EIXAOpFwu6srXIJoiE08Fn0MOzd4+Bq19Q8mifYQfqZNjZz7lmIEnisTKPqzGvdvpY9KYpojCpsgV133apQmqMwOeT+xsEUcNY+rfcrWTh8vmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520192; c=relaxed/simple;
	bh=17e3seaVPIolCVRnz9dvrXMTILwJmsuH1BK6VcvWdM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lhTXK99bMswqKK7iiD14lWAivG19PAEj/H2z2CzSwzl663tFFvVYWN3vYA7TsY0D/gw4t/JsHILH1Vl2tw1ZxftaLQaSO0EXAs28by8OiWBOTZDOIjDvYR0VB7WkimxwNz8tbeY1gl6lEjpEtw0XlFz/l/8c2KPkXATYn7WxHGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m8X9qACn; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m8X9qACn"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-78f0628da1eso112142985a.3
        for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 02:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520190; x=1714124990; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STqazHEagBxWlHC69lQFp5WbvQ2Sdx8rB6+uKcUB0cU=;
        b=m8X9qACn6rFXvvlIJNgTnCpo8bnWFeMP7BF3CxR1IxRYYfvyEwFWScIrLKiBSOw3s4
         2UZo8iIXySKYhv6MhqJ8MfFFaIyxuJb9chkHGBwsRqgEQfWm5OZLX+dOW5kfJjzpCdua
         l8vyOy2ZgAkDYQm2ICp7IrJx56Q676EQEa+hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520190; x=1714124990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STqazHEagBxWlHC69lQFp5WbvQ2Sdx8rB6+uKcUB0cU=;
        b=lvJlowQ7KiPeRXOvKn8vFG64xzvMMWTKPMFWiEDrIG8VqiqGi0fglw8ejIt4Kkb+a9
         IJA5Ed3AOcqLkVpRPU/8DfxlzmnuqQF0F17uRrQqystrgmxKDfsYZwCj1rIQA2AXtx6O
         nqP+Spvtv+zeXpez5hims9euiI61FShQuck7FQug6AFw90T998bWbpiS2epVCHWQbHTF
         Jpg2Thu6mpuSFAQkctt8BgASqzN5ZzEC0kipIAq9qCALAPw/5o6NI9ek03kMitEJEBDk
         eyfDwkn6VOX4gdAJcXoFjeDObACIql+HV9Zwsl+X+rSWYGZoT3wEdGbL1ZLkxCG4eEvo
         l9nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM87bWerVV7C+kzVUEf6L77LnxxwtCBNg3iQUpHA00R4i5M3NwpXDvTrR83FTl6/UBKuNHCEKe/agFsX5pByAxmnKGKDbJsRNZrbaocw==
X-Gm-Message-State: AOJu0YwxsyOnVf5N+DW9HS5GP/1+3N/qrCS+Cokhf5fM0Z8E1YhHWsMw
	3R/mWHtbzjO4v+Zydb2I8uBIBa2fSCZ/pPZoOpxZJfYP5qEh4o0j2TIEAmB+Hg==
X-Google-Smtp-Source: AGHT+IGB4W3xcDVnLVL+1B0lbE5yrHeQCLWo5Y0evN+/+oC4NuGMNOIMrDzfkEb/6TpNH9rKrh/xtA==
X-Received: by 2002:ae9:f00d:0:b0:78e:fd3c:b6 with SMTP id l13-20020ae9f00d000000b0078efd3c00b6mr1503480qkg.40.1713520189085;
        Fri, 19 Apr 2024 02:49:49 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:12 +0000
Subject: [PATCH v2 26/26] media: dvb-frontends: tda10048: Make explicit the
 range of z.
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-26-2119e692309c@chromium.org>
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

We do not expect the sample_freq to be over 613MHz.

Found by cocci:
drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/tda10048.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
index 3e725cdcc66b..1886f733dbbf 100644
--- a/drivers/media/dvb-frontends/tda10048.c
+++ b/drivers/media/dvb-frontends/tda10048.c
@@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
 			     u32 bw)
 {
 	struct tda10048_state *state = fe->demodulator_priv;
-	u64 t, z;
+	u32 z;
+	u64 t;
 
 	dprintk(1, "%s()\n", __func__);
 
@@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
 	/* t *= 2147483648 on 32bit platforms */
 	t *= (2048 * 1024);
 	t *= 1024;
+	/* Sample frequency is under 613MHz */
 	z = 7 * sample_freq_hz;
 	do_div(t, z);
 	t += 5;

-- 
2.44.0.769.g3c40516874-goog

