Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A9629CA
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 05:58:38 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id w7so6863589pgk.13
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 22:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=R3mb2rhS2u7S3omh2zJdH1TEvW5cGjzt05hjTIDMHQ4=;
        b=RVsH2KLdLXQcpR2li5c2qSRrl37F8W3U0bhcLBVW/RO5gngXQ4sJUiLsVULF42xzaO
         BFTITyKD+iXSsf3jG3l+xxv6h/a5bujb9EnLriwo4vb0MHTSvo7JAYfnwqEwWMsulhJA
         rAymlBAtmK+JrYrPbwOkPBeGaZb+3gQI6Ui7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R3mb2rhS2u7S3omh2zJdH1TEvW5cGjzt05hjTIDMHQ4=;
        b=LjqBFYrRNMxRCG6e+byuRY4Gjt1+5yghdnZBrhl4VlbYw0rbvcz4ehNwlq0u1ZnoTE
         wmTmHk8XwEDT9sSe9Rnk8ROw2fqScON5vYQfjIieC8F9lPg/Aev6+p9JBolHmb39ulXV
         rPrVMNuDT7QS4shC4T6ayZTPSk3vkFC2m+HbGu8p0e0gMJjLAa7wro1MUoB7JkgkyfgH
         LA1fHvZe1BA8gPU572G9puY92gRq9ISU4XbkcJqOodAT0PGpysxzllsg4AEVMjT441PZ
         7N3RVZgGY5I0lBqa7/1kJx4OeBjqVd2LXaMnsp/A2TYl4r15uzpsGcu+LFvXaNykbBly
         /70g==
X-Gm-Message-State: AOAM532AA9ya5gsC9ufIveN5mRDIJeQtC6baeqP0EUKiAPQrR2c8n2i5
	ZugPV59UXlJQsGBjfEustPWqkg==
X-Google-Smtp-Source: ABdhPJy3fH8qpUID13Aan+Rrc1+kibcu1N+rmIx0QpCgZcHQ+UC+bjvDgoRjFp6Kng4ySbbLH11obw==
X-Received: by 2002:a63:d14c:: with SMTP id c12mr10917973pgj.412.1630130318435;
        Fri, 27 Aug 2021 22:58:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 31sm8517828pgy.26.2021.08.27.22.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 22:58:37 -0700 (PDT)
Date: Fri, 27 Aug 2021 22:58:30 -0700
From: Kees Cook <keescook@chromium.org>
To: Aakash Hemadri <aakashhemadri123@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng: fix invalid assignment warning
Message-ID: <202108272257.7396C4D146@keescook>
References: <20210828042949.2276341-1-aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828042949.2276341-1-aakashhemadri123@gmail.com>

On Sat, Aug 28, 2021 at 09:59:49AM +0530, Aakash Hemadri wrote:
> p80211_hdr->frame_control is u16, change to __le16
> to satisfy sparse warning:
> 
> wlan-ng/prism2sta.c:253:43: warning: invalid assignment: |=
> wlan-ng/prism2sta.c:253:43:    left side has type unsigned short
> wlan-ng/prism2sta.c:253:43:    right side has type restricted __le16
> 
> Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>

Whoops; thanks for catching that.

Fixes: 6277fbfdd29c ("staging: wlan-ng: Remove pointless a3/a4 union")
Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/staging/wlan-ng/p80211hdr.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/wlan-ng/p80211hdr.h b/drivers/staging/wlan-ng/p80211hdr.h
> index dd1fb99bf340..5871a55e4a61 100644
> --- a/drivers/staging/wlan-ng/p80211hdr.h
> +++ b/drivers/staging/wlan-ng/p80211hdr.h
> @@ -149,7 +149,7 @@
>  /* Generic 802.11 Header types */
>  
>  struct p80211_hdr {
> -	u16	frame_control;
> +	__le16	frame_control;
>  	u16	duration_id;
>  	u8	address1[ETH_ALEN];
>  	u8	address2[ETH_ALEN];
> 
> base-commit: f6bc526accf861728d36b12fbc25ac94cd057fc9
> -- 
> 2.32.0
> 

-- 
Kees Cook
