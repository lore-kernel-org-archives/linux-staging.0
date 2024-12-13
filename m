Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103711C3BE7
	for <linux-staging@lists.linux.dev>; Fri, 13 Dec 2024 10:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734087210; cv=none; b=AS1ADyvWwGuCkn+tJpnVMlCDdkWdnSLiLZKHKJnz32GxaaqVnIbpuwDaS7pyDNRtyPBZbmPWJfvxG+6tTG8Zp0PyrfAN6UxcenyMMu/fsteyhYN9+jPNO/gySqf937G33thYTxwhlPe4CHdR/IIaeFtMRobNCFyAByHvdLRiLIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734087210; c=relaxed/simple;
	bh=3RAKuwhJziTT1DeTTJ7GjajGteL0tlZLFZr1flfX9JA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tm4QFeyhi34Kjug4NZxFIpMqf4/87pU+AnlJdZvlZGliMEEhDLTdehvbgORDsYVvz6QWnFYnm/EbF6VsXfTMjoPcIUtvYze0XgXxhhVRRs2PajAy85sgI2RR8DCXf5JtgulqdtMWB5+t7/sXiNy3M2gfLDN0/kGai3DeSkSRZLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnoXoNHH; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnoXoNHH"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361f664af5so16864615e9.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Dec 2024 02:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734087206; x=1734692006; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yf+WwbETet8e5i96HNJic3txU9PUcKXniPQhzUEgHIM=;
        b=WnoXoNHHbRI7rAmIoZ+DwMbE4KxNxp4eWJQ8NA+mfx2ghkX+ShTdHvitt9Igy1e5R6
         o87Mqx76rRFyRMqbErV0nw00JistkDcH7DoOjdQHc55ToKb0rlD7wzkz8oVUCUbbBjtF
         d4c9wDY1Qa0XhsjfvAhcY0Zt5kW0TmtIJ+AmzL4pCQPmvcF68TZOO6d9iCqKa54SxOKa
         R4r4C2koDylo+/nWDogj97EdQh1EsNVzcOLI9Qw/qLJf8lTOxsHradVVkZMWUaAEQ84n
         KXVpRkAKnZpbjN4lgdGrV/unQfsIawt+YU6n/UfC8lOe8A5CJ+9I5cbyKmHh4g9hf4AV
         fk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734087206; x=1734692006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yf+WwbETet8e5i96HNJic3txU9PUcKXniPQhzUEgHIM=;
        b=hIEWvFuRFtugV27VyjwKweHpxh7OjHAmuem9k0fRVRO9tHXqSuZpr7Mkc9GGIp9RdE
         +DMZDp/HiQ3YK/RuB9o8591OywxpJsjnevdB7Eq1Be95XqgAA51bUQfaSPRFxPLeYIgG
         lBUS823NhDQnj5YcivpxI+eECETsWOGWgzAogyI5ZwGCRIwm5uCxtaiEmyOALdPwbYTh
         OI/ec7R+vi+Eu/rz+KLses5p1uLuLEI/lMGjhHd1wQXwrzPb8OX+xsVMZ1I/ALlufbKj
         /8Rx1ndiMcKDDNnpTOJzaFbp5MyHup5vp9q3T3pEP9YclLu5LdxWIqj9YVBVTUA9LiE3
         Q2CA==
X-Forwarded-Encrypted: i=1; AJvYcCVbbhJ8w9ttccT9rkDRUylQ8yESSa8FBXt8KRy3vQrkR1F5Gy2fnULqivD3j+Tlh//k3VsoF8LN1i7aYplQ@lists.linux.dev
X-Gm-Message-State: AOJu0YymZ0jZZ4+u5ZaVwWQeitWz9JFHABtfWI7rihCKuxh4RkAoKJms
	TcTLVqeIb95beCRTBeWewL2hbP7R5+0lkyQ9qKotFEAgHVVeLVE2
X-Gm-Gg: ASbGnctOvDQ26OMcPPzg+jEx2p2EI6uHBLCwmv68Je9+W1G6U/+K7nSP1UJuK7RlnSb
	i75DbFi7mfypZuSnA4/C6fXF8nCobdsHZzaSB+jkolXxTaQwsWYZ0Rv7vPUr4bHT81FRBf+yyC0
	T+HEG38+zs9NaDINhrlRr9YxPShDoDMk3J9zBnoKTEfWo09nXq0SaJxT8bR7PwmV0c8MmpnbD1H
	rZZyXGhbAagtc285h4hSk3fktgJOUbh0eCyRtFUAcsmVjWrLILg/xRSPWJcEhFBTwESOosT
X-Google-Smtp-Source: AGHT+IF7wpcLBiHevBCqFWuwzVTAWqMl+5sNE/JupCPWSPoBAsIudx1Jcm4rfZoivatzYHnZakf6UQ==
X-Received: by 2002:a05:600c:4e01:b0:434:a202:7a0d with SMTP id 5b1f17b1804b1-4362aa94055mr12963585e9.22.1734087206038;
        Fri, 13 Dec 2024 02:53:26 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625706588sm46607105e9.29.2024.12.13.02.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 02:53:25 -0800 (PST)
Date: Fri, 13 Dec 2024 11:53:23 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org,
	geert@linux-m68k.org, arnd@kernel.org
Subject: Re: [PATCH v6] staging: gpib: Fix i386 build issue
Message-ID: <Z1wSIzBOZu4gUJhv@egonzo>
References: <20241211164452.27464-1-dpenkler@gmail.com>
 <670d63a3-6b20-41a3-a4db-96b407b80202@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670d63a3-6b20-41a3-a4db-96b407b80202@roeck-us.net>

On Wed, Dec 11, 2024 at 11:42:36AM -0800, Guenter Roeck wrote:
> On 12/11/24 08:44, Dave Penkler wrote:
> > These drivers cast resource_type_t to void * causing the build to fail.
> > 
> > With a 32 bit build and PHYS_ADDR_T_64BIT enabled the resource_size_t
> > type is a 64bit unsigned int which cannot be cast to a 32 bit pointer.
> > 
> > Disable these drivers if not 64BIT and PHYS_ADDR_T_64BIT are configured.
> > 
> > Link: https://lore.kernel.org/linux-staging/2c6c7e9d-ca10-47a9-82a7-a2e26b1f51ef@roeck-us.net/
> > Reported-by: Guenter Roeck <linux@roeck-us.net>
> > Closes: https://lore.kernel.org/all/f10e976e-7a04-4454-b38d-39cd18f142da@roeck-us.net/
> > Fixes: e9dc69956d4d ("staging: gpib: Add Computer Boards GPIB driver")
> > Fixes: e1339245eba3 ("staging: gpib: Add Computer Equipment Corporation GPIB driver")
> > Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
> > Fixes: 0cd5b05551e0 ("staging: gpib: Add TNT4882 chip based GPIB driver")
> > Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> 
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> 
> Guenter
> 
Hi Guenter,
These nice patches from Arnd fix the i386 build issue without having applied 
my v6 patch:
Link: https://lore.kernel.org/linux-staging/20241213064959.1045243-1-arnd@kernel.org/

I tested only 
make ARCH=i386 allmodconfig
make ARCH=i386 M=drivers/staging/gpib

-Dave
