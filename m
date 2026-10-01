Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AAB4E7804
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 09:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846315; cv=none; b=IOk5+cJESHZ9NGvAZ1jMrIpPCWfTuHIUCV4FSU9WaQ8HHx1A/LWoaNnleGleSD9g4SYyV/T+7c3M8FBUk4a1OdRlJQPk7WKv1uUnxhtmIG70bxt7mjAvFKMy485u4YxBnps+1eYO9lxneK7E/sRsTl/2bVBmtu7KEEZePosUkt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846315; c=relaxed/simple;
	bh=Jbl2mqkJrg6JBkDIRJIwJCpyaG22Ahw8aik4mz/BCLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+PfYmnfRD9UYPptL3xA/iswTOsKK4lVabk+2k4mhDmH7G66jr12ETZqiStvcC3yUkMJxSRPHa+k4GRR3he/6DEeZ8uTB08Bild5j1py6Nbdo+6MgBWrt6r9ZcDxs7l9mdjTv+JwUkyBnVQnE+bTiVVdA7HLFSZH9NzpRhiG/AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fYONhUZP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fYONhUZP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752371F000FF;
	Thu,  1 Oct 2026 09:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790846314;
	bh=cIhXOAtIAcTkair9aK/+R9lxntklI7LKJFATXHgpYkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fYONhUZPF1JFJWdw5dvGh7RiJ0pMwztWUnjeaLuAcaAkihvahp4ZY0I0pqqQc4rMj
	 Nn5KfsFisaCsHMmfQZtlLbR21L1IiTivrunCMkJmolYtYikxlxDG/Gps87etdFZaBP
	 20Sg+z122VP7vQSToh4rseaooxV2MhPUXA62Y1rw=
Date: Thu, 1 Oct 2026 11:18:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Alex Elder <elder@ieee.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>
Subject: Re: [PATCH] staging: greybus: remove camera driver marked as broken
 since 2016
Message-ID: <2026100102-drop-down-washcloth-ce5d@gregkh>
References: <20260918011437.108678-1-enelsonmoore@gmail.com>
 <3f152ed6-e572-4c96-8762-2fb7cdc77695@ieee.org>
 <aq0x6IGnKd2IYXoU@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq0x6IGnKd2IYXoU@stanley.mountain>

On Fri, Sep 18, 2026 at 03:43:20PM +0300, Dan Carpenter wrote:
> On Fri, Sep 18, 2026 at 07:18:54AM -0500, Alex Elder wrote:
> > On 9/17/26 8:14 PM, Ethan Nelson-Moore wrote:
> > > The Greybus camera driver has been marked as BROKEN since
> > > commit d4f56b47a8fa ("staging: greybus: Add drivers/staging/greybus to
> > > the build"). It has not been able to compile since at least
> > > commit ec0ad868173d ("staging: greybus: move core include files to
> > > include/linux/greybus/") because it includes greybus_protocols.h from
> > > its own directory. These two facts make it very clear there is no
> > > demand for this driver. Remove it from the kernel.
> > 
> > Hmmm.  Do you know why it is BROKEN?  Do you know what it
> > would take to make it work?  I understand the point of
> > removing it, but in part the Greybus code has historically
> > served as sample code for people to work on.  It might be
> > nicer to have fixing it be a pet project.
> > 
> 
> The compile breaks because of:
> 
> commit aa1b4da6af67d5c6a4e933c2d30890c6f282f505
> Author: Boris Brezillon <bbrezillon@kernel.org>
> Date:   Mon Nov 10 14:28:35 2014 -0300
> 
>     [media] v4l: Forbid usage of V4L2_MBUS_FMT definitions inside the kernel
>     
>     Place v4l2_mbus_pixelcode in a #ifndef __KERNEL__ section so that kernel
>     users don't have access to these definitions.

Good point, no one has picked this up since then so let's drop the
driver and if it ever is needed in the future it can be reverted and
brought back.

thanks,

greg k-h
