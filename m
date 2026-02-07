Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148D1153BE9;
	Sat,  7 Feb 2026 12:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770468246; cv=none; b=UjFt3O7ZfVMBYpAU+mc7yENdZ9/sa/iRkZ/UlfLKYDcTYHfH8BQfvt7nWJqrWtnhXke9Swvybbb6tNuoUDPdWCgjW2GhcijjFuLGUNckbGEJHK928WKae6sV7sR8dEMcRi7gAp62s7uylVJjjOaECYNKdWTN9OCMfKtunJiAkMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770468246; c=relaxed/simple;
	bh=H5lSw3Wd9MQwJAgt/OLFBp5iCnv3MISK/LiyzJcaaDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhncFqms2OKpZOXXywSVNE7+Q8HbJeEi6u7Qj6zgJk5NzsrukGg2nHRL3BqORrkwPUCrToVDsYGnMsOBWxK1MuHRCjGd3F6EQK0dIN+lhKOBCqjiFdHG4yYnfukYEFAC5+WhQviXRefQJ+2vx2IKngCKOsSOvpQq37wm/+tDU/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sNiuMr4W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sNiuMr4W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23000C116D0;
	Sat,  7 Feb 2026 12:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770468245;
	bh=H5lSw3Wd9MQwJAgt/OLFBp5iCnv3MISK/LiyzJcaaDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sNiuMr4WOIl0O0IcZA+c2RHOciJ709EgLbu7hyebMkFIkcQDrtcA/55wsiDgY4kaf
	 PbfOPp5o97o/Lj8ScUlkXEgxyGlQLDM9FDy/zgbYxb9b3TWFz8o1Dy+0XzCC6WhZ9p
	 niQ2RAbhCEJI4tGJIszM0tldLbBkX+a3hX9z0+HE=
Date: Sat, 7 Feb 2026 13:44:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Filippo =?iso-8859-1?Q?Muscher=E0?= <filippo.muschera@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: add identifier names to function
 prototypes
Message-ID: <2026020748-audio-earthling-48d6@gregkh>
References: <20260130152807.111025-1-filippo.muschera@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260130152807.111025-1-filippo.muschera@gmail.com>

On Fri, Jan 30, 2026 at 04:28:07PM +0100, Filippo Muscherà wrote:
> Fix checkpatch warnings:
> WARNING: function definition argument '...' should also have an identifier name
> 
> Add parameter names to function prototypes in vme.h to match
> their implementation in the source files.
> 
> Signed-off-by: Filippo Muscherà <filippo.muschera@gmail.com>
> ---
>  drivers/staging/vme_user/vme.h | 121 ++++++++++++++++++---------------
>  1 file changed, 67 insertions(+), 54 deletions(-)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
