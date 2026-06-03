Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFB6392C4B
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 10:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780484080; cv=none; b=a3UHPUKuUdpySnosh9PKq/nHodOusx+t/FtRaFksXfkUTHMLA9arVErsVZ1VQJi8Gk3C2vBE/1TXYvRAEWsr3GSukbf4AHbb82HCd4J/O3sExYkOFrj0H/EDze7AAfvQlCnf8MWrNQhZWBqedQ4c19sYLbiPIiTfbAvoU6lI/LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780484080; c=relaxed/simple;
	bh=tmrf2fIck4+7Bi+IcBroQJJi4SXIIt2ivLBx+FZgzQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nv4v9FYk1MzzGHMnPMDJn/4keGS1YM+RS/RIVIIdXzKyhgXwbMSBM6T6F2l6Z5JTMDE5lCbsRwEa455RyqX1GavJgAtjGGKRFnduRpTSz/+/GGzeHv53vRFBCJhBBGyfOPFo45wC/+JfmNFoC2v10xfChSfGtMin1Jc6s0PeY+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3gapGNP; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3gapGNP"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68d23430690so7125905a12.3
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 03:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780484078; x=1781088878; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l8xPodyUoWJlPI7e6lU/pFf27beG/+cguIPjhg9rv9w=;
        b=N3gapGNPSRV/Bb56jbycmd5aiZzCMeZrq6ANo7GAQeE1uvXsbt1n8nMKLnMFA4Tdov
         jtQBGi3BO0fwq1d2VnTNx6/A5LqTyHf551gsIYCsvi0mHlvU60TvhfLfwKniYfVm1/Hm
         jAjxBVpk0RXSymtiOXOp/pDiw7SR0GNG82BrmH6tRxSRk4SRHQdTajT1SR/NtRYDCofX
         FM/6KMDwVWnY4Us2lfSWMP2/jhw/MNpGMydd2R9L+OyQNK3MU7hly5p4wRUz5m5vDyYd
         Ee6mZ/X9tvwSpgQMl0QVcd1sDMIIZGVomN88nqxamUZT/CtgRxeSRynvpB3C56w9qTlY
         5QGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780484078; x=1781088878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8xPodyUoWJlPI7e6lU/pFf27beG/+cguIPjhg9rv9w=;
        b=lcivNVAAbbiz+DedWM5p3pOykWXDI/ovMwaZZs42+E2w4GP8s4YB+a14NN6oIIWGSi
         plxJFIxo3FnxBcv9ded3BhgkHWuSrNnoyWSlTJB/MiwPvOTODpakWDg8BUnzqdF4JhH1
         EXb6dceg6z0Hw1STk7A0Lke24MQL4FgHyS7PlaDoBJ5lY9q1ZOzV2ki2UeZ9hZDConEb
         kc8yTmlwU9wwyUunarDP/0TXV4QCXroqjRGH9R9VknjpEcDsdb4tCGImvfhKcqS6ttaC
         EbHScG/Uqcorzyd0oTlJpVMifdB3bQ8gt4xEbdze76+yHLY+JkaNqirNP7uk4aanqUmq
         0ckA==
X-Forwarded-Encrypted: i=1; AFNElJ8wLCJJjQw14yz0nG+7c5htOcYAjGI4/pm0n0ZH5xbtaiORX1pOASAYw39JVMD1AxMgiE9p+ZZiBbrr37kB@lists.linux.dev
X-Gm-Message-State: AOJu0YwTIkcyB3bunYPLwh7ZT21xJ0I3anjLX3BLTymyykHFqVxe0xRk
	+rkyQFsSx4JPx+6Wuk7TLlrfm+Xx3ZiwgM3TAT/DBSmaYJT/zoS41ebc
X-Gm-Gg: Acq92OFdDy5CMTzBwc9UCCHt78rqw7mARFbi67dZaermiHX0RsK5QCjsWR/8Gp7YhtW
	49gmlKNEqP6gxgipLotZ12TxgTZbocLqo9pohE4wSmjwY2Jn+gkGBRP6bAZMiC3Dgx+4+rDedg3
	pPBs2WR49Os+TsrvDzA5fDZxR5aIzCIF7SJbALA149n9+HsBnBRLXHIlvtBQNu5/IRs2bGCs3Ef
	4NCEiSvrJkK85uAE0laCLOGGOTLwecMHB9FFPfz0vXJkSfzUAImC//kuP4uH0f3rdqype4ETqTI
	s9CSZFUSi4DVVMD7s+TQ63F79ozB5HHI+t4t3zgt4Omim05uKJMYOdq1Nw/OGeNpZ2rxtibrbi/
	YjGw+MlZlYGw6t0FmkPBqy8P4NfvNeXnJ53ThDjBm1ui37binrtNcOlTQ/bXZVdOzAsu8l+O3gJ
	Afp1TkFF9krhOqGh6FqxzAr+pqpQtrmQ==
X-Received: by 2002:a17:907:c28f:b0:bea:5cc7:95a4 with SMTP id a640c23a62f3a-bf0adceaa7dmr131107266b.0.1780484077830;
        Wed, 03 Jun 2026 03:54:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05208e897sm131534866b.25.2026.06.03.03.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:54:37 -0700 (PDT)
Date: Wed, 3 Jun 2026 13:54:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Taha Narimani <tahanarimani3443@gmail.com>, jic23@kernel.org,
	lars@metafoo.de, Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: iio: adc: ad7816: Use
 devm_gpiod_get_optional() for busy GPIO
Message-ID: <aiAH6eonsntoHQvF@stanley.mountain>
References: <20260603123333.5608-1-tahanarimani3443@gmail.com>
 <ah_zMybQBDHakXpX@ashevche-desk.local>
 <ah__2Fjf0MxIQLnh@stanley.mountain>
 <aiAD7HRnWmSJb738@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiAD7HRnWmSJb738@ashevche-desk.local>

On Wed, Jun 03, 2026 at 01:37:32PM +0300, Andy Shevchenko wrote:
> On Wed, Jun 03, 2026 at 01:20:08PM +0300, Dan Carpenter wrote:
> > On Wed, Jun 03, 2026 at 12:26:11PM +0300, Andy Shevchenko wrote:
> > > On Wed, Jun 03, 2026 at 12:33:33PM +0000, Taha Narimani wrote:
> 
> ...
> 
> > > > -	if (chip->id == ID_AD7817) {
> > > > +	if (chip->busy_pin) {
> > > 
> > > If we get GPIO optional, this check wouldn't be necessary anymore as the below
> > > should return 0 IIRC in this case.
> > 
> > No, it's still necessary.  It can be NULL because of the CONFIG_
> > in which case, sure, gpiod_get_value() is a no-op.  But it can
> > also be NULL because of the device tree and in that case we need
> > the check to avoid a NULL pointer dereference.
> 
> Can you elaborate on the latter more? I fail to see that.
> What I see is that the function either implemented or not is NULL-aware.
> 

Ah, yes.  You're right.  The VALIDATE_DESC() macro has a return hiding
inside.  I hadn't seen that.

regards,
dan carpenter

