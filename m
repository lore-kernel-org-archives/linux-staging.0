Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D1B1C07ED
	for <linux-staging@lists.linux.dev>; Wed, 22 Jan 2025 07:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737531873; cv=none; b=cGyltiwSE4Oyd/DN6nOSBDnD04DlzSuD9vAJ4lxtnvTdYOw1pSDqd5iSneGSw7QIUXNEqfN7pl26/g4jd6YAmT7G/tnDAnvj24ujitUHRov7/x/Ih9fex0oTYU99FKVUVAZ0oLMIYY76ZNBxRdEFSNVSF5c2kgBC2VC65nt0HBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737531873; c=relaxed/simple;
	bh=QLnRU0MWnrg9x3301DNkdRln9BGx5mG+TSPmx9dhhsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUoiICPAGlAWl+BMYpRgcYjDSPDxH+SDAhAEzRgFvUQynXp+0JPr3l/yssGKP1L0SAxwZJbT0v1iONvE/9b9FuFIn5mlle1vWeoqPSpECp97/bKb3cmDf/h8YeEWExt8vY/0cFnVv47CrG6CBTZXW8w8rL7FUFgS0P1eyY5i38Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qzBRhXHP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qzBRhXHP"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436281c8a38so47445165e9.3
        for <linux-staging@lists.linux.dev>; Tue, 21 Jan 2025 23:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737531868; x=1738136668; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bsmxo8ok0PWoDNVNxNxbEGNCPBLfV7kz8NTtIfG+KwI=;
        b=qzBRhXHPFJ0XzC+v5H3rUWx763p9BtoZdkg4zJ1gA5J8V1hIVtyLlrtkEG/rNWUaKY
         F9HgsQ9EIsto0qWHvZgXKhRs9oFysrUkgXEdNOfMrjFUfsg8plFhFANIOWAKn8mKv+dk
         QJKytxm9SXupFj5/NDcoXDVxV44C6prO9fsdF/LUc1n+iu290/eKwulI3k24zeI/J0kT
         2ZomkTIbfV1uAonFh6EfOKwlEl2Qlq88TT4VyowLbiyvhz310t+iXLC3NTroaEn/ln3h
         j2bgT38HcT4wWUEG3yGa/3UICHzumx3IaJr56YWH9RiEYB12A1NypIXQjCAbEUeQ6t2n
         9qyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737531868; x=1738136668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bsmxo8ok0PWoDNVNxNxbEGNCPBLfV7kz8NTtIfG+KwI=;
        b=mlzMSIqvcgNw5Qznbb4ZOQROU2ZZSz7OE2EgN+k2ZxG4C37HDdR6OkLj2cfI5oIHjD
         2XOd8CZFEg1zpuKASUiM0VyMYAsR6lJUvQZ1TaSSxV1Gg3TiUMbEBvdE/QfFXSEYaIlp
         LRmHKOY1Hj2Xt/FgWlaZMFACeCl4nuzJc3ngSh8tcpvpCZ/v1sSpxhKPcukZi8CKjHlp
         Y+bCOyasOUNfqfqRYyQcFiWLu1Ls1PKEC/fAzCFg8y40gy0fur5eiwdSxMkR53lIoVqv
         ibnCjabIDlBAgW4YH0pZk7P6RW+/tsejFhVGl2UUPj3uZHPEgVP/iLikL0Lj/8oqH7EK
         j76Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPf3QDuP31oUS+uY06gU3Oh7VCMyeg0YcXWCIU7zoRBoMN25mNLyYIicejHuF1tmQwMcAWSjKXTyEZqF9U@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/rJ8x8MyR+uTHGvtD+YaqU/35xQWBDjWR+nMFypvb/I8MhaWV
	Nm7s1cWkLxiHql4+HuNanUsZmDBc+daQxpV7vNxnuh7D1dUgQChd70IZ5RyyIIc=
X-Gm-Gg: ASbGncvk4xp0Gfgf4cCIUq7XDLicEIXa1b8ZcD6qmzB5SwE9lDryfprHoSbY/mT90pE
	+N1AGA8YqNg+qXbg9Y0SzH8bqT7h3Aghw6ERmW66rNf4OtQ6MaWOSgRPFmVZaRJVhAG4i2Bwjnj
	tTgpk+xwZUHlKqCqPKnJ/LA5T8Zdsxsk0hz9b64Mf5rkYtBr2keYEtokWWChq3HUEolzpw+dIw2
	U5R6D+htFDB6qEqx2rdeEzdZrlCG6fgk2sfRtcaYNJxDlVnkQMvW4swlfWNQkFfBvsbbi/HHRI=
X-Google-Smtp-Source: AGHT+IFdii86nzRckkv7+ZhJvESX26haiGxkZ4n+5uLX7IO8Tv3+bylFRFp3PbXap4gvqUW3Z5V8ag==
X-Received: by 2002:a05:600c:1987:b0:436:faf1:9da with SMTP id 5b1f17b1804b1-438913c68ebmr189076215e9.2.1737531868551;
        Tue, 21 Jan 2025 23:44:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327574asm15586266f8f.68.2025.01.21.23.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 23:44:28 -0800 (PST)
Date: Wed, 22 Jan 2025 10:44:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Make static and reduce forward
 declarations
Message-ID: <fec1be85-0aa0-4591-9a6e-c4f5d4efd237@stanley.mountain>
References: <20250121203342.20410-1-dpenkler@gmail.com>
 <6889992d-043d-4af8-869a-84eea9609148@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6889992d-043d-4af8-869a-84eea9609148@stanley.mountain>

On Wed, Jan 22, 2025 at 10:37:33AM +0300, Dan Carpenter wrote:
> On Tue, Jan 21, 2025 at 09:33:42PM +0100, Dave Penkler wrote:
> > Declaring the entry points as static caused a warning that the
> > serial_poll_status function of the agilent_82350b driver was
> > unused.
> > 
> > Add the entry point to the corresponding interface structure
> > initializations where it was missing.
> 
> ...
> 
> > @@ -842,6 +824,7 @@ static gpib_interface_t agilent_82350b_unaccel_interface = {
> >  	.primary_address = agilent_82350b_primary_address,
> >  	.secondary_address = agilent_82350b_secondary_address,
> >  	.serial_poll_response = agilent_82350b_serial_poll_response,
> > +	.serial_poll_status = agilent_82350b_serial_poll_status,
> >  	.t1_delay = agilent_82350b_t1_delay,
> >  	.return_to_local = agilent_82350b_return_to_local,
> >  };
> > @@ -869,12 +852,12 @@ static gpib_interface_t agilent_82350b_interface = {
> >  	.primary_address = agilent_82350b_primary_address,
> >  	.secondary_address = agilent_82350b_secondary_address,
> >  	.serial_poll_response = agilent_82350b_serial_poll_response,
> > +	.serial_poll_status = agilent_82350b_serial_poll_status,
> >  	.t1_delay = agilent_82350b_t1_delay,
> >  	.return_to_local = agilent_82350b_return_to_local,
> >  };
> 
> So what happened is that Sparse was complaining and you were cleaning
> up the code and you discovered this bug.  Fine.  But bug fixes need to
> be in their own commit, not hidden inside a giant cleanup patch.  They
> need to have a commit message.

s/commit message/Fixes tag/...

regards,
dan carpenter

