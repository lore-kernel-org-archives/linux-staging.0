Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F7372
	for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 16:38:09 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id a8so16079045pjk.4
        for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 09:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rKvd8GPFgFZOtNQzzws03kml/1ydB9Y6K/jtiteL0wc=;
        b=mkunRimklcu7tq5sSrKfl+MZalwCsCE4vJGGtvK/+ezuV7gNnMBYCay5kpiCcnF0DR
         r07bEiI8kfE2zFDR77solHFcAHg4UcjgdwcGYlr7CUxBh3a2rlLuN9NjGkRit/PgLxIK
         fApuGfKI4bNzgewxf98oGVyAj4fiqfE+NFY3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rKvd8GPFgFZOtNQzzws03kml/1ydB9Y6K/jtiteL0wc=;
        b=TmJUU5y4WJ6YGGQRiPRwmY0slteSc74lQKlZjiKj5wUvUBVs78tctt0eQThyly/aTO
         ASmuIOX5YF8Fd8o3KesF7DFWVJosr6fpPZzWIQ/BYt4yjDENbzhsHGysqbTCPSN+wKae
         +fdMFeeHEL9DhncPoYJIdNzDB8DB7pRhDvNpddu6c6Qhb27pf38EQDmv4PAvX1mr3+He
         bcxGghPK7kvx18/g0cg7HR14egntVbJbgksgBnRrVGMnjWI5v2Y/Rz2obuUJ94g2fidW
         IfnymnSwnG1iPYT9Iw1U/NMq8p1iEV4yhAajBP0KPfTjq1JhS+wzNvlX1ddl6e7wXYmZ
         X42A==
X-Gm-Message-State: AOAM531W34MfMq95RNx+P2NfIyERgQEBYItRVeuVgrSzvBv4IXZb5C0A
	ih/Jk+P/JXw02ckaUhCh0d4z7A==
X-Google-Smtp-Source: ABdhPJwWTb+EHLsKayUYtAvOSVOUAdQtjnMHIwfubJ7iDXxddJbwYUHITnIGBY+2pLtZ3MYHoMtp7g==
X-Received: by 2002:a62:6042:0:b029:3e0:86b4:51b with SMTP id u63-20020a6260420000b02903e086b4051bmr3241725pfb.62.1628872688791;
        Fri, 13 Aug 2021 09:38:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q5sm2291199pjo.7.2021.08.13.09.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 09:38:08 -0700 (PDT)
Date: Fri, 13 Aug 2021 09:38:07 -0700
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: restore missing 'return' statement
Message-ID: <202108130937.7848F6B318@keescook>
References: <20210802143820.1150099-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802143820.1150099-1-arnd@kernel.org>

On Mon, Aug 02, 2021 at 04:38:14PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The input_system_configure_channel_sensor() function lost its final
> return code in a previous patch:
> 
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function 'input_system_configure_channel_sensor':
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
> 
> Restore what was there originally.
> 
> Fixes: 728a5c64ae5f ("media: atomisp: remove dublicate code")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I hit this too. Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  .../media/atomisp/pci/hive_isp_css_common/host/input_system.c   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> index 8e085dda0c18..712e01c37870 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> @@ -1646,6 +1646,8 @@ static input_system_err_t input_system_configure_channel_sensor(
>  	default:
>  		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
>  	}
> +
> +	return INPUT_SYSTEM_ERR_NO_ERROR;
>  }
>  
>  // Test flags and set structure.
> -- 
> 2.29.2
> 

-- 
Kees Cook
