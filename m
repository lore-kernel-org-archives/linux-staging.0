Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117971598E2
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 19:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209676; cv=none; b=mZK57TzTHmE5zzjHGEFxX4vLSGKXIT1RMXYzKbObo8VJvP9pPXb2E7JXYHaOXg0bQDCN5X3lG5PzwK4f8BRlS17oQgfQhSuXTLjS2eBkSDIAb6Zefam60qXT/yWKbTUO5kxJSKkc34f6bb+F8cGY4Mc1Pb9vxiczuIRRT5xkxUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209676; c=relaxed/simple;
	bh=MbsdVQbCUWEGseggQJElQClzRok+A7X+zU8VpB5HgWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EwowfUVBRuDorPplrnJjxN4CRrEYttWkiy0ws6IDR4z4vtqbsena0yd6cxbXHucaK8gPn2GGZWiA4pyMMqIIxATjNLse5EDorQBoNYsy1Ib4jNOBe86/fsOG1PMTesLXSSrHW498e34sJ9xQehdii/TC4hEVyKZA+3AQ9d2NQvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MWSlH5L+; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MWSlH5L+"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6eb7a0b3fe7so1211538a34.2
        for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 12:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209672; x=1713814472; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30a1609TFHVDYvbsiCwVx5jyS7S7qnpRfAGqZPi3zic=;
        b=MWSlH5L+eJDHLGdUzJvV0FAcDd271FdPGAZpiAkNgebekT7OYy+vVjSSVF77nF3J35
         8YkKUO/daprIIbQmue5xgKHp3ibCcwqeTegiPXwaG9EQJ7jzDs58Dt1h47NOeP2EZ3VK
         0ebz3+O/rnFLyfkncgHRK9ayhn8N8BjlLjZsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209672; x=1713814472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30a1609TFHVDYvbsiCwVx5jyS7S7qnpRfAGqZPi3zic=;
        b=sARk6byfJ80rUOolsU6aGpV7zmoFumEx7CytU9dSoex08PWOQ7MHbDUpwzmL1CedZ9
         XXzpqevWb2yaJV65GquVJejuHIN3MAg4sSYZRIu+jAZrRIghtXZwnoe+uViAA7L6jjPA
         xLyI0xIe43HE/OL/cjvvuqYXlupEhHY2A88eUPMUkIpXxO1rpQZhaQxNSUnsAln68bfJ
         iGyIJ4MqjZg34ygSDxWhvT4OVsUesZR5TeUwgh9nzyNqJH0NZ0CQlaZ4R4dX1dxNE2ca
         9X3F7wUDYxISsr+1YUqEhZGkTrBWwnhz4dZ/WSZEKjgi5B+01fNQ17lef3NQYEh3iswx
         I9vg==
X-Forwarded-Encrypted: i=1; AJvYcCUAgEVb+hL/5b8YcMU5Qez+HVVcia32npNn5BNIEzj33FiOMv4zUq/1IqYcoPbG9znW1nTWiBphnPdznmuHnZW1jChgVuZHWK7ss6FgQw==
X-Gm-Message-State: AOJu0YwKLq0bVXJZK8yEbTD5Z/VMg6q/15nBDBQqy5FZRUmRKp0EZ0g6
	7hStqWAeSabvCkw7Y9K7y9v2YbCQS6lNx2cHpzmbtFlnoUm6rOf4FQiCQpsSFA==
X-Google-Smtp-Source: AGHT+IFajy4caV38o9egD00xBm8+r7fFdvax0FnbVE1biamOQ+jag9WqCsqV4RWMv5Us6Un2NRlLiw==
X-Received: by 2002:a05:6830:14cf:b0:6eb:7a07:8746 with SMTP id t15-20020a05683014cf00b006eb7a078746mr5458830otq.31.1713209672276;
        Mon, 15 Apr 2024 12:34:32 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:22 +0000
Subject: [PATCH 05/35] media: go7007: Use min and max macros
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-5-477afb23728b@chromium.org>
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

It makes the code simpler and cocci happier:

drivers/media/usb/go7007/go7007-fw.c:1292:14-15: WARNING opportunity for max()
drivers/media/usb/go7007/go7007-fw.c:1293:14-15: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/go7007/go7007-fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/go7007/go7007-fw.c b/drivers/media/usb/go7007/go7007-fw.c
index 018019ba47d4..86ce593e0c54 100644
--- a/drivers/media/usb/go7007/go7007-fw.c
+++ b/drivers/media/usb/go7007/go7007-fw.c
@@ -1289,8 +1289,8 @@ static int avsync_to_package(struct go7007 *go, __le16 *code, int space)
 		0xbf99,		(u16)((-adjratio) >> 16),
 		0xbf92,		0,
 		0xbf93,		0,
-		0xbff4,		f1 > f2 ? f1 : f2,
-		0xbff5,		f1 < f2 ? f1 : f2,
+		0xbff4,		max(f1, f2),
+		0xbff5,		min(f1, f2),
 		0xbff6,		f1 < f2 ? ratio : ratio + 1,
 		0xbff7,		f1 > f2 ? ratio : ratio + 1,
 		0xbff8,		0,

-- 
2.44.0.683.g7961c838ac-goog

