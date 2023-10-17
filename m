Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315001FD5
	for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 04:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ILL5R+1f"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2c503dbe50dso56164351fa.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Oct 2023 21:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697515357; x=1698120157; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RAFbn1MEbdJCwOyS7whJdaEX4i1Mt1tWVCyQLpsQFN4=;
        b=ILL5R+1f9lAOX3SDCpLE+IsBXNyM/Ok2YxtvteDm0sKMPdQYUs1LwPMnG6lzKy7klx
         sDOK9wV/RCqsJ5wysJt9lVQHu+aYMz2yTiD5rJP40jIfbjBf91AsVYNfoA30KqG9Dfqn
         Y4yoaM/ufHcCf9hLlyLtGy2n5N0dRW02lWZc1BJ7gjjS+crBVYJdeOZfNqF/6F+sbJmQ
         kha0gcjBgGMuChIZqYNXytY0n/lfMALrWHDpadFSPyqXGVYRSGf/68nBql3hQU7ppkoy
         kKy7xW6VCkbtk2OkGEwuO08zc8GWhu6mSWcCqJzfItIkd3UnK4EZmXsCeUmtO98WmiCh
         JU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697515357; x=1698120157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAFbn1MEbdJCwOyS7whJdaEX4i1Mt1tWVCyQLpsQFN4=;
        b=CW3NlwIJKphGZstWURDQq/RHxHVl2l9ekygscogYznLuLgZfEihfq//9XP7FtJPw4T
         XELITdk0iCp12I58Tgw8JiMt6G22E9ZCeeHlxWG2nra2cVPp4dA33+8Tb5pNjSvIy0s4
         gYKRxVc+/udOyuOUipoHo3rPdCMeLKFy/lgu6fOjGhblxxvu+VOidu1crG/AMFzX9S74
         gArl8MLxFBhSPT73msRbjzi6XlQuV0ijykCFPpapXjFFJ+OnB5nWI8SzkFY+2BF8dw2g
         Up4M33VusRjYAd3WAUG8XGHcCUPTkGSqhLdAaHz+gD0L6ReI3iJo6bKjbqPsftc/tVR/
         K1hQ==
X-Gm-Message-State: AOJu0YyzBFL88gPr1sc8pc1H6ZP+Ve5nSKYX7fwVPxjvDfUcCt5KZQb6
	548nnkFqtf4zW6UAmnXnYKVvKQ==
X-Google-Smtp-Source: AGHT+IFGKM4MqZPIl2yECM5ZvuixRBZJXyNJZUkfeDkxxPNrLk7s3L0yLs96bcpjTkiONIitq5f+3A==
X-Received: by 2002:a2e:390f:0:b0:2b5:7f93:b3b0 with SMTP id g15-20020a2e390f000000b002b57f93b3b0mr688315lja.17.1697515356953;
        Mon, 16 Oct 2023 21:02:36 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c26-20020a05600c0ada00b003fc06169ab3sm8531314wmr.20.2023.10.16.21.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 21:02:36 -0700 (PDT)
Date: Tue, 17 Oct 2023 07:02:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: Replace the occurrences of (1<<x) by
 BIT(x)
Message-ID: <433b9d45-bb21-49eb-8062-c03bcffa90ff@kadam.mountain>
References: <20231016201154.GA14625@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016201154.GA14625@ubuntu>

On Mon, Oct 16, 2023 at 01:11:54PM -0700, Nandha Kumar Singaram wrote:
> Adhere to linux coding style. Reported by checkpatch.pl:
> CHECK: Prefer using the BIT macro
> 
> Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> ---
>  drivers/staging/rts5208/rtsx_card.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rts5208/rtsx_card.h b/drivers/staging/rts5208/rtsx_card.h
> index 39727371cd7a..9d2504fddb13 100644
> --- a/drivers/staging/rts5208/rtsx_card.h
> +++ b/drivers/staging/rts5208/rtsx_card.h
> @@ -338,7 +338,7 @@
>  #define DMA_DIR_FROM_CARD		0x02
>  #define DMA_EN				0x01
>  #define DMA_128				(0 << 4)
> -#define DMA_256				(1 << 4)
> +#define DMA_256				BIT(4)
>  #define DMA_512				(2 << 4)

No.  :P.  Look at the lines around it.  Now it's the odd duckling.

>  #define DMA_1024			(3 << 4)
>  #define DMA_PACK_SIZE_MASK		0x30
> @@ -542,7 +542,7 @@
>  
>  #define BLINK_EN			0x08
>  #define LED_GPIO0			(0 << 4)
> -#define LED_GPIO1			(1 << 4)
> +#define LED_GPIO1			BIT(4)
>  #define LED_GPIO2			(2 << 4)
> 

Same.

regards,
dan carpenter

