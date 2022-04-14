Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2C43219
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 19:36:46 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id n17so2390774ljc.11
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 12:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dUKmRYlawJRX3llP91jhphJWKyce5KIMsE/+iyIM6Do=;
        b=TwnvuxM3W/HeeQXZTzgBCJ+eYBl8t05kkmxSY+NiU5A9cQwWGdac8UE8G9/E85Simf
         au58FOVGEiHwLRzzsteNPABVogmV1eV/qOQ2A1bDJJWfdBW1drzM1Q3fGA+0Lc83XtzM
         9pns4fpxmSTysh5GPA0zT+TcSox6p/4A6ymLyHXOAZiXriUEjsUSvFiuJeyPHgsrtU/X
         sMOcVHU8445OL9UXQ4Tpr4ZtV+v9kK5Ug2/vvETPOTuO2wywSAR48/gmuceXwImjdPNu
         x4Bk1bRLCZxfhRUnZI4SUtsoSu1YJrvpuZA4+hAWRX4+P5ITUGkYzvTbtuU7mY1aRt6+
         s/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dUKmRYlawJRX3llP91jhphJWKyce5KIMsE/+iyIM6Do=;
        b=QnLL1J8apTSNgHOVZbddO5twTLJKrazwlT7ZhTyhZKtazYgncMkhYjrYiNCwGEIAs3
         WGqMqBxtSLwrrc2npnt+rhS12OEI3Sfzux+jypUxzFUERmsMW++kGl19zYnaZjmqV3Cy
         BI7nM7OQM3Hll9VUQi+0WbwNcwDXC45w/vnPbhrowDGW80Ja7O0S3wx+GyyOS0DA4e62
         Wmnzj/8l4bDqXhj6vMOzQOWWok39MzOkZPMZAOuttOGy9OYfta9ilD72b7gFFnXkYhnQ
         xqvzoO2gfe0uosmv6jo4DBR6bHkOQiPjYPYVQEQGOll8/DsPCY0ggyMmzvH1fWstZ4I0
         t5Fw==
X-Gm-Message-State: AOAM532lerIV+QV3+tYyjvw/nQe/E9ZRF5/yk5jghxPNpy565y3znmqT
	jOpTNGsyhLtuBndrN4sZq34=
X-Google-Smtp-Source: ABdhPJzC0RWXlDGEATAZdM1wk4Tjv4qdY+VMMpMHSAksal70KhmAT0/sLW4R2avFqQmGf5BLFXUNfA==
X-Received: by 2002:a05:651c:b24:b0:24c:7ebb:a99d with SMTP id b36-20020a05651c0b2400b0024c7ebba99dmr2464605ljr.314.1649965004896;
        Thu, 14 Apr 2022 12:36:44 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id p12-20020a056512138c00b0044833f1cd85sm89467lfa.62.2022.04.14.12.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 12:36:44 -0700 (PDT)
Message-ID: <0c468c33-980c-e657-65d9-33248c0c8144@gmail.com>
Date: Thu, 14 Apr 2022 22:36:42 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 4/7] staging: r8188eu: use sizeof instead of hardcoded
 firmware header size
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220414083853.3422-1-straube.linux@gmail.com>
 <20220414083853.3422-5-straube.linux@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220414083853.3422-5-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michael,

On 4/14/22 11:38, Michael Straube wrote:
> Use sizeof() instead of hardcoding the firmware header size.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_fw.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
> index 3da52a1ba23c..94526064f29b 100644
> --- a/drivers/staging/r8188eu/core/rtw_fw.c
> +++ b/drivers/staging/r8188eu/core/rtw_fw.c
> @@ -263,9 +263,8 @@ int rtl8188e_firmware_download(struct adapter *padapter)
>   			DRIVER_PREFIX, fw_version, fw_subversion, fw_signature);
>   
>   	if (IS_FW_HEADER_EXIST(fwhdr)) {
> -		/*  Shift 32 bytes for FW header */
> -		fw_data = fw_data + 32;
> -		fw_size = fw_size - 32;
> +		fw_data = fw_data + sizeof(struct rt_firmware_hdr);
> +		fw_size = fw_size - sizeof(struct rt_firmware_hdr);


What about BUILD_BUG_ON(sizeof(struct rt_firmware_hdr) != 32)? To be 
sure we won't face same bug in future





With regards,
Pavel Skripkin
