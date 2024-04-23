Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E2813D627
	for <linux-staging@lists.linux.dev>; Tue, 23 Apr 2024 16:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713890412; cv=none; b=mQb1B42RgsFUcI3ir42jWYc4HB+VLICGGjMN1TUkZIVTT7Gvjrxg996/Nj7UgQ3EgNYQu3u69EPPNPpF4H5AQqeUQP5MHj6itWJTmLhIB9tEkZmPWvF83fIt6fjVqUcU94yQdpwXeIrqVIb2LixMWac+qxoZy76pR/8DzRwwb5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713890412; c=relaxed/simple;
	bh=BOJw2vRsPZHwOmrOygNkShk96qoSCUb9rWqqoRjUYVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ui01LQ0C+fb5ub39Q81QX/QBIMo4Ro1HKPhNvEKiC06tKBprz3IUOwGAx80/gJjnuuZWTducCEddtx7DIX9C1vUcbnmevw9PVPFbaTw5IKKQXsimfjt0GCzNp5ydzsw1iEP+xvc0tI8fiPsC8yJJUKXY+9kq2L0uF26SDbEdU4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gh34Z+n/; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gh34Z+n/"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-34b3374ae22so2059301f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Apr 2024 09:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713890409; x=1714495209; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PnokyArXxcyIbQ437WBi+fXlNam0sB9x6yTE3BbNzdE=;
        b=gh34Z+n/O9l+EXdA6gOLK2DjJIVGPXIZ7k3y1u+0SP93XLILICQwm8xN3blroy/ryZ
         HXaRWezBUIEzGyuPfZnq9WfmXJosT2H3zxefPsUuXapuvlRTQRusbmyORgkHj7na1hKu
         3x9mshCLF4t9XYTspJAboZmM5vbMdbu3iuvE2HnG6XS9lKBq/knnNTKZWY7NtoxzPT5U
         AGb+dOxc9FcsbTOa1wAAAVELq3SjYfYaFuU/oCrRlcntRtdMK6IRgLi0h8t5kWzqm/hC
         8edJtnZrRVSf6HWOE2wHzyMkTuOlQHw9MnSRtionLRXcCgKqGVhZaA0Gb0WHE1iQh4xe
         PTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713890409; x=1714495209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PnokyArXxcyIbQ437WBi+fXlNam0sB9x6yTE3BbNzdE=;
        b=JDHNYR1FHgo8C6Rhkt8eEdwI25dhIFPAr0zwzh8kndnpeB4ikUJX/Hae24BRZZu98v
         zGtlADSnNYLPCFSk1c5S9R8IX4in7zXf1gUrzBdbtr7a4xFvVE5fcx7GJ6MEJNz8Hoy9
         asXnDNNmivf30/GVMDDAfh88vZs/YWywoCfE/ERTg+8xgRQKEwf/RAw/4SqngYiwj9iO
         hAmj09mr2uWUNdwCC1NZqZpm2CxVEzBBowLMnZqrh+hwyAFGuIp9dUpA0K0eLJL1eK43
         7stWIJa6KYMIi2BV2rNU0QUIK4Wf4ebMym5N90DnNmiFOCw3EmD2HB5y7LZOXEsuKDqa
         FGtA==
X-Forwarded-Encrypted: i=1; AJvYcCXCRD8Spf6SyPZutvfiinaSCv63Enz9gAwL4Y9tMhBM1BrDIb/dQKSZmIDGnI0MRycu9IWNRljLoag62G9y3sMYnUVajTeFWy5gvCSobA==
X-Gm-Message-State: AOJu0YyjDrFGE9Iy5M0D2tv5vL6/TIwo9zbtwrH6ZTpJ9z2SE0e5fBF5
	evEfeIX3BwDFHVr0EBCgt146rybMObjn+FAnkf2ikuiywZ6QGs3iN80GZb4TuCQ=
X-Google-Smtp-Source: AGHT+IEt0kyNa/ubkeo1mtCZlcqjs3AUlplSYGY2vYsnPCR+hlV65yLYcKKdjfNDUj8XC7Fvmk6LWw==
X-Received: by 2002:adf:fa88:0:b0:34a:d130:611b with SMTP id h8-20020adffa88000000b0034ad130611bmr7073198wrr.17.1713890408973;
        Tue, 23 Apr 2024 09:40:08 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id bb6-20020a1709070a0600b00a55b020a821sm3270479ejc.13.2024.04.23.09.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 09:40:08 -0700 (PDT)
Message-ID: <90569329-62e1-472d-88ab-c93b44abb60c@linaro.org>
Date: Tue, 23 Apr 2024 17:40:04 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/35] media: dvb-frontends: drx39xyj: Use min macro
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
 <20240415-fix-cocci-v1-14-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-14-477afb23728b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/04/2024 20:34, Ricardo Ribalda wrote:
> Simplifies the code.
> 
> Found by cocci:
> 
> drivers/media/dvb-frontends/drx39xyj/drxj.c:1447:23-24: WARNING opportunity for min()
> drivers/media/dvb-frontends/drx39xyj/drxj.c:1662:21-22: WARNING opportunity for min()
> drivers/media/dvb-frontends/drx39xyj/drxj.c:1685:24-25: WARNING opportunity for min()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Code is fine but, I think your commit log could use some love.

"Replace ternary assignments with min() to simplify and make the code 
more readable."

Not super-important.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

