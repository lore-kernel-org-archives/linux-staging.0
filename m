Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E7F37B41E
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 10:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780482015; cv=none; b=UaUIjNACncIFgA4r7r6g7Ph49UsPCqxZHS9N5JcCh45cAIw45hiXh/LOiMM9th1FfY5M9B2lquRIIhfAOra7veospqvqANqEGrxVTnoVZbwfUDezm9OWiP22teYVslcfHg839Y8sjvHB/YJjRIRcqUQHPO97N5EO68grQ0lbacU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780482015; c=relaxed/simple;
	bh=6JWuCjrtHouuP/SgAZ1opeRT+EYE2wYDmIx2BHv+9Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jbi3GMCqXpGBx3s6oOz7blRwSSDhfJC6v7VKHccA/EUlZM+K+U8jwkCrZj6XXRV1frpRcV4FaeWgFZznwr0NP1l84Lm2TZTZD3LSPtT5a2Epz7O43ik8+9Zz6J1t2s8sk6IhZ9kBsZS9CKJuY7q0a5X8U+i0O9iN4kF2ggvfpZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATbE9RN8; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATbE9RN8"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6886be3d39bso19185078a12.3
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 03:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780482012; x=1781086812; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RzJK2sZtZ9lh2JDEqWKWxmwImBV/cnCe18AOQPQmCZ4=;
        b=ATbE9RN8CpqulHhxkd1w3+tD00zYfX4QBL1whc/jcbgixro4B/d/15u5H0WVI4T/KL
         5VnO0gDbq6VG/cpz4njtou1eEKvUpyA0mi3LeQCu/ADy6lWykA3QJzO37dV5hmp3s3ZE
         THyJg89VdGhO4FCCvUJBcljxADg/Jnxk08O/1iX6QQQa+1vkbe3wzfOOXF/Vi33XMT+X
         +IrfCv+Mi6rXUq/Dp2vlLlRTB2Le9Q4jd086KE7tbOaDs8ecBOakMar38AmY4mvYh+6g
         4ItHvdYlzIxcT+05+to6pECvtno0y9M+BH7wsFhCUeh5Gk1mZDF0/VcjGihgwfuIAhFE
         14Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780482012; x=1781086812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzJK2sZtZ9lh2JDEqWKWxmwImBV/cnCe18AOQPQmCZ4=;
        b=Unsw095gIJ7yi3GBIpZdx0wicCpFLRAfPSbFOAYphDq0Jc2IaLDysZXd2GcLsfTChE
         p+OghQVliqq3azhtATv5HJt/IoHZkKzdLbju96mdzTpkYhnHDXRQRuaIhk2VAoUAZFAO
         kBw4kauJMqcrOWHuu3fE0eHOPnJt1HrggBszerYzalsdiTgVdbOFPYlKSBkgvH4zKyyI
         MPzWZse0eUnexCQDkxkKb9qDmMf0WwOLEn0lkoqU6fWJkS7iuMriXmqiuY5HD36Fnb0C
         4AHvLxMS6NsBorDSf8IRnVTrpo/ClOhp8dyTHardp9wBJ6dDL1stZrem+cRS6kzBow/S
         qTnw==
X-Forwarded-Encrypted: i=1; AFNElJ/yAoDb6gZ65a+X4R1Hr7me2JrAvMGM2SlgZDeOaF9lBr7ZTD3IZs0ex4Vj3/8FQsYqq0HJrag5fIxHJq09@lists.linux.dev
X-Gm-Message-State: AOJu0YxxRXZ88U+xtkpEdJ2HQirR+OUtQWHKxyRu//tqohYWMwk3TZkO
	F1LtjiCfheOqnPBmjVDbLRy1+H1fMrNuV1a/PdXELv2HY2pW5NUxAFdS
X-Gm-Gg: Acq92OEe7fLfeRrh9DKLN/LDfMJr5y2Pf9hTFHgV5/aceyl8rp/VvbTlZlhYCvsKWe1
	Rv7FJu4Kjsk9gXaZyAwY6pzqX3OO5qlZdtsTZ8x5uHMXxTs6pkZN5MhCL/hgMQUQan6FuX9v917
	LGxr22a5az1MmpEvnagvMeOZQbMgP8f5eTMCppJbBSdZQIwchsUvhsSGhSd3A6DplQMx/AJUoWo
	EB266CA/pWWsX9tF0cUdDkOFZ4NUWDGN34WIqKst7CDo08dVmH7I3Dkw32cKezY2AkKHlDCw06b
	xW/M0er/BK54kcj9xvQ9loTyLotVaJr2wDaKhW+u6c1IbNRgEUzc6XhTao5JKggiG1n1x+eFoEw
	KHncYRqoESdnJan7yO5BrgD4m78Juu3MqaJv50pVc1LiOpJvFeXvk/1ighk0Qd0DquBa1r2aNd9
	ORXYxsiCfN4gnr0FpmI9NlZb7UMP8lew==
X-Received: by 2002:a05:6402:5242:b0:68c:3994:45f1 with SMTP id 4fb4d7f45d1cf-68e6fa73b28mr1296617a12.6.1780482011623;
        Wed, 03 Jun 2026 03:20:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64c2f34asm974022a12.4.2026.06.03.03.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:20:11 -0700 (PDT)
Date: Wed, 3 Jun 2026 13:20:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Taha Narimani <tahanarimani3443@gmail.com>, jic23@kernel.org,
	lars@metafoo.de, Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: iio: adc: ad7816: Use
 devm_gpiod_get_optional() for busy GPIO
Message-ID: <ah__2Fjf0MxIQLnh@stanley.mountain>
References: <20260603123333.5608-1-tahanarimani3443@gmail.com>
 <ah_zMybQBDHakXpX@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah_zMybQBDHakXpX@ashevche-desk.local>

On Wed, Jun 03, 2026 at 12:26:11PM +0300, Andy Shevchenko wrote:
> On Wed, Jun 03, 2026 at 12:33:33PM +0000, Taha Narimani wrote:
> > The driver currently utilizes devm_gpiod_get() for the 'busy' line,
> > which makes the GPIO mandatory. However, the busy pin is hardware-optional
> > depending on the specific board configuration.
> > 
> > Switch to devm_gpiod_get_optional() to allow boards that do not have
> > this pin wired up to still probe the driver successfully, and remove
> > the redundant conditional chip-ID check since the optional API handles
> > missing descriptors gracefully.
> 
> ...
> 
> > -	if (chip->id == ID_AD7817) {
> > +	if (chip->busy_pin) {
> 
> If we get GPIO optional, this check wouldn't be necessary anymore as the below
> should return 0 IIRC in this case.
> 

No, it's still necessary.  It can be NULL because of the CONFIG_
in which case, sure, gpiod_get_value() is a no-op.  But it can
also be NULL because of the device tree and in that case we need
the check to avoid a NULL pointer dereference.

> >  		while (gpiod_get_value(chip->busy_pin))
> >  			cpu_relax();
> >  	}

regards,
dan carpenter
