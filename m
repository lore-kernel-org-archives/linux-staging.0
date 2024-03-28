Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD43712DD90
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 14:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711636953; cv=none; b=ZdFMqwqNUoIZ25bq7Vrkz7LsEtZaMHpP8SmAu2jcnJrL1hSa2hP352gcCgjUEA2RhLpoxoTq8e55axoQ5HIpsfs/z8LpCBdjN394WFMhmiGDdrzwjH7BNJd3Nxs92D57olAKisR8CwuasgPBO0R9SZkn0Km1pXrzrJ1Y0CjmkOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711636953; c=relaxed/simple;
	bh=72e/QGdwx4cgM0WviYJewSYfxMsyz56u03JStMH/pMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGUg7wn5oLo51/NoU4GxODZbdFzib46OETP5401nXLH0Z2MQNCPN41rVQwZ25+BMnu/pJbw4I6Iedm7UNWKjUztz425p7B9yQASJCzkZubTwrkHry55aj9KUdHO0Rf1G+yeDbpe24PWpCC5wJtZgXQ0w1hpyMDJzWEKIHskzTZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M5Qhm10Y; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M5Qhm10Y"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d28051376eso18523881fa.0
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 07:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711636950; x=1712241750; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G9hLepNJpbi3DWHCAppFTBwjpcQkCnm+v+TpTm9Peb8=;
        b=M5Qhm10Yc6zkBJ6JMKIwuP7eCAJAx0CbdyJjCJCln5DPD4HHCBGs2gKqu3ochghQ2b
         XfXgdqWpOVKs+x76VVu8LR8Smqvq7EsyTCds9J/uEkObGa6XY7OdZ0tlbEOQ4ohyjfQg
         I+gd/Luq6AbDLxByBkQbrWUL+NBUkPuFyh6nvFFJTFmhVKRDk8ZbvSf5WOoaJH6mbj7e
         zQw1ZULJHwkqJAkreAwNLqHqoB3p9AjmMCNuZCnFVFL+hy6YZnKLtf91lWTsZTEPvZsO
         pzwWBHIIehSIpmulbxxE471olmEN7NQ3tzBINMTxfCsrzLdXHC2ZgmrPNJWJRqAVNldp
         /9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711636950; x=1712241750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9hLepNJpbi3DWHCAppFTBwjpcQkCnm+v+TpTm9Peb8=;
        b=rT1eAc5Ws9+7/Ezm0d0Y2ygDM8bxjWnpGIS8DL9JkZ6k0ouFIQZPITptDcdq3+2y32
         0oeF95u97BYCwo5gEWhCjXvQP+wkuge8Vi/nIGb9mSUNEQ6oYsA7CKATes3jLZH8vLwz
         DDVsE8CvQZGMhbR/uGsohv8wGVdSCbYRZubdC/Qc+ORaXhORetkemn1LFn6hiYmhdYsQ
         /ZMaRPffooO1NWmoJ7T5vn8fFiPQKTPmk1H3auBBzzw6pzz3mVuyFfRibqCqAD16Fw58
         SM/2r+t8BDjY6Ho1knzT7iNHNzwnW6YZ62yE4Az3q0CkjcJfnxyG11T2LYGNeHXUhP+O
         2rvA==
X-Forwarded-Encrypted: i=1; AJvYcCW7eSQGGZPaN8M3qV/Ob5H0tueEiBfqdNEAgtYts7bG8V8ps6Zj6ZF1S8qcaUOTdHFGbT4tV/7l1Jt9HSJCRhBPdCnqP6GoO0CIUv/5Jg==
X-Gm-Message-State: AOJu0Yy9PjAAag7gYV7QwDWpgtoF5tl73y7VOJ6yQbqOduzqjurXykTz
	S8t2TjIyXaqraECIArs9HNBDGkutKX0ntppZxElgfdg/l2Tcr3sO8ktf7a5aSHc=
X-Google-Smtp-Source: AGHT+IEH5jD7Cj+NefM1s0YB32bnuPPntJtJeXj9KzXVwKXJ/p0MTHcCp31F39MAt8QJruB1HUs1Lw==
X-Received: by 2002:a2e:7203:0:b0:2d4:676b:f591 with SMTP id n3-20020a2e7203000000b002d4676bf591mr3208568ljc.45.1711636949583;
        Thu, 28 Mar 2024 07:42:29 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id my15-20020a1709065a4f00b00a46b99a4273sm819990ejc.216.2024.03.28.07.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 07:42:29 -0700 (PDT)
Date: Thu, 28 Mar 2024 17:42:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 01/11] staging: vc04_services: changen strncpy() to
 strscpy_pad()
Message-ID: <508e4ede-ab78-418d-9aef-f657827b6dd1@moroto.mountain>
References: <20240328140512.4148825-1-arnd@kernel.org>
 <20240328140512.4148825-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328140512.4148825-2-arnd@kernel.org>

On Thu, Mar 28, 2024 at 03:04:45PM +0100, Arnd Bergmann wrote:
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> index 258aa0e37f55..6ca5797aeae5 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> @@ -937,8 +937,8 @@ static int create_component(struct vchiq_mmal_instance *instance,
>  	/* build component create message */
>  	m.h.type = MMAL_MSG_TYPE_COMPONENT_CREATE;
>  	m.u.component_create.client_component = component->client_component;
> -	strncpy(m.u.component_create.name, name,
> -		sizeof(m.u.component_create.name));
> +	strscpy_pad(m.u.component_create.name, name,
> +		    sizeof(m.u.component_create.name));

You sent this earlier and we already applied it.

Btw, I just learned there is a new trick to write this when it's just
sizeof(dest).

	strscpy_pad(m.u.component_create.name, name);

regards,
dan carpenter

