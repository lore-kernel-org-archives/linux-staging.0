Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A96FF4F5
	for <linux-staging@lists.linux.dev>; Mon, 22 Jan 2024 06:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705906519; cv=none; b=Q65rfGZ8soFlJlZwvIFUwtwwfJpXcI9OdB95OGVsVvE6hGjt7uQzrg5GXRaecDvYTKJwdGTnvtzNaCWZQHnNIFmBcHeRrIB7jMOCoj0Rn1EIbEy9+Rac3A19zS9Vl0IIhGo1X1Iud6Civz5ZQw/Cm/i+qEmTho1lZUrmjhzasUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705906519; c=relaxed/simple;
	bh=kurIw7V3rZKMF/Ht1fnXn8epEvVoc15GU/v6IoSqneU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q1gXUzKuiTvEDnFje+Nt0q6zVyGVCT6YmLaE5DI9d8YXP8Yo2oZ2HNwuDjwnQLnvHjBZyuzdbeZuGC/f/S0iyyv5dSQCNXbVlgO36/GaUk4ttCWLAbOgPt5MjdHT/FdIEDWwx72xMYQjhKRzw64fQric8/7W4QZ8tqklZd+3Mp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u+yDtjlX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u+yDtjlX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40eab3912d5so9192165e9.2
        for <linux-staging@lists.linux.dev>; Sun, 21 Jan 2024 22:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705906515; x=1706511315; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8aUJC8rG/vO3bD1rTOQLhtvB4t4NcN5TufneLFrEaCo=;
        b=u+yDtjlXHFaNlKwAm7C5jy+Pl0DOmBLFfDxQEk3lym+gFiLdsOe9x+uG3e1yOOx2VR
         iOPdnHiqvD0GDBS0cLrsRVh5Ms6BIi2YDTnUBPexVGzGgX0I7ioauaxXZlNHo9Y14F/7
         d3pG1ntn3xSj4OG/LVUxe8Xi6s058jK4nszHkA5dGj3TV/4aKOqGi8JbzM3WMtGTyfIW
         7FzbVIM9xRrypTXvBsZLhSZDNCcTfuskesYiCZEZ3wQnvDPK2WxfzrJeiek5+3EEnBkn
         8rlCheXtuM3wV5hoVLKX4QkkBgOmrzBzmRIs7mm5aWPiA3xTHMdDquZn6nTUyUAE4b5y
         pYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705906515; x=1706511315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aUJC8rG/vO3bD1rTOQLhtvB4t4NcN5TufneLFrEaCo=;
        b=Og0Ob5aclaJmIxhn+fyVrnnJ4GPaVxYFLFKbdVkEJ2M1JKk4d2VJilPbXJ4G0w3+OC
         /j+FLFeN34/mFN/sXMTXcAJcu+aWJqwFcP5u1syYOJLnjoVYgZ+RJ3tLsaARhCg2jpBT
         ddsWTaL/gaXVZ473dP0nigEUsnsOfHdYhYYEQrmO855Q77fOZBwPyl/iExiMdQpkdxk3
         09I9TfriDBgpbyKt/+h549DjpjyuIJeZmTUwfhXU/1/Exg4SWMeOXJyVYBKifosz6PfL
         vARy6yEMKNcjLuvh6EjU4LP3rlBNmXY1zzYW5VJUz3NwUuL5m/cXAAqdtkn4oViFse3S
         WjqA==
X-Gm-Message-State: AOJu0YyifOvwKm6zy+1Y/yQTTDASAmrF5IIFrXtr/Z5KSOx28quNYj0O
	4iPhZI9oq61QO1mvRODsbb2ulSyoOH/lWELqDYi5h9hhAMYioc6pQT3HGrgwutg=
X-Google-Smtp-Source: AGHT+IGfn4IAtpvCRksZdJ+qY0f4oJppo8bUr5RyWi7AbO/2NfJDVKSiGSy1jFwXSGGedSZzJIOsgA==
X-Received: by 2002:a05:600c:6002:b0:40e:ae0b:62ee with SMTP id az2-20020a05600c600200b0040eae0b62eemr387119wmb.56.1705906514724;
        Sun, 21 Jan 2024 22:55:14 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id u21-20020a05600c139500b0040e4a7a7ca3sm38018916wmf.43.2024.01.21.22.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 22:55:14 -0800 (PST)
Date: Mon, 22 Jan 2024 09:55:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Erick Archer <erick.archer@gmx.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Franziska Naepelt <franziska.naepelt@googlemail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Aloka Dixit <quic_alokad@quicinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Use kcalloc() instead of kzalloc()
Message-ID: <a5d8a5f1-432d-46f0-84fe-7b5b22ff5f32@moroto.mountain>
References: <20240119173900.11035-1-erick.archer@gmx.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119173900.11035-1-erick.archer@gmx.com>

On Fri, Jan 19, 2024 at 06:39:00PM +0100, Erick Archer wrote:
> As noted in the "Deprecated Interfaces, Language Features, Attributes,
> and Conventions" documentation [1], size calculations (especially
> multiplication) should not be performed in memory allocator (or similar)
> function arguments due to the risk of them overflowing. This could lead
> to values wrapping around and a smaller allocation being made than the
> caller was expecting. Using those allocations could lead to linear
> overflows of heap memory and other misbehaviors.
> 
> So, use the purpose specific kcalloc() function instead of the argument
> count * size in the kzalloc() function.
> 
> Also, it is preferred to use sizeof(*pointer) instead of sizeof(type)
> due to the type of the variable can change and one needs not change the
> former (unlike the latter).
> 
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/162
> Signed-off-by: Erick Archer <erick.archer@gmx.com>

I quite often write responses to patches and then never send them.  I
wrote this response and debated sending it but in the end I decided to
send it because you have sent multiple patches.  If you had only sent
one patch then I wouldn't have bothered.

Generally, commit messages should say what the user visible effects of
a patch are.  Sometimes with these sorts of commits, it's hard to
determine the effect.  For example, Kees went through and changed dozens
or hundreds of these allocations to use safer constructs and we don't
necessarily expect him to audit all the code.  They should already have
been fine, but it's better to be safe.

However in this case obviously the patch is small and just by glancing
at it we can see that it has no effect on rutime.

But if someone is reviewing patches with "git log" instead of
"git log -p" they aren't going to see the patch. I can almost always
figure out what a commit does without looking at the commit message,
that doesn't mean that the commit messages are unnecessary.

So I really prefer if commit message say, "This commit is just to make
static checkers happy and to make the code more readable.  It has no
effect on runtime."  The commit message you wrote is way more scary than
is warranted.  Here is my proposed commit message:

"We are trying to get rid of all multiplications from allocation
functions to prevent integer overflows.  Here the multiplication is
obviously safe, but using kcalloc() is more appropriate and improves
readability.  This patch has no effect on runtime behavior."

regards,
dan carpenter

