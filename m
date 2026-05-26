Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA073AE71E;
	Tue, 26 May 2026 16:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779812565; cv=none; b=ZcwvzQiLev5IpHV7W2mQ6YkG6Q9ow2UKyDdnv1i3sMBg7rI5eGK5IdpKqthR0eezvGTDhJciodzpzHUqHrz9FBMkvl4vufyp97hhFhTcPMcPAw2mcS9pFy324UCygaRv90LqIg3D5nSFoiat7C03P9I3r3q1iVWIW+nPk7p1fC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779812565; c=relaxed/simple;
	bh=W+IXRCk649mr+7DLoGlzo8z8mX/XIE4VcUsijIuGSdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=soSfjuf6pOB9BMBaafg4MXrPjHhG52SfviwYB1ZO5nHtKYUzc0eVydB5YakiOj9u1805AuYy+i2qmPXp4vMKoaI6gmqDa6ytuP6rN+nmMn8M6IbkbHSHKnV/5c1s/HvvUFo2KatiU3YdgBIwhJwCV6jB7m7OfsFIZlJuSvPMG2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xaRNhE4I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xaRNhE4I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E301F000E9;
	Tue, 26 May 2026 16:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779812564;
	bh=xj2zJV/CB96E+HeXPGOhBf3aclzpUH9zI5ye6D1KrIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xaRNhE4Itk2Ms3tcbsAlUu5YbjnNuovyIsSpcuI29MpIU2SP6PQ+2l7+7j2c3TT6M
	 fb2HNMogi5M0QfKwQpfdTNlo21CYJZWEFmImgLPUtJXh9hSob8rFCKSZ8JGQ21FNS3
	 rcHlFzJqBEUuXsMeYOmapNUsPOgQGNlOQqbMLkx8=
Date: Tue, 26 May 2026 18:21:52 +0200
From: gregkh <gregkh@linuxfoundation.org>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
	linux-media <linux-media@vger.kernel.org>,
	linux-staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v3] staging: media: Remove deprecated Atmel ISC drivers
Message-ID: <2026052634-astride-aflame-f641@gregkh>
References: <19e64377600.72fca248167943.7947263371163961978@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19e64377600.72fca248167943.7947263371163961978@zohomail.in>

On Tue, May 26, 2026 at 05:46:56PM +0530, Ashwin Gundarapu wrote:
> The Atmel ISC and XISC drivers were deprecated and scheduled
> for removal by the beginning of 2026. The replacement drivers
> (VIDEO_MICROCHIP_ISC and VIDEO_MICROCHIP_XISC) are available
> in the main media subsystem.
> 
> Remove the Kconfig entries, Makefile rules, MAINTAINERS entries,
> and the STAGING_MEDIA_DEPRECATED menuconfig since it is no longer
> needed. The source files remain on disk but are no longer compiled
> since the build infrastructure is removed.
> 
> Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
> ---
>  MAINTAINERS                                   |  2 -
>  drivers/staging/media/Kconfig                 | 18 +------
>  drivers/staging/media/Makefile                |  1 -
>  .../staging/media/deprecated/atmel/Kconfig    | 47 -------------------
>  .../staging/media/deprecated/atmel/Makefile   |  8 ----
>  5 files changed, 1 insertion(+), 75 deletions(-)
>  delete mode 100644 drivers/staging/media/deprecated/atmel/Kconfig
>  delete mode 100644 drivers/staging/media/deprecated/atmel/Makefile

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
