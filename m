Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010EC7F3
	for <linux-staging@lists.linux.dev>; Thu,  8 Dec 2022 09:37:01 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id ay40so626341wmb.2
        for <linux-staging@lists.linux.dev>; Thu, 08 Dec 2022 01:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Wk7+i0C/FWEnPCeIRF23zs5aw223SpiGHR62WUI0pA=;
        b=S/ZRMUYscgN7PwFNXP6eiKHyPpzRzt/H+F6Y0JzP8DT/XhoxoACVk2xE653w1CIyUP
         6jWQIEa3zfyqh1Sh8XZ3brRt/eXLpja3ZSgaEJXbXqPX2YFnBFr8opdXue+TBRZZ8XYl
         HWK6KXOJ3yzrG/Tffknu7bxi2KxPP4L8OZURZmnJ+ckl8PL2W2ObwuBs52NLq7uhV7u4
         eYC7f0sMBtTlkhrXKKq5zeSW58yUGmjVL/ZEbysMpRf4Ivf37TmROB0pu682pqpMJvta
         0Tpm0vWohE0VYrc80MCFOOJwDWvmbBxNSNwd3tOpOvSVJhT/HxgQKGsBU1P6Tm+vmC/P
         Fm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Wk7+i0C/FWEnPCeIRF23zs5aw223SpiGHR62WUI0pA=;
        b=48E/JjpX98HQROM6hU06fZYOxouNIWqjfJjsI7dsPtMm+vj08M4K/7juD6a8wkxUDg
         jx7wf5T4EY5F/mWeTVEHXcD6JPWfwxcD5w1cw1NhEAXs/j5g+xc3+CiLYhoO0r9wz+Dk
         1x2+VLV8kdLsr5w75goQCuitTFcpFIX7VybT+Za42da3NRQsOgI83v1WMFk294jNx4A2
         Ap4BkLWjp8HELo392eIDEol3MXnGCCZUsuN/BLiQBrJIHxIdoZT4RmmhbZsNGWb03Vhz
         yOrQoaqV3AcUfgRsUD410rdCAje4UCWOmSQqF57z6S0ETi9AjSZrg4vCRVQ2iVKUvxqk
         BHIA==
X-Gm-Message-State: ANoB5pkD1rOjKM9J+d9KoDPJXSfpDX4tGdsptj+aGbbCTAOhv8/XsyLx
	Kr2zwqIsycNTJt8o4z+uBa8=
X-Google-Smtp-Source: AA0mqf7nPhTl/OBwrtfB1SU92fVjJcQqVpKX6rUXLGgxV8LV9fXuR+r2CN5Zmpws7gZEiGUzMiB+pA==
X-Received: by 2002:a7b:ce0e:0:b0:3d1:cae5:efe9 with SMTP id m14-20020a7bce0e000000b003d1cae5efe9mr11693567wmc.158.1670492220314;
        Thu, 08 Dec 2022 01:37:00 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k10-20020a056000004a00b002365730eae8sm21772828wrx.55.2022.12.08.01.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 01:36:59 -0800 (PST)
Date: Thu, 8 Dec 2022 12:36:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Matt Jan <zoo868e@gmail.com>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/3] staging: vme_user: replace 'unsigned' with 'unsigned
 int'
Message-ID: <Y5GwOELXuuGDPilx@kadam>
References: <20221208091117.GA95220@zoo868e>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208091117.GA95220@zoo868e>

On Thu, Dec 08, 2022 at 05:11:17PM +0800, Matt Jan wrote:
> Update the bare use of "unsigned" to the preferred "unsigned int".
> 
> Signed-off-by: Matt Jan <zoo868e@gmail.com>
> ---
>  drivers/staging/vme_user/vme_bridge.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
> index e17a8f7de165..9a127f6fefca 100644
> --- a/drivers/staging/vme_user/vme_bridge.h
> +++ b/drivers/staging/vme_user/vme_bridge.h
> @@ -84,7 +84,7 @@ struct vme_error_handler {
>  	unsigned long long end;		/* End of error window */
>  	unsigned long long first_error;	/* Address of the first error */
>  	u32 aspace;			/* Address space of error window*/
> -	unsigned num_errors;		/* Number of errors */
> +	unsigned int num_errors;		/* Number of errors */

Now the comment is not aligned correctly.

regards,
dan carpenter

