Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8640224AF9
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 07:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785224051; cv=none; b=SH+b3wk7i2Zzm2VvtVczqDV9yym60dwzGG98ZzRY2s0uaWn9FnYuZIa+xwGBqrP9V+wVeWnIk3zahsebB4D6DuQYdlOBkBka7Di+m+Pe+S1onYVp+/TgbY952Ukkvp2Ljim4/n5OEfq8j8wY5r9wLHMj3N0ITjM8dOuJCx1NH1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785224051; c=relaxed/simple;
	bh=4GoJOEOeaG5Gz5smyS1FpFhBuSM7furX+Vz6cDrDPhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7xucCTgHUsqASirNgCmahM6SrAznkPoFc3hzqF3Q9S99voOTYSFdtSaCW0Hd2g0Y//DqfpskTTeiiQk/Yj088m7gpwyMnSkFeheZELaEXDQwrILAx0Q2tWC6RQMCwPUAQGokSj0dE1I5VECrslb+LFoX+UqYsGOtjPTzfnpx0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pPXcTtOo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pPXcTtOo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E160D1F000E9;
	Tue, 28 Jul 2026 07:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785224050;
	bh=9uH0hEQacOy7ku2NqXl7cNNvunDuXOooCa52pgDGaK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pPXcTtOoInONLcm7quF3gh3MZxPkZgpzROfe9uOvXVqze58zz16qXMqvTC3KwGfaZ
	 7FREAbtol1pp1WhJqUcSLMtw1SrtPHP7PSn/VkaIv1N9rdH8TCtPTBuJi5MZvLB9NI
	 J+lIxIUYTATGZ5hbjN+NRwCEgblPe+AR5+dqPv9w=
Date: Tue, 28 Jul 2026 09:33:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Akhmad <akhmad100913@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: replace magic numbers with named
 constants
Message-ID: <2026072833-scoundrel-deodorize-2dda@gregkh>
References: <20260725125314.39313-1-Akhmad100913@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725125314.39313-1-Akhmad100913@gmail.com>

On Sat, Jul 25, 2026 at 03:53:14PM +0300, Akhmad wrote:
> Replace magic numbers 0x6404 and 0x660F in rtl8723b_InitBeaconVariables()
> with named constants TBTT_PROHIBIT_INIT_VAL and BCNTCFG_INIT_VAL.

Where did these magic constant names come from?  Please always document
that.

> This improves code readability and addresses a TODO comment requesting
> the removal of magic numbers from this driver.
> 
> Signed-off-by: Akhmad <Akhmad100913@gmail.com>

Your full name please.

thanks,

greg k-h
