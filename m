Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB491ACBB
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 15:10:15 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f78a32266bso37538855e9.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 08:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686150614; x=1688742614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aYJqhoKXaC4L3HtC31xSAXOYfzHEq2aTFT52lzn1B2s=;
        b=mgE9+GvQBRH3zIari05XcJlVmTNJTT/WUbO+P+8yk5mZJ1NBrSPBEOXQ1fV+0Vc+z4
         FPUIat5OAKcwPP0HGXiIwqKTAsBRB+eHcHmXNiRZnDSZUdFFFLhsBtxQ/DYh9wMA/4Tw
         fZIgoerToGJ5ro/BxTbuLPQ7XeYlX/hi/8OOuM2qmiLdNW9ifCeT39swFYeIHviabE1A
         HoMlzIFfiFvFXOIhKCLGLC6XtdfujU5nPTHEyhTmLKMdlQFRNG0IzGNhulsP5Wp07v5e
         VzuHaHS9mR4JYwb65WVjM+qqO6JWMUqLwr/2wUMXpVMlw7OyF6QnoUfV5yFVWVOMn2mx
         NZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686150614; x=1688742614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYJqhoKXaC4L3HtC31xSAXOYfzHEq2aTFT52lzn1B2s=;
        b=GAvPlxJAazW1SAXcFRjITpvtnkQren4m9gqeSBY0nq+cxlgPgQnWtwlaX0cYnk6xZk
         k93oVxuczIU2UfKl5/d0s6Vwkzl6wQ9bg7P3RRMJgxqFDzlghYAGBFTL0ymlLIcR1GyW
         H7T6tckFycueJbEfae/pOGVXO12gbVukyTxD7+TAso2/pQDns2d0xTR63h1soxdBPSE1
         PL4ErjGmfBGn1CTEWWoAncAQq20XUVNoi3c+Jmj07CKrx/b0lvO7wAB7LUAiBGiJtXPe
         3uLfD5mhn53wICRT8/kWaJVIrJyXkgipJJqJ22Zd/v2WdjHnYdSFXVoyDJkId4W2DDdf
         9AxA==
X-Gm-Message-State: AC+VfDwH6ly+gk1vvzjs0FWd2M74leIAYKojKYef422V1LPbuMkUxN2K
	foR90OBZ2Xwq5vOqd8k8b5m2LA==
X-Google-Smtp-Source: ACHHUZ44Da3K0ioAg/XbvI0Vd3z82OxCYmqb10WD28MALYbP9uc5wTra1eZdRd4kj0dd6UlheM7nmg==
X-Received: by 2002:adf:dd06:0:b0:306:3ded:2bf1 with SMTP id a6-20020adfdd06000000b003063ded2bf1mr7476716wrm.60.1686150613947;
        Wed, 07 Jun 2023 08:10:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h9-20020a056000000900b002f9e04459desm16017306wrx.109.2023.06.07.08.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 08:10:12 -0700 (PDT)
Date: Wed, 7 Jun 2023 18:10:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yogesh Hegde <yogi.kernel@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Trivial code cleanup patches
Message-ID: <c7cf6067-1940-45a9-8c8d-42475648017f@kadam.mountain>
References: <cover.1686149467.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1686149467.git.yogi.kernel@gmail.com>

On Wed, Jun 07, 2023 at 08:31:19PM +0530, Yogesh Hegde wrote:
> These patches remove variables in the struct rtllib_device that were 
> set only once throughout the driver. Instead of using these variables, 
> the patches modify the relevant code to directly call the corresponding 
> functions, eliminating unnecessary indirection and removing CamelCase.
> The patches are required to be applied in sequence.
> 
> Yogesh Hegde (5):
>   staging: rtl8192e: Remove variable SetWirelessMode
>   staging: rtl8192e: Remove variable SetBWModeHandler
>   staging: rtl8192e: Remove variable LeisurePSLeave
>   staging: rtl8192e: Remove variable InitialGainHandler
>   staging: rtl8192e: Remove DRV_NAME definition in rtllib_debug.h
> 

These all look good.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

