Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517C72CA4
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 15:15:53 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id z5-20020a9d4685000000b005537cbe6e5aso8680077ote.1
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 08:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bvVtz/dG5wpXJrVUlsjEtf4jIyUq5VXwh2yzvFXtufg=;
        b=JAR+ck8VcTN6+TbYv38Sl0ec6sGWbrO0u2FXw6t9cPYgzXiuixwbHl6G0W77vAN1ea
         UDm+zpnZLfFnhKfCbF48pBSRYGQJjv1hBLAZM+Ri8otUeRgRjproZtjFtYLNdo2PV+X6
         zlTG8VgUplF3eDa5tcKSNv8S8accNJSwZ6UmW/dCjC3d36xfkfx6V+0aWmvXYeQT+c/7
         ONDyAe7prv/ayvqfiLPnI39jREHiaPxmIHFeGu9jFx4+FIlDitmhsBvrPb5Tx0bdkBUW
         fBMDl5MC4+rq7WZy97PTXIScqACWRDihpg1Ii+sC2K3yHPP9fvryoKiB/oE4fybNzIcL
         JHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bvVtz/dG5wpXJrVUlsjEtf4jIyUq5VXwh2yzvFXtufg=;
        b=xwCVGpdQ78DTOjByvaa2D2cDEQp/zhiljssDI0HkGTAz8axlCchT0KMJVKDtc53RME
         UApDqOWu9wQFGsqd9ToEZ3mq6tNKGyInC+zalR4jvYXoFR6eTuybwg499zHuaO32+Rgs
         w7FoHPLF5HlU1/JSD9tuha+XKioLw7o2qaIGIwbVkwFohRCAqv/W5lPMiFxiALPgLLOV
         C3XnDzBiT/nwxsSj57hwNP284T4yUVdPJ8eTYiYpjdAWciQDreAthZ2BXlv0Q3Xz1aBP
         5YhOcJjuRe3n7X4U7WtE4fupx0sDRO3OtzGxZsWzoadnFrGSUkS/ELhaBWtqoHKCWD1u
         ZGlg==
X-Gm-Message-State: AOAM530GPB2qh7eYoF7OarU6wdGVrWw0RjNWyxiIW/KfTYwPMOtdZCHG
	60TPTsIedYzIgC7iq4qbhm0=
X-Google-Smtp-Source: ABdhPJzs9If2C/jeXxW9RWTxvvyexAy7zBi0YZjsATZ9PGaUaZEPe5fu64jXzj+GXwIOcddZeNPtTQ==
X-Received: by 2002:a9d:6483:: with SMTP id g3mr13968208otl.105.1635174952481;
        Mon, 25 Oct 2021 08:15:52 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::101e? (2603-8090-2005-39b3-0000-0000-0000-101e.res6.spectrum.com. [2603:8090:2005:39b3::101e])
        by smtp.gmail.com with ESMTPSA id t11sm3074948otp.68.2021.10.25.08.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 08:15:52 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <7dc4eba4-c009-b8b7-bc08-5b608bdf86a0@lwfinger.net>
Date: Mon, 25 Oct 2021 10:15:50 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] staging: r8188eu: core: remove goto statement
Content-Language: en-US
To: Saurav Girepunje <saurav.girepunje@gmail.com>, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, straube.linux@gmail.com,
 fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YXafzp5F8T7/+tk2@Sauravs-MacBook-Air.local>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <YXafzp5F8T7/+tk2@Sauravs-MacBook-Air.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/21 07:15, Saurav Girepunje wrote:
> Remove the goto statement from rtw_do_join(). In this function goto
> can be replace by return statement. As on goto label exit, function only
> return it is not performing any cleanup. Avoiding goto will improve
> the function readability.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---

You need to read section 14 of Documentation/process/submitting-patches.rst to 
learn how to submit a revised patch. Resubmitting such a revision using the same 
subject line is likely to confuse reviewers and maintainers alike, if not 
patchworks.

Larry

>   drivers/staging/r8188eu/core/rtw_ioctl_set.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
> index 2b54cdfa9d6e..411b06e135be 100644
> --- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
> +++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
> @@ -51,7 +51,7 @@ u8 rtw_do_join(struct adapter *padapter)
>   			ret = _FAIL;
>   		}
> 
> -		goto exit;
> +		return ret;
>   	} else {
>   		int select_ret;
> 
> @@ -78,10 +78,9 @@ u8 rtw_do_join(struct adapter *padapter)
> 
>   				rtw_generate_random_ibss(pibss);
> 
> -				if (rtw_createbss_cmd(padapter) != _SUCCESS) {
> -					ret =  false;
> -					goto exit;
> -				}
> +				if (rtw_createbss_cmd(padapter) != _SUCCESS)
> +					return false;
> +
>   				pmlmepriv->to_join = false;
>   			} else {
>   				/*  can't associate ; reset under-linking */
> @@ -102,8 +101,6 @@ u8 rtw_do_join(struct adapter *padapter)
>   		}
>   	}
> 
> -exit:
> -
>   	return ret;
>   }
> 
> --
> 2.33.0
> 

