Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4722F80
	for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 13:29:28 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id e2so27256234ljk.4
        for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 06:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xQ4af4RoffHiZWw1odnbmrmEK8rRB0AB3mboCujvWr8=;
        b=ICZbNAWSmmLc5SIJU/wxuITZR48alw2/TOGNeyM5P9n6LBeiok57tfHX7v66B2RyOh
         tCzNHxVyqMSrJbUJTzISJV7zFWmaFZPoQG5R6S4pL2Gp5uyZeBi8LZ0Q6VFYHpBbyMIo
         mdUL/vQETA/tnuFe9UVaDOYfjD+wSxaUIGymegy0rXM2yrpkmG44xJHw5lVnFG67KL+x
         cnjTg7NiLvW08G0auT1GgfZz+ReiRx451jgNFTEFipOE6Wh/Wx1auHxzar+iDK1NL1k2
         5tkqygLl5YjGYKoGiybYDDv8gTLY62owIr/PfjemwhRwSY9Ta9KGyxFixXyG+wZVmhME
         wJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xQ4af4RoffHiZWw1odnbmrmEK8rRB0AB3mboCujvWr8=;
        b=semARPHTksqUPyqIsgOgMClB/RnF7oeaacOPuGCrgUKwfV76vHVyiaxH9gBTRgF0cj
         obLEUYsJkF/l0zKBc3+CUHR347KaoZ/Zne8YQFuS+tbE/UnMaDBgBBxfv8oJXTC0GfbK
         RbnYFo+HaVhfoTwSzaBW0VPcjPCLvk72NJ0XbjfSklknFYTAz182FcGvBuEsoMkLTNgD
         hcJaaFo09yhJshf7Dw4EeQ9vTaRCZ4lbxt7JRonj4/wL+2SmRRhej//GyyVcwhfIZ2Ui
         Bcpg+ju+lY4wqQWC+vZ8MEw19DgVPCe2oZLloqkS1cisS60VHCQkOUTXPhKWXR95m6F0
         ln7w==
X-Gm-Message-State: AOAM533xNaOQNNwjvu/IdYSamMZUAypmWEWY5mnyr0wLeAW5p3DGUvFo
	Mi/GeKZd3h8zR+jeUTV0S30=
X-Google-Smtp-Source: ABdhPJwpliZ1bhzHrIn6k8dsn+ajuWurlDphmzkpHPvq//PUv6RJ3XDWfGrujfj76UVdbRyCyvLAcg==
X-Received: by 2002:a2e:92c8:: with SMTP id k8mr16866516ljh.100.1621862966377;
        Mon, 24 May 2021 06:29:26 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.googlemail.com with ESMTPSA id h12sm1753363ljh.130.2021.05.24.06.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 May 2021 06:29:26 -0700 (PDT)
Subject: Re: [PATCH -next] media: staging: tegra-vde: Fix error return code in
 tegra_vde_probe()
From: Dmitry Osipenko <digetx@gmail.com>
To: Wei Yongjun <weiyongjun1@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>
References: <20210524133550.2363884-1-weiyongjun1@huawei.com>
 <db911ac9-2d08-ae30-03ea-dfb7db964441@gmail.com>
Message-ID: <1e05ad22-c4d8-c443-5377-7cd9db024cb9@gmail.com>
Date: Mon, 24 May 2021 16:29:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <db911ac9-2d08-ae30-03ea-dfb7db964441@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

24.05.2021 16:27, Dmitry Osipenko пишет:
> 24.05.2021 16:35, Wei Yongjun пишет:
>> Fix to return a negative error code from the error handling
>> case instead of 0, as done elsewhere in this function.
>>
>> Fixes: dc8276b78917 ("staging: media: tegra-vde: use pm_runtime_resume_and_get()")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>> ---
>>  drivers/staging/media/tegra-vde/vde.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
>> index e025b69776f2..321d14ba2e56 100644
>> --- a/drivers/staging/media/tegra-vde/vde.c
>> +++ b/drivers/staging/media/tegra-vde/vde.c
>> @@ -1071,7 +1071,8 @@ static int tegra_vde_probe(struct platform_device *pdev)
>>  	 * power-cycle it in order to put hardware into a predictable lower
>>  	 * power state.
>>  	 */
>> -	if (pm_runtime_resume_and_get(dev) < 0)
>> +	err = pm_runtime_resume_and_get(dev);
>> +	if (err < 0)
>>  		goto err_pm_runtime;
>>  
>>  	pm_runtime_put(dev);
>>
> 
> pm_runtime_resume_and_get() doesn't return positive values, the previous
> variant was okay.
> 
> You should also version your patches and add changelog.
> 

Ah, sorry. The other patch is from Yang Yingliang.
