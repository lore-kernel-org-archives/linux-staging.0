Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9687024B28;
	Sun,  9 Aug 2026 20:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786308437; cv=none; b=FzrkWxIj/MRl12Pw+ocTA/Ex38U6djGAoIjCACnEaDhGXZczwnD0xyQF3NPIE5CS3Ry1is8WjfglwciHZC0KW1kQ9Dp2pMRfVDaEnygQFStg2XHScuD0diPZA75AH0BQaELwSqJRxE9i6qYfJTz2KUQGzt8PjSUOjW+f9Dl1K3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786308437; c=relaxed/simple;
	bh=G+RNh2OUoXjmIs+RkEyxEeUrciN0xTA55KGspv09YaA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZIqGUW9enYKKK6VX8sdg/7kVFvLqpsCtUoOCcQuip01Cxz8pm6QTH1sjZpJxXIFbKAnIytKf3HrcX6hwD2rwBAs52CgUQ2lsfHxuOXlTMpCl1ojPa+3G1nOHWrm7eJEN4H/dzElszu9zqK5gI3/laVdUbFjvT/0U0HYKwhIYfBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H16ShC28; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H16ShC28"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145091F000E9;
	Sun,  9 Aug 2026 20:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786308436;
	bh=Csc9nEX9eRwLU7Dj/i1jGJAMS6b4fKU3+9fOiQhHo2U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=H16ShC28UgKWvtczeVSy3iQmoPUzZKnOgih3sjDN3hyVHLB4vOGtLXNu8+f8JT+xW
	 HgxFWH6EDYcnEgAH1NtXgrqsMw1+5mZY7ffXQqlHadnVvzwC049igY2qul+dvUEp/I
	 BdRc2hk5bI++d26Q9WpT9SCawgzDoTLveoDNU6PqMgV1E36taAAbxSiGrEb0LgVn4c
	 Da7QkiYaP7pAGmgU9Qf2IG8TsV/xspZXhNlmT5gJVXxWdGR3VwHMMZG8Kdto3nBmS/
	 HcavBCI2ccbOfZyS72DoZTRnrFmY2GAOX43NzhIAgbfZ+M62aAnJS7k8oN5m84Z9Xp
	 rl4QSwa/0L9Lg==
Date: Sun, 9 Aug 2026 22:47:11 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mohit Mishra <mishraloopmohit@gmail.com>, Hans de Goede
 <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari
 Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [RFC PATCH] staging: media: atomisp: remove redundant
 ov2722_startup() helper
Message-ID: <20260809224704.608fcbce@foz.lan>
In-Reply-To: <2026080949-breath-pacific-db89@gregkh>
References: <20260809180105.58428-1-mishraloopmohit@gmail.com>
	<2026080949-breath-pacific-db89@gregkh>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 9 Aug 2026 20:17:15 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Sun, Aug 09, 2026 at 11:31:05PM +0530, Mohit Mishra wrote:
> > In atomisp-ov2722.c, ov2722_startup() was invoked inside
> > ov2722_set_fmt() to program sensor hardware registers during format
> > negotiation, accompanied by a "TODO: remove it" comment.
> > 
> > Standard V4L2 subdevice drivers do not program hardware registers during
> > .set_fmt(), but defer hardware register configuration to stream start
> > (.s_stream(1)).
> > 
> > This patch:
> > 1. Removes the ov2722_startup() helper function and its TODO comment.
> > 2. Refactors register initialization into a static
> >    ov2722_startup_registers() helper.
> > 3. Moves sensor software reset and resolution register array configuration
> >    into ov2722_s_stream() when enable == 1.
> > 4. Preserves the PMIC power-cycle retry loop on startup failure inside
> >    ov2722_s_stream(1) to maintain hardware fault-tolerance for AtomISP
> >    tablets.
> > 5. Updates ov2722_set_fmt() to purely update internal software state.
> > 
> > BEHAVIORAL RISK & UNTESTED NOTICE:
> > This is a functional timing change. Deferring hardware register writes to
> > .s_stream(1) has not been tested on physical Intel AtomISP hardware.
> > Submitted as RFC for review by AtomISP maintainers (Hans de Goede,
> > Mauro Carvalho Chehab).  
> 
> I would recommend doing changes like this ONLY if you have the hardware
> to test it with.

Agreed. You should also run v4l2-compliance tools to check if the
V4L2 API behavior didn't cause regressions.

> 
> And did you forget an Assisted-by: tag?
> 
> thanks,
> 
> greg k-h



Thanks,
Mauro
