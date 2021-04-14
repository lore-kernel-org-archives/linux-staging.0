Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B066D24
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 16:46:55 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id b136-20020a1c1b8e0000b029012c69da2040so3509582wmb.1
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 09:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o+ROcY1C8wz+8PkDwYJ0lELoDYp6Z6DB0Dpa2ieHXSk=;
        b=WKZZ4YuCmfu4t3u8YtaZHTMmCLTh1OUflTICQbpr98lNRy5a1nW0CB5E01bfuOaSkx
         hRDK9UJpSNgAC5Z+cYmrZPALX2T6vnanFG6BfjAg5OmZsBr2BOMYldptIQ8q9Wwoyn/i
         mzY1uBZ+77qI6HUapXtnXdO9KpwPeci+cRyrz3y4YsTTvizuH6OMaNj9wGetPedi63HC
         hsjbMHpyu/eA3zNTswNgdvRkIlRhfw+eREDOkVlulQUygoBzCv/4wNuZ8VdzgHedD12D
         5uyHro/8Vst7frKlQ98NVlF1NGJco1i9/RN5woAiUoOUfuZJKtgln7Ug+hOn/hU1Ocu6
         U7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=o+ROcY1C8wz+8PkDwYJ0lELoDYp6Z6DB0Dpa2ieHXSk=;
        b=t0K/DkBvujtbu2gX6HTM6RuHR7uXsFo3x70TrQuT66ZV9e+nCzG3iUwXT3HoCZIGvf
         dYNsXkWfzCVeZfjpQMiSHT05OB66dD6VD9HcxL4OoIEnmPq4d+dcl748vxghhWWZctFF
         ALA2Qd1HCrP5Qv2jXDooGpuqypK5MBS2F5dIRKLMrrAQrigMPxy0Cu/zRauzNOvslwSa
         tTTwPwOClDgvQhYuTds37D8zySyiHddNJnwVPSyLnZaP6IUxpqLUvWJc5JqzdadR3TsP
         5NVsBkazxcvcHRO1NWbLVkBsz1GwmEMxVu/ArkDKSFC0tWTPC+4HwKNMt/zJoTjVDCZz
         PHSw==
X-Gm-Message-State: AOAM531vk4ENdAaYV7oXt8LUyPZ1uybGJGeLuMXR7BHKraONhUxZMUNx
	Dk7HRVcEoXPi0d/5rIqp7TM=
X-Google-Smtp-Source: ABdhPJyYuz4ksvarjnIv1ssY7WB+q4mqAdzG49O8lSpMxLFJ0uzQDfOL8ktmyipnD664+3bkfm1jUQ==
X-Received: by 2002:a1c:2985:: with SMTP id p127mr3911373wmp.165.1618418814386;
        Wed, 14 Apr 2021 09:46:54 -0700 (PDT)
Received: from agape.jhs ([5.171.72.89])
        by smtp.gmail.com with ESMTPSA id j14sm23224202wrw.69.2021.04.14.09.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 09:46:54 -0700 (PDT)
Date: Wed, 14 Apr 2021 18:46:51 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Outreachy kernel] [PATCH v2] staging: rtl8723bs: Remove useless
 led_blink_hdl()
Message-ID: <20210414164650.GA1418@agape.jhs>
References: <20210414162614.14867-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414162614.14867-1-fmdefrancesco@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Apr 14, 2021 at 06:26:14PM +0200, Fabio M. De Francesco wrote:
> Removed useless led_blink_hdl() prototype and definition. In wlancmds[]
> the slot #60 is now set to NULL using the macro GEN_MLME_EXT_HANDLER. This
> change has not unwanted side effects because the code in rtw_cmd.c checks
> if the function pointer is valid before using it.
> 
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> Changes since v1: Corrected a bad solution to this issue that made use of
> an unnecessary dummy function.
> 
>  drivers/staging/rtl8723bs/core/rtw_cmd.c         | 2 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 9 ---------
>  drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
>  3 files changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index 0297fbad7bce..f82dbd4f4c3d 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -150,7 +150,7 @@ static struct cmd_hdl wlancmds[] = {
>  
>  	GEN_MLME_EXT_HANDLER(0, h2c_msg_hdl) /*58*/
>  	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelPlan_param), set_chplan_hdl) /*59*/
> -	GEN_MLME_EXT_HANDLER(sizeof(struct LedBlink_param), led_blink_hdl) /*60*/
> +	GEN_MLME_EXT_HANDLER(0, NULL) /*60*/

I'd remove LedBlink_param struct as well, now it's unused

>  
>  	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelSwitch_param), set_csa_hdl) /*61*/
>  	GEN_MLME_EXT_HANDLER(sizeof(struct TDLSoption_param), tdls_hdl) /*62*/
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 873d3792ac8e..963ea80083c8 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -6189,15 +6189,6 @@ u8 set_chplan_hdl(struct adapter *padapter, unsigned char *pbuf)
>  	return	H2C_SUCCESS;
>  }
>  
> -u8 led_blink_hdl(struct adapter *padapter, unsigned char *pbuf)
> -{
> -
> -	if (!pbuf)
> -		return H2C_PARAMETERS_ERROR;
> -
> -	return	H2C_SUCCESS;
> -}
> -
>  u8 set_csa_hdl(struct adapter *padapter, unsigned char *pbuf)
>  {
>  	return	H2C_REJECTED;
> diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
> index 5e6cf63956b8..472818c5fd83 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
> @@ -745,7 +745,6 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf);
>  u8 tx_beacon_hdl(struct adapter *padapter, unsigned char *pbuf);
>  u8 set_ch_hdl(struct adapter *padapter, u8 *pbuf);
>  u8 set_chplan_hdl(struct adapter *padapter, unsigned char *pbuf);
> -u8 led_blink_hdl(struct adapter *padapter, unsigned char *pbuf);
>  u8 set_csa_hdl(struct adapter *padapter, unsigned char *pbuf);	/* Kurt: Handling DFS channel switch announcement ie. */
>  u8 tdls_hdl(struct adapter *padapter, unsigned char *pbuf);
>  u8 run_in_thread_hdl(struct adapter *padapter, u8 *pbuf);
> -- 
> 2.31.1
> 
> 

thank you,

fabio
