Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA7C2F6927
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 08:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771574916; cv=none; b=MBvL4RAvZOrcH7p0InoI1fl/D2oSgIRqMO5Pkad1ne3g2T8UpBOWxEw1jWJq1M8+k/8uvJ9+CBDXKkQQgA2pS+LyKvj2xVxm0fl6LcoqTsGuv8eWk2JZEXMb5kBWIqThezXwBLYh+L0tDlMBURahaM0O+sWF/K8inBmvjM5ay4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771574916; c=relaxed/simple;
	bh=xUjfoouKyYB3IsvJO8ZYZ9AbvYHgrq10uRETmPCEXfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7IhgAxLB0dnptp7+LvOFSfcZsGudpw/+ZWMurH3PLWyr2ds2y6pYL7qIs3b9jlb6hlrrj0YF8K5EbjjqzWCt0UQaH8NmDzuyZFH6ZAzlwPIA6R/aQkDL5YZ//jOs18iXaHbfFIrZhtKx6Hn1+JJBGTCuBMcDZDiihMF3N3WYG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YBob6R9w; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YBob6R9w"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so19381465e9.2
        for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 00:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771574914; x=1772179714; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PW5/Tx2f7vm6B1RaJRWVO1XGu49Vd/tH4yy2gBO2bc0=;
        b=YBob6R9wFRpQZUP/DCuS4f3R7L5FPyQB9cPPdmwRo9eXpsTPyEmIA+uwzqmLTYV6LR
         3sl2nuZflpRFVdFWuZ7Uet2Zx5N69pFU8vS7Wdo16ZbZhHYvHi7uC1MGWR27tqw55WJv
         qZSL/FSH9t3LTj9Q2KkJ9AYyQgjN06FyrgkhTZHcw5v+FZwCr6bE3yOTojumgyZsv3sb
         ONwH4EBIMZvpmZ7GRP8mnb8Kh1Udc43SfeXt3e8gZTH3IP+ebi2yUB/OlT1Q6gfVp1ck
         /VuRsar0BkiSPglEvQxpVfAM3Il6NDFNjkcxWcHWDFFNobak2O2FPB/PoUyZEXA92WX+
         XEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771574914; x=1772179714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PW5/Tx2f7vm6B1RaJRWVO1XGu49Vd/tH4yy2gBO2bc0=;
        b=K6xhymQ8Hhadf3SHMjsgeA4qHLLAxqmSa3X6iK/HgWCFE8VSBDZRcIW1ZW4A+ZJ6Ly
         MoJ670uERFA4pJE4jNIgg0uJ8H5zqtEFmctZwZo2o1d4P0SkLUQvwkaazuqmZptcUQpF
         xrD4KDenN9eRIz0NHLt+E3KXS9T4no5T0OYaMxmIPXTzUk1WmRuzt9/Kk7DkHqQVwqRp
         5WdQTS5N2yz0/8k49grbV5X81ikjVzJG3oMngrZ90IWQtd8Wn64MMalFf+7QlpX+6wJW
         1cZNcSxqiLeHqzMLz7jDNjGHs71UYNssxCixdEX+M0zm/oSdeAW9s/zjbD8I86KsNSrd
         4scQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3JcYoILORPnGnn6lCX0J1mjOs+8xqz+QOniIfclFWfjvYkhwE6yH9Ax/JiA05+M21O9YBX1fxTrnAcCWq@lists.linux.dev
X-Gm-Message-State: AOJu0YxbL7vPXQmSsvdVVw6HlIwhTzP1vNaEdhi6p1ZwhaWG0HiCvwk+
	btS26lTszUseXFC6C8q5mS9MKCsIfeOLwLjcHvGI8yV4tW3aT2RZSxf26YP6URe7Olg=
X-Gm-Gg: AZuq6aL0Qfs7B1ypbZ+rs+fWGP9uyYyE2NHfWOTjj2jIhCvemgLxSUXgAAC68LsKSrQ
	05ef3mP9p1SAqjcvX5DcWsvFM2dLHK+JrzLxjubQmY0SHJ8z4jEUdsVVJpP61jmuMzchvrXgj0o
	qAFIP2XaTmDOvpzzWG+c5jVM5xY7Kv3yUPK31aRqXnwN7tC17sxRt3aUKBlYsUBBgPQ54NaCnn9
	/rZq2ZCa9npFk+7n1NcQBolgrhExjifpBbLdvcZBQ0jSvQccwzQrg2Yv7faj1ET6hS+WzE3LZ1Q
	4V5AckoMjNqY2Q56T1KN8Bh1TnJBGqbS6DCXCkfTqJe1m/s8GVvzF6zwOJRg1Lpaoz6yPTm3K3f
	G4Bpezwr3zDeZGZMkKslBqEUO0Q7MqHg5iiFdm3scJXq9edvXJiF5gyepNggaoGTZ0a2jXwozVv
	7lBa6hWJA5FSDnw5Uu8EyTOx3fvscl
X-Received: by 2002:a05:600c:1c20:b0:480:7162:fa48 with SMTP id 5b1f17b1804b1-48398a549ccmr139543985e9.13.1771574913565;
        Fri, 20 Feb 2026 00:08:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c048bsm59429125e9.7.2026.02.20.00.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 00:08:33 -0800 (PST)
Date: Fri, 20 Feb 2026 11:08:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hardik Phalet <hardik.phalet@pm.me>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: greybus: audio: fix NULL dereference in
 gb_audio_manager_get_module()
Message-ID: <aZgWffV8wwa3MDW1@stanley.mountain>
References: <20260220062741.399677-1-hardik.phalet@pm.me>
 <20260220062741.399677-2-hardik.phalet@pm.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220062741.399677-2-hardik.phalet@pm.me>

On Fri, Feb 20, 2026 at 06:30:10AM +0000, Hardik Phalet wrote:
> gb_audio_manager_get_module() calls gb_audio_manager_get_locked(), which
> can return NULL when the requested id does not exist. The returned
> pointer is dereferenced unconditionally via kobject_get(), leading to a
> NULL pointer dereference.
> 
> Only take a kobject reference when the module is found.
> 
> Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
> ---
>  drivers/staging/greybus/audio_manager.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/greybus/audio_manager.c
> index 27ca5f796c5f..1da8804e61ca 100644
> --- a/drivers/staging/greybus/audio_manager.c
> +++ b/drivers/staging/greybus/audio_manager.c
> @@ -111,7 +111,8 @@ struct gb_audio_manager_module *gb_audio_manager_get_module(int id)

I don't think this gb_audio_manager_get_module() function is ever
called.  If it is then we need a Fixes tag.

regards,
dan carpenter

