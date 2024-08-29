Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AAD1922DD
	for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 11:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724931807; cv=none; b=eso9M7HatAQzIOvjN1hbkaI1H31OH9wUPnwM/Wvnw1/F5FOD6+FN06B2bGvl37/uKeS25NcnlU4Whm3uwrL6Gb7wkNR2je+4kR3MLSQQpzZbrsnXqGo/7noAP4ynVpZWNr+qx1jCcKCZkRxztVJ68154GmAv9RIAH8HNs9FFEes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724931807; c=relaxed/simple;
	bh=s63R0yEtD2lzGTkJnFSMLaCXpECL6SDh0c4ddUidQTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQEtCFPz3olrXKyoT2kgehnAxqD098TmlzdvY7fyVdHzog7iSvMoNo9j0t2ZhzTYKjO/dSBrg/+BAEmGJ5JWCE+r9OMhKwdS44iyO5vNXRZoa5VA1prumVUWV60MEdG9T761lvTtIIavyJHKLEV+6CqsqjuljJNzjJOLNEOsDDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F0GGcAzP; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F0GGcAzP"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-371893dd249so380760f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 04:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724931804; x=1725536604; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WKJ044DJ6shbS65781+Yi0H+JjJTteS86fL5N3lWl+k=;
        b=F0GGcAzPIV2EgBgebBgiwHtmVG440XvAqL3NJnWunPoDyyzyoVCUz/eqoiVJ9YRDYr
         VhYrdTMIWaM47LZTWJgzpFixJMcS0KIeJUVvx5GVlCuVho4Z/InzXAktKke/oONf2PYJ
         fBVML0PbbXfygopDwcGVeAcRHaggXXhz1/bw5kc0G9+90ProC2Z40Fpfu4ekQI/zh7c6
         1nIo2cOXoJLjDPvQKP447MYfxdqRrm8NW6Gnz8Pf8CHL5u5yw+NjkBruC+GPJvRSJ25h
         sWDtv4FMvax7sjlu7SNPbFbpsJOLSVRAJrwrEgVYl9cGqK/arBz7viBImslTyeg20rC2
         aD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724931804; x=1725536604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKJ044DJ6shbS65781+Yi0H+JjJTteS86fL5N3lWl+k=;
        b=OuWwp6cgOcfSQeTZ5l+Lgs++HmYsnMeGeUy9Az3MqKtrqwlnSz2vJa1pEgOHBtXZoD
         AHFzvaqqNXOCrsStVb32rTXLrZ0bp6fL8lv8Q2qPAo3gSxRVwswtZR/CFm+rX0BQ/tAx
         GeuG73opuK72ZBwIUC3DojV756+ururA3hGfIAAGzOYqvreyT4Kz9MJewHqSfchqkccx
         6kjnpwAd/mVcB1iOtRxNt8A0NANdubl0KPGVpAKEfKctOu/PseH0pfqQGlJWhGXIISlu
         rdFWISItzemaRdXrJcJ72D1vBv0j2ba+xIcE2RaW8HM4bMvNRIb30e+SmfhBtC99eHW2
         Nf6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVo/mi1vz23PL9yXVIisXSatHsyA/xvwb23qIfEFZOOn1LGDq9+1cmOLR9xZxIoVMjjVKSBEhNrhDbM4cjU@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2AIE2Tiw2hzpx8xZiGct5j1NFx+P/0udeskUZFeDjxaiYDKFl
	aX46x34fCsBYuuNAyINoLKaTXMsHMiedtPr0QLwq1RW/mBjaxqLcQ7sMa0Pwiks=
X-Google-Smtp-Source: AGHT+IFOdw9ujiuwiSBHFU9+4OjvZIDBUCRu48fmW/IwaVfF6faEydvSR/mrTCHm1bmjK7UKGK5Yfw==
X-Received: by 2002:adf:e508:0:b0:368:7a04:7f5b with SMTP id ffacd0b85a97d-3749b581bd6mr1613589f8f.40.1724931803624;
        Thu, 29 Aug 2024 04:43:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee7171esm1202801f8f.37.2024.08.29.04.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 04:43:23 -0700 (PDT)
Date: Thu, 29 Aug 2024 14:43:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alien Wesley <alienwesley51@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH] staging: rtl8192e: Fix Assignment operator '=' in
 rtl_wx.c:681
Message-ID: <9c1dc3e4-18fa-4a09-9be9-f0f3c9b4fb43@stanley.mountain>
References: <20240825161335.21737-1-alienwesley51@gmail.com>
 <2024082916-savings-upstage-9606@gregkh>
 <8c1960d3-8f0b-4505-99aa-8af55685bbb3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c1960d3-8f0b-4505-99aa-8af55685bbb3@gmail.com>

On Thu, Aug 29, 2024 at 08:33:41AM -0300, Alien Wesley wrote:
> On 8/29/24 06:52, Greg KH wrote:
> > On Sun, Aug 25, 2024 at 01:13:35PM -0300, Alien Wesley wrote:
> > > Separated assignments for pairwise_key_type and group_key_type
> > > in order to silence the following checkpatch warning.
> > > 
> > > CHECK: Assignment operator '=' should be on the previous line.
> > > 
> > > Signed-off-by: Alien Wesley <alienwesley51@gmail.com>
> > Please do not put line numbers in the subject line.
> > 
> > thanks,
> > 
> > greg k-h
> 
> Should I fix up the subject and resend it as v2?

Yes.

regards,
dan carpenter

