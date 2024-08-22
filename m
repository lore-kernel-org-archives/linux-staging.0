Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA631EB27
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 14:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724337956; cv=none; b=mvgTu1I+SG3qHwTJ4xnS4kfV2giD5efjT5clSzeueMOSlFnnPpV3FUdGL04qybzCs1Gs1hS+59OK6bIe/8F60tqlQLQeQtY4fdVG5b/PVqB362KaP4GH0MlGO+dYAEepf9OsBuwhUviJAU/HbHAprWrqEoTw7pXhA0uKt+2DqMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724337956; c=relaxed/simple;
	bh=UYliqU8zC6Cy5j0FVRYrcTVg1FwZP3pGPNuhEz8qz/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieTQuOgPsyrQ/Qjev/bJS8xwNIggjc26FfXSMSiAPWXYIhYDalvnzsHinBwFA83x81VFMcXQS2swbz3f6uz4hnQ4ko/+d1RWvMqxCbo6JCWwVOtjBHabsHm7m8VQWqQthc0/xChh6jRVTEcZVBsYNPCqY7QBN8iKCUXK13qiydk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rlRVibxn; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rlRVibxn"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a7d26c2297eso115310166b.2
        for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 07:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724337953; x=1724942753; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dqfRiCuHOz5QjE+AHIg341g7rC3lTF4xMoQGWnAZTk4=;
        b=rlRVibxnfd4U72i+bNz9jtHdc9MNxOKZhLVhZlXnkM0aID52v9gCMAYQYgsaC6grYf
         jjQPyLA/ikOuXWaYEtU12XdBp/B+BMgUvu0+RH91zr1Y52LpNjBqVHH0MeRGDoY2R6lR
         WZHk7nY2hBy8iyBkk9tYcaheeiboSHdKQOfpWM3M0RsGPg22/VEmaIRVqVN7xQRihkmi
         JOli8othjTDu1OMNY/CEkh+d8oyB60ixIWeZH+I3XRs1WU28SJWrOD+cJiUFmqf4k4Go
         efrsvUTOb7AugMVc48vQTi+9aw/q9NHqYN7nGs+hyMby/sxUW1gULw24cU+tlXLITYoL
         Avng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724337953; x=1724942753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqfRiCuHOz5QjE+AHIg341g7rC3lTF4xMoQGWnAZTk4=;
        b=GvS3A397p6MVu9i89wDW47FmGCK5M9u3c73FqCZvsSA7aAlAbJXHdxoos0PfIsAvo8
         JhxZ2++rZ1/atD7Kr8TPQg08q4fINu4Co+JNDtQfm2qRLOGEjuMEwejA6Nj0MXsgHG+4
         HnZNi3dP0N3hqqa82HC9l0nxaW/ZbiWg/aQ09SvZE2+k3Ne0wS234glZ7DMHHmAU1oEK
         +29piUl1Lw6KisqmRd6TJyE/Hq7YaXPDlfBXbSON1yK4Ed9vH04WK55rz2dAsJudPsot
         K5s/3CC8hM42eh6oaJei6LkO6HLLzBbxIW5BM8c1hxQ0fBxCsvfXIk/BY3emfaKUnqDF
         l9uw==
X-Forwarded-Encrypted: i=1; AJvYcCWOe7zuxyGsbQu2ubjHiih5/3EzvxqfCOlteB5aLIC4KrbgZGfPj+6IJl8O1if6L2e5Q+rXs1gEZpb4/vH/@lists.linux.dev
X-Gm-Message-State: AOJu0YxoSf9SjqhO/pwd9TNi2FoXgye9jt7ntLwVO4WvhTa1YH62uCxe
	3JlXC0E3esnMh+0mOpItaqOxNLJv8UgczoFIDEANXEP/nihGQfE/ZOGkQV1creyo0PFC4WeihcW
	M
X-Google-Smtp-Source: AGHT+IGTms71ZGwKzmBD3O9q9nvmNcRB0v5c3voGic8zxDJXfFeHvsSYDv7q1ppR3nY92D+zJk3qww==
X-Received: by 2002:a17:907:3daa:b0:a86:8916:b5ef with SMTP id a640c23a62f3a-a868916b8a6mr253254066b.69.1724337953177;
        Thu, 22 Aug 2024 07:45:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f5ae7sm127798266b.219.2024.08.22.07.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 07:45:52 -0700 (PDT)
Date: Thu, 22 Aug 2024 17:45:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hans Buss <hansbh123@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v3] staging: rtl8192e: Insert spaces around '|'
Message-ID: <b4b68832-3f5a-4d77-b55d-832bd6caa65b@stanley.mountain>
References: <20240822143837.37768-1-hansbh123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822143837.37768-1-hansbh123@gmail.com>

On Thu, Aug 22, 2024 at 11:36:55AM -0300, Hans Buss wrote:
> From: Hans Buss <hans.buss@mailfence.com>
> 
> Insert spaces around '|' to adhre to Linux kernel coding style.
> 
> CHECK: spaces preferred around that '|' (ctx:VxV)
> 
> Signed-off-by: Hans Buss <hans.buss@mailfence.com>
> 
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

