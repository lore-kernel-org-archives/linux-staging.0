Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7728F3C6618;
	Wed, 11 Mar 2026 09:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773221266; cv=none; b=hK8kMoPJ2eLNY6voPI8b4r8fCNY89htLymOzRe08NPyqO11NrKzL2oFqYQr+nRHsBdUy0SIYbcpswNjazgmoXBXf4EZjLHCH9BxCtq7MoiQYjV3G8h2OJq3wxz7itExLsMKtsP3kYbYTnOS93eO9pNwKYS8WMy/JTO6PBz984UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773221266; c=relaxed/simple;
	bh=ISmz1XamJOL2cmzXww30vfMMedodq78km94WW1O1pR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNfzjeItrv/6RYstaFuH+KDZ2MZVGcuoSq7rFgmQdC0gLR0zxTOCKn0dqGshWZLDFEhlPTQGRMjIw1IgnMtqkGVYbCE9b92jg2PfswCEE6QG5UAaoEOl7B8pl2+3x61TnWHImwIiCJFTCFSN3PoHHcTx9gqrF0WAu5q3s68foLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KywX9LJi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KywX9LJi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815D9C2BC86;
	Wed, 11 Mar 2026 09:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773221265;
	bh=ISmz1XamJOL2cmzXww30vfMMedodq78km94WW1O1pR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KywX9LJi/irAksv1gdWq1mjeInh5G1t0vKzwJYe7H3zuu612qr8bLSydX+BgBpBvu
	 bZmpmMWaFiE57HmzduqdYenKDXCbNl1GHy+bfplX51EIUUAnL/0+EVFY5WjELayV/z
	 E67jjtRSd9LJPZ9zZGwoaKfvm+/h68EKTST9y5gM=
Date: Wed, 11 Mar 2026 10:27:29 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: I need piece of advice regarding rtl8723bs
Message-ID: <2026031119-retract-obnoxious-0306@gregkh>
References: <270B444B-3171-4FEB-A43F-CD33DFFAB518@linux.dev>
 <abEhz7LVGlwyTdir@stanley.mountain>
 <0A9F09AD-0082-489F-878A-0899CB6F7413@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0A9F09AD-0082-489F-878A-0899CB6F7413@linux.dev>

On Wed, Mar 11, 2026 at 10:13:41AM +0100, Luka Gejak wrote:
> On March 11, 2026 9:03:27 AM GMT+01:00, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >On Wed, Mar 11, 2026 at 08:21:47AM +0100, Luka Gejak wrote:
> >> Hi Greg, 
> >> Sorry if I am taking a lot of your time or disrupting your workflow,
> >> but I would like a piece of advice regarding staging/rtl8723bs. As
> >> you may already know(or you may not), I am working on port of
> >> rtl8723bs to mac80211 architecture. I am currently on stage on
> >> getting wifi scans to work(I can bring up interface, and I believe
> >> that I am close to getting scans working as well) so I want to ask
> >> you if you recommend making patches for staging/rtl8723bs as once I
> >> finish the driver and begin process of upstreaming it
> >> staging/rtl8723bs will be irrelevant/deleted(or will it?).
> >> Thank you for your time, Luka Gejak
> >
> >I'm not 100% sure what you are asking...
> >
> >If you want to port rtl8723bs to mac80211, that's great.  We love
> >that.  When it's ready we can review it.
> >
> >Until then people are free to change staging/rtl8723bs if they want to.
> >Your work on the port is future work.  We can't really be confident of
> >anything that will happen in the future so we just go on with what we
> >have.
> >
> >When your driver is merged and it supports all the hardware that
> >staging/rtl8723bs does then we'll drop the staging driver.  We never
> >keep two drivers for the same code.
> >
> >regards,
> >dan carpenter
> 
> Hi Dan,
> Let me clarify, I am decently sure that I can make driver work and I
> want to ask if I should focus of development of that driver or if I
> should take time to contribute to staging/rtl8723bs as well.

That's your decision to make, we can't tell anyone what to spend their
time on :)

That being said, converting the existing driver, in-place, is probably a
harder task than doing a new one "from scratch", if previous attempts
are any indication.  But that all depends on the developer involved.
So, it's your call.

thanks,

greg k-h
