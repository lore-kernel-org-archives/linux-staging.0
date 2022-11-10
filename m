Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA51F361
	for <linux-staging@lists.linux.dev>; Thu, 10 Nov 2022 00:10:53 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id b29so237287pfp.13
        for <linux-staging@lists.linux.dev>; Wed, 09 Nov 2022 16:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yfINp8pb5N6Kx42V2kF3zccXP5miAwmr+YVzAQR38b8=;
        b=hrulcqmGHvIDI7EqZKqSueWhh85PNmFzN08aIKM7w4yjyfwkcS4HuPqLRRHwcVjggo
         jpKx4rESzVfQK/lHta+SCGcvocKoB4TOc1+BvhJeW5UbuYExMukkbO58TBObElRpmcBA
         16H84vUhdPO6YaHsoin3oZPfwskSYzp++yb/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfINp8pb5N6Kx42V2kF3zccXP5miAwmr+YVzAQR38b8=;
        b=7m4nypJfkP5ZJPFZUOKfdnKzdPD5ubszbNCytdrGcy02b5BOrH0vNAW/wtrrwZu8rg
         liiN5RklIpbUiwM1n+58mA7rOmrdxGMEyDJc9F4ypmTrBgQpynI4I9ZP+SSsbTCybKPZ
         PQxW5eMVYI3yVtfJAwscC95AriR+3fad0a7S3OQeuh+C13QrEWJUz/geBvPTIWptcGhq
         GxaGD0EHED5gNNUILnV+WPMKuk36TRzIRF4rvt9Mi9+2yYsiYpijgCMpqdcdDLQMPcEg
         Cxy6yctqYDDB10KAfRBBZy4Hliw1Cy70uYZaM301tgNz8ZNhYE4Z2Tt5JshSomR+7YxF
         KxNA==
X-Gm-Message-State: ACrzQf2cX+LvLjMBi1nudAoQDjK7h5voEhDP+WmRRsldi8rciSV7fpCe
	mHSbC2+psU9koe7w0DCshl+pzQ==
X-Google-Smtp-Source: AMsMyM5Ur4+2jdo21Hc7VyMq48tFV/jggd85uZGIwa6o2cvJu/+hjBRLNTLAWr8lbwDHdOX2nk1e5w==
X-Received: by 2002:a63:2cd2:0:b0:41c:5901:67d8 with SMTP id s201-20020a632cd2000000b0041c590167d8mr53661261pgs.365.1668039053278;
        Wed, 09 Nov 2022 16:10:53 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b4-20020a170902650400b001869079d083sm9748551plk.90.2022.11.09.16.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 16:10:52 -0800 (PST)
Date: Wed, 9 Nov 2022 16:10:52 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 7/7] staging: ks7010: Avoid clashing function
 prototypes
Message-ID: <202211091610.8D12F1F@keescook>
References: <cover.1667934775.git.gustavoars@kernel.org>
 <8d2ceee1248b5a76e9b6c379f578e65482c91168.1667934775.git.gustavoars@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d2ceee1248b5a76e9b6c379f578e65482c91168.1667934775.git.gustavoars@kernel.org>

On Tue, Nov 08, 2022 at 02:34:46PM -0600, Gustavo A. R. Silva wrote:
> When built with Control Flow Integrity, function prototypes between
> caller and function declaration must match. These mismatches are visible
> at compile time with the new -Wcast-function-type-strict in Clang[1].
> 
> Fix a total of 27 warnings like these:
> 
> drivers/staging/ks7010/ks_wlan_net.c:2415:2: warning: cast from 'int (*)(struct net_device *, struct iw_request_info *, struct iw_point *, char *)' to 'iw_handler' (aka 'int (*)(struct net_device *, struct iw_request_info *, union iwreq_data *, char *)') converts to incompatible function type [-Wcast-function-type-strict]
>         (iw_handler)ks_wlan_get_firmware_version,/* 3 KS_WLAN_GET_FIRM_VERSION */
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The ks_wlan_net Wireless Extension handler callbacks (iw_handler) use a
> union for the data argument. Actually use the union and perform explicit
> member selection in the function body instead of having a function
> prototype mismatch. There are no resulting binary differences
> before/after changes.
> 
> These changes were made partly manually and partly with the help of
> Coccinelle.
> 
> Link: https://reviews.llvm.org/D134831 [1]
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

The "mode" churn makes this a bit harder to review, but I think the
final result looks better.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
