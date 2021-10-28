Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380B62C81
	for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 11:26:48 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id 1so4172991ljv.2
        for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 04:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DDaBBkQmi/773KYoGIavcAYqBXm2wz4Ih2cpVAOAk8s=;
        b=G0fImp+VuElLAwq6Vsl7qDm163/nN/9FFd4ugzlJdsXZ8HGxzgNey54ZOX0aUT3ozJ
         9qP/0y6uV8z74Gy6iQXZAz+q0230b+QVD2SHi2QG+lhEwGrvtapEO5ykYuE+h3/TZhV0
         7/Zj+Qhd6D1dyqunJ7NaNa1OM3ICXHdFQ9j0oAlHIW2TM2mqVoW7J0cdX0L2NoLs1EbA
         VbMrDAqt8z2zpEJIQxSrnufzftCqT+/4PVrRrdFzfmnGUX2rZr+ZiwZ54LfyA4sXUFNW
         FrGuScvQITlgrHqPyzu1/7G6ulJk5ewDa/qRg/amthwjdj35rDIzhyUeYRfOT2IqStFQ
         YtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DDaBBkQmi/773KYoGIavcAYqBXm2wz4Ih2cpVAOAk8s=;
        b=1N3mKQHS66BkA8Z0nePZ0JlW7UaXwFJYs+gWw5OUUwHgZ6L581e/lM8Cx0EPhSsHIM
         LyuZmpculLBhuTrrW5ebQdMTkCBWnrAlQXHatUoKiDqmO+2MZ/OXetAG9eCS+auCsUNh
         pxe5eT8NxDi7pI8Kx8X9ljM2SRMTy4Iok1Lr2mXZtnkiOmhXIBr8+EU3CDvRFnDj0Zki
         eeDnW/UNOHtvHbfHxMf26g10e8ORDSi06XVPLoWuge6zHpuUL3WEYNV3avv7FvG5kJmd
         6K0N0GdHSyO5CF0zFBwIjWHqUFuEzyQG4tbNHkYp0T9cSbP0xJQoeM4AtRHZJZXqBvS8
         fZCA==
X-Gm-Message-State: AOAM531wwC24rjWsfTDhhVJJWMZVeqwEiGdlfOAw+q4c4aZlif0/hJsM
	rbaBPWfs4o0Cc2g/XVANitA=
X-Google-Smtp-Source: ABdhPJyRYa4zS0AOK4ns2HYWruJSDGORUaZFQ4/JrHw4Tt4AdPujPJss9MxDEaQi2hr5R3kIBtHYOg==
X-Received: by 2002:a2e:9d88:: with SMTP id c8mr4182608ljj.276.1635420406281;
        Thu, 28 Oct 2021 04:26:46 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.235.8])
        by smtp.gmail.com with ESMTPSA id h11sm287494lfv.86.2021.10.28.04.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 04:26:45 -0700 (PDT)
Message-ID: <d4ee4591-0642-002b-ddd8-41693c0f1ccb@gmail.com>
Date: Thu, 28 Oct 2021 14:26:44 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] staging: rtl8712: remove the condition with no effect
Content-Language: en-US
To: Saurav Girepunje <saurav.girepunje@gmail.com>, Larry.Finger@lwfinger.net,
 florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
 alec@vc-celle.de, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YXonpdnCatbuOo8H@Sauravs-MacBook-Air.local>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <YXonpdnCatbuOo8H@Sauravs-MacBook-Air.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/21 07:31, Saurav Girepunje wrote:
> Remove the if condition check and else code section in
> query_rx_phy_status(). As variable cck_highpwr is assign a value of '0'
> after this assignment, if condition check !cck_highpwr is always
> going to be true. So remove the if condition check as well as else
> section which will be never true.
> 
> After removing the if condition there is no use of local variable
> cck_highpwr. Remove the local variable cck_highpwr.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---

[code snip]

> +		report = pcck_buf->cck_agc_rpt & 0xc0;
> +		report >>= 6;
> +		switch (report) {
> +		/* Modify the RF RNA gain value to -40, -20,
> +		 * -2, 14 by Jenyu's suggestion
> +		 * Note: different RF with the different
> +		 * RNA gain.
> +		 */
> +		case 0x3:
> +			rx_pwr_all = -40 - (pcck_buf->cck_agc_rpt &
> +				     0x3e);

You can move "0x3e);" part on previous line, since it will fit even 80 
characters boundary. It will improve readability, IMO

Same below.

> +			break;
> +		case 0x2:
> +			rx_pwr_all = -20 - (pcck_buf->cck_agc_rpt &
> +				     0x3e);
> +			break;
> +		case 0x1:
> +			rx_pwr_all = -2 - (pcck_buf->cck_agc_rpt &
> +				     0x3e);
> +			break;
> +		case 0x0:
> +			rx_pwr_all = 14 - (pcck_buf->cck_agc_rpt &
> +				     0x3e);
> +			break;
>   		}
> +



With regards,
Pavel Skripkin
