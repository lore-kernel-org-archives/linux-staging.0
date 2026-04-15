Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED31C346E56
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 16:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776270203; cv=none; b=ZOieA0TDsP2PFKLeDT1sbaysj4kktIBrKvGiHW70xcj3NDU/BYg58pShjaFGYn3V1IDsfJKRe/BLOsRRMIFvtmMN2fb+i3zum491airgYAtpW/FTmgu2NY06DbrsEg+/UngYYTOuPpVn25vCxi+h6TkX2M+S+SLX8/vXcdfs5Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776270203; c=relaxed/simple;
	bh=GHCU+bbFUJa7ME8vQIA0RMnlQLkMVDn7IlOjIXvxDPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOE6Zq2XAGivg9JHABEOWIq9EmXMqJGhLAcFkNXzeiecNjbKJLYXZ4aCghq2uR/HU4KKbbQ1RBCqihWaXHXt0dGfrr61X+MbwnIbu7OQo5os2fMv+SDsDpGncx7nF6ln5b03X0cXrzH8ik3hHb+sajeOtGZlM9qNy8H3OhH9h4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8dcerex; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8dcerex"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a041eae5so52306665e9.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 09:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776270200; x=1776875000; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w5SisJyRtRtkzZampcjxbirVuB3MRSAAjgkwq2Gw8Sc=;
        b=P8dcerexFJswYH0/R7PdM0U1Gt0eCKPBKoRfzQUs7xsn+MUS75/SDWoSRJJ1rbwc2R
         0DeXoalcWVVrJTOSAjJG13E1Ls74tpUSQEhAFAsK6sP/Z1u6G7xOhOyZUxy8+D6U4oHv
         znLlokemPf9M+fzhWuFpTsYfun3KLI620OyZuU30FZpLRPBFJ2b9tliO1olIX7OQlnGe
         E5S8K1B/3fTo0n2ykuwdwjj0mRitGATeAGgB9hAP3HNnMytvpt2vo8EgyGydpteomm4X
         VJQsYrt71QIH8p7Vu+nlUeWjbwDVfGDg7BrB/mPmXNugQnKZPWS5QI5lza4ptuHxQl4k
         rvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776270200; x=1776875000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5SisJyRtRtkzZampcjxbirVuB3MRSAAjgkwq2Gw8Sc=;
        b=Q4x4AXEJyCRnI5Ezy9O6q5W4EVg7jJ2vYFiGNcBrmgZmIfW+vmzmxk+mWd6atGDkNd
         mpMj2MJGPEuDTOswEK0ZEbPbYr2HgopZ6GGvZzVsP5GKDYglui6vcJQg80pCDELLIzgD
         bCMUcDeN67eoAFUa3gIEGz5PyvSdr1Yh7b6U9vWGaUmv6LQHCEsIBKtY2c0JuaYp+ex7
         lMI5SRcDI3t2bp4X2+a8sLddxf7sjz0VStsbme8qFKXsnBiMwL2W7c5Omip0BPwzRuet
         Bc8dJkTGPOAM+CugHxnSoKHoGfXdl531ZmdCI4JXMArgC2WOMhEF/iNW89BV9TRQDUT+
         Dpog==
X-Forwarded-Encrypted: i=1; AFNElJ9T654maEhYUuPQyAYIxmeTHa75xhqiDkz6mHwJ/qYPLZsUcx/byt8DNxm1pihWoY3FEA92BwX6ordX6kcQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyrU7BBEUPPREEAA4wozNU2fQ/3Vvm2wUy+mZ/QsLYPEn2NS5JX
	mdqZB25nbqN5um1Moik9r4aF+hJVxVPfQMy+HJuVNxTaY9IKU7I9NkyN
X-Gm-Gg: AeBDiet6jto82+sGdp3n1Xr/1xwzq1kBjAAHCt7IbGC1nYO5nThr9qjgOp74PLS5CpZ
	BmJVFtypptLo4uMaioGSIOkOI2ht0feduWn4Gp3T67PUJo0ppHy1uAdUfFa5PTXm0gs+x06CE4u
	vPLYDVwI6aKFz0IJBj1QJ0k9okcD+qVFarmidqS1QbraiHtI70Zl73/y0YHcAqq0cnqxDXk9tbn
	wfyMwk++wcok9NRK4L4HV5/E7DD1LVpUotmE2rdQ8tSLOIC9i8P70+/4om+qs0juxdQJ9B5PuyN
	keJMwPXl8WTJQ3dq9MbSTu+s6940h3YIZeLHTcve3ST7A7KlQDt4OcKd5yWtq6xNeiFhIUTpIxL
	0nIGbXjyKRa1oNgc63Yc08tiL5K4lzlQIyLIBhDELENR2nd5WU6sLymOuPgQK5UQxBDVZ2/6bJ4
	1MyZYKx5S16RYyKYajVTw=
X-Received: by 2002:a05:600c:8284:b0:488:d228:a133 with SMTP id 5b1f17b1804b1-488d683d280mr295721625e9.14.1776270200141;
        Wed, 15 Apr 2026 09:23:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f0eac687sm22601145e9.21.2026.04.15.09.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 09:23:19 -0700 (PDT)
Date: Wed, 15 Apr 2026 19:23:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] media: atomisp: gc2235: fix UAF and memory leak
Message-ID: <ad-7dDQTF46ijzzb@stanley.mountain>
References: <20260403002319.12771-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403002319.12771-1-dbgh9129@gmail.com>

On Thu, Apr 02, 2026 at 08:23:19PM -0400, Yuho Choi wrote:
> gc2235_probe() handles its error paths incorrectly.
> 
> If media_entity_pads_init() fails, gc2235_remove() is called, which
> tears down the subdev and frees dev, but then still falls through to
> atomisp_register_i2c_module(). This results in use-after-free.
> 
> If atomisp_register_i2c_module() fails, the media entity and control
> handler are left initialized and dev is leaked.
> 
> gc2235_remove() unconditionally calls media_entity_cleanup() and
> v4l2_ctrl_handler_free(), but these are not initialized at every
> error path in gc2235_probe().
> 
> Replace gc2235_remove() calls in the probe error paths with explicit
> unwind labels that free only the resources initialized at each point
> of failure, in reverse order of initialization.
> 
> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---

Thanks.  LGTM!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

