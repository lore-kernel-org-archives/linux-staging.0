Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC0913D51B
	for <linux-staging@lists.linux.dev>; Tue, 23 Apr 2024 16:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713890956; cv=none; b=SXFC2Su/s4NWEJ8AsR5ReIpFO6znK6NNpxYQ5qxFFveCp8vuSOaci9POv/XMsErZdLp/hfYmit6o7Oj4t6+mtjbf0xM2ED452phyUd4FIkAkf2TxSwLIM7nIOXsXo31JhGFeqoZhzi+cg0xIx02sxx9aL8sZ2Obv3eJOpbwj1eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713890956; c=relaxed/simple;
	bh=ldVzTwv3fwEiTXBi6dYuRPKuiRpDDdt1y7A0qo9Q2QA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BEVPKrJ6WAmoy5hTLWAc3zoTY7RqQpBes4D/A/hz7pwYxKkMNR38PcraS95wOS/ibefqzcRtlmn3b9b07M54csVKo8ztmzA0zo1wjnAnXEUaqgu1GLkXjQMfw7tFBJd/AQulcJseU8oRxR5ZMcpZb5hjRxYdGzqqep/ZzzkYkV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rxQWcgDN; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rxQWcgDN"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-34b029296f5so2614919f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 23 Apr 2024 09:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713890953; x=1714495753; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ldVzTwv3fwEiTXBi6dYuRPKuiRpDDdt1y7A0qo9Q2QA=;
        b=rxQWcgDNGrfel9O2yRkvNylaqTAdvq9SoAC4Y+bkm+4ew0ZaNGP/NfxSciigVrLzhh
         dNUQtHf+qdxUgvNU66HeDHf4kNSXmrHeUBxTzPC6cLOOlkAXIdnnnKTPEUlv3rk7gAV/
         gOVXdSLRelUWi2moZ8/AxC4DveJmuEYOzBJGzqDH9DhXNa0drCAysf7EXxsEg2RA7bK6
         CpsAuYQtO+9nV1so1fodfCoQ1p2XU5VqzNV79TajSnVbEXiAlcrw6iX0ndRMHUzb/etn
         oZt5BuqgXLWSJA+mEC43KdAD2618zBg4n2w4njkfCQxCZCR6P4dbMFdVYyLVIobPo+ZG
         uIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713890953; x=1714495753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldVzTwv3fwEiTXBi6dYuRPKuiRpDDdt1y7A0qo9Q2QA=;
        b=fo2o9AGbx7HpIWkm6cO5tHhe3ViJHS+zKbiBN+NCQGLVlczPk9mZs8Q22+j8tsi3pp
         6FZeQ8OJkGoDLxwVcw/zy3kTHfS9H0NhkWVDy6tHPv6aM2zlFsw0qNBa6vtF0hUFZlBN
         bSJV6VHAFA56pPE8vRxhc4b4dxeBSBmWa8B4pf86Wt6l9t1x6wTgOpfuEPqwD4j5KTPt
         erhWj2p6jiHs4UnEVJtDP2NT49jIzqGR8Frz0tdRTT5Nyx6YdZpn8wIDbTsDjCUpvwtf
         1qgiQCo05mPw/E0avKra7czMHaPCawKDvziY0O5pHGEyrQZmy82JwdR+RPC6O4IaOaag
         3EDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr7kZ7hpZwVGu33mbz+ktOQsadZn8ZzIiQvXNoa1kuBooN0Hi6zJC3g1Ks6EF5lT8vJyEYkQiPgbS9JQPLiM93kElQn4TKzm7QjRY3FA==
X-Gm-Message-State: AOJu0Yy/giZymuc8KwNS5TlDwCpYhmjXpwDZAXoPb8sLykVOoEED4Ddr
	bQiJSNOPa/gkok6aYxFHrYMO5+h7oYlWQowHwftrt9yiP4YnVnvvBCMZMnouFM4=
X-Google-Smtp-Source: AGHT+IFFjiX0lGTvRX6PkqniQZmmmeygPyoAEul4datqZN6BwlChbzsJP3H/9AAw03G7QKIB4ZDERg==
X-Received: by 2002:adf:fa88:0:b0:34a:d130:611b with SMTP id h8-20020adffa88000000b0034ad130611bmr7093753wrr.17.1713890953167;
        Tue, 23 Apr 2024 09:49:13 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id n12-20020a5d67cc000000b0034a51283404sm12576954wrw.72.2024.04.23.09.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 09:49:12 -0700 (PDT)
Message-ID: <81770681-7ddb-41b4-8202-8dd44014c5e8@linaro.org>
Date: Tue, 23 Apr 2024 17:49:10 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/35] media: venus: Refator return path
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
 <20240415-fix-cocci-v1-26-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-26-477afb23728b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/04/2024 20:34, Ricardo Ribalda wrote:
> This is a nop, but let cocci now that this is not a good candidate for

*know

> min()

But I think you should change the commit log ->

"Rewrite ternary return assignment to mitigate the following cocci WARNING."

> drivers/media/platform/qcom/venus/vdec.c:672:12-13: WARNING opportunity for min()
> drivers/media/platform/qcom/venus/vdec.c:650:12-13: WARNING opportunity for min()

then

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
