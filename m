Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D7170
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 13:14:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F138E610F7;
	Sat, 10 Apr 2021 13:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618060466;
	bh=aXasx+AstFoj3HDw0Zv75AyHIuHJ93VYSUn//nda9IQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TC6c0r2xVx+5x8gxvGcVou3fB//TkwKUVuM9dbLn00CqT6NhQ6rDIeWlnoR4UW8+j
	 DTV/aOSL0zdH3W5g8bNacV2yqvyEwkAuh1cmlIs0T6CvwKMinROFXPHgx1ctV3R64D
	 Bsf95y6/1OvDMCxqjKxjygHiq7Z6KkTq4N3ZHeOA=
Date: Sat, 10 Apr 2021 15:14:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH v2] staging: rtl8192e: fixed pointer error by adding '*'
Message-ID: <YHGksKltkkmaUeAk@kroah.com>
References: <YHGhdtldqAlRsPHT@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHGhdtldqAlRsPHT@kali>

On Sat, Apr 10, 2021 at 06:30:38PM +0530, Mitali Borkar wrote:
> Fixed Comparison to NULL can be written as '!...' by replacing it with
> simpler form i.e. boolean expression. This makes code more readable
> alternative.
> Reported by checkpatch.

Checkpatch did not report this specific problem, Julia did :)

And this changelog text does not reflect the commit you made here.

> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>

We need a "Reported-by:" line here to reflect that someone reported the
problem as well.

Ideally it will have a "Fixes:" tag also, but I can add that if you
don't know how to do that just yet.

thanks,

greg k-h
