Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914C32C6BA
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 06:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711607963; cv=none; b=VOAqNliTyyJLyeYi9nMHMTIgsYlvwARcg6qvbIQ9SQ71eDVPdnCfM9YA3YgcIUQf4+aqyxdPIyFtdQ0o7qvJJmidXMHYRR4R3pwtT/GeT3Vl4LIp09ihpi8F5cfLr/0QtQHMnjmUvfiNOnu9H93qtDcyutiQM/RfNjZyylDfArw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711607963; c=relaxed/simple;
	bh=iM/Zrr6xg5+bDVZfSFnEORtiFT+7aRXqsnR+cnaan98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0MlA0RJslOj+e1mp5hYoQ2Z2CxUXrUhNx/U2OtNoizpXLsvgVqQLO6bTmqmtL0Zx6mHkrQ1gunEG6WZ//XXWNtPizpFw48SImC+/lMXVmYfVdH449tvpN0wxMBeQEjeNF4/kp1KiO+3lTbLpONwE4MzulN8PARHrLHAGy0V3Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ixwQhPAn; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ixwQhPAn"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d475b6609eso6086351fa.2
        for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 23:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711607960; x=1712212760; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FqD6QFkv4RcPR01vWVUf1wMB4qAMJiEap/VS8LtfkEg=;
        b=ixwQhPAnzRlpFDZdrBlLei7HOezhl1/KAGaXind+GIPccDy2M3FogTi46TkR0J8DAl
         2l+tQEwuyuBwNyAIIahwRFj1vKz1M+U2W423XRveBb15+7Q1GEp9Xn7S9x0JHrE8+MKI
         wlqbjML9iJw/gmeoIZudzLrdA/70Dm/fVtU5aS10n9g669kiIK9cN84eXMNb2w6Ale6P
         mdD/dA1jArgqKMUON6skCmkcLFU3G+1BPuxpD5+NWrJpUl6fuQxcm8UfbAYyiavu+58U
         lwf2eXGzTNK1wmp/yi7XKb+ap9jErtKR23c0WZwEP5ZzCFrVE4R2fHcH5QCPFAhdgo7G
         dGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711607960; x=1712212760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqD6QFkv4RcPR01vWVUf1wMB4qAMJiEap/VS8LtfkEg=;
        b=k7GbZnlS7KgGa32So5roSmpC2XYFSs14DjeDbcCAy6Z2+utvOsXBoacpxotKZCQ9A5
         z7lL4Ipy5Kju8NK6GaxlMLX1iLiwZPkVYtev1cPS4Pg4UrLczxJebNx4ElxszHMPukDk
         PQyfwdGNpLHZUHqLt5PC4Y9EMW+AaVoN8vZDCk4StCH0PiRKNjeeqwndgf1424/VlUZ1
         dokqfnGlgHiof2v04hs7xKMYLQVGr/bVmQHJOayEZaG9TzeYqgXn7TH1GwZmaTfRWGxX
         L7bndhj7PWp0Ud47btYrXhEl7+OPZnvA+p807z8lydi3wvka2BtoDaCRLrakZa9ZFztU
         EGNg==
X-Forwarded-Encrypted: i=1; AJvYcCWSPUDCBt9ayvokGdGyIgl/YyeTYFQSozo2yj7dzQDR6xzwRdKH9dCLsqcXpeLoUlEr0swLxidbB1tYp34rGWK+xOyJDVbkYb5p/ADubA==
X-Gm-Message-State: AOJu0YzMGVQ0LPp5BdotRB4ZXDWKy8Tm/4/SD0kWOtyLB0zKXvnX4sZ1
	vkz1qeCxdNwFlt7XvFKVXhX2LVVfFJVIeZNddBWIWrm1npBcHKJMXpSnXMReTMU=
X-Google-Smtp-Source: AGHT+IHWJOoEo7pRzUGI3H9oyAn6IMRYBaACNvS/9pjMj7sskPE2i+M+a3M7zfiBUiKyrs+HJVaBkg==
X-Received: by 2002:ac2:4823:0:b0:513:9e44:c68c with SMTP id 3-20020ac24823000000b005139e44c68cmr1172033lft.6.1711607959469;
        Wed, 27 Mar 2024 23:39:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id fd6-20020a056402388600b0056c53ea5affsm217009edb.77.2024.03.27.23.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 23:39:19 -0700 (PDT)
Date: Thu, 28 Mar 2024 09:39:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ayush Tiwari <ayushtiw0110@gmail.com>
Cc: alison.schofield@intel.com, paul@paul-moore.com, mic@digikod.net,
	fabio.maria.de.francesco@linux.intel.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH] LANDLOCK: use kmem_cache for landlock_object
Message-ID: <dfa6ddcb-9a2d-49ac-90b7-bb30b23e32c4@moroto.mountain>
References: <ZgSrBVidW1U6yP+h@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgSrBVidW1U6yP+h@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>

On Thu, Mar 28, 2024 at 04:55:57AM +0530, Ayush Tiwari wrote:
> Use kmem_cache replace kzalloc() calls with kmem_cache_zalloc() for
> struct landlock_object and update the related dependencies.
> 
> Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>

Is there some advantage to doing this?  You need to re-write the commit
message to give us some clue why you are doing this.

regards,
dan carpenter

