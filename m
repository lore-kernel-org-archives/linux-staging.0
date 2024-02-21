Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452473D552
	for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 10:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708510727; cv=none; b=Mh5Wk9jHz1sbfALqDYt7A1e7MsIWIjDLhG4FVObMk69h97CPPigOeejSG/Q6i9rkaJUaV70DhX8JaH8VMj0jND4AiFsEP2hREq/P6AeIzM01KzLROTYY0plN96heofQ7FrH4L9/X1NeIWDus3OqOAJ5BC8Qm9wJUsfCOtmqS80Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708510727; c=relaxed/simple;
	bh=Kz0el0TMjoNI2QnXHyxF2PvVpo76TlArIWhUIRqIk4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CoqBlV3ouDHdb+bAGSBpdrjOaYwfNF/j7/5wHIZ65qdic7yLphrBce+nVDZ+q8ecA4pUwOLMw7tsZw2aHfebEayw00z17xOoCfrXLWWpj5k1jhZEjJC4wVmh1ob9pPwnDE7qB4OytO4km9rdli3I/AqyhgzmWcegiCe7dokEDc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w30bP/fj; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w30bP/fj"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-564e4df00f3so1433794a12.3
        for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 02:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708510723; x=1709115523; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOZWXYz0ax9PLPpkQLJdzcrN4l+8sAJvZhLzcXx8cHQ=;
        b=w30bP/fjmSkBayI4jDg56mgwbXk0nECVQjwAeqAA2rbcjK4rD1bjWujXKWHCwQDOpL
         9WSlCLfwzj9gcuD5GP9xPqFNwkymveUl4S8IFYWzxUJ6q7zMavcbFH8ee1ozaRjABKO4
         U03hpFFvFngpentOKV32geFNw3kfe17jxa/1tMbIIRnUfYzUdFtkyjnJfVV2Nvk4hOye
         YP2h9HBGAklGdfYl2KQGlDYqSDCeDtvKzj/lTq5TvjhPEuuRt/kT4di8e6AuYf8TAVWS
         wUWwFr/tV8O78UcPdspAwTo2BqMRFcaofpl/3b5++As2QgQYwerw5OJ/HMwEQ7w+EPlR
         5vYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708510723; x=1709115523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOZWXYz0ax9PLPpkQLJdzcrN4l+8sAJvZhLzcXx8cHQ=;
        b=H2NC6f/OdP2ZepwtxjKGCtYNIedZfiXscUKzCd3Ehmi5GygN5L5tH4k7oHraI4esGD
         D0r8XApBWbyKprym3vOQ908SdvgGKMbCrngZCi3KO9ssetrZjT26PGkm8YtLZ3M6KLCc
         WxBUEzlCE+0V8LFbQDZLmw7rLVzCVoCTsxLcrOzoV8KutAKhRhb8gmh62FvwNxoXuDfX
         CG5I0VNGuL5REaE/9QcDI8K/mCKINfC1ZBNu4JlIomz+ga5i9P+OgZtsScalOAaTsyYa
         LHLLNhCMebyb2k/iZUYB2wd0NqkHbtJSLGYemiytF38ikClfTSd4IasKoH4TnBvBWgSA
         WVsg==
X-Forwarded-Encrypted: i=1; AJvYcCX7VRECpV0Lr2VzKOShLaidTJAOhIVVTY8bRTnTJqNlYjgB35RNpWG9OaS9YzuTK1+vz8ZWu1Sx1EW4/upa74hd3+n453agAUDn/lSDjg==
X-Gm-Message-State: AOJu0YzMKGT5juZkNAOh7pLZcASIjkTEiCaKu/rlNZooymzx/0hl7kyD
	jS9L6R7/H/+TuCHioZo59HcXPVWf8La5WUjfLrYbuytDfLBmyzpBnAJtUNThMSM=
X-Google-Smtp-Source: AGHT+IEeRDPAMZ7wla9T06jLLenh+NdcXBE8k3BklG5ivy4o/djY/xTj8ppS5RuIiGGOVuLlBqRm3g==
X-Received: by 2002:aa7:c58a:0:b0:564:b822:9204 with SMTP id g10-20020aa7c58a000000b00564b8229204mr3848417edq.17.1708510723630;
        Wed, 21 Feb 2024 02:18:43 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id s1-20020a056402164100b00563f918c76asm4454659edx.52.2024.02.21.02.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 02:18:43 -0800 (PST)
Date: Wed, 21 Feb 2024 13:18:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: sawara04.o@gmail.com
Cc: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: fbtft: Fix "space prohibited before that close
 parenthesis ')'" error reported by checkpatch
Message-ID: <87f76339-3ace-4cbe-bdb9-266a86bf55eb@moroto.mountain>
References: <20240221095404.592464-1-sawara04.o@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221095404.592464-1-sawara04.o@gmail.com>

On Wed, Feb 21, 2024 at 06:54:04PM +0900, sawara04.o@gmail.com wrote:
> From: Kyoji Ogasawara <sawara04.o@gmail.com>
> 
> Since whitespace is prohibited before that close parenthesis ')' in a
> conditional statements, remove it and fix checkpatch.pl error "space prohibited before that
> close parenthesis ')'".
> 
> Signed-off-by: Kyoji Ogasawara <sawara04.o@gmail.com>

This breaks the build.  You could do a search for it.

https://lore.kernel.org/all/?q=define_fbtft_write_reg

regards,
dan carpenter

