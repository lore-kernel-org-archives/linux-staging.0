Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC68C3FDE
	for <linux-staging@lists.linux.dev>; Sat,  2 Oct 2021 14:47:51 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id k7so20342110wrd.13
        for <linux-staging@lists.linux.dev>; Sat, 02 Oct 2021 07:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EXaz91VynQUtGRPsCHnZ8KgaZZE30+maPa6ti159Xw8=;
        b=A0EEtQdfGdKXkSiA2YmVM3lrxZ8WjonbEkDaEM0noojVbtFezcwyjm/giS/x5jFHzA
         r9atcdK29SbUlmclYatqMn2taZuMdHobES0ILw+nteSgfPyYG8MTW683sT2HPxpYFy5+
         IBIz/mPBHkDS9cWXM7xj0iTXigmw5xEl0MtZlAKRdVAyM/o7u6E0L3/cRx89TGN2Qegs
         x+aWMXvvf/hot9PKClbO4qnnp+O8aIUSCwGxLSw9ENQln701wqHiYiLxYpAQ4YJHHdjV
         Rp9Cx9OqTX+dmdW3kicUHCnQPcfbQrTyKJR+xeAVhiMmW7KoCgEAugQFmkFeypE17YSb
         Hz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EXaz91VynQUtGRPsCHnZ8KgaZZE30+maPa6ti159Xw8=;
        b=2ziCPyZs+JOjURZtk3YgXhKA8sv41PdEgoQQkiHdJtY/Yi/HBz1S/W0tKlsdE3HD3H
         OjyddNXcAph/f8kSpjPSuiwoMyML28CQAKQA9X2f/PDtA/igFIhQKCjQ2ESaoRLAOn/k
         obtfHKEq3LCN3I+Y5vplmJRs3/vqBlFXYFaah6CPX7B9gdihfHAHWuIjgU7D0IFqbnao
         jpkPcYiSZSBQT+kwy3rcgYYwN8HkWeOzCaSTLch31cy5iSe4P6Lvyyw52R6nyuQxtMgL
         JYiWfDwss4KUIbJLfnNBXcQ76LKdXWBfLCYyM7+ouocvB6NBrQ5ZV1dw1rt4N1AjYq0t
         CDfA==
X-Gm-Message-State: AOAM5332JcSn73tujODo2MxniUMJ1vyXO6vsaH/zeHygIXRTtWwaG2eU
	q9FGTpl49TNcH8YfArFaguA=
X-Google-Smtp-Source: ABdhPJw4+S3FgiR5OaMace3M/NZUE2SYcqkJFX/bGqMSRW/U3F0mRH/sF3C/Nt5JfBNGIvPFuIZvSA==
X-Received: by 2002:a5d:668c:: with SMTP id l12mr3650589wru.436.1633186070068;
        Sat, 02 Oct 2021 07:47:50 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::f816? ([2a02:8108:96c0:3b88::f816])
        by smtp.gmail.com with ESMTPSA id y15sm2058296wrp.44.2021.10.02.07.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Oct 2021 07:47:49 -0700 (PDT)
Message-ID: <fb64de38-50e1-e0e7-0b13-42e2c2e43f3d@gmail.com>
Date: Sat, 2 Oct 2021 16:47:48 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] staging: r8188eu: core: remove power_saving_wk_hdl
 function
Content-Language: en-US
To: Saurav Girepunje <saurav.girepunje@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org, fmdefrancesco@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YVhv5JiHovfdpNGg@user>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <YVhv5JiHovfdpNGg@user>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/21 16:42, Saurav Girepunje wrote:
> Remove function power_saving_wk_hdl is it just calling rtw_ps_processor.
> Instead of power_saving_wk_hdl() call  rtw_ps_processor().
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_cmd.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index 3a70776f3304..44a1df4f51d1 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -1649,11 +1649,6 @@ u8 rtw_antenna_select_cmd(struct adapter *padapter, u8 antenna, u8 enqueue)
>   	return res;
>   }
> 
> -static void power_saving_wk_hdl(struct adapter *padapter, u8 *pbuf, int sz)
> -{
> -	 rtw_ps_processor(padapter);
> -}
> -
>   u8 p2p_protocol_wk_cmd(struct adapter *padapter, int intCmdType)
>   {
>   	struct cmd_obj	*ph2c;
> @@ -1890,7 +1885,7 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
>   		dynamic_chk_wk_hdl(padapter, pdrvextra_cmd->pbuf, pdrvextra_cmd->type_size);
>   		break;
>   	case POWER_SAVING_CTRL_WK_CID:
> -		power_saving_wk_hdl(padapter, pdrvextra_cmd->pbuf, pdrvextra_cmd->type_size);
> +		rtw_ps_processor(padapter);
>   		break;
>   	case LPS_CTRL_WK_CID:
>   		lps_ctrl_wk_hdl(padapter, (u8)pdrvextra_cmd->type_size);
> --
> 2.32.0
> 

Looks good to me.

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael
