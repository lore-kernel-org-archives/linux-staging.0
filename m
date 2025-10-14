Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587EA18A6B0
	for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 13:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760449990; cv=none; b=eJ6ZGxGKNHnxcJKCgslRh+gbTWfLY5eZ+YzXb4gX+J8S5cTrNLcX6G2mpJ9Dv9mLu6hp6WTgF76vztnEHCeXjTF681Y+Tk/D/mQvkLh//oXNdemBmbYIIS9IHlxw3jO6oXsXeYprzH6Km1yKcQFtdQgKxyx2ML7BJGahwTOVqdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760449990; c=relaxed/simple;
	bh=IElxN4QNGTGIaRmLgByL0OIhhUz5m3vPuXMGPnxLbRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWghI6vk7lhAGTZCrlIlyAlB2bzr4w89wFv6icg72b9cb9ypeR19IKlReY5TBG+vMFbr3zHK7Kni1oWK0+nPk07k4rdKLIirTp60b1SBIeV/v1IFV26v3USrsqqFsEqRwFh1ylk+KLKuhsdgeIQadeqIBWCL4ycSC+Om1SVJ6KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T0zyDPcq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T0zyDPcq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so43392745e9.2
        for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 06:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760449986; x=1761054786; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vYLX/V/IYNpEsTQWc+fcqDgIUy63VyLnT/A3MBhbEHY=;
        b=T0zyDPcq1P7FLVdoG/XKw0+zcpGYJKJlC/Qs2rE5A7UlW7ksaDACJpU/cwxa/kqy8Q
         CU9tjjz65NA45hGOQE7H9jwIYhOaNjLtUIelAOdaIlTP8HmCGaDpSu534LZCbKdoJP0H
         s8p0CVk7FPzYVS28DMQoQEYPSNTBz25k4iBQLUxTyBkPWophCUKPKKRhzgqDPEj082NU
         eq3yOVQ2LLzx3aHUxg3L+oOCFZfYWTYESx08CsdQZczCuQ7iLabKYaV0De5AVoVbBL+A
         cAe6okQ6eklUBsFPOYgCaXyvlzZeJNQZwWnppReQ/0P+9PzL+BMRY5NRF8oMS9XauZKi
         ut/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760449986; x=1761054786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYLX/V/IYNpEsTQWc+fcqDgIUy63VyLnT/A3MBhbEHY=;
        b=d+eO/w+kfF5JJtFOy/DomkCh0RL96txl+jDo2kr0WhYSfTIB1dbpr0H1mnrfCIyS3x
         AkSxEvEI6I5Sq/MLAr297yh5+3Xtmcdfx99Q60s97ZqCqDaRI020XB9fiFdpd4S7JjRO
         lgEbszUzwOiKocc6ttRJZMu84z5V7yNhjTJ5ab4wW3qvzmY1UJHuIpvNs5AtNhtPafL8
         TJtd2PkXKmVkXSpqqTdmLfUxsQqnlmiohHjOjlJOocNag0tu31+mxMA/QxgUMDglbt+Z
         1YpUgEW/DHjodCns3ye9dWyT5x+1v4lJlhvvgjaPXkN7KCZZvH2Z/MUT+EDSmOS129pW
         qr5g==
X-Forwarded-Encrypted: i=1; AJvYcCXRaFJA/rlPVWoxZ/i5CsHfONarDZ8ds9xYI+0aaYV4CWuq3/414hWyLQ5AQMlycHwhSqzXy03YQk6M4Rjb@lists.linux.dev
X-Gm-Message-State: AOJu0YwgDsaW+C4L2O9fC/P9YAquOF6o6QllwjhPl1um6sQF5lVnTzHW
	suY+nhdiDIMdXEsq0BLKk/Ek6blLgZTptdZl4RJfAYvEoaWpyDsi/55Hw9tbPtbS9Ck=
X-Gm-Gg: ASbGnctRY5akjV5xbt9BE/lRtuSZmIEg2VyateV/gJhfwgyRuZCQgAGfPBBxP0XSHPP
	J9w/JMCNds/LKowhxADS6CwkpINJQ8m/5ciWrT8r1/LJintMMUNIvccE5+mBbM7gsKvpqfco4kF
	56WR6Ymg6wWG8IenIvWofLzLSCamy7kKBKXp5y/6BRsXP1J74SazMOKVB/bYoCLpHvWW7GbfjG9
	H/WtPVaIY+UTmVpCDGQNTsa5PJKLfIqUpJTezWsDAepT1SXfinETHBfz7vVADPtF1hS82rvSOCk
	/rcmI6BStiOOoYovqOC6VwC0pkf2CpPkSB3ppoVUdn9iMPT7kTnxdjfHrdthG/ly3kM7GUU/UbT
	HuP4L5GB86FTOhgNTdcA/6gVLECXguUOZFmjkAyUqJsoZJn36CfE+GFLKgpJWaA==
X-Google-Smtp-Source: AGHT+IFcYBoVH6SZ1b0n1fUVs59heTV+uMc9my9gJaVg1Bkdl7LM1WLOakMGVQ2yKdbkJej4zbdLaA==
X-Received: by 2002:a05:600c:4ed4:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-46fa9b08be6mr157473195e9.26.1760449986537;
        Tue, 14 Oct 2025 06:53:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fb483c7e0sm244106135e9.7.2025.10.14.06.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 06:53:06 -0700 (PDT)
Date: Tue, 14 Oct 2025 16:53:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Cc: gregkh@linuxfoundation.org, johan@kernel.org, elder@kernel.org,
	schopin@ubuntu.com, me@abhy.me, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: documentation: replace strncpy() with
 strscpy_pad()
Message-ID: <aO5VvrKTswmfO-n9@stanley.mountain>
References: <20251014134148.2597178-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014134148.2597178-1-vivek.balachandhar@gmail.com>

On Tue, Oct 14, 2025 at 01:41:48PM +0000, Vivek BalachandharTN wrote:
> strncpy() does not guarantee NUL-termination and is deprecated for
> NUL-terminated strings. Replace it with strscpy_pad(), which guarantees
> NUL-termination and zero-pads the remaining bytes, matching the fixed-size
> firmware tag semantics.
> 
> Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
> ---
>  .../greybus/Documentation/firmware/firmware.c        | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
> index 3b35ef6d4adb..deac8584841b 100644
> --- a/drivers/staging/greybus/Documentation/firmware/firmware.c
> +++ b/drivers/staging/greybus/Documentation/firmware/firmware.c

This is sample user space code so the strscpy_pad() isn't available.  It
will break the compile.

regards,
dan carpenter

