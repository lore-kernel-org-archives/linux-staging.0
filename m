Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF6B2FFF91
	for <linux-staging@lists.linux.dev>; Tue, 18 Nov 2025 07:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763451418; cv=none; b=S/xecUmqwFeNiUO5VZsKgchYuuy1IkqeaGE+0egkrPeM/2SReX7/Iac8ODqzkwhQf6B4ah6kU1AHPC7tyfOneeKV7TSIY9/bS1IgnqLxdlwLi9FE6Fhcdftr03qPLezoXWbfQ4SguGy417AFh4TZ8DXjbb6YQ1dbj0guz7qBUi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763451418; c=relaxed/simple;
	bh=jGH5/CEEBjQBAhN/KKMYTbcyNf3Uvl2lABRQziep7vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEn/eWb7XssvyGw+xTtaMgWfF0o06B6JktpiaCMTKhdgmN7tDXlH11Q6xE3ZzdSvsmp/HJ1BSpj0qNCXJy+0kO9BtECEEdNvHkZ82Ta95gdeWXcfSpg3ZOrwuckNr9UU9JXSCOkyFvOtENP4bufnzWamZtrJ8jOufq6C7n0Iffs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fdcgz6mo; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fdcgz6mo"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b73b24f1784so192897066b.0
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 23:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763451415; x=1764056215; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rb1AZdrI6VjKLUj+2F+eU7kfRCL6K9PQeZlP12b9JH8=;
        b=Fdcgz6mofFwnQHLLzN1qhMdayiU+0u1pH6AnpW4x4BydFi+36qNn8DA1LVvmJFjEDI
         M+925L6DBqBijAPdQy/cnLVbmIi3T9ze8ZttkZBA6DGTv5weoelngRnVAxNTtjKn90s2
         aaVMVNsM+DY4TmuVy4TNLcb6bIslS9F6wKU7AMFv9teUO5823uEw4KPUFXJHZ2ShyBjg
         eQVMqBokiW/WPdjXz7RkeoZTENYYra6VRpKxqvJel16ARW64IiejryAwXtB3+E/UjW2a
         IOnzC/VRLgvVtxAK4dVLqYpl1c70px6GA3GXHdMN8E96OF09MeC4x6iEqyrCaYqIbIh1
         HIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763451415; x=1764056215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rb1AZdrI6VjKLUj+2F+eU7kfRCL6K9PQeZlP12b9JH8=;
        b=sMmyMLYXJ+2meZ25zrgZQiGrFefZAH3+EBrT2+sCboLfPcSpo5+USX9Q60KHQzn8QT
         hkbUrSMb248mgM/O00orrd0k4D4OeybQhz3uM3rHIOZwCar9cCwbTzh8Y6cw3r1DTkwg
         NuqtlNK12LV+YycGeqJ1ketIGX5ghcgvPlLP9HzLcbflUnswcIHGaEb3xX52fWYC+qSv
         T+RxGHYKbLs0TaIMPjo/0SIQK0o96Kf60eGREcZZRqJeZyjpU10QDn4ZL3w3LI/8pEwt
         F8UJ9nYUFcICVSKb17tAlnD0XMz/HhJu7Qcy/Tv3iHL6CTjo+QEhpE/35fobAicrst9Y
         ij4g==
X-Forwarded-Encrypted: i=1; AJvYcCUKiowObVx7UzjMdhbkC5hlIiHqcKgsWebnKwZSpWiPLI03+zTgclotQeMydFscxbVwCPx5NFDgNGhkITz3@lists.linux.dev
X-Gm-Message-State: AOJu0YwDejn9sO/AdPwie88rAZHg88LmPFTjy8QkSp/UPVSpMekvdzVI
	MUmhQxWVSbmZKdf4emKNODeKdLyLLtQ7yn5EeiKYDC2BZK/wBbfnOAPRPbtvRLAYaUA=
X-Gm-Gg: ASbGncsVB8XPhABfzXnpPrl1lHfXKDWL6vn3pNkhI1PEFi9tYdyDMmhTqBcKA/J4Shu
	e+7rjT5hk67Tii7V9OywEvbKuHZSi59Aayvu1FkVVVO4/PJ59rF+gp3s1Y9Y9IT03LSfmhTlKj1
	ZBW364WTcFZK9BCN63JJ0Z6ems7rKhe0+ETijdbxd3mJwLtwkTDQdQvs0EupgidI2uD8GAqpF16
	7scZSRuW5b6ppqJWp8BBCKb0Abnrtv9TCBWarEab8m/9/5dZoaZOF8+PH5ovoknMgsqvTlh7R2J
	M41vvPZVMIimn2libKjO51PCY9/TDso0nRuK9m2HBj1UGxNSVBILXCxLI3tCrhy5ds2KVSi1RFw
	rwi7e61hfVZ4z/iOFiSGLyeDK66O8mrSK9fmzfyR8nHwQuRpQHjqHfoB77ZnHmm6fbhV2h+zyl+
	/xi7b1BQ==
X-Google-Smtp-Source: AGHT+IG0FpjWmmxcQYJpVKcXJx06Pdk1OMq8ApJhUZmh+cOAdGtHz/5esIfHPFyf7pTZjPJESFRRRw==
X-Received: by 2002:a17:907:5ca:b0:b73:2e54:a002 with SMTP id a640c23a62f3a-b75a0a05e00mr294145366b.15.1763451415325;
        Mon, 17 Nov 2025 23:36:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6433a497ffdsm12125067a12.21.2025.11.17.23.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:36:54 -0800 (PST)
Date: Tue, 18 Nov 2025 10:36:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dharanitharan R <dharanitharan725@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: replace strncpy() with strlcpy() in
 firmware test tool
Message-ID: <aRwiEnEx4gX90eVh@stanley.mountain>
References: <20251117065003.7453-1-dharanitharan725@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117065003.7453-1-dharanitharan725@gmail.com>

On Mon, Nov 17, 2025 at 06:50:03AM +0000, Dharanitharan R wrote:
> The sample userspace firmware-management tool uses strncpy() to copy
> firmware tags. strncpy() does not guarantee null-termination and can
> leave buffers unterminated. For userspace code, strlcpy() is the
> recommended safe alternative.
> 
> Replace all strncpy() calls with strlcpy().

Don't use strlcpy().  Either use strscpy() or strscpy_pad() as
appropriate.  I wrote a blog about this which may be useful.

https://staticthinking.wordpress.com/2023/10/30/strcpy-strncpy-strlcpy-and-strscpy/

regards,
dan carpenter

