Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB783FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 18:33:55 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id e26so3550802wmk.2
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 11:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0nDMZoA1FmymyOsMekWRkgrfqA9nLfGofhzBu5s0MiI=;
        b=lTKs2xhrL5zclQgutYhmmfMvqsqaUIG0DtKRqGRztp69Ry+Y/Ly4mtYA+U3Ier8boq
         /feLd2L/Io4fnF8u6wGMevYTc1h0tjm5sRRHqXLfZ1UM7Bzhu/VgaxE21WmTEfGVpNsY
         nw9SEX/qXFFfPY3Cq2UEwW4ScWLEzFCwufzi41kzn0LMQ5BX1sFd5Z7vDSAjU52R1vmO
         TG7QBxgSKVMMSLvlvTWOWbs+KPCz+Z/3wWDaceZJUFTRD1OzmZzRTg/TNO5nkfLrJqNt
         ImgbRtOxFi52e+IDjmqZkik3EPzTvBNb9FKYPTQBhuEr3LiN9m2uF/53d683yWKGmg94
         sNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0nDMZoA1FmymyOsMekWRkgrfqA9nLfGofhzBu5s0MiI=;
        b=aVtQvL8DkzA2F/GCpnI0ARYLcnX5iJlUTN2RtxSPJe/Ss5n5Ame3ZP4FRYisREPWn6
         3R4S53UtmAveqxbJK6RarfdMY/6UD0DBozPqRq61Q09M6A1Zxu+pAnCUAV5KFkQDkhMR
         7aDMR08vP1s4gMM8eG/jlE3pH5Y3mpVu0srfjeXRQmHI5o+NETWFJMMGYdQx0tX9xG+/
         q37KHyO3jwsJoMruEeaNwr5G+xDtY/SqnXKC240eRuERkCP1J+hYY/DjHDDGk1Tw9y95
         IGAwFPYsqh3YzWosrP0q+nAugDCeiYYDqW2Hn3KQ8iOgP2GilzQYuZqzcFWRJ9awqZCp
         YqCw==
X-Gm-Message-State: AOAM532y0NFYTStanXa6typPWIPGsyrd1Po7aJupohjhHPJSbNHW3U+7
	PPxSwy3FJ1DxYpRTfIT6yyg=
X-Google-Smtp-Source: ABdhPJyWAGMJesUMUT3+5oJPXd29WZJB2b4c/5/aTfnVVOvjgMbIMMTjm05p8qbgThq3sV35Nbkg8A==
X-Received: by 2002:a05:600c:2250:: with SMTP id a16mr3659235wmm.72.1631385234320;
        Sat, 11 Sep 2021 11:33:54 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::1db2? ([2a02:8108:96c0:3b88::1db2])
        by smtp.gmail.com with ESMTPSA id l7sm2111273wmp.48.2021.09.11.11.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Sep 2021 11:33:53 -0700 (PDT)
Message-ID: <760ac39a-5562-cac5-0b7b-e42f6628743c@gmail.com>
Date: Sat, 11 Sep 2021 20:33:52 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH 05/12] staging: r8188eu: remove rtw_set_rpwm
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210911141521.24901-1-martin@kaiser.cx>
 <20210911141521.24901-6-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20210911141521.24901-6-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/21 16:15, Martin Kaiser wrote:
> After we dropped the call to set HW_VAR_SET_RPWM, the rtw_set_rpwm
> function doesn't do anything useful.
> 
> Remove the function and the rpwm component of struct pwrctrl_priv,
> which is not used outside of rtw_set_rpwm.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   .../realtek/rtl8192cu/include/rtw_pwrctrl.h   |  1 -
>   drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 34 -------------------
>   drivers/staging/r8188eu/include/rtw_pwrctrl.h |  2 --
>   3 files changed, 37 deletions(-)
> 
> diff --git a/drivers/net/wireless/realtek/rtl8192cu/include/rtw_pwrctrl.h b/drivers/net/wireless/realtek/rtl8192cu/include/rtw_pwrctrl.h
> index a4cb292e1aea..303df55c521a 100644
> --- a/drivers/net/wireless/realtek/rtl8192cu/include/rtw_pwrctrl.h
> +++ b/drivers/net/wireless/realtek/rtl8192cu/include/rtw_pwrctrl.h
> @@ -309,7 +309,6 @@ extern void cpwm_int_hdl(PADAPTER padapter, struct reportpwrstate_parm *preportp
>   #endif
>

The patch does not apply to staging-testing.

Looks to me that the change in

.../realtek/rtl8192cu/include/rtw_pwrctrl.h

made it into this patch by accident?

Thanks,
Michael
