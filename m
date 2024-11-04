Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A5F18C038
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 08:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730707773; cv=none; b=oF7UozaVlP329IeeKbd+t18JXfqDmWbQgrQKZMJSh4jEtoZvgMNtzwh4+Y4VANRMfRqONZol9QVJyVu/eJ14Q1psu25mcjemzQFnA+2yVwx/RmmuGAJ1yXGAbrm2HzSs97YxU8NLePqA7qEoRHwBRVOx12Laj4Pa9mq8VEmpxu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730707773; c=relaxed/simple;
	bh=+smaqJgqRUBeteC0zyieDxigAF1aK6M9oaRBbBEo8h0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0Xz9JltEFm7FYRKu0a5hRhaoT8B28MzOAWYo/6ulMnOVLC+ehfOd6mOmhUtAxrsqrRTC7uy0ojZ1z4VipwPHyGOeFu9zzsMLQz76Jj6gTF2GnV7JexGEUmdVdcwQPwBZx9LL1yTrGr6SL+ejBEEPRqPl/sGJQGOokIelblHWmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N9hlCBqk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N9hlCBqk"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so34149605e9.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 00:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730707769; x=1731312569; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M2TfwqW3q2rlubXI3HLqbss+F3yh9GI0LJK66jFfoE4=;
        b=N9hlCBqkQBpF6z6M0RqeCbLFW6OBFg2jmK/ImwqKTTqhNF8SG9v4+U1hL8+gszW6DH
         bMJOIo2ctX3hOkOfGwcruskOPqouhRZTHfqNh1WLFYIH6JGmlUleht+FzhSZHPZfYqPW
         GHyLkX4ercqORnkvnrhs9ZAP7P35z9gvkggu6BqHSMwSgMxy9pfWOG0nTgHcIw01UULf
         LethHKzzXm5r8XtN7gQznmPoymq+JwNzQQBRddrLmz+umf0Cn+OKPW9Qnn7jc6r/tD1F
         Zu1NEm+MhjfqYu8RrG7GTzSAN1R393xh8t5ie1wx5sm+EhwqJRJ7hDFVwKGjJeYc6toT
         M6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730707769; x=1731312569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2TfwqW3q2rlubXI3HLqbss+F3yh9GI0LJK66jFfoE4=;
        b=DHiwn/GbmpqoinIXqg5ReBs88dLDUt/77ED4rHWSXhHRhaEq7P1ugTUYcDYguQmIkM
         jub/tFhCNuGFtEVxNrMaXxeZZN1yKSGsYGsSQaB4xRN4fSQWO+P+l1jZRBP4MWB4EyhY
         ko80c8BasD4tEn2B662ztTj345E8D0YPatJaFSohCUPJAH+VTqtbhWsxBzBfc4UTlmr3
         +xn9Dfz24jZzdXVyyy6u/to1VGRY4cpxL4w2gpzSIuu/K28njtyiC5wBrt0OHZTWT36N
         sr2L/zwk5KRkjvvclslTXBtmbc9cCKlos5sUWySFt1vunKa1sQlWjXU4WRSvAWvmR+O4
         +Kiw==
X-Forwarded-Encrypted: i=1; AJvYcCWcQeMOHwvUpZBnCB9JOA0aKtQF9dFyTNFEXilI3JDyWDOG6k0byzUz0ktilYljA45jLqMaYOXHApLA++qk@lists.linux.dev
X-Gm-Message-State: AOJu0YxNEK+jKlf5Q0FQ73e4Y7YzgRICuMd6L9qI7wfDnq0YCrjzSBcc
	NFxtfbPpjUQezMQoAexHN/NyfpF31A7yY3lp/UPzKg92Gin8oY+S08rnK1W1gPA=
X-Google-Smtp-Source: AGHT+IHbLx5OFNtfL02/dK6BVDvg7JZVLBymgPvgLcRyabVsXd/ovAsKFfxvs/h3o0nrWgK5+Sys9w==
X-Received: by 2002:a05:600c:358f:b0:42c:a574:6360 with SMTP id 5b1f17b1804b1-4327b820b9fmr130822355e9.29.1730707769154;
        Mon, 04 Nov 2024 00:09:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d6984e3sm149599395e9.48.2024.11.04.00.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 00:09:28 -0800 (PST)
Date: Mon, 4 Nov 2024 11:09:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	arnd@arndb.de
Subject: Re: [PATCH 11/11] staging: gpib: Correct check for max secondary
 address
Message-ID: <d399795c-8a8d-4fbb-a645-4115cebe2619@stanley.mountain>
References: <20241103212617.13076-1-dpenkler@gmail.com>
 <20241103212617.13076-12-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241103212617.13076-12-dpenkler@gmail.com>

On Sun, Nov 03, 2024 at 10:26:17PM +0100, Dave Penkler wrote:
> GPIB secondary addresses can be between 0 and 31 inclusive
> unlike primary addresses where address 31 is not a valid device
> address.  When 31 is used as a primary talk address it
> forms the UNT (Untalk) command and when used as a listener address it
> forms the UNL (Unlisten) commmand.
> The library was incorrectly not allowing a secondary address
> with a value of 31 to be used.
> 

This needs a Fixes tag.

> Signed-off-by: Dave Penkler <dpenkler@gmail.com>

regards,
dan carpenter

