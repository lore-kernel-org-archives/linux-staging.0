Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB0D2CA1
	for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 18:57:26 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id i63so43029774lji.3
        for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 10:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nwpZgGmQ5ALmjpN1leDuBf91wJZekYXv4KJ/1++WwDE=;
        b=bpu7XPqKR/UBhAjgQL433xaTphjoT/opwc4z628rx5k0ELVKKhL4MLNCI0RR4MbxB9
         sw13AMmRau2Qp1zmzzBphSMADZKsJQCyNmPT0vFwi9aJKoSNdAXobDbqbGszyTtmz7Kr
         d+HuWINElx9UroI5i/v1msLxJ5pIGb5+SClvmYPhtX/Rj4jh9QVkI1MhY1zOg0IAzk6O
         s+dAG0oOt6fpVMpPEEHBxgIoEkAJUkim+yzV/4dwTfGmtXLt+q8m/KgfvOsaaRJCTxMd
         0TUcx2lXqKjNTgXA+g7lQei9JFQId+vIpCZ0MIfT4/mYyFm4wlXocMRGAruza2UQu5T7
         fwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nwpZgGmQ5ALmjpN1leDuBf91wJZekYXv4KJ/1++WwDE=;
        b=V4ZP2kwH2qcRiP557ut53j4MybBgr0NTNyQsqRHyiAtImfWlo/p9ko1h+UXv3nSNjz
         AzwIPBakYfvRWQKrh7UK6V75Pf0PlQ5CvTKfsfZWTFQI+/m9VZ3UKBMWPrYGkLIhby5w
         OY/y5bC+cx/EVlIZthSDU2Cs8piwFPBQWTkYLeQLeulz/ymHUlEY+z0VZEmsZUUXWUzF
         PThZzFzOY4Tnbt+J/l2eK4ze+c2sqsGsRvVhN0hc1IiLA9YPbCCWHZnBF/Uyg1E+gBUu
         jwPT9WSW2vMuqabDGuv71Cnn2PQqyqHt08i6J/GkYbRgGXRSbX2ErvUDSOM54tr07BFR
         8UbQ==
X-Gm-Message-State: AOAM531YvLXG81TC7yYrlJ+RPOfFkx+qx3jbvDrxct/mkm/gQJaGiZTh
	/NsYzdT3bqkG8LGMOGmfhfY=
X-Google-Smtp-Source: ABdhPJwRRD9/dfXd34F05JxqeKjDTQ8jAApBvYS2CDM7kLtu9nSiYZivr1DmFNmYpCIdBJCbL/LpAA==
X-Received: by 2002:a05:651c:1a4:: with SMTP id c4mr748038ljn.3.1638298644549;
        Tue, 30 Nov 2021 10:57:24 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.236])
        by smtp.gmail.com with ESMTPSA id h17sm2032330lfj.160.2021.11.30.10.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 10:57:24 -0800 (PST)
Message-ID: <851b57b9-79ac-e7a1-a61a-6f36a5d9d77a@gmail.com>
Date: Tue, 30 Nov 2021 21:57:23 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH -next] staging: rtl8192e: rtllib_module: fix missing
 free_netdev() on error in alloc_rtllib()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org
References: <20211130034007.779351-1-yangyingliang@huawei.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211130034007.779351-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/30/21 06:40, Yang Yingliang wrote:
> Add the missing free_netdev() before return from alloc_rtllib()
> in the error handling case.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/staging/rtl8192e/rtllib_module.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_module.c b/drivers/staging/rtl8192e/rtllib_module.c
> index 64d9feee1f39..18d898714c5c 100644
> --- a/drivers/staging/rtl8192e/rtllib_module.c
> +++ b/drivers/staging/rtl8192e/rtllib_module.c
> @@ -125,7 +125,7 @@ struct net_device *alloc_rtllib(int sizeof_priv)
>   
>   	ieee->pHTInfo = kzalloc(sizeof(struct rt_hi_throughput), GFP_KERNEL);
>   	if (!ieee->pHTInfo)
> -		return NULL;
> +		goto failed;
>   
>   	HTUpdateDefaultSetting(ieee);
>   	HTInitializeHTInfo(ieee);
> 

Good catch!

There are 2 more possible leaks, tho. rtllib_networks_allocate() and 
rtllib_softmac_init() should be unwinded too.

For some odd reason rtllib_softmac_init() does not return an error in 
case of allocation failure, but it should be fixed. I think, it worth to 
fix whole error handling in one patch




With regards,
Pavel Skripkin
