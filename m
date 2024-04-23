Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379D71386B1
	for <linux-staging@lists.linux.dev>; Tue, 23 Apr 2024 12:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713876236; cv=none; b=fwV/c26RAQR706ggZ630lbnNgDH0YPpAbtM5VxDF4mToYAohHiIVeb8PG8WQNqIQh/YpG2NN4JAbVWmSUsLFZxyM9iegdkn4TH+pKA7WxBBtKNgsEf5Kn6yeoSGjIpA4Jlw4p9l/5UuA7dDks5v+OEV9wcArjRoG2yDBRHzUI1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713876236; c=relaxed/simple;
	bh=r0UmnNWiljWy3w/DWQQ7Ic6mYcT+iVhIRMPUeFTh3tM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bcvSD8eUAXgZScskmb1XsPx/NxaDynXVOXF9Cl5i6Pgzel3hFhmHC3isx+joTrUq241haNzBqP9Ih876JZswzI8355QCKdq+6pHh6wclE18kVXsyE2xJTTHc1I+NBGaR/nMEDiVm1zM2GMUZaA+sr9+czAS0ewaOc1OXAQW0XHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VE3pQ/8K; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VE3pQ/8K"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-343f62d8124so4518514f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 23 Apr 2024 05:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713876232; x=1714481032; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+qnKAwgvBHM35XCDpuBit4GUKItb+LTK0jOfybUvb7k=;
        b=VE3pQ/8KsNBMJMos9vf9NNNHeUqGpQYYjL5pbhHv+K8pTpPgW2J6atK0TZVnIEvkQX
         kYmmtvoVz6kHejaOWs2PJF5UsQqpXZjRQLhZe3uw9ZbgbzWaqfEdT7+W9aJ3sOPwXHeT
         iPiG5oha9sjqjByJUBtOmIAxCB54M7fZg6xWYhWAZJtZsOdqNL3W+GdnaNdVTun3KNNf
         wyoWbQug7Zn+Yojn2cwxSGk6lGTPksaQGt9yDBK8zuRoHHstn9Bc1+AgbHpPYleAU7WT
         R2OATXbkNg39IJdgRUQPmb7OzJDybwTPgQ1Nk7tIfbIrQACPUBl06PBzapBANSoufjdP
         ezSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876232; x=1714481032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+qnKAwgvBHM35XCDpuBit4GUKItb+LTK0jOfybUvb7k=;
        b=poWV0hijv+J4BPxuvnqvJW/e5riLw3E6qFPF4lCNpdeCbr6Q+yPgz1SJkV41k2SBwU
         a6l/0H7eKScHxxV7mOAsGmWY/b1dxrIaLpAwq3U5yirR5VOj5+CbmnjBH+b36WfmRoHx
         HT2BO3c6DFBq79tb2nbKqf/U+d3cLc6MovAUI8j/IOTcEJAfj7WARSnuOT2E/gifvQvZ
         8kaEicycAc6RkzsORdaGXZUh+TvCOgYooPOXZOalXrHpIfXfUXzCwEIx0GaYIzei6yQl
         KmD18TlD/JYCGxKe4yfLHk50sbGDKEoaFnG8c+L2u7UEh4Prd9zsazKqaOA6LP3ra6z4
         1YcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKRzUJtzXTFiP8zkrwFgCARpFlXblydpsCC4dDFOUVPqHOoa5s5qsXMIHU9y7/UAQLS3tL04reRcoLRX2ZTrC6YUEoKMMd9qwcO731KA==
X-Gm-Message-State: AOJu0YxfKi5qjp2SR5TE1W839YkF8HNOn9sN5k0lsCiVrEZgbKaJMuCi
	G8UbnqSRZpph4TJMvyvpTj2X+aVFynmjUDN3e5b7r7Mv7kkv3JfkZhzEgpz2Kt0=
X-Google-Smtp-Source: AGHT+IHx5NN+z23VludiFeHTrKmrJCe4gLG+r1lTx6C4j7QEMysWQLMdtEpvLnQqAlOL1NQMbBj3Zg==
X-Received: by 2002:a5d:6a8d:0:b0:34b:5caf:6342 with SMTP id s13-20020a5d6a8d000000b0034b5caf6342mr2073298wru.67.1713876232556;
        Tue, 23 Apr 2024 05:43:52 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id r16-20020a5d6950000000b003477d26736dsm14506412wrw.94.2024.04.23.05.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 05:43:52 -0700 (PDT)
Message-ID: <d13fd47e-1ecd-4aa8-844b-cd260e9fa437@linaro.org>
Date: Tue, 23 Apr 2024 13:43:49 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/35] media: s2255: Use refcount_t instead of atomic_t
 for num_channels
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
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
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-11-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-11-477afb23728b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/04/2024 20:34, Ricardo Ribalda wrote:
> Use an API that resembles more the actual use of num_channels.
> 
> Found by cocci:
> drivers/media/usb/s2255/s2255drv.c:2362:5-24: WARNING: atomic_dec_and_test variation before object free at line 2363.
> drivers/media/usb/s2255/s2255drv.c:1557:5-24: WARNING: atomic_dec_and_test variation before object free at line 1558.

Hmm, that commit log needs more detail.

"Convert from atomic_t to refcount_t because refcount_t has memory 
ordering guarantees which atomic does not, hence the WARNING for the 
free after the atomic dec."

Something like that.

I'll leave it up to yourself to decide if this warrants a Fixes:

I don't think so myself because the previous code doesn't seem to matter 
to the decrement and free.

---
bod
