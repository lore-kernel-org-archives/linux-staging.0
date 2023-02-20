Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965F58497
	for <linux-staging@lists.linux.dev>; Mon, 20 Feb 2023 19:13:27 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id ay9so2393260qtb.9
        for <linux-staging@lists.linux.dev>; Mon, 20 Feb 2023 11:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1676920406;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2x/ZnGEIutJz/ohk0y7JjrYHPKC556kirwfWjoI34Jw=;
        b=PzQ0DM3wYomL4jJe/hIApWXOa3Q9wtEiApGNHzzkVKHcOG4soR2g0iUSfZLxWwmDcK
         IpA4AB14pGwBJ08ikH29yzkR1Kic6KBXMrI7HecxJjuB6DcpGG47wfUCTP/tOqpGG2sT
         3m9MSm8E0yMIRW3OSR/HCSawaP5S+PTdzCkf8Oe5j53X5bjlOfJ6zkyXOaeeNzCIM69L
         P16o/5zY0mB1r1mBOTKbMhO5T/u9PgpMq9tyO+GbnKDdEQqgaUl/CYOrLjbHwrVpCPqA
         pdDbh3iFgIv9E/TuxdskMr8Tju8nW/1B093t4NtTWERkHCtaZEA1YprYaZQIWQ/LIMxh
         yjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676920406;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2x/ZnGEIutJz/ohk0y7JjrYHPKC556kirwfWjoI34Jw=;
        b=hqNSfYOYul5bxu77DXtVKltVReO0x6+Mu5pJm0npuxBBN3x5Krr+sFSN21qW2vZz/s
         IC4ALX0c13ID+rJqW5d/u2ebM2RVTB6z9/ve4BZVeG5htHqWkRFnKMvqRFbLhfCKn7G+
         EIPRDXUlBVoNWcxbU+safX/5Zm2f+ehroP3+gV/HL7M+VVVVoLLzPMlqG8MqcuCN80V9
         5RPgNuz/l0gZQz49xQQOZJ1nBTBkVgR850aeuJFCbsI/9DAPQnH7onCA/syejsMDRKMR
         Dxtq4eDmBrnu4J2qoNw0pULJeccxKCgoLyBvP1yN/z2JKPrgpp0UMMxRu/kiGnZTNAKZ
         Cqkg==
X-Gm-Message-State: AO0yUKU7m31FQSbXxzCDxf8HAAKIcGP37ufPZziX/iy21EvjexIv8Dro
	T5MVkEmNIq+dUB1Y0JQKReE=
X-Google-Smtp-Source: AK7set9gipoyr+L5ZQ3MNWg6+3BKYxxqXVC+zmWaQRvfllT7fSoIriCXX8+Vvh80eIJfNBEnSFOJ+Q==
X-Received: by 2002:a05:622a:2c2:b0:3b8:5dfe:c3dc with SMTP id a2-20020a05622a02c200b003b85dfec3dcmr4042525qtx.3.1676920406371;
        Mon, 20 Feb 2023 11:13:26 -0800 (PST)
Received: from [192.168.0.103] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id y6-20020ac87086000000b003be56bdd3b1sm924231qto.92.2023.02.20.11.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 11:13:25 -0800 (PST)
Message-ID: <2d045c1a-5947-1ce4-b5cd-a1684761a812@gmail.com>
Date: Mon, 20 Feb 2023 20:13:23 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] staging: rtl8712: Fix multiple line dereference
Content-Language: en-US
To: Shibo Li <zzutcyha@163.com>, Larry Finger <Larry.Finger@lwfinger.net>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230220084050.18459-1-zzutcyha@163.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230220084050.18459-1-zzutcyha@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/23 09:40, Shibo Li wrote:
> This patch fixes the following warning in rtl871x_mlme.c
> 
> WARNING: Avoid multiple line dereference - prefer 'adapter->securitypriv.PrivacyAlgrthm'
> 
> Signed-off-by: Shibo Li <zzutcyha@163.com>
> ---
>   drivers/staging/rtl8712/rtl871x_mlme.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_mlme.c b/drivers/staging/rtl8712/rtl871x_mlme.c
> index 63e12b157001..cc47c1cedd4e 100644
> --- a/drivers/staging/rtl8712/rtl871x_mlme.c
> +++ b/drivers/staging/rtl8712/rtl871x_mlme.c
> @@ -773,8 +773,8 @@ void r8712_joinbss_event_callback(struct _adapter *adapter, u8 *pbuf)
>   						adapter->securitypriv.busetkipkey = false;
>   						adapter->securitypriv.bgrpkey_handshake = false;
>   						ptarget_sta->ieee8021x_blocked = true;
> -						ptarget_sta->XPrivacy = adapter->
> -						securitypriv.PrivacyAlgrthm;
> +						ptarget_sta->XPrivacy =
> +							adapter->securitypriv.PrivacyAlgrthm;
>   						memset((u8 *)&ptarget_sta->x_UncstKey,
>   							 0,
>   							 sizeof(union Keytype));

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> AW-NU120
