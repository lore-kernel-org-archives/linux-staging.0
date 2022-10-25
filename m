Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAAD7479
	for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 17:22:42 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id kt23so8843942ejc.7
        for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 10:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a7hk24JV5lro82ACGBjAyUKW4BHMyYNrXH2HtmsPxHk=;
        b=bVhy8PRQzalraPznINqxS6p6aolGcRu3S9+inSpdrUI5yMHu0Zty2+32Wxg6bz4aeG
         NGaBbqk753GAdzecPgJCXUKBjr1LE5y2Ah6bXIiBCHVSqzEI/X+hzyF0ZFxdY4ouDo/f
         p6slYL+bHkekzrMRpmScEx76YxZX1yxMg7VFc/5gPIV0cIwUuxQZHrrdYHhN0jVyiSBn
         GW82d4DvJ0LeI1Jxkx1qz698jjfe1eZJCoocn4CiMbnfSZmnhjCIP3c/DjLbpUY7dXHH
         aevNTAekpISXqtP/rezlclzEmYSdZdQBf/navT4qa+XEtLCdMJbUDkvyaka0y8GmkLYv
         v+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a7hk24JV5lro82ACGBjAyUKW4BHMyYNrXH2HtmsPxHk=;
        b=EyEBQq9ziGRxGUnettrlI4GFeyPmClJLDeLtjPjxfgNEqizpKNV9XYeR9469qsJe5H
         yudu4BnG1CQnq/3o+eDIqzCZjMpajBUxBT47UydV/UTtm/NM4ezTHpfUUy3wDyOUMU7Z
         uSBV6FfF7dmTZvvYRxls6j97dgXLkeRLqUzx8Hw+ni0i6tdYzjy5UMngT6GhAfXOsi65
         5L7fq8sgVhYs9dQkCNNL+aMhqgWPQMMynTj3DOT8ticz1ViEs709Ns3Mouht0zNSacJU
         WGGmKanEUonP/07RBvhT1xgRp5FrHIEGrwUyg8tqXK09R0StIorZCeBqHL1l1Ul4Ak+T
         2apg==
X-Gm-Message-State: ACrzQf24LCU2ZA0gzCC9hDpUv7rYeW15ulW6c0CUtiHJYE/hn3hDgzTg
	wyc++qZFLSUMuu60gBhXD9w=
X-Google-Smtp-Source: AMsMyM5ImPW1+mYblkMY3S0q2dB2daen+x7cZADSV+ZDCxsOUTPYQ1/NGHVWypUeXWup848c11MeVg==
X-Received: by 2002:a17:907:1c17:b0:78d:df89:26c6 with SMTP id nc23-20020a1709071c1700b0078ddf8926c6mr35514089ejc.20.1666718560491;
        Tue, 25 Oct 2022 10:22:40 -0700 (PDT)
Received: from [192.168.1.100] (p57935738.dip0.t-ipconnect.de. [87.147.87.56])
        by smtp.gmail.com with ESMTPSA id i9-20020a17090685c900b0078ae0fb3d11sm1711492ejy.54.2022.10.25.10.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 10:22:40 -0700 (PDT)
Message-ID: <1d88a899-614c-06c5-5dc8-9a9a7e58dc47@gmail.com>
Date: Tue, 25 Oct 2022 19:22:39 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: rtl8192e: use explicitly signed char
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev
References: <20221024163005.536097-1-Jason@zx2c4.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221024163005.536097-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/22 18:30, Jason A. Donenfeld wrote:
> With char becoming unsigned by default, and with `char` alone being
> ambiguous and based on architecture, signed chars need to be marked
> explicitly as such. In this case, passing `char *extra` is part of the
> iw API, and that extra is mostly intended to be somewhat opaque. So just
> cast to `s8 *` for the sign test. This fixes warnings like:
> 
> drivers/staging/rtl8192e/rtllib_softmac_wx.c:459 rtllib_wx_set_essid() warn: impossible condition '(extra[i] < 0) => (0-255 < 0)'
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-staging@lists.linux.dev
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>   drivers/staging/rtl8192e/rtllib_softmac_wx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> index f9589c5b62ba..4563e3b5bd47 100644
> --- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> +++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> @@ -456,7 +456,7 @@ int rtllib_wx_set_essid(struct rtllib_device *ieee,
>   	}
>   
>   	for (i = 0; i < len; i++) {
> -		if (extra[i] < 0) {
> +		if (((s8 *)extra)[i] < 0) {
>   			ret = -1;
>   			goto out;
>   		}

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
