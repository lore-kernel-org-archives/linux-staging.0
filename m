Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C8012A14F
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 09:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520179; cv=none; b=XKw80nl4FrUR0LMluavxVoJ1PyyPCJtzS/kyYJPDf/d5tEv29k8kEWyV8h+wkVdt6t9Z7yLrJkR5MItkZOl5yivyK5karx+rUF0VsMcz0UP7MA+ox39OmTZnO8Y49FXRwV4SKxjd9+DP6YM+XSZxeV/R2N3KKlYeQ2ucKksbWh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520179; c=relaxed/simple;
	bh=HnkZzu3hOGP6WP/z/J628OEomq/9kbGj6cjO+bxIfdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Smxx674tmo8cpLouqTrqrqzGay1TAGjNedun2J0uXk/falMLwVfboY/r+idGRpjX8NJbFvGit95AqFOoh2bmsMTHKmNt+Tlo4BvBFvDXq/kx3se3hMferD0i+U/sB/zeeaee9VDXib5IybmYH2Lb36kSlpaw0c/vvVWa2AqCtos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HFYIYhtc; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HFYIYhtc"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78f0440656eso106858185a.1
        for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 02:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520177; x=1714124977; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXXgUMwvGuh/bAZ05Vu9f2lIZUwmSZiJ1Ue2E9QmyGE=;
        b=HFYIYhtczuD09KwL5W0is2kJ4uCg20aXQeNwLZ1bswHkU16xEOrjaw0ThgTY/x/9hq
         hrkLewW6OrVLXvlqCvhdFF48sUpJe/xVvwo0jGoGiu0TZ17XHAj4dx4iYcYrMgXzaxu0
         pRuTnzhgQVORSj83X5FtIlx9jsV80SigUwizY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520177; x=1714124977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXXgUMwvGuh/bAZ05Vu9f2lIZUwmSZiJ1Ue2E9QmyGE=;
        b=L9Qymx1+FA3IROityykgblc9StqPBkzjAi6W3/65d8PqB5q8XSgNJ9eG6C2P3x5ixq
         bQVWf0+0d4PRCvF2Ft1+TwAGSnM8XsD1Jj+1F/tf51CE/IChrhsBQAmIppFybnjSUQB0
         Nm1f8bw6eGjAMxFUz8k/Tju2GC56lUE/jMGBwa6fVOpwxUn4jEpJYxlP/ps8OKWJNDjh
         7flIQze77m8MyMl5cpFAogvTVwFEDJmT5lKtGDYwx0NKtU7zoUeWWhNSPkadMcQHyhxk
         9/6rCg4UV0WfzDnYufSWXUcRiXiFKq3Se7JRUAcxYfywPiV5sLQjMaPwm8s0bbhL4kE1
         3KNw==
X-Forwarded-Encrypted: i=1; AJvYcCVIgNRenL3F8S908BKCbrF9XZ+Lty/1sW+6I3qVskEjM8JDXlBjId++xDi5Pj/Z6EvufcKM9zGXU3HG+2myIue9bTR+vf+NQ0SRJE3TSw==
X-Gm-Message-State: AOJu0YwH5McJQ9J3XUbvL42+4IVa42hOOmvFvptRkb1lDK90XHAK/t37
	rPG9ewNtebDJPhnZNjZZXLftH1z/vvh4Edx4vT2lmqq9PjnkyvqiNc80F8B/Gw==
X-Google-Smtp-Source: AGHT+IHtaefRUDCkJpXsh07H2yA2NeK9gO3xvd3htQb2Rtwe8WSp0MnWmceFe0R4rsJzjkJBUbtDcw==
X-Received: by 2002:a05:620a:111a:b0:78b:e8b0:f156 with SMTP id o26-20020a05620a111a00b0078be8b0f156mr1546954qkk.67.1713520176717;
        Fri, 19 Apr 2024 02:49:36 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:36 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:01 +0000
Subject: [PATCH v2 15/26] media: netup_unidvb: Use min macro
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-15-2119e692309c@chromium.org>
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

Simplify the code.

Found by cocci:
drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c:138:26-27: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c b/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
index 46676f2c89c7..1c885d620b75 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
@@ -135,7 +135,7 @@ static void netup_i2c_fifo_tx(struct netup_i2c *i2c)
 		(readw(&i2c->regs->tx_fifo.stat_ctrl) & 0x3f);
 	u32 msg_length = i2c->msg->len - i2c->xmit_size;
 
-	msg_length = (msg_length < fifo_space ? msg_length : fifo_space);
+	msg_length = min(msg_length, fifo_space);
 	while (msg_length--) {
 		data = i2c->msg->buf[i2c->xmit_size++];
 		writeb(data, &i2c->regs->tx_fifo.data8);

-- 
2.44.0.769.g3c40516874-goog

