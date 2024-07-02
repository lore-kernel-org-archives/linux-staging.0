Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD5C1B4C31
	for <linux-staging@lists.linux.dev>; Tue,  2 Jul 2024 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719927964; cv=none; b=UldgJWxsFd0V9J8ghC1HVkj8fGOqjOyE8Ln8hFyCPejC+V0fcyN9TbxbVR0mgyJMn4LPlImiM5wfUtsh+c4huiD+QrVoE6D00H23lhFUBbpIEy+zsv9LGFSNc9ajvwBnafkRhCiMRh/KZN8wBlRLih157KdSlIkR2BjXSeixnyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719927964; c=relaxed/simple;
	bh=VGdyH+yFJZICp/mwbvFetq0ibB2CUajUHzE5kfWvTEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntJw2CrDKciUbi7qobrYxE8ITDzhpdJRxM8cTwTfUR8FiLNywqeYZti+/oBqP2afSW/bx0KceXXXAy4RM7NdFKzPzUNJmZdJJo9BcP5tIBSdcTyRYPB1Wiht/S4Wmi6O1M7SFYodRuMuKgBOCDnS6wgzU9tFXMY0FSh3dj5IbUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O3AynTQw; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O3AynTQw"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-25e00f348e6so151675fac.1
        for <linux-staging@lists.linux.dev>; Tue, 02 Jul 2024 06:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719927960; x=1720532760; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NiyhmXpZS1r7WZeDrgRFtefnzEGTGZ2jJsCR0mdYOhA=;
        b=O3AynTQwWEiqMzJkfDAvY1aL6U3yDjlYVZsL+TkwqZGGVzlPoWYWISnVmWYi3wbNJg
         Ekq8nrKtmeEojO9VXVsfXTn0/tJtOTxS1QzbXNo5gTeTsCl1jnkal/CKvvd+z1+kEVTa
         g9x6O+j0MRKfcD2haSMayOYUpzzHVQFJ47TOH2nLIGPnlDEbYiT7M3Q6rjBuSO6UX/pc
         ycxkm7ek2Reqp5LZCxnniPBFAzgPx0fLylb7g8yH3VMkW/pLpv+YcXRqafLTKxSyEPxA
         jW0hoiBKIMtuE+FX01uxqW0ZREqe1zkqwf5ibJh+IGHcx0AltL5yiB8Or2q1JkYGOlFs
         Y1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719927960; x=1720532760;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NiyhmXpZS1r7WZeDrgRFtefnzEGTGZ2jJsCR0mdYOhA=;
        b=mRlB8uDrO3falyt8UEldbKe6nIcGzUmSSdfXsjI090AcozVPIbCm0xKVcJqrjQ/g8N
         TEI4THbC9XHY7V/cGJq+f2DiiiBQ9vKo6C3c8M58mDf9cP1N4ypoOvY2Pf0eYFZn8bO0
         Sl5h814ziEtvelN54uzJVKh8j5AXY9hsGHrohBqjiP/v6uv4KZo8Bj65fcdRdu3ih5HM
         2YQDnJ+qSC2zCRnck2pY/8wRA6BpeTuToL38pvi+AAb6IKicLCBZzG99nT1lZjpgdV6J
         FHhco7EjJ/PNP5lsxKxxhuAfZoS0K5X6MVtbMI/ViH8pJm59Hk4g8ZViwxRSjNNb+6zG
         /EnQ==
X-Gm-Message-State: AOJu0YyJxV321jJnjiU2Dh66C5yNlV6N8sGnfox5xZZ0ovirMEPv+4xS
	ZwMddd5EYijUyTTgVqUuofyD8Nw8BsEUeT77kCuyiSdVdkBu73/JESwjh9vKwP4=
X-Google-Smtp-Source: AGHT+IFpG/+NxuDQTZzifvzctc9H1OWBvWlhgyHr9DRMBTOjzX5KQcOawMFkjTy2lBWhf7Nw/PdOiQ==
X-Received: by 2002:a05:6870:6494:b0:24f:ebcd:6aa9 with SMTP id 586e51a60fabf-25db338f930mr7423045fac.1.1719927960594;
        Tue, 02 Jul 2024 06:46:00 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:a6f1:b7be:4c8c:bf62])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25d8e1f0490sm2227612fac.20.2024.07.02.06.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 06:45:59 -0700 (PDT)
Date: Tue, 2 Jul 2024 15:45:55 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?=C1gatha?= Isabelle Chris Moreira Guedes <code@agatha.dev>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	=?iso-8859-1?Q?=C1gatha?= Isabelle Chris Moreira Guedes <patch-reply@agatha.dev>,
	Jookia <contact@jookia.org>
Subject: Re: [PATCH] staging: Fix missing warning/taint on builtin code
Message-ID: <ad745b51-0aef-4a16-95a4-3514846e6504@suswa.mountain>
References: <yf3ewok3u7fu7f4yqlcovcvedkhyjtibvwzlgbcjwf7ijcsktt@vrk54srlnk2n>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yf3ewok3u7fu7f4yqlcovcvedkhyjtibvwzlgbcjwf7ijcsktt@vrk54srlnk2n>

On Tue, Jul 02, 2024 at 02:44:31AM -0300, Ágatha Isabelle Chris Moreira Guedes wrote:
> diff --git a/init/main.c b/init/main.c
> index 206acdde51f5..fca889f3bcc0 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1602,3 +1602,23 @@ static noinline void __init kernel_init_freeable(void)
>  
>  	integrity_load_keys();
>  }
> +
> +#ifdef CONFIG_STAGING
> +/**
> + * staging_init_taint() - We need to taint the kernel whenever staging code
> + * is initialized (from built-in drivers) or loaded (as modules) and issue
> + * a warning the first time it happens.
> + */
> +void staging_taint(const char *code_id, bool module)
> +{
> +	char *code_type = module ? "module" : "builtin driver at";
> +
> +	pr_warn("%s %s: The kernel contains code from staging directory"

Needs a space after directory before the quote.

> +		"the quality is unknown, you have been warned.\n",
> +		code_type, code_id);
> +
> +	add_taint(TAINT_CRAP, LOCKDEP_STILL_OK);
> +}
> +EXPORT_SYMBOL(staging_taint);

regards,
dan carpenter
