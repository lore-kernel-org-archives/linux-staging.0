Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B942C80
	for <linux-staging@lists.linux.dev>; Thu, 21 Oct 2021 10:17:21 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id d3so210322wrh.8
        for <linux-staging@lists.linux.dev>; Thu, 21 Oct 2021 03:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1eulVtgnBse6T07v3i1s5Tmo6HHXX3u1XOsvEFwTjqI=;
        b=bOscBNW6BzvTWF1npFjKU35mUMZogJ8SypjvwFkSQ78EwxsaG5yXPvQsTimzP5LlgZ
         y4sJHUdmY5VJ4xlztxaj1ijB0L6ePopmMejNIh3XfTWuSTK+DTptyogmoheiFcrU8ydZ
         fVirY2s71iXx+peQOulGx4gZjZqRfbjiCQXdP2SplXCt8Zw4svCCUf3pYDCu+kdIxrJ5
         5hQumIpYKkFnpaKoQKEgA1klNO6XVedgGxVoKIQM8+mtCadYFmA8uA9al/JNqEZf4E0i
         jM4+pni/a91cs8zHIgakspMB6/N83N3UFsmPD/PLgFS+H5AgsvDgpmOEYY0jwNXxLDn6
         1ZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1eulVtgnBse6T07v3i1s5Tmo6HHXX3u1XOsvEFwTjqI=;
        b=xMnKDtXotrr/Imb+5oGJPtKqcvmAZYiyYlpiy9YoytqxR25CA5eX2KRcJpgAGMk6DP
         A3gfR22XbPyvNkb6zqbT1zM0WI8efgFOsXUkmNJy0SocWG/hnQJ6RgqPfUApVXKcbDZ2
         zYzc0U1LIxB/gooHud8oyi6TmKJR0dsZqCO9fgAvP9jddjvoqMhXriaP3fqixHJ65OYt
         QXdY1lJG96GWZugyPu+7qjfPuLVzIZ34iYyLnklKMyrmvqiBgsulNT6TjBSAzZPSkrVf
         AB41EiRrmicON0suZ2kl2nVFL5GWpK09UwRR6tfJguiuZxGZF60irvpsmtAhhZZytyPm
         zF1A==
X-Gm-Message-State: AOAM530+Iz5oxcUTGwNGIwc2QUHGLmU8sz1nuV9r5G10OMh2Cer/pqD0
	UqHn7U6BO7HTIrKaxe0Lw5s=
X-Google-Smtp-Source: ABdhPJy8FI6uWBSB3kvM0sQ1+NJPGq5YDrc9WQNCn08d0g+SrTN3pI8Qha9VQuCB0kTC35VKeTF0ew==
X-Received: by 2002:adf:b348:: with SMTP id k8mr6034289wrd.435.1634811439870;
        Thu, 21 Oct 2021 03:17:19 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::d7f0? ([2a02:8108:96c0:3b88::d7f0])
        by smtp.gmail.com with ESMTPSA id q12sm4550935wrp.13.2021.10.21.03.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 03:17:19 -0700 (PDT)
Message-ID: <243e691c-4fb5-6cb0-1a46-c27c1fbb218a@gmail.com>
Date: Thu, 21 Oct 2021 12:17:18 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/5] staging: r8188eu: remove unused dm_priv components
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211020195401.12931-1-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211020195401.12931-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 20.10.21 um 21:53 schrieb Martin Kaiser:
> Remove unused components from struct dm_priv.
> 
> DMFlag is only written to, but never read.
> InitDMFlag is assigned to DMFlag and not used elsewhere.
> DM_Type is also write-only.
> UndecoratedSmoothedPWDB and UndecoratedSmoothedCCK are not used at all.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/hal/rtl8188e_dm.c     | 3 ---
>   drivers/staging/r8188eu/hal/usb_halinit.c     | 1 -
>   drivers/staging/r8188eu/include/rtl8188e_dm.h | 5 -----
>   3 files changed, 9 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
> index 4ce2c3749665..5d76f6ea91c4 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
> @@ -87,12 +87,9 @@ static void Update_ODM_ComInfo_88E(struct adapter *Adapter)
>   void rtl8188e_InitHalDm(struct adapter *Adapter)
>   {
>   	struct hal_data_8188e *hal_data = GET_HAL_DATA(Adapter);
> -	struct dm_priv	*pdmpriv = &hal_data->dmpriv;
>   	struct odm_dm_struct *dm_odm = &hal_data->odmpriv;
>   
>   	dm_InitGPIOSetting(Adapter);
> -	pdmpriv->DM_Type = DM_Type_ByDriver;
> -	pdmpriv->DMFlag = DYNAMIC_FUNC_DISABLE;
>   	Update_ODM_ComInfo_88E(Adapter);
>   	ODM_DMInit(dm_odm);
>   	Adapter->fix_rate = 0xFF;
> diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
> index cdc602fa9af8..ef1ae95d7db0 100644
> --- a/drivers/staging/r8188eu/hal/usb_halinit.c
> +++ b/drivers/staging/r8188eu/hal/usb_halinit.c
> @@ -1469,7 +1469,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
>   		break;
>   	case HW_VAR_DM_FUNC_SET:
>   		if (*((u32 *)val) == DYNAMIC_ALL_FUNC_ENABLE) {
> -			pdmpriv->DMFlag = pdmpriv->InitDMFlag;
>   			podmpriv->SupportAbility =	pdmpriv->InitODMFlag;
>   		} else {
>   			podmpriv->SupportAbility |= *((u32 *)val);
> diff --git a/drivers/staging/r8188eu/include/rtl8188e_dm.h b/drivers/staging/r8188eu/include/rtl8188e_dm.h
> index 4a0608313f7a..208bea050f6f 100644
> --- a/drivers/staging/r8188eu/include/rtl8188e_dm.h
> +++ b/drivers/staging/r8188eu/include/rtl8188e_dm.h
> @@ -15,14 +15,9 @@ enum{
>   #define HP_THERMAL_NUM		8
>   /*  duplicate code,will move to ODM ######### */
>   struct	dm_priv {
> -	u8	DM_Type;
> -	u8	DMFlag;
> -	u8	InitDMFlag;
>   	u32	InitODMFlag;
>   
>   	/*  Upper and Lower Signal threshold for Rate Adaptive*/
> -	int	UndecoratedSmoothedPWDB;
> -	int	UndecoratedSmoothedCCK;
>   	int	EntryMinUndecoratedSmoothedPWDB;
>   	int	EntryMaxUndecoratedSmoothedPWDB;
>   	int	MinUndecoratedPWDBForDM;
> 

Looks good, thanks.

Acked-by: Michael Straube <straube.linux@gmail.com>

