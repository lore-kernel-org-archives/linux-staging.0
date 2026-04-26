Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF2738735E;
	Mon, 27 Apr 2026 03:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261857; cv=none; b=qzm4pxfD7qi5BLtg7WWFjT7L2acniVQBqFHePEyu7flPoIzQIiT3w4phnsnJ0XqhPxvlmYLw4lotETk9VCYhjXhMuvXmuCWjMw1CFET4ZVyr1YeSdGYUagPm+7QdXwofA4r+r4jRtCzPMoWWw5ENDbzdU9DOMoBvRkHldt0yruA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261857; c=relaxed/simple;
	bh=HYFnAa5LUDwqfF8+x0DPPUs0eYk0k+tO96GEowhCJOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=klAoFJz3Vrx9n2VtfI6FPnA8AytiqdT2I7xfv/FxsbPrhwoH4NYH3x8CWNnIUfJPr6OCY/Se5shp2w0d62kZ05CUO5vJJhjXxPEQOXMpIi4fkagfEiMcwKiVaxJ5xeyGlyMYWDRKvN8Km2ZMSzyb4MjXdduckrvdb3l6jdU2s+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=K0OpHy17; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="K0OpHy17"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44119C19425;
	Mon, 27 Apr 2026 03:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261857;
	bh=HYFnAa5LUDwqfF8+x0DPPUs0eYk0k+tO96GEowhCJOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K0OpHy17/IRyGJXHBb1T9Z636Dzhm/9i3sbWcWv7uZeYxdT4T6YMVatY9vG9WYJ4b
	 /+VAVWhamrQ+FlCX32hGF5a9vDw3nK9vykKq5v/hZLY391h72pLlA2531HaFysPLhY
	 7YAMwSmVYuj5cTzb3mJBMezZQxNR7g+pT+K8MpSU=
Date: Sun, 26 Apr 2026 21:51:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: deep@crimson.net.eu.org
Cc: Dan Carpenter <error27@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: refactor code flow and fix sleep
 ranges
Message-ID: <2026042601-trodden-spectator-083b@gregkh>
References: <20260418164719.1069618-1-deep@crimson.net.eu.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418164719.1069618-1-deep@crimson.net.eu.org>

On Sat, Apr 18, 2026 at 06:47:19PM +0200, deep@crimson.net.eu.org wrote:
> From: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
> 
> Clean up core files to improve readability and style compliance
> 
> - Flatten deeply nested if-statements mainly in rtw_security.c.
> - Correct usleep_range() arguments where min > max.
> - Improve code flow and readability by using early returns/breaks.
> 
> Signed-off-by: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
> ---
> some if statements still give warnings when checked with checkpatch.pl.
> I thought about removing them entirely since they're currently blank,
> but decided against it. If it is necessary to revert them or delete them,
> please let me know.

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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
