Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1101B37147
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 05:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718171526; cv=none; b=tglok2mi0xKkdX2bdbghit/AZfqwKq+X6haQ4GNHABvICh8bUZUnms6qIY9gC2E/PXORu7awASv/lgN94l4VoGqz4bLhl17V4j3I5ju0kug9JatAJyT/jWcpfkeXSQVw8GQVtM1+fA2VTeG6wPPWDNYoaA6HH6x9cJ/1PVqH0p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718171526; c=relaxed/simple;
	bh=R3t+fAoA53G/0nY+v//+k/Yhq+rbGHMT/yqHlCsaWPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcB5b99Z318o+LBey/QGAgDrZx9LDy7v8tHe4u3lo6kICJDp+6mZ31P/YCRTMocEe9ye0j+Ee3H8dni/QUAQ1i9ulCom0Wmii4molnEh4h03yTr2J3qBcJW+pX+5hkFtLKUZwt5A+T0j4ZgBfh8PNisBFXMcy5NEJm8sKOqAZJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k8H2eKcG; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k8H2eKcG"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52bbdb15dd5so2186438e87.3
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 22:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718171523; x=1718776323; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xu6qvgKjDbbrX0YieinjCnM1/XJxdkg3zPM9JY4YbrM=;
        b=k8H2eKcGkBv7gJsU1fkE116dPNKt1RdKbpoh5jW6peknvpHjhWlAm8R7cQKIEUgZvJ
         8+oQ9aDCxltmz4rbq1GPNJjc4s+wEC+fXCndFGkV8yTnDMZXxZQCCzwMdNJKdbEeiYZL
         TrGv3NT9uQ47GPeEBBJW4wErX/tUX4evhfjWLuLa7N2FAl5/uda9uboPsSHWc9P0ZRiF
         22BIgNsU6biMA7dd40UuGLG7VfshbLkH68EN67Qfhe2CoKzy7SpOe7gIMuE65WV4vz4H
         PXkN2e1W36+BAnrBgLrs4ydmoe2CEnh+AYZJ5Ukfcgw3L3JSiD8Tnq+4nOTiJkKnweC1
         83LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718171523; x=1718776323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xu6qvgKjDbbrX0YieinjCnM1/XJxdkg3zPM9JY4YbrM=;
        b=o4Z3YmZCOsV0bdoGCbq4wl1CoGgZekzJzhurYipyZ0Y0hz8F8hfHOaS7wPafQ88RQG
         Ptuen8g2pbTXdq/Pjx3qOKd+E+mUAtF0p34A5COOT02YEfwurUJeFzZcAxKQbgaqbMyK
         AuU38odd4FggHKrjufTIsOr3NWOWVwJiCwgJsrE45NrvvOjphhic63rbOaJ3kBTD2W06
         PAeHm+jRu010KU4/Vfs/e3gupTjKFzO7OZTU3i0NoAz6iUYwoQhY1aexYTMJM3atk+se
         uzubcR/0vm0alGZbJ9vHOkq1VkV/JrIbHH6RGApqrk+OBnu+zj2TSIOwQzbZmvr+N7/q
         cvcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr6bUSmDxhtp7iuiGjLyJgJgmKBmzN2dzDOuva51tOF8Y0lWeqVxC2BYCxEwmUx7/zVBIBm8YDI/HYaY85jctaP4EfN3iyUiaIxbzMBA==
X-Gm-Message-State: AOJu0Ywd1D0fD1uB2z/9YAJ5JtQLtLKVrap7Dg3ROq6QRdlYNkOKwIxm
	EZddEg6ndcfIQW6DT0vxnsqlEZTNKhi2fbnPtZSKf4u+glU7Q/hzcrB7wupcl+A=
X-Google-Smtp-Source: AGHT+IEMv2WQXJmHy+VtqH/aJvnGmRbaK8iEAZEr9i2rlYc4Tt6nVmQ8wQ7fMKuercu2cza5UfG45g==
X-Received: by 2002:ac2:4344:0:b0:52c:89ff:10bf with SMTP id 2adb3069b0e04-52c9a406871mr304623e87.67.1718171522911;
        Tue, 11 Jun 2024 22:52:02 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874e74c7sm11430045e9.47.2024.06.11.22.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:52:02 -0700 (PDT)
Date: Wed, 12 Jun 2024 08:51:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 07/10] staging: vchiq_arm: Reduce indentation of
 service_callback
Message-ID: <96339b9a-e523-4009-b907-3b9502bbe9b0@moroto.mountain>
References: <20240610210220.95524-1-wahrenst@gmx.net>
 <20240610210220.95524-8-wahrenst@gmx.net>
 <01190bf2-c698-423a-b587-c80ce5d92bb8@moroto.mountain>
 <20240611212347.GG10397@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611212347.GG10397@pendragon.ideasonboard.com>

On Wed, Jun 12, 2024 at 12:23:47AM +0300, Laurent Pinchart wrote:
> On Tue, Jun 11, 2024 at 09:04:28AM +0300, Dan Carpenter wrote:
> > On Mon, Jun 10, 2024 at 11:02:17PM +0200, Stefan Wahren wrote:
> > > The service_callback has 5 levels of indentation, which makes it
> > > hard to read. Reduce this by splitting the code in a new function
> > > service_single_message() as suggested by Laurent Pinchart.
> > > 
> > > Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> > 
> > To be honest, I liked the version of this patch which Laurent didn't
> > like.  Even after pulling this code into a separate function, I'd still
> > support flipping the conditions around and adding the goto...
> > 
> > Laurent, you really didn't like the goto?
> 
> I won't nack it, but I really think gotos seriously hinder readability,
> with the exception of error paths.

Hm...  I guess I only hate backwards gotos (ones that go up instead of
down).  To me this one is kind of like a goto unlock.  It's slightly
more complicated than just an unlock because we add a completion as
well...  I don't have strong feelings about it, I was just interested.

regards,
dan carpenter

