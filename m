Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BE340E8C2;
	Wed,  1 Jul 2026 10:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782901603; cv=none; b=swkxHe9uNOO1Vr4D64UBvGAOC5SxBviE59bXUmEQt1RcWGlq6AkWsEhfLPmTSVNxQkPhhfPcVBITMtCmLXpo9o9LvcJEOfvCMnDb7YpAX6lIiBNXDNJHKcSBWP5MEhManqDh+MLnfo0I48aes829rGUDbUVpOo9lPSn8sa55tNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782901603; c=relaxed/simple;
	bh=RzlbxsvRAYfiv/ZN1gy+XS+AeqIHBLE79m3oRVwfVlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/i/V4UkZRmaoWLF7xrm5qgF0QWb42uS1fMegmZHvKd3n0+m4J+9ZF4LicoW6NUvjxHq+sN60L9W7y5tkcNRKFjsPg94RCUIqC1SmVfYwbPXhtldEVya2MuZJrnmoTsUVuk3ERTKt+B5TmIsCvJf6mazkWqdRHQFbubn4cvJ+Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XRlL+7B3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XRlL+7B3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880011F000E9;
	Wed,  1 Jul 2026 10:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782901601;
	bh=xrZzxt9Jm5BxOWtCc+tViBz/4PLhToOmL5tt196CFbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XRlL+7B32lgv01hewSNt3ynvkwqNNMD6Y6dH98aNKtePxrcp+nzZXp7Jr3jQ4hSzP
	 qmCwep873WTGTibdzO6jREeruRijR345bK1nTq5BsTcCl5I+0DcpW4sBT9UZN9DpuB
	 F40MKfrgn2qPDhBkv1ngvIB8RJvuRlIC8ul7XxZE=
Date: Wed, 1 Jul 2026 12:26:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ruziev Miraly <miraly.dev@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager_module: add missing
 newlines to sysfs_emit
Message-ID: <2026070156-stingray-fretted-d2c5@gregkh>
References: <20260701100814.30509-1-miraly.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701100814.30509-1-miraly.dev@gmail.com>

On Wed, Jul 01, 2026 at 03:08:14PM +0500, Ruziev Miraly wrote:
> Add missing terminating newlines to sysfs_emit() format strings
> to comply with sysfs documentation and satisfy checkpatch.pl.

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

- You sent a patch that has been sent multiple times in the past, and is
  identical to ones that have been rejected.  Please always look at the
  mailing list traffic to determine if you are duplicating other
  people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
