Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149461CABD
	for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 08:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vlie+sM8"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40839652b97so41876555e9.3
        for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 01:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698222666; x=1698827466; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0hEeygy7scrPA7fj42ymgzcDYZxtxZqez1lW3zusuZw=;
        b=vlie+sM8QW87H0A8qCHYqvOrEpttL5ttTVG4tc2km+tpkNeHEx/ncyURpYzgVPsvWK
         kkbJL4t27MO9OBfLiKtVO9ptVC6Rl08odsMhVi2SzgbctkuJHXss+bLa+T4GkHM/rNXN
         qN6v0amVq6CTns3TXdotxQQeO/4GNZPJEl2EkgM7aSHGDyYaRt4W9TjAhxCD1B/rLjsI
         IjelBZ7+y/avgVaMrDxPHH/ZuNzk6ipRBy6ZJaYKxpOCdmu5G6GdZiAHNClKZcJZIb9E
         +9GoIrc6DWlFHJAt6Fe7a2jr0Eb0UobEiampmdAbkFQZ/Iw2pH8vhNliztEywlGRjHOo
         9S8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698222666; x=1698827466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hEeygy7scrPA7fj42ymgzcDYZxtxZqez1lW3zusuZw=;
        b=f47gJxFYu0VssRC6FakOPIGwgA/6179HAGf+0F+xrIZ7dXtMAzkpE4Q6nGxagkWcV2
         QJ7hMLxvjsGnwFOoZNs62IgtIYfJaMnRYjBr26pT5E0W6yhU2Ihm05cPt1OPf3TmcBTD
         IEgCp7J57EgHrouZbpae30Uib75gv2kq5Y9shLZUAjl9oz+7ITpVwZgNXtgDWMMshXGo
         bUK6I4CV5Ypn1syAAFqHNRIZK+Qa79wJQ97x0dWb0hHfoiY4vbPOeZR3kcvl/6hC3c6t
         QZvDggS0i37HqfKplF7AZtQ8/c1CadfpI/d5W0UYfM7o0hF1tKZKwzF1skzWhijDdtJD
         tzcg==
X-Gm-Message-State: AOJu0YzBj3kIkV8xExnDOIJIqN5aJAoHY8A/ayLYmsJ0iHz7kMLVtd/U
	S+ubygNEreH1y01IrBh7MiUwmQ==
X-Google-Smtp-Source: AGHT+IGp6Sd/0vNZ+hERiSf9UeObvJhpUIG66ICJykxI+Cyxb4QchVVepUzSEQe9OH4SrpTlNEhetA==
X-Received: by 2002:a5d:5b1c:0:b0:32d:a61a:85cc with SMTP id bx28-20020a5d5b1c000000b0032da61a85ccmr17650633wrb.8.1698222666060;
        Wed, 25 Oct 2023 01:31:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a16-20020adffad0000000b0032d9f32b96csm11458056wrs.62.2023.10.25.01.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 01:31:05 -0700 (PDT)
Date: Wed, 25 Oct 2023 11:31:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: gustavo@embeddedor.com, outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.or,
	Julia Lawall <julia.lawall@inria.fr>, Deepak <dvarma04@hotmail.com>
Subject: Re: [PATCH] staging: wlan-ng: prism2mgmt.c: rewrite flexible array
 member
Message-ID: <30743075-7cfb-46d5-ae47-8e7053fce860@kadam.mountain>
References: <ZTjRWkqXeoS74E52@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTjRWkqXeoS74E52@lab-ubuntu>

On Wed, Oct 25, 2023 at 11:27:06AM +0300, Calvince Otieno wrote:
> Declaring zero-length arrays is allowed in GNU C as an extension.
> Although the size of a zero-length array is zero, an array member of
> this kind may increase the size of the enclosing type as a result of
> tail padding. The offset of a zero-length array member from the beginning
> of the enclosing structure is the same as the offset of an array with one
> or more elements of the same type. The alignment of a zero-length array is
> the same as the alignment of its elements.
> 
> Declaring zero-length arrays in other contexts, including as interior
> members of structure objects or as non-member objects, is discouraged.
> Accessing elements of zero-length arrays declared in such contexts is
> undefined and may be diagnosed.
> 
> There are some instances of code in which the sizeof operator is being
> incorrectly/erroneously applied to zero-length arrays and the result
> is zero. Such instances may be hiding some bugs.
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> 
> Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> ---
>  drivers/staging/wlan-ng/p80211metastruct.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/wlan-ng/p80211metastruct.h b/drivers/staging/wlan-ng/p80211metastruct.h
> index a52217c9b953..c8b73c867391 100644
> --- a/drivers/staging/wlan-ng/p80211metastruct.h
> +++ b/drivers/staging/wlan-ng/p80211metastruct.h
> @@ -71,7 +71,6 @@ struct p80211msg_dot11req_scan_results {
>  	struct p80211item_uint32 signal;
>  	struct p80211item_uint32 noise;
>  	struct p80211item_pstr6 bssid;
> -	u8 pad_3C[1];
                  ^
This is not a zero.  This is a one.  It's put there very deliberately to
"pad" the struct.

regards,
dan carpenter
> 
