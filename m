Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A7E2C82
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 12:46:43 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id r18so35861315wrg.6
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 05:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nY3B4UpS1wt1COUArQAJ3OR6K/p/Tx5/lrNITNeep30=;
        b=DKYL8SdkU53n63iNpyPpBJux23Yn7ExfKDNuTWmys+NklCutGuDcqr34y3dlEmSMTv
         LJjZnnNinmoH0H+ZisYQSj/z4WohZudzW8LinjKhCOg+oqsOICglkcI0/Niv+dMarhqz
         igsZDBe3bxTr2iTX48es5ir1HYJJbI+430Esnin07eMaO7oNoqC1IxS64ODNJp3We4AG
         cNbef3zc5Ozw1VUt4ExGEtztycaRkr1upIzmvDZQGn/m7efkE5ppSiL8OXlrFO3eNwqB
         SFKM+5pGmuBhAuQLZw2hLKuCuPI6CgaskK6fDFgpZ9L8miWAV6tDSnxmAufgszG5/xPk
         rozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nY3B4UpS1wt1COUArQAJ3OR6K/p/Tx5/lrNITNeep30=;
        b=Ol0Cu0ZrAe+O36HtMoOCayFWs1vNWTDxC7wawX8coS5C9BMoxFJtFtb2hWv5brlrmY
         bLtMEAZv8t5ufwt2q18UPqXeAA1u43Tv+SzKkO2LefL2hPicxvkD8FM0KIF3/qATwTX3
         umkRc09UuCHSqNC/+pBm45RMcQDEr0wyI7wn/Ml9eo3CMGT5sj62s0uAFghfzwC56PQ6
         2UkjLBIJYBpYVgRK/eGes8oXEHKbx1hcvxeIycPwXlYbvXKJTYQWAEQEazObPBfdBBer
         RysDkShtrvbwDS1U5OuSBjP+S20ITH+haFhrdbMwFcBxGlQP4QghlKthqQAdsvLDIxyw
         ph3Q==
X-Gm-Message-State: AOAM533e/2XtWcn+6ZzmGwABe/BhOKDfXZo6kRHBaCCs9bvI6DMvD/Ze
	BGJRcJrSJjktJxnecQXTMEg=
X-Google-Smtp-Source: ABdhPJxSyLFM+WiBuKuWPY6lztCRmpFhAgSv2CXGEqJ6Y/gs154nLR5FWunJPS7GQO8ItM6e2FzjjQ==
X-Received: by 2002:adf:9b97:: with SMTP id d23mr28240708wrc.135.1634474801558;
        Sun, 17 Oct 2021 05:46:41 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::d7f0? ([2a02:8108:96c0:3b88::d7f0])
        by smtp.gmail.com with ESMTPSA id 186sm6981596wmc.20.2021.10.17.05.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Oct 2021 05:46:41 -0700 (PDT)
Message-ID: <1d132f55-8283-e7ef-d558-9dffdcfd53a8@gmail.com>
Date: Sun, 17 Oct 2021 14:46:40 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/3] staging: r8188eu: res_to_status is unused
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211016181343.3686-1-martin@kaiser.cx>
 <20211016181343.3686-2-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211016181343.3686-2-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/21 20:13, Martin Kaiser wrote:
> The function res_to_status is not used. Remove it.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/include/osdep_service.h | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
> index 4622ce400e41..d148137adf39 100644
> --- a/drivers/staging/r8188eu/include/osdep_service.h
> +++ b/drivers/staging/r8188eu/include/osdep_service.h
> @@ -174,11 +174,6 @@ static inline void flush_signals_thread(void)
>   		flush_signals(current);
>   }
>   
> -static inline int res_to_status(int res)
> -{
> -	return res;
> -}
> -
>   #define _RND(sz, r) ((((sz)+((r)-1))/(r))*(r))
>   #define RND4(x)	(((x >> 2) + (((x & 3) == 0) ?  0: 1)) << 2)
>   
> 

Acked-by: Michael Straube <straube.linux@gmail.com>
