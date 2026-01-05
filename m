Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD0F2F12DB
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 10:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767607764; cv=none; b=n14nqaj/YzA9h14GlzSQWSmR03se9QkqxAIhdej2baDNSrvBxdlnbA4GwD5k6wnI1jTVieHDt/jhBni7UbWjCDHFIx1a6/01fLBZHjLcn6WuRkJRpsvQOU1/ecahuW80bwlpLQ0QNliEqVURWdCJ9xzPA+Qq4Ajnzj99l/6l3mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767607764; c=relaxed/simple;
	bh=HaEzEYyza8lmatOqf1za2pkgn5bN+AvWVk7IoeviXAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0seoIpZZ7a5yc3rGPJhH40pbGyPo2MTDb8KAbPpedXCK7jqh/JUVch/hoyNGxPjgtrfXZDsAd1QI2RcbQ9u2A8bfHa+OaCY1RgSppKlpv5xHHi2HD1MCvFF2fRwgpyr0oQBRXtGoDjuI1IgQbRbt8TgyU93dVWkAP9AFs0xjNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=igH7GBXo; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="igH7GBXo"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso130912375e9.3
        for <linux-staging@lists.linux.dev>; Mon, 05 Jan 2026 02:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767607760; x=1768212560; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IlzeuvMnWpm21LjmYT/5/RVCRr6/oOpHIWXrd20iuz4=;
        b=igH7GBXoEi9HH4u9R5crNrKhnxnPZ5Yeww0QxuZlI0xXRrNrrpd77qYh5E8RK7Ew4K
         ZyEhQmaqGpWQWG8tAx80BvyZTFEC2TSrqMa4/NatFFEkuylFnlTDy4vvCDDgSKW3Q/TW
         QFnmp5UH9FV46RuUSKq+Nnjn/GLa3OMtHflRpSLYZsSZz1gbdLxKs7KefI9ycLu2hqp2
         EgCBluaxz6YJXZC+RmBxi863x33W4sns001APT70Ka9vudJLM2CvKIgyrPdR0cb/DsRg
         R4qK3tlyKBrkJI+ROyE1NBo+vwutcQflXJJ/dwWfZ7kj4V83Wz2UZY2xiCNgJzk68ruT
         OiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607760; x=1768212560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IlzeuvMnWpm21LjmYT/5/RVCRr6/oOpHIWXrd20iuz4=;
        b=qzkl5VIW3XaKMDjE1bkbR63xoyeTy9YI0uRLckPJT1YzzvBPYWVY5lJ6Qek53aJmwX
         nAjKG2Ce6cNojD55o5LFmxUtlT1RkMfhQxdyyBJewsIGYRixqpKApHVoz2SpCA5A5Voc
         zxDet5ig2VYvhlM+CXKP1nJelzdiW48ZJs05iHYi3mgjmLxcKWEg5QmE3w9STLAPexda
         1Xtn69BNiGi8m+VphIFEgkUen/8UjH9IOrD6HY+pTDw+ebjka4rzfBcAvRkct21dCgtt
         8x39CuRKadm3+cWx6b1ecSucJhbSq4hjfCJqyrW7zTcVyqWCoCCWcDZrFj4ehC3aFsi/
         vkiA==
X-Forwarded-Encrypted: i=1; AJvYcCVDQjCoVLdZHCJZw6uUu42gKeFLCJWVdmrF7/LwfMB/F1J9jYC5/erqs4g5RJhRAJFp59B59iLcEtgeIW6o@lists.linux.dev
X-Gm-Message-State: AOJu0Yzzk/iJlwiHBJoeawRiY+z+p8zmof4o264PkpJ2HBCs0DTn8abm
	BzcrIsVUj1c+gLTbUqrR4e0Bvu1NKE4Hgcsdm5ouigq1Y9YNtZXGtsPhehy4RihoMS4=
X-Gm-Gg: AY/fxX653qvuVohwYRxa+d8pLaoC37RKBtml0rPD9As876liW5/MaPZpuOlSSB5NQ9L
	yaqcnX1EblgSmPJ/xjqv9RatSZMh6lwdP4hIR1D2fUMjn5oLzYzbjS1A1SLACK2i1svzMDenMr/
	+BQ2CIpHXYoIcy3X5wGduH61bTR8FqqAgNQu59aaF8lCc4dCqlHox48JQNIFL8EB7xF7cKy0wqt
	4VSCMi1agVFlYWznTt4dGGqz/hOKJUwVcVpAz23ir+BkHuARWVJEDcZwMOMrguZ713GePjrioUN
	wKlN41Htr5u3pbCy7lFQ7BOQVssTURlHSq8PrBkGa2xbU/zgj5UMw7sF0nqoAYUW5QFA62mqvS6
	zjscYiy1IGEOI6SSm6ZK5qwnOn4hRJV1znDUmrCjGLgdmoRaBY0cU6yKCt4ewpO02BxbbjWlqfA
	H8voCzoWmVObeivdbT
X-Google-Smtp-Source: AGHT+IFF6mlDf4rn8+0EUNe/LlrIVzaNSb3DcRNWYLhGl4RcIOvMWinAt4Wkd+BSxs91cxf6lLf6ew==
X-Received: by 2002:a05:6000:402a:b0:430:f41f:bd5d with SMTP id ffacd0b85a97d-4324e708e9amr50906571f8f.55.1767607760494;
        Mon, 05 Jan 2026 02:09:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa0908sm99614680f8f.31.2026.01.05.02.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:09:20 -0800 (PST)
Date: Mon, 5 Jan 2026 13:09:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: arche: drop dangling Kconfig symbol
Message-ID: <aVuNzWb3TEj74t2M@stanley.mountain>
References: <20251230062704.3339404-1-rdunlap@infradead.org>
 <d81069b8-04fa-437c-8bbc-51360784952a@infradead.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d81069b8-04fa-437c-8bbc-51360784952a@infradead.org>

On Tue, Dec 30, 2025 at 10:23:40AM -0800, Randy Dunlap wrote:
> 
> 
> On 12/29/25 10:27 PM, Randy Dunlap wrote:
> > --- linux-next-20251219.orig/drivers/staging/greybus/Kconfig
> > +++ linux-next-20251219/drivers/staging/greybus/Kconfig
> > @@ -206,7 +206,6 @@ endif	# GREYBUS_BRIDGED_PHY
> >  
> >  config GREYBUS_ARCHE
> >  	tristate "Greybus Arche Platform driver"
> > -	depends on USB_HSIC_USB3613 || COMPILE_TEST
> >  	help
> >  	  Select this option if you have an Arche device.
> 
> Perhaps I should have left COMPILE_TEST here, like:
> 
> 	depends on COMPILE_TEST
> 
> ?

If we're going to do that, we should just delete it.  It's been
impossible to build for eight years.

regards,
dan carpenter

