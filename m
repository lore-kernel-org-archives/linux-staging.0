Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8F0154BE4
	for <linux-staging@lists.linux.dev>; Mon, 20 Jan 2025 07:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737357362; cv=none; b=pYBRmq5WYW0JmpRTuQ7pNvUMOF6i6uU4y6zYg/nISRbk3jjBJRgLHHgQgXVdFbS2H5gR3+SgsDaMi/U/CrOnzE2DO+ohEo0vAvO/GFSNs7aPkZyBqb/qogo3kXy9BoHR/bXHuFkylK+UwasmCw3KenPSypQGZ/9uMdX3IRHXzCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737357362; c=relaxed/simple;
	bh=dUrTKTQ8k2DVd2fHNKr/UwFGXTE9LkTppiUxU2s52pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTA0CTuB7Z31gyQBdDOmIVBoZNFbO1svRYM+1naMftwfGZFAyQ4IAz9iFw2PmmliSKkT3MOgvezxm/MLN/oZwro5qHK9bvZapbVyhCeeSzVfchJb13WqhSoHpFtLjhGKY8Bk/cBgEmXZwwiQQfOoI1stqyrbNUkNZxFwnakfzTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HAM9qx/d; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HAM9qx/d"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso25557505e9.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Jan 2025 23:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737357358; x=1737962158; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MA1HgMl8EKMjR7RR7euObrXd/SWSOhY1b7QdaFCBVkU=;
        b=HAM9qx/dag3pzvjiWs51HwbAMd4689fVgHogqdP4LoVgLZzlhjTEEpNCvORJ83zR17
         1wjmxRwAulFMTiCL8OXTfBv1PIRyj+LP+7yCTMzjZdRZXXq8MDyWhmwTXx691ulvX4PZ
         WcStJ3mtGgEboGUmXQWcJXkJZTaKsLEQhVEs00V8UBBFUqEAzM2xkWDBqolRf5Qb3CVw
         6jdHEHMyRjPg/rtBx2PoOweC5a/G2lZ+ZqgcWJT1pvlT6JlEwgPQyxWY6k9dp5dSB9qn
         FQBz8FQnRJWYMqt6n+zDTvuDst2dFXh4lbSUGTPKvt/y1GY6Zbltw3M0VyaihSwVq2kx
         BZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737357358; x=1737962158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MA1HgMl8EKMjR7RR7euObrXd/SWSOhY1b7QdaFCBVkU=;
        b=OTuR82lrVyuErCBS1tudllqwGNs7GQKMxCQcr+JXdpMAHrpsRrYebRuQ+BKi24gPnk
         ViZWW5oJiVvYrbwM2zvlheNMwBCKdEGj47SXw8TOabSqac7I+NYHS/NB7IU7YrhAVRqp
         pRy8AG4h4hVqQ10pux8tskbCXn167moTr7Lx9/aVUEtOka8Jvoa1h05U24Fy+cxW3paO
         mpaWoTkEvSp3+XVc9RTsI98zhtAppZFUf1u3CifL1ebeuBSZli0tgBVqinfrhF6nRYx1
         J/tQQIzt4QHeZApYH/+phVPzb/6ME0cSCDd7ncCPfARCDllYDnQ+rN3YSJyvIWIpjtma
         hm/w==
X-Forwarded-Encrypted: i=1; AJvYcCWc3pMTHuQOZijNq/kwVw8cXZ2jxYcVk23hCAQaWQaEHlUuYnsXOInOV/DFchrTZGljt/PxNFk3my4CV2al@lists.linux.dev
X-Gm-Message-State: AOJu0YxRosBNGbOjuZZxkZDZFzWKE/WG8zYTc5xjNzuAUgUO5zsHYhBd
	owYfYv0Emir1qPrpQDmy9vhkvuTTfahI4xgzjNW+snFg/Fp9KXaFho04wNaG7aA=
X-Gm-Gg: ASbGncshVRnN3ydXjtNPV/nwmHCNzCE9UxTaysP7YxDrB3b+MSO6983RnMUy3skxeQx
	VJqEOIxiBoPKbPTWslSUIFnknMYI0MSQq9TOMAzUgqDq84RmacI5t7SHaqTnqNrQpP1MndVj6rS
	IJT/+s+hMu9fcdjRdZtyiEeHLtaW2zieEdDQ0b/f8lvruQsAh+idbkapf9fSS4A8ZmLsz1vvO91
	AWPDIowYQKcY4Ct7du7SP3ssshBIcCfbfHh+KLxggl52sxo2yHemTDb3UgDesYYwp4prZS9vBk=
X-Google-Smtp-Source: AGHT+IERRIZCKiArrcq0oJ6aPPKBpbgYo3daA/k+bR56VTNm6OLwXRxjcuqW8bkAXiQf7JhMN2gURA==
X-Received: by 2002:a05:600c:26c6:b0:436:1af3:5b13 with SMTP id 5b1f17b1804b1-437c6b475f9mr184360455e9.15.1737357358613;
        Sun, 19 Jan 2025 23:15:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904086cfsm129133155e9.4.2025.01.19.23.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 23:15:58 -0800 (PST)
Date: Mon, 20 Jan 2025 10:15:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: gpib: Agilent usb code cleanup
Message-ID: <3a31262b-6bed-4f74-b00e-a124a9486e07@stanley.mountain>
References: <20250118145046.12181-1-dpenkler@gmail.com>
 <20250118145046.12181-3-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250118145046.12181-3-dpenkler@gmail.com>

This patch does too many things...  It should be split up.  People
complain about this requirement a lot, but eventually it will become
instinctive.  I use `git citool` so I can highlight and click to add
lines to a commit.  In this code there were some dev_info() changes
mixed into the unwind code in ->attach() that were hard to separate out
into their own commit but it wasn't too complicated.

On Sat, Jan 18, 2025 at 03:50:46PM +0100, Dave Penkler wrote:
> Remove useless #ifdef RESET_USB_CONFIG code.
> 

patch 1.

> Change kalloc / memset to kzalloc
> 

patch 2.

> The attach function was not freeing the private data on error
> returns. Separate the releasing of urbs and private data and
> add a common error exit for attach failure.
> 
> Set the board private data pointer to NULL after freeing
> the private data.

By setting the private data, this patch actually does fix the
double free that I mentioned earlier.  It changes the ->detach into
a no-op if ->attach fails.  Needs a Fixes tag.  ;)

But I still hope my blog will convince you that the error handling can be
re-written in a better way.  It shouldn't matter if ->private_data is
NULL or non-NULL because the caller should only have to handle success
or failure.  The caller shouldn't have to handle a dozen different
failure modes:

1) Failure but the ->private_data is NULL
2) Failure but the foo->frob pointer is an error pointer
3) Failure but the foo->frob pointer needs to be freed.
4) Failure but the foo->frob pointer contains other pointers which
   need to be freed.
5) ...

It should just be

1) Success: Everything is allocated
2) Failure: Everything is cleaned up and any accesses are probably a
   use after free.

> 
> Reduce console spam by emitting only one attach message.
> 
> Change last pr_err in attach to dev_err
> 

These last two can probably be combined into one patch?

> @@ -1388,11 +1367,19 @@ static int agilent_82357a_attach(gpib_board_t *board, const gpib_board_config_t
>  	retval = agilent_82357a_init(board);
>  
>  	if (retval < 0)	{
> -		mutex_unlock(&agilent_82357a_hotplug_lock);
> -		return retval;
> +		agilent_82357a_cleanup_urbs(a_priv);
> +		agilent_82357a_release_urbs(a_priv);
> +		goto attach_fail;
>  	}

In my blog talk about how every allocation function should have a
matching free() function.  These two functions match
agilent_82357a_setup_urbs() so we should have a single function to
release the urbs.

regards,
dan carpenter

