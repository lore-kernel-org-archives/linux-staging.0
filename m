Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43F21FCE
	for <linux-staging@lists.linux.dev>; Mon, 15 May 2023 06:41:32 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f42bcf5df1so67223455e9.3
        for <linux-staging@lists.linux.dev>; Sun, 14 May 2023 23:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684132891; x=1686724891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4JUV54jxuxM8izW+Nmy6rQqIr/WYQkWVKP15cwdksrA=;
        b=ZVkveGWgomXKeIlwVTMBphGGgTimP7KoAgnn6TYC98GBR/DnLjwjAYhnzwNZUwErpo
         9NLxbZyAsZ721Id6dA8lGXvm9ZZty7hy7ReNT/0SEWkwtRKmmw++jWKmE3Ox3m421YWZ
         ey3gCZyRa0fpZ8EsDVIVS5F0YmjpWuzttOwMdIG2Des4gfjA2b41pNwD9/36fTUm9ABA
         F+TFSQjW0EuiRStiru9w4G3OVLnzP1jj2Sa4P8RT3sd8wm3Qi/xv9r/DGcsQ0W3CAgXU
         eXYI/CD5IrYp5c/BeVHF4V0GAkukRwkcufmAJOAEaTnOHiQtOF0W0i6e5ZwW+GqupTvA
         N7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684132891; x=1686724891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JUV54jxuxM8izW+Nmy6rQqIr/WYQkWVKP15cwdksrA=;
        b=UIRVNfq8WtIHKGG9I4omiIEqncdxYhlXfwbMCfLIoBvlMV//+B6hdq4Kicimz3f4KW
         vs55kY7Y1kdGbA2iDaqhSHlmI0tU5svbHELSb0aTdLJaxbCXXGlA/A5wvlwn/JNJn+OZ
         8OOe8NDElU4k6cg0pBvd1BcNKFwQsjiHghjR/08ZtxkVzFDbc3vYlStuWrU1K+h24N7w
         k8ffR5zB7J0mGG2ud/BX7/9iXrDwfxZYoffaLrwu3M0EaAYgmyiFkgzj7k7nJPyWTAj7
         MQGiTVygTwkNyIFr+p3bz1Tq/AW2IudcrjomIlyukodwcp9ILZDqC0GAHvmPaAsSs//8
         tbLg==
X-Gm-Message-State: AC+VfDzdkBDtCxs3ymXgSKpToDW9diYh8EsQpDAAId2Yi1HnrKPBXQnC
	SZplcH2jq+neDGIuLFwHEXBXKjp5C4nXF2EK2Bg=
X-Google-Smtp-Source: ACHHUZ5QccdWX15ir5CHShRduqKeviU8fkV9rD4pasaLI5GVhsdy/9fKc7RdjErEbgvhePQDsLWlSA==
X-Received: by 2002:a1c:f204:0:b0:3f3:f7f0:2203 with SMTP id s4-20020a1cf204000000b003f3f7f02203mr21849565wmc.12.1684132889995;
        Sun, 14 May 2023 23:41:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e26-20020a05600c219a00b003f50d6ee334sm961890wme.47.2023.05.14.23.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 23:41:28 -0700 (PDT)
Date: Mon, 15 May 2023 09:41:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: rts5208 :rtsx : fixed  a brace coding style
 issue
Message-ID: <0ef95ba5-e001-4dec-a834-cb81a9b35ec8@kili.mountain>
References: <20230514030940.4820-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230514030940.4820-1-kartikey406@gmail.com>

On Sun, May 14, 2023 at 08:39:40AM +0530, Deepanshu Kartikey wrote:
> Fixed  a coding style issue
> 
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/staging/rts5208/rtsx.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
> index 2284a96abcff..0ab9355873f7 100644
> --- a/drivers/staging/rts5208/rtsx.c
> +++ b/drivers/staging/rts5208/rtsx.c
> @@ -399,10 +399,8 @@ static int rtsx_control_thread(void *__dev)
>  				chip->srb->device->id,
>  				(u8)chip->srb->device->lun);
>  			chip->srb->result = DID_BAD_TARGET << 16;
> -		}
> -
> -		/* we've got a command, let's do it! */
> -		else {
> +		} else {
> +			//we've got a command, let's do it!

Don't change the comment style for no reason.  Try to be consistent with
the rest of the file.

regards,
dan carpenter

