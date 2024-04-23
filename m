Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDAF12D1FE
	for <linux-staging@lists.linux.dev>; Tue, 23 Apr 2024 12:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713876559; cv=none; b=tOd6zZr5ZT0/U9g0h1YA1mfRToaI1UDrDvwtPjSvpJcIELq6NW06iyEXhYujTNd2BMVXSorryuXUo+4OMjJwgFA5vkGhcAWe035tqqZlC7y+L80Gh55jsfhIGfgTKPI+wrDTI4GNopUsUhSMIUtMWB1avYcAYpRW8ofbSijmO5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713876559; c=relaxed/simple;
	bh=XQeZr6E7rXhe/VT+k28qSPXYBkfsY+98/EcL4uCWgDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKIh8o/kiF7d8VbpEgyce6blLUWRgRV8cnkW+i6X5bo+TLDYiXMSsKmUpoEkFuF6irSsC6uYvlioC+t4rLQpftv6ce/R0yJUPhWN5vRNSP/5QmIh4aREKr+KA9uom83oXO2USyEDc7O3IXp76hnZdLbAK5EyxA6KF3q7Kc+CZMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AbgjxAC1; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AbgjxAC1"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-343c7fae6e4so4898954f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 23 Apr 2024 05:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713876553; x=1714481353; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GtCF0d5TRfvf1gJjlek+SkbwLI/L240GdEgYBnOFyEs=;
        b=AbgjxAC1r6vbhckl7BHZjqn32OQHuuhAtNfWDlDLnzSzKHkw5cWz1jGjnCz67S4OpT
         K2YZq42Nd1EoEt1jutJz5wZXmGc3nhQxopDmqaCjnXdXGuUmdsTxJaV9oPGLuYKytLNf
         FVBhG9LAMv5eLyXuajfx07seIXLza9vdkuzx2Sd5hnuW56PT5sipn3U2tTRJNzG12mCJ
         JGB9a4V453G6rILoM8MyTLaMed8rfTkdPgBEEekGIiTN719keW2Gqmy5b9AiUh/BMIsG
         GNBWErEz7oVVprcubtlwtXXJSX47qKzWQonoucYVz1/OuQsa1nPUFYykJReg2tQH19lf
         N3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876553; x=1714481353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GtCF0d5TRfvf1gJjlek+SkbwLI/L240GdEgYBnOFyEs=;
        b=qSmYm8zeI0Hp73Q4MULwnJr19B4UNZBUNsootZMb6x4oPl1h8cDrJgL2KRkKewWqJC
         SB+HzgZt18bnnMcVQBQHQ5sjsj0VuFHg8hYbGL8uUyUKAtp80x+b6T1T53zew3lV5PbD
         hO/E/vkd601lOXQhn/mLKf5VmYprnvlgUrO4n7LNp85l5HGxB6/r1uuCkOJ6y6RqG1Y1
         Xk7CCHzib1EFiAjiuXQ/RS36Q60skMYNRgyMSqNgVIzR1hdSSlDYC2o3pxXWYcIpq39K
         CPYZ9IHf1pnqjC6WYScYXNmmO2Dvt1/pn7wUDtCnd00A8uy0jyKac3On9F75ZCGWWCjw
         avAA==
X-Forwarded-Encrypted: i=1; AJvYcCVerNMlOfREXrIDLoiXacjyVRVsi2bAR7XK8Si1PfMwzrn9sfth2qSxaMvZVXg6TCnq1lxswIu55w9hF+u5/JU1Oa5viacRdjQFYwH0ig==
X-Gm-Message-State: AOJu0YwvT8YKFODDg/kES7M84XtK4UQOjmdQMiiwN2tU857MUzaqi9tp
	48JNtc7gEsmPZQuvCN6e4kmzAhsN/rQkdtkiq1GhQz6SATYKCGrJ5Z+3bqPDUEc=
X-Google-Smtp-Source: AGHT+IFQ/wvfOsFaUdKh98XxWAyZjDTRY072QmJCxCCxJbX9yzwrMnJqlpUXpbY2Dl+AdrwFqOGXDg==
X-Received: by 2002:a05:6000:1e89:b0:34a:9afe:76f with SMTP id dd9-20020a0560001e8900b0034a9afe076fmr5609928wrb.30.1713876553387;
        Tue, 23 Apr 2024 05:49:13 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id y18-20020a056000109200b00343300a4eb8sm13594089wrw.49.2024.04.23.05.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 05:49:12 -0700 (PDT)
Message-ID: <515e2718-7e1b-42c0-9d61-a10d00f12a31@linaro.org>
Date: Tue, 23 Apr 2024 13:49:11 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/35] media: common: saa7146: Use min macro
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
 <20240415-fix-cocci-v1-13-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-13-477afb23728b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/04/2024 20:34, Ricardo Ribalda wrote:
> Simplifies the code. Found by cocci:
> 
> drivers/media/common/saa7146/saa7146_hlp.c:125:36-37: WARNING opportunity for min()
> drivers/media/common/saa7146/saa7146_hlp.c:154:41-42: WARNING opportunity for min()
> drivers/media/common/saa7146/saa7146_hlp.c:286:35-36: WARNING opportunity for min()
> drivers/media/common/saa7146/saa7146_hlp.c:289:35-36: WARNING opportunity for min()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
