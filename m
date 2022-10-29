Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646C523AA
	for <linux-staging@lists.linux.dev>; Sat, 29 Oct 2022 07:20:15 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id q1so6625074pgl.11
        for <linux-staging@lists.linux.dev>; Sat, 29 Oct 2022 00:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ss9mHb7Up4WJPG174BroMQ/rFUMxSmAvI9HWcoDXYeI=;
        b=lfDRgG4gcFVjPXy6WNAXfQOcZUwQLCRZzSVWisL6fGMaIBSiyE00C6zMO1EvlHZgv2
         0tHmkWcODvxiSRdK9Ax1/zGgaWNYudHsoleWrPIRDTNCFZ+Jb/nmrjqTpg/xO2e8YFz5
         8837MWqCeZonLNzlfWlRAuQAViIMtdkMad8wA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ss9mHb7Up4WJPG174BroMQ/rFUMxSmAvI9HWcoDXYeI=;
        b=g+PFLR/dusMhFs6aO2t0lIFtOiTUxkb5uyCzsXIVZ3EIIePA9t2eUwfLbONSL+mH9X
         IPW/wxzo8Z4fs8U47tKteoh25zPJWx5xvaE5tj7+KlqAwNNKfg3i0cx12fIN2F7KdIXe
         easVM2w3tUqYfuv5pNL/9r7+sOiNshazeNRmtnlYPdIXpGgKCeIa1DJ8dI1W8dl7iizY
         vZC4evHH+DidG6VbspLi2xMFPfKhYwrbA0o/QvkCtR/uxOxhLAN/yo7xwzcAwRcCgkdo
         hqYCPX2NyFTzsgg6/uGiBHfPdFLhf5pZ8dYH8IKhDMZ5IjGgP1UM6W2An/CPGvwKxuZl
         Ks6A==
X-Gm-Message-State: ACrzQf3CIXqjXuyaLmbBZuBPimlHIpG90uEoNN8b5pse/JCEnqI2FCnL
	BB/mBDhLsmNBWYvVBB5eRnrDmA==
X-Google-Smtp-Source: AMsMyM4mHeFnX3w8YCr2wsNw66bw81ioiWfWld+qaCT8h6ltyUO0X1H0B9yBBV45mm3eQJY7kd2lZw==
X-Received: by 2002:a63:7909:0:b0:458:1ba6:ec80 with SMTP id u9-20020a637909000000b004581ba6ec80mr3057284pgc.414.1667028014840;
        Sat, 29 Oct 2022 00:20:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m18-20020a62a212000000b0056bd737fdf3sm585170pff.123.2022.10.29.00.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 00:20:13 -0700 (PDT)
Date: Sat, 29 Oct 2022 00:20:12 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 6/6] staging: ks7010: Avoid clashing function
 prototypes
Message-ID: <202210290019.CD8CB27A63@keescook>
References: <cover.1666894751.git.gustavoars@kernel.org>
 <34bf3ce1b1ca2da4c5ec8a6e26f31bbb9ca1c4f5.1666894751.git.gustavoars@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34bf3ce1b1ca2da4c5ec8a6e26f31bbb9ca1c4f5.1666894751.git.gustavoars@kernel.org>

On Thu, Oct 27, 2022 at 03:22:46PM -0500, Gustavo A. R. Silva wrote:
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
> Link: https://reviews.llvm.org/D134831 [1]
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
> Changes in v2:
>  - None. This patch is new in the series.
> 
>  drivers/staging/ks7010/ks_wlan_net.c | 184 ++++++++++++++-------------

I think the casts in ks_wlan_private_handler can be removed, too?

-- 
Kees Cook
