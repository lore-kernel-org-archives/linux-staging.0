Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1363FC3
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 22:22:30 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id u16so648035wrn.5
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 15:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9miw9SxWD4u0MzKWwOg5JNvsX0BNeRBeHfRb+p9jelo=;
        b=kxU9zo4bB3SNnuVhnb9/SuNygbOih4SJg2h89xELrhbMHYuAjSXDklDxEQOxGAcr8T
         RXn0JhJtIPIv6RMUMmW/aQjaLwyFRt7MBlK2xlJkWdYZfeKdGtq7CoAhw3iTmNi5gC4F
         7+H95ozTYtjb2vAWufgiY1Ug9p5O3YFPZ+ftCd+w4QrWcbY4KIv8o0Z0rorun2NP4bMS
         zG6nuUakNwhVeRynoPAzLxiZoQYYxjOMv+BPRIjwIs6N1KxNloTo/0xxU+iCcJ80HHCT
         ZG/TsL+kcKhEBITH/dEy/JLaarEXKtKteLGDcJIA8SCHX6sAlImib98GoSknoCFA6mMj
         k+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9miw9SxWD4u0MzKWwOg5JNvsX0BNeRBeHfRb+p9jelo=;
        b=Vl9qcSTvuh1Ezk+UwOwvzxMtyYKr+UgsssBTy5HShPcoyhACCG/8IHvtjb9FbepJvk
         B3YxW4EZYxGNr/ZPSZAfymPNM/PZhGHQXK3s0F9aBrQJrvkqHmMztaBA0Vh9Ghd6gbAw
         h8mCq/0443tSSArIDnT3Wo32LMi1GkwfED8igOoZuWbzycWhGGNraSuSl0U/50CGzpqR
         CdImF0/JKRHBcQperlo8UfYP0nk6zIbuLqOZvkJ6Gt9l9qeF/MUNKoSf2hNw/AsEF7fz
         NvnP8j++nlNAAWyS4zUd+oRvCxOeWVTzjUhroMV8blVNCk/of8u//Ig8sumMtWarlCID
         7iqw==
X-Gm-Message-State: AOAM5310xJVTucMGXAnwnCy0qI6pz25Ce6a0Fo1JbTwEvatPwsa43toR
	uWZO/38LSTbFAUxEKUJho9hbAA==
X-Google-Smtp-Source: ABdhPJz/EPJVQ00Dz/FRmjo9aidF8nvyBR0G6x7XpAg7VIfv950GLcNFFMZjEAzut3+gF2d7BXJF8w==
X-Received: by 2002:adf:80eb:: with SMTP id 98mr1459440wrl.348.1631658149357;
        Tue, 14 Sep 2021 15:22:29 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id h15sm11271408wrc.19.2021.09.14.15.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 15:22:28 -0700 (PDT)
Date: Tue, 14 Sep 2021 23:22:26 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net, martin@kaiser.cx,
	fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] staging: r8188eu: remove unused fields from struct
 hal_data_8188e
Message-ID: <YUEgoipiosdhiXdq@equinox>
References: <20210914121352.26052-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914121352.26052-1-straube.linux@gmail.com>

On Tue, Sep 14, 2021 at 02:13:48PM +0200, Michael Straube wrote:
> This series removes some unused fields from struct hal_data_8188eu.
> 
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> Michael Straube (4):
>   staging: r8188eu: remove unused macros from rtl8188e_hal.h
>   staging: r8188eu: remove write-only fields from struct hal_data_8188e
>   staging: r8188eu: remove unused enums from rtl8288e_hal.h
>   staging: r8188eu: remove unused field from struct hal_data_8188e
> 
>  .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  5 -----
>  .../staging/r8188eu/include/rtl8188e_hal.h    | 22 -------------------
>  2 files changed, 27 deletions(-)
> 
> -- 
> 2.33.0
> 

Dear Michael,

Looks good, built and tested here and working fine - as you say though
these are removals of unused code/properties so I was expecting it to
work anyway :-)

One small thing to change though: the subject line of PATCH 3/4 should
refer to rtl8188e_hal.h, rather than rtl8288e_hal.h.

Many thanks,
Phil
