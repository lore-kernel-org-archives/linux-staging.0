Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4205376469;
	Mon, 30 Mar 2026 16:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886490; cv=none; b=H4eb9ts2FzfgZ4GjY7Q6MWvCkgF+NVcLFPecRC2N6S2Ip7i3p1i8TV7fRTSz/7LKTeSqw4NqyMir8vmqtT8r7xgsJ8gx/jY1BE8h45JMcPP8icMGEJEj/LHWxmUXthkYvVxYDqlYM8Xa2E9X8bfjMbbzDsH+Lma04pKYNF9T/84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886490; c=relaxed/simple;
	bh=FYn94/2J0ZrE5g+dDGZP9ENR4BkcDhveEVhu65QRiNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bk2nR3UMo/vjX6a18MDPmG9lmtB9lBIzHr01+B7dYzh4+6Dzdd9P45RhbPjMxh322TS+ktVlLR1mHrS16gPS/oHwRfLqyL3hOTuk1XvJcKQ15mhKDRmDE7FEGXo1y4/cjlKA0SGA63uEQzzR7ExqEHKOH93lMczlUaUWaEMt3Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bcBGgoZ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bcBGgoZ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7ABC19423;
	Mon, 30 Mar 2026 16:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774886490;
	bh=FYn94/2J0ZrE5g+dDGZP9ENR4BkcDhveEVhu65QRiNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bcBGgoZ9Ip5YzgZr7bCkpIbnaREbQmysEI26fMikhgDNBB8HyN9o0BRTPU3Smki+4
	 kXAAa7lFpkwD8H6lYr6tUyMOCTc/Sn/z/vwPXzgm8q8GLVVCFXGcRsjnfiuLvR+goY
	 NcLHZBa1Lmid+jAE4608mxKSI0WUwUuKp43zXiMI=
Date: Mon, 30 Mar 2026 18:01:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Marcos Andrade <marcosandrade95963@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8723bs: fix coding style and remove dead
 code
Message-ID: <2026033005-savings-prologue-e874@gregkh>
References: <20260326014221.525368-1-marcosandrade95963@gmail.com>
 <20260326014221.525368-3-marcosandrade95963@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326014221.525368-3-marcosandrade95963@gmail.com>

On Thu, Mar 26, 2026 at 01:42:21AM +0000, Marcos Andrade wrote:
> Fix various coding style issues in rtw_wlan_util.c to align the code
> with the Linux kernel formatting standards.
> 
> Specifically, this patch:
> - Resolves lines exceeding the 80-column limit.
> - Removes redundant and unnecessary parentheses in complex conditionals.
> - Deletes commented-out dead code that clutters the logic.
> - Fixes alignment to correctly match open parentheses.
> 
> These changes improve overall code readability and address multiple
> checks reported by checkpatch.pl. No functional changes are introduced.
> 
> Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
> ---
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
