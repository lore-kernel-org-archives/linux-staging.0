Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1C17E
	for <linux-staging@lists.linux.dev>; Wed,  1 Jun 2022 10:01:33 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-f16a3e0529so2053117fac.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Jun 2022 03:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XXDc82wXfPWWKbX/nT330vBK88cC1PyPk4e0Tm0Xu1M=;
        b=YfOgGz4sBN5TfXj/wakWsW/sOlESQNRbYaErD3fZ16idqbIb9GOwFY1FOxsj/Wa/yt
         tmw28HyX+KGrZJSGNSFcOlLUxMs3aYEGlEn5VRs0qT2GSsG3biBAW+/2eg7f/zW9lYSv
         UFNpl1BNDqsS80b1yXUONj/STlmVqCet/l3vebzI8vV7zCqC6jboiwF2/SIPuj37RXdg
         5WYe2dUeXeCOhmP7d5zkqfBaGE0/NZVMH9dpCe7Fc2jPBY5LFk+TS8WJaCD1zW9cajg3
         5s0yimwDpg5bVrkZbbIuFyQ4ThLNCjRGVw83OXG+tWUpedsIpfhAEPfyUVW6RS9IgWNv
         l53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XXDc82wXfPWWKbX/nT330vBK88cC1PyPk4e0Tm0Xu1M=;
        b=uhwkx+5AxjYmOCihKsL+cHcjQVAS/JdsQQp2I3YJplwnv38ZqI3dBMkp6IcMVeBNNp
         YmzTx50ObCPq6mbeI5MIVkM2CV+IOmoQL2ytk4fBaorBf6SeVPv2xFrGRnXVlGAkhi77
         ZIjF3y5qTFHD1kWSFACbx7V6tP7mkGFLJziGQuk52KjqcZjRvyRgFXoCsV+ayWgRgDDi
         uMg3k5ylZuBGhOYa7lQmA/DK+hsmIZLkwvTB8Ljgn3Y47VZdvXm6bef0z3LABcmmcV77
         diL2ljnS5LNMLx73rNFgwD5xXOhEhkS7zy/iea6Tf9gqvMKTC+BKIPFuqRiT/Mp8kbf4
         OKUA==
X-Gm-Message-State: AOAM533fv15Y910Pd5Q2XNOh3HAyS3n3EX2rDNXEruk5kBoxHdm9CKsS
	OvVCZ7rR3YuKIH6Y5tu/4i4=
X-Google-Smtp-Source: ABdhPJxoNgDTA9XRHkCmYrXdPCJxmNsI4TcKbSHtVOKnVIKFsHQOVmMTeyDPbWcCkmwr8Q6anpnYMg==
X-Received: by 2002:a05:6870:b38d:b0:e9:2082:fe86 with SMTP id w13-20020a056870b38d00b000e92082fe86mr16363999oap.145.1654077692438;
        Wed, 01 Jun 2022 03:01:32 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::100e? (2603-8090-2005-39b3-0000-0000-0000-100e.res6.spectrum.com. [2603:8090:2005:39b3::100e])
        by smtp.gmail.com with ESMTPSA id o7-20020a056871078700b000f32fb9d2bfsm480784oap.5.2022.06.01.03.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 03:01:31 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <007ab767-b124-26fd-20f4-29fea899a573@lwfinger.net>
Date: Wed, 1 Jun 2022 05:01:28 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] staging: r8188eu: Drop redundant memset
Content-Language: en-US
To: Haowen Bai <baihaowen@meizu.com>, Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <1654076108-9326-1-git-send-email-baihaowen@meizu.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <1654076108-9326-1-git-send-email-baihaowen@meizu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/1/22 04:35, Haowen Bai wrote:
> The region set by the call to memset is immediately overwritten by the
> subsequent call to memcpy. So we drop redundant memset.
> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>   drivers/staging/r8188eu/core/rtw_mlme.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
> index 5a815642c3f6..56c8bd5f4c60 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme.c
> @@ -676,7 +676,6 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
>   
>   					_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
>   
> -					memset(&pdev_network->Ssid, 0, sizeof(struct ndis_802_11_ssid));
>   					memcpy(&pdev_network->Ssid, &pmlmepriv->assoc_ssid, sizeof(struct ndis_802_11_ssid));
>   
>   					rtw_update_registrypriv_dev_network(adapter);
> @@ -1253,7 +1252,6 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
>   
>   			memcpy(pdev_network, &tgt_network->network, get_wlan_bssid_ex_sz(&tgt_network->network));
>   
> -			memset(&pdev_network->Ssid, 0, sizeof(struct ndis_802_11_ssid));
>   			memcpy(&pdev_network->Ssid, &pmlmepriv->assoc_ssid, sizeof(struct ndis_802_11_ssid));
>   
>   			rtw_update_registrypriv_dev_network(adapter);

You supplied two patches with the same subject that do different things. That is 
confusing to everyone. Please redo with unique subjects.

Larry

