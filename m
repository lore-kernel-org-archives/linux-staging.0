Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D46175A72;
	Sun,  9 Aug 2026 18:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786299530; cv=none; b=IbnsSHbSUQUpFKDkl2vp3yr/fHFM4hj0ZZ8kIFeT6zQ84CNMJWbV4n5lwmXn+KDlQQ/8AviSMj7qNkjYUoG7C+ySNGOpV8Ev3XqjfqQEcvb3IfIYQTegfexkdIhCDUuM8fjXeTgW5FqXS8iRQFknFzTkuySPVizvH2KQFiK+mqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786299530; c=relaxed/simple;
	bh=FeQuabZAKxAu4h9G47V5kTGyd8p5zQ82/45n7pYIDzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sf3LZxvrDBM8TwMCcNFUsdsp94vd0Pb1C0Xm1CzBdgAlpO5SnqgjxmkEG936eDs/OCizFblSd5ps0yNxtodQVlMm2nXPk4wB98BxsCB83LfWMXEMofA0en+U+6XzY0sHHUPzcWdOXbsOT4KGNSiUgXRK08umfhDK5pJ52j1tkO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ibrNqSfP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ibrNqSfP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38741F000E9;
	Sun,  9 Aug 2026 18:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786299528;
	bh=qWvm/2O+zJFY5iLvwsESeJcVPrMlJNgGPGSIUuntgf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ibrNqSfPDr95RIb1euy/kLpemkkYiyxTEnysth7ePlqWuETFeFJLxyV+cDZyY0TGf
	 RrCV6JZcXkvynSoZh5svgYZrv8NSd0dpOopOm+ClqmuyA6CA9nu9RvGYiQaOQUtVNj
	 qrb/2m6++r503K3Ik1hGm6A4Bfw28XtF6lXGc9FU=
Date: Sun, 9 Aug 2026 20:17:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mohit Mishra <mishraloopmohit@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [RFC PATCH] staging: media: atomisp: remove redundant
 ov2722_startup() helper
Message-ID: <2026080949-breath-pacific-db89@gregkh>
References: <20260809180105.58428-1-mishraloopmohit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809180105.58428-1-mishraloopmohit@gmail.com>

On Sun, Aug 09, 2026 at 11:31:05PM +0530, Mohit Mishra wrote:
> In atomisp-ov2722.c, ov2722_startup() was invoked inside
> ov2722_set_fmt() to program sensor hardware registers during format
> negotiation, accompanied by a "TODO: remove it" comment.
> 
> Standard V4L2 subdevice drivers do not program hardware registers during
> .set_fmt(), but defer hardware register configuration to stream start
> (.s_stream(1)).
> 
> This patch:
> 1. Removes the ov2722_startup() helper function and its TODO comment.
> 2. Refactors register initialization into a static
>    ov2722_startup_registers() helper.
> 3. Moves sensor software reset and resolution register array configuration
>    into ov2722_s_stream() when enable == 1.
> 4. Preserves the PMIC power-cycle retry loop on startup failure inside
>    ov2722_s_stream(1) to maintain hardware fault-tolerance for AtomISP
>    tablets.
> 5. Updates ov2722_set_fmt() to purely update internal software state.
> 
> BEHAVIORAL RISK & UNTESTED NOTICE:
> This is a functional timing change. Deferring hardware register writes to
> .s_stream(1) has not been tested on physical Intel AtomISP hardware.
> Submitted as RFC for review by AtomISP maintainers (Hans de Goede,
> Mauro Carvalho Chehab).

I would recommend doing changes like this ONLY if you have the hardware
to test it with.

And did you forget an Assisted-by: tag?

thanks,

greg k-h
