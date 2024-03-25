Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7430B14AD14
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 05:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711345963; cv=none; b=BZnTxaG9iRF1wq8PouRe1YTee4Jl6bnVWt3IzaxmVOrWC6/kFKcjD3YCXVMS8DhYrbiBQkJQRfqzjXJeNe/GkhlWyHCjyN1a2Ev5dqgUFeCOSBmlq8xH8UO1JlyHJhkuOBZ426u/3VJ7HiYy2qXBJHAK6mydMSeaaNj/xjlnWno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711345963; c=relaxed/simple;
	bh=Ca+XvmlXKeGYPksLbW1qY3T/nyJfcNvs3uDjLng276o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCuG6U/kSELAlrjgoMNOrLtMq7LhYHcAodM9F7gtkBaRVL7PYOM5/DZy0QXCiotq71YB3SCvdAr0I6p9ms74m78sbj7InMyb+NNWjCcqskK81TB1hoaCCU0XY4mLCu4KIPy8ZRELLPvbfje/IrRavVyPkym50ApwcnmwP2KQU/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uo00ah97; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uo00ah97"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a450bedffdfso448494966b.3
        for <linux-staging@lists.linux.dev>; Sun, 24 Mar 2024 22:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711345959; x=1711950759; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KQMqHnlXbBG6D/HNGUsVRBxdn6P40gz4MCzg880daGs=;
        b=uo00ah97vLZGXnWSOdTSsevrAQ0NHVvVmjwN2pT0nCPxGpuG1DG1+/77mGd9GfGCMd
         RvjT8jiQlTkmD5cHdMlecMEsNVgZAjNS6NhJkVVXjQIaBxBep5M7oBjfdBavXu5XDzOl
         MoqkSkfMeODpq9HYx6k2kB+62HE5FvcOdbltbjmIcqHmrZ9mxqalZ202+KEVppYdWBAE
         fxQ/moKcdp7FZ7GDKiwrSMaJJtk0Ombr/YqZ+/e7VBRxMs1I9KY803HvbBoh7U1oT94O
         ZWSmT9tnghHwTY9qVaHwfTH1ghoUgTw0xn04Fnz00ceSnOe0LIa5ku5LVGSNYlJY1AA1
         /gMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711345959; x=1711950759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQMqHnlXbBG6D/HNGUsVRBxdn6P40gz4MCzg880daGs=;
        b=kYO4qzQLEBZPC3oCZYSor4ZtKdP7U4Atvz78TheQIbzuBDJ0wcjoAvvR/tOY7gGn96
         ONgV8+T4w1bTuR6g3O7ayMQMTi+cldsja/Y6h7sH07WYkcT9+J2Jf3nhcxynqeaFSnHN
         qzATC2k7LvA+rfzACB8cX3+FcewM0oayhFb0dN2De2w3PSSycWADK0B4dGWCGCU7Gdpq
         nm9zUbUGdZyA1Up1Oekc9g4/Rx7RTgCDB8cliy0M8H+mOU/1mzLAkHXchiJvMNhpFysp
         RJPChXc5tdCGQY3GbBUlcxSrhvMGIbng1526CI64ZkIhpZA8Wi27IuCTM6vVf6PzP1gI
         W6Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUpu3kvxBM37+o8+as0ycEaz0CzmKeJhnYosX42zuQcPPFuFhXVNCPob1zw00bxUPRfC+djH8SU6IEyVcaJD/ohHk4mOiSF1rDPRRA0sg==
X-Gm-Message-State: AOJu0YxgEgNuo5z+zUNjAZyOAuRcqSElDDVbz71GB6PhtAHC4bP/1s+t
	EK0hEH4glqy91KEfrNcDAoUL6dpx3lcW86LrEohoFUg1X8lOeKmMwuQL2TrNQuo=
X-Google-Smtp-Source: AGHT+IE+RzKFPbfOR436dI+w5MSweWdPphLKMDQVzXF5JvnyobxPPFXdyQ/VwDYCB4hZSUuYQrE7NQ==
X-Received: by 2002:a17:906:a28a:b0:a46:8d93:6c4d with SMTP id i10-20020a170906a28a00b00a468d936c4dmr3137486ejz.25.1711345958573;
        Sun, 24 Mar 2024 22:52:38 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id v22-20020a1709061dd600b00a466fccbe96sm2644067ejh.122.2024.03.24.22.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 22:52:38 -0700 (PDT)
Date: Mon, 25 Mar 2024 08:52:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shahar Avidar <ikobh7@gmail.com>
Cc: gregkh@linuxfoundation.org, elder@linaro.org,
	andriy.shevchenko@linux.intel.com, robh@kernel.org,
	parthiban.veerasooran@microchip.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: pi433: Reduce N_PI433_MINORS to conform
 with N_SPI_MINORS.
Message-ID: <662306a0-1544-4f16-81cc-68324a0c3172@moroto.mountain>
References: <20240324093201.793485-1-ikobh7@gmail.com>
 <20240324093201.793485-3-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240324093201.793485-3-ikobh7@gmail.com>

On Sun, Mar 24, 2024 at 11:32:00AM +0200, Shahar Avidar wrote:
> The driver can't actually support 2^20 devices.
> Current RasPis GPIO pins can actually support only 1 device.
> Other or future platforms might support more.
> 

Why are you doing this?  Is it just a clean up or does it have some
effect on runtime?  And if it does have an effect on runtime, what does
that look like to the user?  This all needs to be in the commit message.

regards,
dan carpenter

