Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88901C32
	for <linux-staging@lists.linux.dev>; Sat,  2 Jul 2022 07:14:21 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id dn9so2395938ejc.7
        for <linux-staging@lists.linux.dev>; Sat, 02 Jul 2022 00:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=cwJr0Rj/cBbfz8CN3fmWkRtLbWhgFNVOHODvETM8Bh0=;
        b=m1j2IWcSiyfO8OkcvqFXdPLzraHX8gFmtOr0ZF1kegOUaK9q7r25ziI0KNJBGaUgOB
         EvJ2zz6WB9FVfLlrNBVQlzZCnohP51rFtqulbKd7/9St9T4KA2pxPX+fhhfQTeIabdHF
         VnTreh2Y8/SM6RGmRCbXY7rRsqrytwyOqa1bqi+r5oblszv+C15Rs0wKrA2jKEAFAs3o
         Ii8xW0qEkHiysDRbMUBeG8pbKc3cZExu+1ZCGaRCCLthKnDrxxy+EIPZW8KAFW/KO41H
         2tBl9fvIwXAtONMd9qqHWSXGM+CBiUF7QZn8dZrDBAPV/yYKGMazKK2wEuOvNp0VArTa
         pvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cwJr0Rj/cBbfz8CN3fmWkRtLbWhgFNVOHODvETM8Bh0=;
        b=MptB0VYpnXJ391beXFXWElSkHe6Ku/sgeLrw+Tv5D4+gx67cuh4clzZ2D+SzmLc0QZ
         2mF13hW2AVdKPu0bl9nZ6KZ7lMhA9232k+aWD1cWIwpWAeztXABcbFl/zp4l8VgCio+T
         +l36bU8Fu/uyqK2lbMTKhqlXE3pyblRynNmQ9XzS440HRVkc4qtka000xeQja/1XtO1u
         pZ7uO83DECpSfC0dQw7rUfBC9kAro0PAW/XwhjI9QCYT5di7beW94iw40brCTZowGZlV
         om+1vb288Vjb70H7/ijhwk8s/6xli7FXPzOee6LeMRKFqrUX98WbaXURYbB28ebpkg2H
         D+eA==
X-Gm-Message-State: AJIora/zR+sxN/jOYzhe7/cS3giSFZvpVKtI0U5NrrfghGVF9Vh40OnB
	nyvYVYkkl0i1bS7JsJibzSg=
X-Google-Smtp-Source: AGRyM1uc/1TG/ChbDHQt0Lvsl2WNSh8qXtz5nhM7dMHlWvkOEIh8aTk77gxbfLX5Uz2R5rnj73psvA==
X-Received: by 2002:a17:906:845b:b0:72a:4dbf:82e6 with SMTP id e27-20020a170906845b00b0072a4dbf82e6mr14478214ejy.149.1656746060086;
        Sat, 02 Jul 2022 00:14:20 -0700 (PDT)
Received: from [192.168.1.100] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id t25-20020a056402241900b0043589eba83bsm5930978eda.58.2022.07.02.00.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Jul 2022 00:14:19 -0700 (PDT)
Message-ID: <ddbb1600-823f-86f9-e2be-4e6dbf501185@gmail.com>
Date: Sat, 2 Jul 2022 09:14:18 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] staging: r8188eu: remove HW_VAR_AMPDU_FACTOR from
 SetHwReg8188EU()
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220701210753.8210-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220701210753.8210-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/22 23:07, Michael Straube wrote:
> Remove the case HW_VAR_AMPDU_FACTOR from SetHwReg8188EU() and move
> the functionality to a static function in rtw_wlan_util.c. This is
> part of the ongoing effort to get rid of SetHwReg8188EU().
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_wlan_util.c | 28 +++++++++++++++++++-
>   drivers/staging/r8188eu/hal/usb_halinit.c    | 26 ------------------
>   drivers/staging/r8188eu/include/hal_intf.h   |  1 -
>   3 files changed, 27 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
> index 2d5fd654ead9..aa6b549fd54d 100644
> --- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
> +++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
> @@ -805,6 +805,32 @@ static void set_min_ampdu_spacing(struct adapter *adapter, u8 spacing)
>   	}
>   }
>   
> +static void set_ampdu_factor(struct adapter *adapter, u8 factor)
> +{
> +	u8 RegToSet_Normal[4] = {0x41, 0xa8, 0x72, 0xb9};
> +	u8 FactorToSet;
> +	u8 *pRegToSet;
> +	u8 index = 0;
> +
> +	pRegToSet = RegToSet_Normal; /*  0xb972a841; */
> +	FactorToSet = factor;
> +	if (FactorToSet <= 3) {
> +		FactorToSet = (1 << (FactorToSet + 2));
> +		if (FactorToSet > 0xf)
> +			FactorToSet = 0xf;
> +
> +		for (index = 0; index < 4; index++) {
> +			if ((pRegToSet[index] & 0xf0) > (FactorToSet << 4))
> +				pRegToSet[index] = (pRegToSet[index] & 0x0f) | (FactorToSet << 4);
> +
> +			if ((pRegToSet[index] & 0x0f) > FactorToSet)
> +				pRegToSet[index] = (pRegToSet[index] & 0xf0) | (FactorToSet);
> +
> +			rtw_write8(adapter, (REG_AGGLEN_LMT + index), pRegToSet[index]);
> +		}
> +	}
> +}
> +
>   void HTOnAssocRsp(struct adapter *padapter)
>   {
>   	unsigned char		max_AMPDU_len;
> @@ -831,7 +857,7 @@ void HTOnAssocRsp(struct adapter *padapter)
>   
>   	set_min_ampdu_spacing(padapter, min_MPDU_spacing);
>   
> -	SetHwReg8188EU(padapter, HW_VAR_AMPDU_FACTOR, (u8 *)(&max_AMPDU_len));
> +	set_ampdu_factor(padapter, max_AMPDU_len);
>   }
>   
>   void ERP_IE_handler(struct adapter *padapter, struct ndis_802_11_var_ie *pIE)
> diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
> index 3908c46d2fbe..1a08de85a6ae 100644
> --- a/drivers/staging/r8188eu/hal/usb_halinit.c
> +++ b/drivers/staging/r8188eu/hal/usb_halinit.c
> @@ -1209,32 +1209,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
>   	case HW_VAR_DM_FUNC_CLR:
>   		podmpriv->SupportAbility = 0;
>   		break;
> -	case HW_VAR_AMPDU_FACTOR:
> -		{
> -			u8 RegToSet_Normal[4] = {0x41, 0xa8, 0x72, 0xb9};
> -			u8 FactorToSet;
> -			u8 *pRegToSet;
> -			u8 index = 0;
> -
> -			pRegToSet = RegToSet_Normal; /*  0xb972a841; */
> -			FactorToSet = *((u8 *)val);
> -			if (FactorToSet <= 3) {
> -				FactorToSet = (1 << (FactorToSet + 2));
> -				if (FactorToSet > 0xf)
> -					FactorToSet = 0xf;
> -
> -				for (index = 0; index < 4; index++) {
> -					if ((pRegToSet[index] & 0xf0) > (FactorToSet << 4))
> -						pRegToSet[index] = (pRegToSet[index] & 0x0f) | (FactorToSet << 4);
> -
> -					if ((pRegToSet[index] & 0x0f) > FactorToSet)
> -						pRegToSet[index] = (pRegToSet[index] & 0xf0) | (FactorToSet);
> -
> -					rtw_write8(Adapter, (REG_AGGLEN_LMT + index), pRegToSet[index]);
> -				}
> -			}
> -		}
> -		break;
>   	default:
>   		break;
>   	}
> diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
> index c3704618bccc..b81144932d9a 100644
> --- a/drivers/staging/r8188eu/include/hal_intf.h
> +++ b/drivers/staging/r8188eu/include/hal_intf.h
> @@ -17,7 +17,6 @@ enum hw_variables {
>   	HW_VAR_DM_FUNC_OP,
>   	HW_VAR_DM_FUNC_RESET,
>   	HW_VAR_DM_FUNC_CLR,
> -	HW_VAR_AMPDU_FACTOR,
>   };
>   
>   typedef s32 (*c2h_id_filter)(u8 id);

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
