Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0352137C
	for <linux-staging@lists.linux.dev>; Tue,  3 Oct 2023 14:22:22 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5221bd8f62eso282244a12.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Oct 2023 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696342941; x=1696947741; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gZTPVZjw5Q7ID9PafpDtUtk+upIY6bWyOZZUesf6B3U=;
        b=iIIC9brihy5s2HEBFCbSnfJLyzSNzDMjZ0706yj6cIndi9NXQBkHrURVghoMND5m4L
         e1sjXx548SwxYYu4TpgNMk9eYQ+T4GtmuqQnyGgNt1nCtxuag5YdymQrJy3yjHyc0QaQ
         8lPKmRqvJ8ggGuyb9/vpW2Jsz0Ql6Sf0FPEpDrl2EKUUppDtHu+E6+lABNgqV3MGfhAf
         mize5eD8s8EIcCSQniV91jdCU3+JUZDtlJ9+FhbYfrP1j1zE91EvHJrr7kDPCfRKqQzx
         3QsjqadtlFh16Rf0h+RBmlxf+HVvNrwdQCYCBGk1GjcwvYvIpLq59GtA2jWkaszgqovG
         6IOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696342941; x=1696947741;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gZTPVZjw5Q7ID9PafpDtUtk+upIY6bWyOZZUesf6B3U=;
        b=GwPnVLx8R5D5JxURayESkjuO+NmcwbHw5WdridLVvQmNCt4LmfOmscYP4K8CKa9HHP
         LNJQR96UEiApLEuUxEPJGizab3yu/v3zkpygO0+ffiwB6/HWqspI3br1ytpwlzPNsyAG
         VcLh4sJmDNZn9DhdcGlG7yPSkq2dDcTd0TUhZGBbBGE889l2NYWVtrtezzEGqEQOHOJF
         8Buwt1OVepyHvvPPZaxDQyATA2rQPCyJWrvo7ZicsWOtLp/EZMLLxM8rs77mZ88+pSh+
         f0GM64SQHOEJj9bbvDj3P7Dorjg0X1vIm32rudidw+yKSwCk/TaUmAgFXAqH2cN7PvfR
         Uk2Q==
X-Gm-Message-State: AOJu0YxlI6exgh6uSEY7Nvc9wk61rCEqAzoKI3YZi3/nMnV92rzMv8ID
	Acug1/lf1LQ/2P8AxOQeeeQ=
X-Google-Smtp-Source: AGHT+IEKi6grJ6nrHdtMgB67yD68xZ3JEqIPy/wfgBeOm8Ihw8L+7hmvQPEaDZoWlKlGtpF189MLNA==
X-Received: by 2002:a05:6402:5243:b0:51d:cfeb:fc3b with SMTP id t3-20020a056402524300b0051dcfebfc3bmr11140823edd.1.1696342940653;
        Tue, 03 Oct 2023 07:22:20 -0700 (PDT)
Received: from [192.168.0.106] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id s3-20020aa7d783000000b0053404772535sm935532edq.81.2023.10.03.07.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 07:22:20 -0700 (PDT)
Message-ID: <7a8e0c9e-4662-ffab-50e8-f0f9e73dbb10@gmail.com>
Date: Tue, 3 Oct 2023 16:22:19 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 0/3] Type encoding info dropped from arrary name
 "abyBBVGA" and variable names "byBBVGACurrent", "byBBVGANew"
Content-Language: en-US
To: Pavan Bobba <opensource206@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1696141471.git.opensource206@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1696141471.git.opensource206@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/23 16:15, Pavan Bobba wrote:
> This patchset series consist of fixes to issues found by checkpatch
> 
> Pavan Bobba (3):
>    staging: vt6655: Type encoding info dropped from array name "abyBBVGA"
>    staging: vt6655: Type encoding info dropped from variable name
>      "byBBVGACurrent"
>    staging: vt6655: Type encoding info dropped from variable name
>      "byBBVGANew"
> 
>   drivers/staging/vt6655/baseband.c    | 40 ++++++++++++++--------------
>   drivers/staging/vt6655/channel.c     |  6 ++---
>   drivers/staging/vt6655/device.h      |  6 ++---
>   drivers/staging/vt6655/device_main.c | 24 ++++++++---------
>   4 files changed, 38 insertions(+), 38 deletions(-)
> 

Hi Pavan,

please do not send your patches in one email.

You need to send it in 4 separate emails.
Have a look at this example:
https://lore.kernel.org/linux-staging/
It was just send by Tree Davies.

Thanks for your support.

Bye Philipp
