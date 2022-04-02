Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA44186B;
	Sat,  2 Apr 2022 16:42:29 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id b17-20020a0568301df100b005ce0456a9efso4237906otj.9;
        Sat, 02 Apr 2022 09:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LxIBYGAnw0G2uTyNe8oc7bEWhXzBTFL31jJUCuZn7Ig=;
        b=Ud7pFw36L7xNhE5Zi5Gc2HHWzUiX54grQmv9viTGoFtw7vSweK2Z/4PZTt2+wi9Q/e
         CpLM/f6QKrhwXxxlP0vBnHb+LUUSnYxLDiLMvAhViF8IFUuJnJCwNyOyfTijV4Uw/dMm
         UigcLdy9E5wI2GKtAtoqgQUFdttuzH7JMfPtryDTYO576ueDsxz/wcaPd+iKwJwNdpOg
         z0j+KzUDVODl9sWRFFsDNgFlycdJ6gTC4Ki/sddE66viVryGpj2+PiCfoOPEBRRi5TuY
         J+RptEc5E9pNC8IjWcTqfkzptcULkwl6WlHhcGytwQasuAeoVd3S3tgUtPcBxYfjgebz
         ekZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LxIBYGAnw0G2uTyNe8oc7bEWhXzBTFL31jJUCuZn7Ig=;
        b=f60nURqpbTKrTCHASVKevIRKPUGhFOw6Qh2kzbEUx6Ufym9X5TzFkDZU84R4orQdLZ
         kirK7mQu9E273NYf65He0d3EnXBf68JNcuwnhVispsMPm94JN5OY7ozYgLgrf+G/rbZ8
         pE2T///81JY/g9IkyUiUhCCOLsTzZdxPLq9eySdYAY+bipC58YMAfpGjG8GTwKqt8PKv
         PrgAxQDFQGNzXTK1zTwPYSP+e0Vh+mbkj6lP2b3XDJAVoIbnJVIT+EzIYwW9+YptJqRo
         q3ePPRyExKGQ9aVmhkSU9GUTUOBbAtYFhjRNMsLhNVoSaB3az08mm3SPLvQKNbOkGrwf
         mfpA==
X-Gm-Message-State: AOAM531lsJQqZ6yTc9e6z6Ie/m5hK9Uuc4++0Ucs7/MDelgiPzR5J7A2
	cAFE6bSsF4CvTtWd5rJz7/U=
X-Google-Smtp-Source: ABdhPJxX1JfkTpQWEVQe5XDpoAfaEarTckKHCpsEqTCFXzoIHsXejI5ei7Oj+GSHSDH5/ObNYlzKOA==
X-Received: by 2002:a05:6830:1047:b0:5b2:3173:d781 with SMTP id b7-20020a056830104700b005b23173d781mr9031403otp.178.1648917748252;
        Sat, 02 Apr 2022 09:42:28 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::1004? (2603-8090-2005-39b3-0000-0000-0000-1004.res6.spectrum.com. [2603:8090:2005:39b3::1004])
        by smtp.gmail.com with ESMTPSA id eq37-20020a056870a92500b000c6699dad62sm2529148oab.41.2022.04.02.09.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 09:42:27 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <583569c9-baf0-b478-d14a-4a2beb3708d3@lwfinger.net>
Date: Sat, 2 Apr 2022 11:42:26 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 6/6] staging: r8188eu: remove spaces before tabs
Content-Language: en-US
To: Rebecca Mckeever <remckee0@gmail.com>, outreachy@lists.linux.dev
Cc: Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1648888461.git.remckee0@gmail.com>
 <2fd10f393e3bc7381a85d0bfc1ec04a80af4eabb.1648888462.git.remckee0@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <2fd10f393e3bc7381a85d0bfc1ec04a80af4eabb.1648888462.git.remckee0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/2/22 03:50, Rebecca Mckeever wrote:
> Conform to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> WARNING: please, no space before tabs
> 
> Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_cmd.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index 832bf25b1a83..8ae25cb4246b 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -548,9 +548,9 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
>   
>   	phtpriv->ht_option = false;
>   	if (pregistrypriv->ht_enable) {
> -		/* 	Added by Albert 2010/06/23 */
> -		/* 	For the WEP mode, we will use the bg mode to do the connection to avoid some IOT issue. */
> -		/* 	Especially for Realtek 8192u SoftAP. */
> +		/*	Added by Albert 2010/06/23 */
> +		/*	For the WEP mode, we will use the bg mode to do the connection to avoid some IOT issue. */
> +		/*	Especially for Realtek 8192u SoftAP. */
>   		if ((padapter->securitypriv.dot11PrivacyAlgrthm != _WEP40_) &&
>   		    (padapter->securitypriv.dot11PrivacyAlgrthm != _WEP104_) &&
>   		    (padapter->securitypriv.dot11PrivacyAlgrthm != _TKIP_)) {
> @@ -1010,7 +1010,7 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
>   	u8	res = _SUCCESS;
>   
>   	/* if (!pwrctrlpriv->bLeisurePs) */
> -	/* 	return res; */
> +	/*	return res; */
>   
>   	if (enqueue) {
>   		ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
> @@ -1151,8 +1151,8 @@ u8 p2p_protocol_wk_cmd(struct adapter *padapter, int intCmdType)
>   	}
>   
>   	pdrvextra_cmd_parm->ec_id = P2P_PROTO_WK_CID;
> -	pdrvextra_cmd_parm->type_size = intCmdType;	/* 	As the command tppe. */
> -	pdrvextra_cmd_parm->pbuf = NULL;		/* 	Must be NULL here */
> +	pdrvextra_cmd_parm->type_size = intCmdType;	/*	As the command tppe. */
> +	pdrvextra_cmd_parm->pbuf = NULL;		/*	Must be NULL here */
>   
>   	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
>   
> @@ -1378,8 +1378,8 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
>   		p2p_ps_wk_hdl(padapter, pdrvextra_cmd->type_size);
>   		break;
>   	case P2P_PROTO_WK_CID:
> -		/* 	Commented by Albert 2011/07/01 */
> -		/* 	I used the type_size as the type command */
> +		/*	Commented by Albert 2011/07/01 */
> +		/*	I used the type_size as the type command */
>   		p2p_protocol_wk_hdl(padapter, pdrvextra_cmd->type_size);
>   		break;
>   	case CHECK_HIQ_WK_CID:

Congratulations on a very clear set of patches. Each performs a single change 
exactly as required by the rules.

For all 6,
Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,
Larry
