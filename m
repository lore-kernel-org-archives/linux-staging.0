Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8D813CF9C
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 14:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711378228; cv=none; b=lwb2i7UpbUorwFPl2L1BwBmg8JGBzLd6qX25yA/Hf4GwX3kVjNoP4jNWXnDkeoI+tTxTeYOkRboq0mm1zVMF+nlABlZnNEP+BCFJPE2pnm1O+UeF0PxS2SKMk0HQDPi3Xh5dCg4EzzY3seYPzn6eYISRaw7OC+2mJ2StDjEIsXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711378228; c=relaxed/simple;
	bh=bzGkhh3857LfO//R8Cc3xM+Sm0Pu0LcZVZpGpS79/9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LDpvwccsWzcTJJ2Pfm1X0rCOFAqikXWbKHpsVrTsIG/NHFjdkF2R3bLnRqLgnvqH3LOWWEjMYdzn/gXBYgYnMrzuoTRhg6yK++ahBBeNJzovOzAfQ+bK4yv89WKxNghuQvZcdXDOSa2/2n+2dXrOzCpZdJDDHz4mjqMg279HJNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DEIvWnvD; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DEIvWnvD"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2297d0d6013so2491921fac.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 07:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711378225; x=1711983025; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HiJIJJs/fXvTyCDSSNBDGHDw2J3EG4BtX2teiiFjae0=;
        b=DEIvWnvDdJmOTlPn/Hv1YWqcIMtFe49u2Aa1r1poBmIHZuSxe1EFIJDI51TOtr5IiX
         JajIb+0Bg9itr69IFSRjuePCXqGe+KnIB+t2JtyXQmwAralLMDE0uci+Oqva+Y/wWtlh
         vdUmLggubSgvWVK0cOUALL7VNXvaDZzB+K/2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711378225; x=1711983025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HiJIJJs/fXvTyCDSSNBDGHDw2J3EG4BtX2teiiFjae0=;
        b=Jg59qW2+CFhqnTxLN+brjvncEf6X/WFFB5fbV1Mv6NQrQkKj9hvVmGfvIa7bwl5M3i
         LeXJkJI7Za5haB0qlZQqRUfyOprPnbBx6kp5ASKh6M1PWlQjjJZWU9vRCO2EPufrDtI4
         ZxXSxbKvI6u76dGMjGMdHHAIhzCxNHU7636Zh6FefG+3oul+s7bdUeQHbmWdhGib0J3M
         U1eajixk08V2Sz2HzH5IXAM3UMnnRtAuOT71kl4v+L8pLY3KSJKLb9xAAoCgPdZQn1lf
         lNE62NKFzlzMPNavTvSxGT/hdVFBCfszvQPPnxNKzrOS0Wf39YbziSiKJVBijtSGyytj
         Plzg==
X-Forwarded-Encrypted: i=1; AJvYcCVF9nbcyd0xZtXNj5D2MXymdaiTdjgXTs5H+VvuxRbh8HJ29J810+jWvarAvPDVf2lOuMLetPEbIVdTj5uRDOs4z5x9s1ipmeE5udvx/A==
X-Gm-Message-State: AOJu0YwpFSIcMWQE3gUrfjMUGlxP376MxCoi7fPXZbDkpV+ytcmWBQ3k
	oxYrDkUEez2tS2akMPoabCPZHZhf17XxqwsEkWs0QIxAPvpiBiN2SIMwXfJwSA==
X-Google-Smtp-Source: AGHT+IFi6H6aHLQfI8VFi0WO8ICSYFmiwIeOfLPtxErl0UIG07TzmLmgVZ3n0y6H5EShjbVyMwmPSQ==
X-Received: by 2002:a05:6870:1641:b0:229:e41e:a6b0 with SMTP id c1-20020a056870164100b00229e41ea6b0mr7401259oae.47.1711378225403;
        Mon, 25 Mar 2024 07:50:25 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id eq17-20020a05622a5e1100b004313f54aaa9sm2491449qtb.5.2024.03.25.07.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:50:25 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Mar 2024 14:50:23 +0000
Subject: [PATCH v3 1/3] staging: media: tegra-video: Fix
 -Wmaybe-unitialized warn in gcc
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240325-gcc-arm-warnings-v3-1-81b8c10dc18a@chromium.org>
References: <20240325-gcc-arm-warnings-v3-0-81b8c10dc18a@chromium.org>
In-Reply-To: <20240325-gcc-arm-warnings-v3-0-81b8c10dc18a@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Make sure that tegra20_vi_get_input_formats always assign a value for
yuv_input_format.

Fix:
drivers/staging/media/tegra-video/tegra20.c:624:72: warning: ‘yuv_input_format’ may be used uninitialized [-Wmaybe-uninitialized]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index c25286772603c..630e2ff987a37 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -164,6 +164,7 @@ static void tegra20_vi_get_input_formats(struct tegra_vi_channel *chan,
 	unsigned int input_mbus_code = chan->fmtinfo->code;
 
 	(*main_input_format) = VI_INPUT_INPUT_FORMAT_YUV422;
+	(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_UYVY;
 
 	switch (input_mbus_code) {
 	case MEDIA_BUS_FMT_UYVY8_2X8:

-- 
2.44.0.396.g6e790dbe36-goog

