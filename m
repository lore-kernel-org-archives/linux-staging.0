Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464AD72
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 13:33:05 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id bi32so10372075oib.2
        for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZxRMsCrThJI9uuSdKdHUyxJFANz6CHyn6poCfErU9Q8=;
        b=dpnTVq1T+/zoFToqPGpFTyudjkaIpavz+343GvHSNJPOXWZASk0W85pJk+fFuhYyj2
         PzDLZ7xWaA5PojnM8fB/nl3aORZgsSjsaBQxVRf+0DpRtbVOI1rucUxhKxn+iIYMtqRj
         sSOdpUjXfKMrOb3cUtuJaMINSXCOi2dTrxRU+LP61pXxtvi4GrlD7+uB52d9hPTXvm9b
         9eLTvzFut3RF1/Hd9SxoTwdnknmZpQQNdkvr4wJ6N8K/ykxn93XilSJ6UIpUCfZTfFNp
         kKd11wHRcinl0VjmL2aKdkYE5FzR5jFSRVK9JnzM3rjE4wgm/ilFuGy7JFFCAxLyQKb9
         Ck8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZxRMsCrThJI9uuSdKdHUyxJFANz6CHyn6poCfErU9Q8=;
        b=mYQ1/A0vJ/GDQsqJk1Hk/2ypq58CZ/P4bOXvCoXWHbByPxQ2sFMld0J4pwJSBGMMWp
         j4ObBbekMBqrTS/UEusBe4JMs3ok9EOFFaLbH5a5QhObXMkjBKI1sRBOX/hgLxWddTZf
         35N1Vb/KWmo11eEvWvxHHop/kyKVLlUHiTRbosWyt4Ae47ijpBFqAOPFwttQ6D3hkfXg
         SyZ3qLHOH81ZExWQXihTeRhmKVgMtQuFYo6K9xpkkp7RXmPBMo2fGOK4IGUR/v0yoMp5
         +hZs285g45PVY/5GTnp/xrLa9tFn/V93T5UYsELHWv8YS2UJbR/MfyEKcrqUC5M0YfTX
         ZKmg==
X-Gm-Message-State: AOAM531Zz1W9cbh3NxBNd7ATN8tlcip/ImP1sBcr1VvhB7HGMV4NUFay
	ZbIKMTO6oRax02tLIMuVt1M=
X-Google-Smtp-Source: ABdhPJyG2+8rbt5+K37T+kaVVmKFfcdxHxREw8jaiCQ9KIfpPHawX9u2z0TFnWRP9edIWUB1dZEg/Q==
X-Received: by 2002:aca:1014:: with SMTP id 20mr10474128oiq.70.1628775184517;
        Thu, 12 Aug 2021 06:33:04 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id 4sm618104otp.23.2021.08.12.06.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 06:33:02 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH] staging: r8188eu: scheduling in atomic in
 rtw_createbss_cmd()
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 kernel-janitors@vger.kernel.org
References: <20210812065852.GB31863@kili>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <27c01d9d-1322-3168-227b-106444634eea@lwfinger.net>
Date: Thu, 12 Aug 2021 08:33:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210812065852.GB31863@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/12/21 1:58 AM, Dan Carpenter wrote:
> A couple of the callers are holding spinlocks so this allocation has to
> be atomic.  One spinlock is in rtw_set_802_11_connect() but the simpler
> spinlock to review is when this function is called from
> rtw_surveydone_event_callback().
> 
> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index c3a9051ca10c..ff5b4505a713 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -735,7 +735,7 @@ u8 rtw_createbss_cmd(struct adapter  *padapter)
>   
>   	rtw_led_control(padapter, LED_CTL_START_TO_LINK);
>   
> -	pcmd = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
> +	pcmd = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
>   	if (!pcmd) {
>   		res = _FAIL;
>   		goto exit;
> 
Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry

