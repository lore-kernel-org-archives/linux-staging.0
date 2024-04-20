Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3264AEFD
	for <linux-staging@lists.linux.dev>; Sat, 20 Apr 2024 23:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713654480; cv=none; b=P1f/rpynsliWbQjzbkaYJm1NNOGQ6yigHar5sgKC1Ru99qbqqv5QQFRmw86iCkBSXySeWlaOiM1QsPXkj9+o6eRD9YXYSthOq4KemY1r6pT2gSXHuTQgRhPoMlb9Qj2LmlQunUxZZD6jDxro5Tv1gWQaN9qC+eK5o9Q9RHx4pyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713654480; c=relaxed/simple;
	bh=z6difwhnZxEoVhqGOtYJurOynqmxvUFH5a72r0Wf1ZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ehxukVc4mRZ+DGKGbTzfz3wKHug6/fs482Oe8W5zzcKWZ7CV5rHKBk3mEtD64EtUxI8oJRrL6Yy031hayZytoYIJkAFGiq1kXGJ5OaCe53pBgD0Jf0sFT9idh56mmaWOkhmueMjEjXBAiNxUHV7Eib7NDHWDYrQsgLFHaRvK6io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZDRN+b16; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZDRN+b16"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-346359c8785so2728859f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 20 Apr 2024 16:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713654477; x=1714259277; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9hTDE+OmzSnorVJyzQcFNYmLnBIvZgvXWNavzd4DaM=;
        b=ZDRN+b16RHW8CAc9ujjJCB4FfvN5OzZVOB2AEXE60f75CFL0ABDWRyGg8sZLQdVj+2
         j9MNsQiwcpQVgVBeKBhVurK4Bxsd3lYetIJP0RC627vz0fGod+TDNr5Hy01mflEUTp+f
         LPfnY/nCVAGTSb8tRjQIXJcpCArByHYeVNpm5Yh5/tyRRFp/xbtnkzO1uLWvEFq/Feif
         QZwrAdGZ9zM8cMQK1+jWeSIdWDBcz+M0+7AwD6ubFvI49KMLHCjuYEWMg++qLkZyRXRr
         TQVyJRMnqbOnXJM8UCbkF0LF5wzY0awh1b+YvRM3LtVFAr2dpi5YxdVHdIuPA9VOiZe1
         Md8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713654477; x=1714259277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9hTDE+OmzSnorVJyzQcFNYmLnBIvZgvXWNavzd4DaM=;
        b=AFuVMqq+DQUCmNGIp25/bc5AGrP6Dnvo74i6E2ae0/JQRnWK7HmmZ+Yzf4zMH3g2Fw
         V0L+x3W9ulOGTLpYBmd496J/+XsUcloN8UE/cVwVQ9eNyEiNiXrhN0v9XKRdCeX3rci1
         AflufdksjitHZKPoUnS0+aB4bdufzM3L5arzt5B1wcHx5t2BOAQvZi+QJa0YIxtykdZB
         3R43S+/mZLtNJUUYkZbMdevfnCl0Qn6Rq1VwV0C30H58QaF8v1zGoyJhy9SwttiPJ6D1
         whwuADRBiAAvtTkLJCL6ch7T3Hsciqpuc7xh/g3lRuNkLvONXrnM80GkrlRU4U1oaYMB
         jmMw==
X-Forwarded-Encrypted: i=1; AJvYcCUp2oZZtIOJH7pXCvV+pLhU81orhIiKIYMPUIxRd6V6gk/0+MLo15OAgxgbl6J2l0DzUp3MNtZzxAk6OCMGzowQYPu7Nswl4P4CfiijGg==
X-Gm-Message-State: AOJu0YwFxqajIO002JfIy4dflaEzEOcKQm7IxfZKPSvZphxbH8f1foxH
	M7rQ6ilKr9VTB7GD3z1xQMklmi/T5vA8096+d2nsHWZf/IAp6UMSbcWuDFMUs58=
X-Google-Smtp-Source: AGHT+IFGdOa11zFVqyC3KCcGi9RrrofVzZm8cOluppaZLRYUDrIPrVm3Gfdre6MIxYSUZ9KallR7Bw==
X-Received: by 2002:adf:cd84:0:b0:33e:7f51:c2f8 with SMTP id q4-20020adfcd84000000b0033e7f51c2f8mr3599510wrj.36.1713654477259;
        Sat, 20 Apr 2024 16:07:57 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d6383000000b00341b451a31asm7862874wru.36.2024.04.20.16.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 16:07:56 -0700 (PDT)
Message-ID: <ae9b190c-3961-4704-bc93-cb1c4182672b@linaro.org>
Date: Sun, 21 Apr 2024 00:07:55 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/26] media: stb0899: Simplify check
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-2-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-2-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2024 10:47, Ricardo Ribalda wrote:
> chip_id is an unsigned number, it can never be < 0
> 
> Fixes cocci check:
> drivers/media/dvb-frontends/stb0899_drv.c:1280:8-15: WARNING: Unsigned expression compared with zero: chip_id > 0
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/dvb-frontends/stb0899_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/dvb-frontends/stb0899_drv.c b/drivers/media/dvb-frontends/stb0899_drv.c
> index 2f4d8fb400cd..35634f9a8ab5 100644
> --- a/drivers/media/dvb-frontends/stb0899_drv.c
> +++ b/drivers/media/dvb-frontends/stb0899_drv.c
> @@ -1277,7 +1277,7 @@ static int stb0899_get_dev_id(struct stb0899_state *state)
>   	dprintk(state->verbose, FE_ERROR, 1, "Demodulator Core ID=[%s], Version=[%d]", (char *) &demod_str, demod_ver);
>   	CONVERT32(STB0899_READ_S2REG(STB0899_S2FEC, FEC_CORE_ID_REG), (char *)&fec_str);
>   	fec_ver = STB0899_READ_S2REG(STB0899_S2FEC, FEC_VER_ID_REG);
> -	if (! (chip_id > 0)) {
> +	if (!chip_id) {
>   		dprintk(state->verbose, FE_ERROR, 1, "couldn't find a STB 0899");
>   
>   		return -ENODEV;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
