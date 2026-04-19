Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6200633CEA7;
	Sun, 19 Apr 2026 05:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776576963; cv=none; b=bpkYDQiDoy6ROsl9lBBHaW8Llwftg3/T8f25h6UYRxnhNHjpJsS7lKpfpNcRnx+ObBW0MPJIDbSMke7iigQc6J9ioUql7XUPA0dTlzwOaDe6Aep6tIvoXRo0icAlH01NCCT8zIZaaBxzopXei1/72//050P3uhBVcsWHsR6aXt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776576963; c=relaxed/simple;
	bh=1QDda8TThF6YlzQrX6nQ61h/TM2iwF2y53m6hBWP7Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JqCuVQWKmH+GuFqrcDITMTVcUe3H1erPtuZOAxlM+B4ioMxbN953TkD+AO9vXUa7HpkokZylYmTPpcggw3sF9Z6/QG0RdIKQCmU080LLGamIydTFbtyXnkRhpSMzWDReys+3ahbUqkkAacF3MgKu3kkZhIho21IebfeG5c5JD7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RMaVfrVW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RMaVfrVW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84430C2BCAF;
	Sun, 19 Apr 2026 05:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776576962;
	bh=1QDda8TThF6YlzQrX6nQ61h/TM2iwF2y53m6hBWP7Yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RMaVfrVWfINfMChgWm/x7IeerVh4iuroHyMLYqtz0ypSkmxQ6ZL/2DJHUvoyuKdVS
	 CAGJys3L41vuK6wPVYXUG5X6akQTkbDjcVWVwLU8mXD9yI0DCZHQS+bYK5uA8YDSMw
	 DuEoP4oEkoCX4IaVp1bNELm68PcK17941/rj0zD8=
Date: Sun, 19 Apr 2026 07:36:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yuma Ochi <ochiyuma.ochi@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: Remove boolean comparisons
Message-ID: <2026041945-retouch-enquirer-49d7@gregkh>
References: <20260418161611.399189-1-ochiyuma.ochi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418161611.399189-1-ochiyuma.ochi@gmail.com>

On Sun, Apr 19, 2026 at 12:16:11AM +0800, Yuma Ochi wrote:
> Remove unnecessary comparison to true/false in if statements
> to follow standard Linux kernel coding style.
> 
> Signed-off-by: Yuma Ochi <ochiyuma.ochi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c       |  2 +-

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
