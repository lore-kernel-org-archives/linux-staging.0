Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4443F23AB
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 11:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777377315; cv=none; b=WKNnbEtiJk0A29j/i1E7xWamrqDalokvMsVH13n5oU4KBC9VKvc9A2y3VTq00TpznU0d4IFgnVLYO2GeRSNOe28ehBxwajudmI/gjBwQLAR7QOIe0nnuKVkAcSVUVZ7O9Bgl/RPq9ymAGxNwldAHmma1jbBbF3vLChtgSccHvOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777377315; c=relaxed/simple;
	bh=S7N2xG2r677UOw9avIF07lXlPqSlkGhRoYEopSh3eFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQMdJI1P2qfyAyRFTSZGSYHiQisCRna/ThXx8Ck7S16AK4QVKUkwJ/EFjTwSboNkCio3MjNcP498gcgDPDfiN/ELSh+mT/BCvMQZBlxhCinPm2WoVcMFCrRS8Gj0oVXrG3cGHeEEvoaSYcy96Velad1kMZeGqMJSnnhccHWK6ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce+xSD+9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce+xSD+9"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so60700035e9.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 04:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777377311; x=1777982111; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l6xR9z333a9hFwRkoAgx3vUaOdgKW8U8CNCC2N3LLcA=;
        b=ce+xSD+92m4CMIDauRaCU78M9z3plhdwQOOcb6Owp5BcJC2nFx3X/Sq4iyq8+kqWwa
         /xUfMFPzpmEfM0E2ENl5+zSLIo1Sla5jTJne+k1o9CwfOOD80WUo7EPUX9Io1yDNh/8Z
         xbVZIgYDyB/zG/O9bVNSw39mDg2QTbYJNVn+77h7S+TOF9LmElWnXzLjvxfz2LFOxT81
         OFAdfEIekARF7uszGyDovgQ5sT7+YKtT4o7wylU9152lUaIBw0f6agul3N9+9+/OQNy8
         64ERF0KMn024ZvADaSZgE2ZIBWRCq0+Q/Mt2hoT+LDnY3TJpYhzWwktxVNSrPlc0q9G/
         9G3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777377311; x=1777982111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6xR9z333a9hFwRkoAgx3vUaOdgKW8U8CNCC2N3LLcA=;
        b=LTUeBr+IuR2ELPhcLevjQPPVgYVJb6Lm1aFVK/1+3IjcgRBhvIDUAv5mcm98eYCcre
         fHhTyd48OYFrtUJ97DqPo5SzRDh7YNU4TufUnDuOyfezoETXMpSK0T8SUEAVFicyL7sH
         PxT80tYcZNMroY8pYW7gj88RZ9z9MnqG5bXBXrvm8JJuK/psPp/lcHcDuvNq6NcS7Nm9
         Flh4qhrP886GzMwQkhA32Oao7vtUUPLMTadEjdh70Xm08XO5pSQFbwqamFoRCVYdI766
         +rYz55YDq84IAG5Wgl263aOsK0tNDVz12IDPK541Hj+ztj5sZHAtJ869aYralkE92s+T
         LQPQ==
X-Forwarded-Encrypted: i=1; AFNElJ925iZJug1F2RZy4uA/TSMbZOvKEf/UerrtPHDLXOKYrwkXEuZqLJDTEejLR5qywJA2BUcczNDQjK4OXlmx@lists.linux.dev
X-Gm-Message-State: AOJu0Yyfu14bZxPFV2lzfgs0E5zoWMXdcjAWM5+nlpP9663o1pNi3hSv
	+KUo+OOtFdi8nc+kkym7bsxt8tIq94MYWvL25Cs8O8Bjkr7hrsyZSinX
X-Gm-Gg: AeBDietuY7UIJnlE4w75J1WYpGw5OicGS//DVdzG8xfN1eWwCCnNhLkyO5RZG6f7prO
	sKkULN1apB4pEJmSQ73bfau5WiD8hRK5kexhQcjzUBxfIajSRgOLdBC2Vc0L98Is8Nqovi7F4Vh
	APF5v54D9YMEctHBw3x3HmtW62GrKCZ1DNBk5+wHUlb65Wn4aR5CvroCKDgkcfMSh72qa0mYCTf
	GRIzwB64oCMfM1PyViJsnYJttdup9+TDQDWKAddwfFiu7ox5IBEamfLE3pd8yIpHR2UrBdRdYET
	E123XOGIpdxuKHB5Rg+dlum9I5wJWfB5522b8X4hLihUIQNoPvXSf9XNzTHTNd9jiVRrz2UFEzh
	u0xpPoZDflDB2dFmEBMVcTMsJI2eDuAJO1nk3I21qPekw2yAKcw8MgpW0m33lsotY4RhO4GF9xQ
	pIwlmmWdpebGR1cHrmtAsJzjBcOQuyYg==
X-Received: by 2002:a05:600c:42d3:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48a79d8acf1mr9964435e9.7.1777377311348;
        Tue, 28 Apr 2026 04:55:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a79cf4952sm5345145e9.18.2026.04.28.04.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:55:10 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:55:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Salman Alghamdi <me@cipherat.com>
Cc: gregkh@linuxfoundation.org, luka.gejak@linux.dev,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] staging: rtl8723bs: rtw_mlme: extract local
 variables for long expressions
Message-ID: <afCgGuAShUy0RtVY@stanley.mountain>
References: <20260427190548.156499-1-me@cipherat.com>
 <20260427190548.156499-5-me@cipherat.com>
 <afB5jnwGX6H5j0PG@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afB5jnwGX6H5j0PG@stanley.mountain>

On Tue, Apr 28, 2026 at 12:10:38PM +0300, Dan Carpenter wrote:
> On Mon, Apr 27, 2026 at 10:05:32PM +0300, Salman Alghamdi wrote:
> > @@ -772,9 +783,14 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
> >  				rtw_indicate_connect(adapter);
> >  			} else {
> >  				if (rtw_to_roam(adapter) != 0) {
> > -					if (rtw_dec_to_roam(adapter) == 0
> > -						|| _SUCCESS != rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid, 1, NULL, 0)
> > -					) {
> > +					bool roam_failed = false;
> > +
> > +					if (rtw_dec_to_roam(adapter) == 0)
> > +						roam_failed = true;
> > +					else if (rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid,
> > +								    1, NULL, 0) != _SUCCESS)
> > +						roam_failed = true;
> > +					if (roam_failed) {
> 
> Just write this as:
> 					if (!rtw_dec_to_roam(adapter) ||
> 					    rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid,
> 							       1, NULL, 0) != _SUCCESS) {
> 
> The "roam_failed" variable isn't beautiful and the if else makes the line
> five characters longer than it would be otherwise.  Eventually we'll get
> rid of the _SUCCESS but I like it to look ugly so we know which code to
> change.

Do it by itself.  It doesn't fit in with patch 3 which just does
newline and it doesn't really fit in with this patch either.

regards,
dan carpenter

