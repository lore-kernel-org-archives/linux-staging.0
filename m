Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B622D0C82
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 06:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211887; cv=none; b=mnHz/rXbuNF+b5oj0SbPTJJAPwjSYnfE0Aet1TAj+MWWROMez8UxXQJnjao80ZISrcKxWB4nOjBvzve0Wm8+2vy6azWD5C0tQTQfd7v+h9HWhn0YnSArV2cGqQm72GCdUsPXQTP+8euNLYdx8uQEdFcSp9F0NEz8bp2gTct01Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211887; c=relaxed/simple;
	bh=PzPcFTQ3tXwP7zF5f7H/cw0KlxWYCJGLWtrtgS88JXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5g0Zr3RN+0haX1E7PbefufrCanAbl3immfs3mySuJbeMI6fX4yS7X88V24oe6xLyhxRS51L1c37zrbnhPWLc55FqJZCKdKyUfPUUOvbQsNMUJxDC0Uxkd5SuM8WKn5Xl33Z/4wKQ5t15X44ay22q8c/SJfJIzKExy07Hwdf6Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CZrf4trg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CZrf4trg"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48529c325f0so35026555e9.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 23:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773211884; x=1773816684; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7zvEX0IAkMa6oXnGfx3rdipMmH1BF7wL9zhJ+aTV/NY=;
        b=CZrf4trgwzpvq4H0ErIeYLjJy/6y570xkSoPOzPctbmNoyaH+2qYqGFQqgrD2RA0Dy
         P0D7wn3MaPUx68qDcwmF/ljltKBtxlEfZyklpVj5836lk/fC4eWHMAkajpWeEa7baWsp
         ltNhknW2uQFzVdZ/Kn0t9nzaiGBacaMnAdo8L+XtmlzI6KqPYfVNZuOTLz43y0WQAgFN
         fLUUbIEtud4urzI/Wan2P0b9Ww1thMtSASMRdRu26vbuXD41kYtlfcHbs6IPvxa4s2Cm
         yJ5r4khq8rJDh9h80bxuhpr+vEmh04RcUeUGgqUDOub/paIhexoypFg2zPKdPp6WZ5/p
         dEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773211884; x=1773816684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zvEX0IAkMa6oXnGfx3rdipMmH1BF7wL9zhJ+aTV/NY=;
        b=YIl4noddSguuO7x/hqH4MyZnx5DvuWbbp66DFHPdCMOKAE9iIqAQt+g0EmxqLpHtAm
         r6faockPmtSeTrKk1fMgecnZHhizexGHI4Y8A/4pC3frITq+5xx6qDawPPnQuSYFAoWO
         mbUP2wWXEGRuhSiCvTY3vSRQdYnnHkdxVc7m3Z9GVzqus1RHtr4htli11ADcb/OYYivI
         WBURTOgHHJXkQB7Ekl/e5pbSSxgRfuq58iBWOLjPmpP7BngYYCeabBdxE45W9xvakSdd
         vn0n0qQbpmUa0thEBWY+QHETAA26pLWA7G4XSddVwcsnmjyN9eDNbmC8gRl5HqPgXHHb
         g9vQ==
X-Forwarded-Encrypted: i=1; AJvYcCV454me8lHGdoF2LRZGubP884/cQ7XkNoFUGHyLySDntvSZ1eoX3gQEOb3AibtRAqHnQCSOi+88EQpO5gkG@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn6ZMZihgYFaRvqsN5FO2ySPhwvFHRi2K/rJ1JX2v1Of7jsTqn
	hMdfx6/NXqwFKLql4Dn4p64TGUkZm4Y4LgqkyOoKANUxzgKMkkrvOhGqR0JoRFIAnpE=
X-Gm-Gg: ATEYQzyO/hyefEbWPPIRvNUzMTs9/QsSMKJYphffGp+6CWAQCsmjKCfrwrK0jJ+UYYp
	RC6VI2bPCeq2TBI05GJUCKOSzZUmpdH/qqFrESS8OlNaPwq8YPnluVqJrj7ZPliSNZzn/1Ea7bp
	TWejTEbFshC3Ah0FmmfN4KLJNu3z9ImKQWoiAfRO/SG33M+4SlRzdr9/zvEU/BjfO6bUa4icm/t
	fSUk/0ffS+UxrwatzqIcbFyR9EPgKE7Rc80urujvq/YEkszp3Xx0TagAdyzOrORdDrktuo/29BR
	zTP0+r4PX7lquD047SNkiG6+GnF/5gQ5ZIL9HRh/FKZQtTFnzplP3bvTyzfupBOgMhp0OhxRUoT
	sLSxik20kTJpMOt58XJsNB7W8G25fmbZ/VVYyQ86OppEzBUk39ngfDwVg8TWSf8KK61qcxDp0Rs
	66KLFOLy3a7qYF3PxJjADRzUeTr2BI
X-Received: by 2002:a05:600c:1383:b0:485:2fe9:3375 with SMTP id 5b1f17b1804b1-4854b0bff59mr23795475e9.15.1773211884113;
        Tue, 10 Mar 2026 23:51:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f820a2f1sm4090148f8f.30.2026.03.10.23.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 23:51:23 -0700 (PDT)
Date: Wed, 11 Mar 2026 09:51:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org,
	m.tretter@pengutronix.de, mchehab@kernel.org,
	p.zabel@pengutronix.de, tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de,
	kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org, ribalda@chromium.org,
	straube.linux@gmail.com, lukagejak5@gmail.com,
	ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org,
	mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH 1/7] staging: greybus: simplify cleanup using __free
Message-ID: <abEQ6HA0CGGCyV1B@stanley.mountain>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-2-sanjayembedded@gmail.com>
 <abCIBPZzZBfMoOtm@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abCIBPZzZBfMoOtm@ashevche-desk.local>

On Tue, Mar 10, 2026 at 11:07:16PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 11, 2026 at 01:35:07AM +0530, Sanjay Chitroda wrote:
> 
> > Replace manual cleanup logic with __free attribute from cleanup.h. This
> > removes explicit kfree() calls and simplifies the error handling paths.
> > 
> > No functional change intended for kmalloc().
> 
> ...
> 
> > +	struct gb_camera_configure_streams_request *req __free(kfree) =
> > +	    kmalloc(req_size, GFP_KERNEL);
> > +	struct gb_camera_configure_streams_response *resp __free(kfree) =
> > +	    kmalloc(resp_size, GFP_KERNEL);
> >  	if (!req || !resp) {
> 
> Now this check should be done in a better way.
> 

Yeah, two if statements, right?  Drop the curly braces at a minimum.

> > -		kfree(req);
> > -		kfree(resp);
> >  		return -ENOMEM;
> >  	}
> >  
> 
> >  done_skip_pm_put:
> >  	mutex_unlock(&gcam->mutex);
> 
> To complete this, one may add a prerequisite to use guard()() first.
> 

I don't think we're encouraging people to re-write existing staging
code to use cleanup.h magic...  It's unclear if I have to review these
patches or if they're auto NAKed because we're not doing the conversions.

regards,
dan carpenter

