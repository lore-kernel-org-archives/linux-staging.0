Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4982312E4E
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 05:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710308839; cv=none; b=j2aURC4WWrhTNkGxe/+wW4znhaxr4DqESqzoaWGii/VIf6Y+A3W1JsCYBhxxHsHzARp2bqSpyPVLHrj+YEWkki7Gc4/xuAVzokdU1bgYUMverOSDRWOktslFgN/S5rHJAKWLAZ6GaSuSD9clHJrZd2iaf99/meKSw6kiMN4RFm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710308839; c=relaxed/simple;
	bh=XyJjIP3N3pEfS6auuifybHfrxfnQVY1JT4z5GvMYXjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbKVaI3cAtavZBVM3uMXZ1lJCjHpgRs8UyvK4Fvh2mO4/IfVH4Ib/eJ8NF5saK3A4gbBwW/SSNiGm4kE3B5ksRbNekwSeMkPDwsFMckMotXZINqmwtL1UjoqiGaOllYeud3nRDPTjRKPIN4/l8lhxhsuX8+xgNpDHasoOPmlX1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GvnQLzL/; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GvnQLzL/"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56838e00367so854501a12.0
        for <linux-staging@lists.linux.dev>; Tue, 12 Mar 2024 22:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710308836; x=1710913636; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1rNabkQK5fwhzB8TbiWGYIspOvr3QURMvFrMa2kcQL4=;
        b=GvnQLzL/Py2j7bwmaAEe6wRgYu0DYrzC52pS+9sGQaRFSLJoWNB9RMhOWVEYgJq6L8
         Vr/D2RTUnaFx6MwH6XtNqJqaaEKh+IVqqJeDnpr33YSqY5+n4U1lcsGvVUpfTsZ84DB/
         S0Bh+fGE5lMEmvBcXDfyWn3Mcf79M/rFSqCv6n6g8oVGpT7STs6jFTGHTM8oY3zHFg80
         rBczjvp0eSOHjy4JIo7Nve61g+gyAaeC1SrTC08nJcv0dlpEebLJttPcqMmYuR6Y+URx
         YApFCa3rwcoIlm6K/efyYak5dtvZ7FuhkwlH39Ktjt4CD0Gpo7fd9Ij466/gWt3JAyWY
         yjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710308836; x=1710913636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rNabkQK5fwhzB8TbiWGYIspOvr3QURMvFrMa2kcQL4=;
        b=PCa2HFHNCu/Z3Fy8Lse+cwDIQrUYjw1rAJ+LAiQL97BNqdCssc37GphfKGgOq7wgmX
         Qcac56ESW3hht902FyIuM8/hjm6iS6PbgS00nNxwcT5054go67mqlROao6dU46MF7Lni
         Xisz7GhhVlDxdxbK4ZtR6cqN1lkK6Aj/QkT6mzNzHkbLbGD7Ue3gzhtbLGN6IWgpLpBm
         V9s+u1rNaxufyDhtLTTVNRU4G8qX42ytmSpV7tyMGKl995jNsTZDi00RR8byYA5luwRf
         5j5sxq+d4dokTUy3Xbf3z9V/2xY7YJdLpXLmePVza8VbAFdl/43ldRI3YuN3C0LS4C1m
         BrXA==
X-Forwarded-Encrypted: i=1; AJvYcCX7zbfX3TaheaEzNy08T/A/bEXLbNyzeUTPU1QfUT6wJsevnDcPGVjd2+sGslXcKXaYTysmhEs3x75Ehh/CyvADk7lK9lEgtyXBCOgh9A==
X-Gm-Message-State: AOJu0Yyqgu4VJ+9h+e9fh2/z440vN6BSgoWp6UgSR7KNSommwbRvbtDt
	RRjI4nuNv8yY04p2L5HhF9TM6iwPBp7u46XakPSyqG6N/xT1sDqyqO9L/IoiHtc=
X-Google-Smtp-Source: AGHT+IF8t33P00Vffm3hQwTe343HmIWz64ZgPwumplB9cLE8YNCblECEIyKCkjc9aNVqfKfuN6GZQw==
X-Received: by 2002:a50:cd95:0:b0:567:45e2:c4db with SMTP id p21-20020a50cd95000000b0056745e2c4dbmr4453144edi.39.1710308835557;
        Tue, 12 Mar 2024 22:47:15 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id gy4-20020a0564025bc400b0056820311668sm4623037edb.57.2024.03.12.22.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 22:47:15 -0700 (PDT)
Date: Wed, 13 Mar 2024 08:47:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ayush Tiwari <ayushtiw0110@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8712: renaming tempVal to temp_val
Message-ID: <aeb35d3c-8d4a-4b22-a620-7d61c255827d@moroto.mountain>
References: <ZfE4iDfGUyq/C9s4@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfE4iDfGUyq/C9s4@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>

On Wed, Mar 13, 2024 at 10:54:24AM +0530, Ayush Tiwari wrote:
> Renaming variable tempVal to temp_val to address
> checkpath warning 'Avoid Camelcase' and to
> ensure adherence to coding style guidelines

The end of the line is at 72-75 characters.  s/Renaming/Rename/.  Put a
period on the end of the sentence.

Rename variable tempVal to temp_val to address checkpath warning 'Avoid
Camelcase' and to ensure adherence to coding style guidelines.


> 
> Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
> ---

This will break the build.

regards,
dan carpenter

