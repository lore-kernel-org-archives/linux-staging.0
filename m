Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638E31E98E3;
	Sun,  5 Jul 2026 09:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783243297; cv=none; b=iGsUgXTFA5/wjMJPUn9+Q0DZO/Oka+aWLRvVGBNZkY1NU+3YnHM/nSOeHeA41GjswsIEad2mxjZ/4eBxHb0WBJRtQ3R0V9w7SPXZFkDkny/Neq77/qTKiLomuKg6mb1B15F61KwZcjVjrskUbL3PcpvX1ukn6anVv6HvXbNpfa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783243297; c=relaxed/simple;
	bh=7qCau1pXqrLDLc5AUA2tjSOvVvzDOySI335DrUq3UO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jmi1qAqx5tWQPTSbL/XBl8/Bu3dnHR0XnaUw39uhR1Ss0yEBrj2Q5Kc4EE3i/OdVcejPNj5d3V+8vEeOqk2bgkNnFRBeY5m2c1ChQUEaNVL+baGC0feEtMEP6BwI7ukiWUeDQ4gKeJ8Lw0XDbNmEaADYWdpmyl/aXV1zz033iJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CZ+/NfDO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CZ+/NfDO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49CF71F000E9;
	Sun,  5 Jul 2026 09:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783243295;
	bh=o9ouxXUULUO3PUqUEcJLw56usGmv5BsxHyO/P+Gl1N0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CZ+/NfDOhpmnsEX84V2uL/WR5DEs6rzFaXOYCOvuS6wBKnfECPaXBb0f/dMtQnxoD
	 +yyGZ5H5tLUDEIdhymtlikYRkYnmk6/RYy0fY7J3qqD/cijP56M8vXAIdRtbawbOIP
	 BBjcBSKg/s93g3b97NxFtVGqq9vWCOzAR+leKGpY=
Date: Sun, 5 Jul 2026 11:20:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: pastraman <pastraman1@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: rename bLinkInfoDump to snake_case
Message-ID: <2026070531-doozy-sash-c547@gregkh>
References: <his-message-id>
 <20260705083424.9606-1-pastraman1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705083424.9606-1-pastraman1@gmail.com>

On Sun, Jul 05, 2026 at 11:34:24AM +0300, pastraman wrote:
> Rename bLinkInfoDump to link_info_dump to follow the kernel coding
> style, which discourages CamelCase and Hungarian notation. Issue
> reported by checkpatch.pl.
> 
> Signed-off-by: pastraman <pastraman1@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
>  drivers/staging/rtl8723bs/include/drv_types.h | 2 +-
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

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

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
