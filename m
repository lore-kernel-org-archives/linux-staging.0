Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A082F84
	for <linux-staging@lists.linux.dev>; Sun, 18 Apr 2021 15:07:14 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id h10so37657298edt.13
        for <linux-staging@lists.linux.dev>; Sun, 18 Apr 2021 08:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=i/KYGADl7+/IqKuzmG1t2Lht8OnViYJW5I8fQMLDOt8=;
        b=Z+lGEHBhkSmKCt5U6Ml2lsJsoNJIHkKsiG6VQL1VIFOCd/3zGF32737CXNBurS9bmb
         WYJoqnPgbvrDgtBYNwVb8jd5h+/Q9FmuulobkuSMNa8S8M4mZQ6pEbLtnkPlIN22Ep3H
         /AoXjzQqD3GDrrETWcDwihkoIR89wrYale8OqztT9T9Qz547ZO2TIZLR1P5A+VrZDX6h
         YwxwdGUYlsMLomQc6ROkSuk6iJ70Qs38110YRagjVSy5CjVugmUxcYeUZEPeNGy1BErA
         w8RWxNCzAOiLVsltq4HzrvIEKEXgphwH7CP1yDmXxIP1BmSnpPaEyMK2gynpv+A63aL2
         TREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i/KYGADl7+/IqKuzmG1t2Lht8OnViYJW5I8fQMLDOt8=;
        b=CIHShBlan/9gFjqV1hoKB5lzHDEhMaW7LUT2lpKIoOxbqbJHCmwRyXNl2jYEmxqHSd
         SCJIJUqpaB04p79sQgmb0/drdUMttMjNRcQai1arVFgGrLysZlVQehOYL75VfwEuzahu
         vOtd8cqnWhTebqD1CH99ltEMqz6rOUKaC9yVGCRZhl/icFzjwP6NiHWgHa9NyhQKJX2F
         qK8eJTX330LFLILzVb9GFmSVJICsfnL1HshpK2xLPDIqA6gcv1x5l0kM3+1lDw8x0mjy
         bhhoWoDjx/3KtcP8Vtm4RhICuFRG279fWIgyFlyeeeahKGGvrE2nsthjtrs1B3zCFddm
         BdJw==
X-Gm-Message-State: AOAM531503pnsVbJ38xhQ3LelQwuvRIEPSKWMwfPPUdrTusYfB29HIBb
	LQfKAhs3/4wMXoq5apbi4pQ=
X-Google-Smtp-Source: ABdhPJx9WTyYngyiYos8Zp2mPmzD59lQxv1HaZwcvK01yMMw/nr2m7/cNcR6xVNKtJ+NhIx8MV4yeg==
X-Received: by 2002:aa7:ca04:: with SMTP id y4mr20480459eds.72.1618758432791;
        Sun, 18 Apr 2021 08:07:12 -0700 (PDT)
Received: from agape.jhs ([5.171.80.219])
        by smtp.gmail.com with ESMTPSA id pv21sm8452660ejb.109.2021.04.18.08.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 08:07:12 -0700 (PDT)
Date: Sun, 18 Apr 2021 17:07:09 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, saurav.girepunje@google.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
Subject: Re: [PATCH] media: atomisp: pci: remove unneeded variable 'err'
Message-ID: <20210418150708.GA1402@agape.jhs>
References: <20210418144323.GA54920@user>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210418144323.GA54920@user>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Apr 18, 2021 at 08:13:23PM +0530, Saurav Girepunje wrote:
> Fix the following coccicheck warning:
> 
> drivers/staging/media/atomisp/pci/sh_css_mipi.c:39:5-8:
> Unneeded variable: "err". Return "0" on line 44
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@google.com>
> ---
>  drivers/staging/media/atomisp/pci/sh_css_mipi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> index d5ae7f0b5864..708903a31b08 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> @@ -36,12 +36,11 @@ ref_count_mipi_allocation[N_CSI_PORTS]; /* Initialized in mipi_init */
>  int
>  ia_css_mipi_frame_specify(const unsigned int size_mem_words,
>  			  const bool contiguous) {
> -	int err = 0;
>  
>  	my_css.size_mem_words = size_mem_words;
>  	(void)contiguous;
>  
> -	return err;
> +	return 0;
>  }
>  
>  /*
> -- 
> 2.25.1
> 
> 

Hi Saurav,

this ia_css_mipi_frame_specify seems to be unused. On
header file, before the prototype it is said that it could
be removed only when all drivers moved to a new API.

Is that comment obsolete?

thank you,

fabio
