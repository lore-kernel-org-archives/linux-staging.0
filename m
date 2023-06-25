Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79305661
	for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 14:08:18 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-51669dd574aso601751a12.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 07:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687702097; x=1690294097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qb5uaG1ukttpAvFf/VsYxgKDzrt6PGIJhyXlt0S+974=;
        b=oTFbyGblJZQYnCfEHksOhrJu+0t1MjoglVO2m22ZpEHcITylvHiAP0E9dThUfU9bTr
         odWWydWnBURTXM+uBDY1UsLzKheuhtd7QHZjYi8843+GKikSm26HvlrDXtZGgocdbh5I
         +VsyvtJmCRWfsvPMzQjzryvOkNm7utbtCA3NYbw1sb8IsRTzgrYSqSAceXgMTZIxWVSC
         lvxcRGUEzU3jF1djmhnNHkHDqsLReKrWtlSpTKdrjgETFncVjJF+RX8gVqBvIGsggYaE
         uTyq7i0XygbECR2ENoRw+xB+oJPjGQ33geneXrHdvosH8Mppn/0sbMPsiIpBs1CfTFrK
         +mgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687702097; x=1690294097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qb5uaG1ukttpAvFf/VsYxgKDzrt6PGIJhyXlt0S+974=;
        b=R4C01lONjATxLq+VAE1lDVrhjkYrRER3QL8EtibMzSEn9IsQyQfWkfuLAveG5Lqxy7
         1m7EG5BZ9uldx80vJzvnwg+X0BZF/ey8wwDzcP1DT896YlPfLRoNh6MaealvaqjjAxrk
         Mm8kwdp+GELf9nl/QWQymvtB9MD8FGbqtIdrkGnltDdZueut9fS8krax3jjuuEBzVp7N
         IihngrI0LzJ6Jy5cH665rb+vM7TiG49VDF6ywMbcEFNEHnhiQtRYgtnzSMpDWME1AXdS
         4AMVyFbTVEq9ElNV2amM1k4pO/qxnzV6zZCveFGRtyN7QsZIKz+41LMS1MhO/UliFtHr
         cj2A==
X-Gm-Message-State: AC+VfDwABFwDnEVNNjXy8T8oXfCqPTkzwJHTvNwbsCfLgQ77Xuzral1g
	Or7toUk9XZIuOyF4a5Xq2XgjofzF6LI=
X-Google-Smtp-Source: ACHHUZ57Y/CLa/g0I4iVLHJPBt4Z7Yne+UFoeaNZya7MdsPH4IzdVE1XB9LzR6GCXRYxRWcjcr7/Ag==
X-Received: by 2002:a05:6402:1e8e:b0:50d:fd8e:e224 with SMTP id f14-20020a0564021e8e00b0050dfd8ee224mr19569949edf.1.1687702096644;
        Sun, 25 Jun 2023 07:08:16 -0700 (PDT)
Received: from [192.168.0.101] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id x2-20020aa7d6c2000000b0051a3f9770dasm1793222edr.8.2023.06.25.07.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 07:08:16 -0700 (PDT)
Message-ID: <b76b810e-7489-9f36-ae57-f6674a1b734f@gmail.com>
Date: Sun, 25 Jun 2023 16:08:15 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] staging: rtl8192e: Rename function HTUpdateDefaultSetting
 to ht_update_default_setting
Content-Language: en-US
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 dan.carpenter@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <ZJdmp3PAOAIqC3Zo@tacos.darkphysics>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZJdmp3PAOAIqC3Zo@tacos.darkphysics>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/23 23:56, Tree Davies wrote:
> Rename HTUpdateDefaultSetting to ht_update_default_setting in order to
> Fix checkpatch warning: Avoid CamelCase
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
>   drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
>   drivers/staging/rtl8192e/rtllib.h         | 2 +-
>   drivers/staging/rtl8192e/rtllib_module.c  | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index f9fa3f2bb728..f526d04839bf 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -67,7 +67,7 @@ static u8 CISCO_BROADCOM[3] = {0x00, 0x17, 0x94};
>   
>   static u8 LINKSYS_MARVELL_4400N[3] = {0x00, 0x14, 0xa4};
>   
> -void HTUpdateDefaultSetting(struct rtllib_device *ieee)
> +void ht_update_default_setting(struct rtllib_device *ieee)
>   {
>   	struct rt_hi_throughput *ht_info = ieee->ht_info;
>   
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index e3ce4431d460..405033c7ed77 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -1982,7 +1982,7 @@ int rtllib_wx_get_rts(struct rtllib_device *ieee, struct iw_request_info *info,
>   void HTSetConnectBwMode(struct rtllib_device *ieee,
>   			enum ht_channel_width bandwidth,
>   			enum ht_extchnl_offset Offset);
> -void HTUpdateDefaultSetting(struct rtllib_device *ieee);
> +void ht_update_default_setting(struct rtllib_device *ieee);
>   void HTConstructCapabilityElement(struct rtllib_device *ieee,
>   				  u8 *posHTCap, u8 *len,
>   				  u8 isEncrypt, bool bAssoc);
> diff --git a/drivers/staging/rtl8192e/rtllib_module.c b/drivers/staging/rtl8192e/rtllib_module.c
> index d6a4d6b4ec57..841300e3a8bc 100644
> --- a/drivers/staging/rtl8192e/rtllib_module.c
> +++ b/drivers/staging/rtl8192e/rtllib_module.c
> @@ -129,7 +129,7 @@ struct net_device *alloc_rtllib(int sizeof_priv)
>   	if (!ieee->ht_info)
>   		goto free_softmac;
>   
> -	HTUpdateDefaultSetting(ieee);
> +	ht_update_default_setting(ieee);
>   	HTInitializeHTInfo(ieee);
>   	TSInitialize(ieee);
>   	for (i = 0; i < IEEE_IBSS_MAC_HASH_SIZE; i++)


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
