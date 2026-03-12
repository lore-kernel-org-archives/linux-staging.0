Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8473A5445;
	Thu, 12 Mar 2026 05:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773292461; cv=none; b=VuWjEHT9f+OeIGoD3y/7RomJ5n7RUrkCzn6VDvKSlumAeYx+edyuQkDuAcJ6o39s2+wIVSdRed+cws/rla8oDTIis6ZdJYHHXVrSwOE0kQDaTPrQ2iFUDqxzm+0RuqUCFrEmK3vk9auZu8uLNMgdQQXkF2kGMhSS8WpVvTs3CKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773292461; c=relaxed/simple;
	bh=CwuCBbZ4a6bNMQBLPJOIX54areMa5ta5Yy5C7KhTGqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpBfI35HapKvyrOM4IJ3lku9OOgWUKyeLt7/yfAZSaZdcOWfyGwddGCzhEKo51wca/Vb0FPHrxR8yA2SNw4tTc4AXcW8lWTU6SALQLpFpK8cIsKP8DnnT2PcYHMHJWFKJ0SpDZDZqHSVaI9h0EJTzc/reQy6VvGgTJXaQecJlBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DuiH+RH8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DuiH+RH8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E78C19425;
	Thu, 12 Mar 2026 05:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773292461;
	bh=CwuCBbZ4a6bNMQBLPJOIX54areMa5ta5Yy5C7KhTGqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DuiH+RH8qf3RFidxkAyLBji7CvZ0wnUQf0k6rFsvhj9YD8qw/tbKuXPhCVkRiHgMw
	 8JH3LfKL8LH2THgFASlU+0mQDB2q1LDCGs8kjdB3TI62BYd8ho/yITL/3WFHF2mIve
	 ZSkuouyAYM5zpR3g7yjOp+sb/FZkhsROaYKnqrVM=
Date: Thu, 12 Mar 2026 06:14:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lukas Kraft <rebootrequired42@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Changes udelay to usleep_range in rtl8723bs files and
 resolves checkpatch warnings.
Message-ID: <2026031237-unharmed-hazelnut-a410@gregkh>
References: <20260311223403.218519-1-rebootrequired42@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311223403.218519-1-rebootrequired42@gmail.com>

On Wed, Mar 11, 2026 at 11:33:44PM +0100, Lukas Kraft wrote:
> Signed-off-by: Lukas Kraft <rebootrequired42@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c  | 36 +++++++++----------
>  .../rtl8723bs/hal/odm_RegConfig8723B.c        | 28 +++++++--------
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  2 +-
>  .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  8 ++---
>  .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   | 14 ++++----
>  5 files changed, 39 insertions(+), 49 deletions(-)

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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

- You sent a patch that has been sent multiple times in the past few
  days, and is identical to ones that has been recently rejected.
  Please always look at the mailing list traffic to determine if you are
  duplicating other people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
