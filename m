Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FEA239567
	for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 04:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785127013; cv=none; b=L1E2ZkE17u4ijzG4unUFCr55mnknS1Y5dahcUyWw9nYfcvtiFrpnZFp4tCBFn/7eNl1S0uGImMag2YeOcXeTRylbA0TXuUN7auBq5UdvKT6S/OvBBmKuW6ARVRoziWYepeMAtta7zjd2hLt5KjruC2AvxhEVV7VBJaJn6+RGyZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785127013; c=relaxed/simple;
	bh=D8c+GreeWufEUTOnNNNPoN2gj9t7Xf3MmLfUhSCNjH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOdZIU545nYb1nFC+exdowFpDJh8n89OuEeTIg87Li9StL55trDgFwKWErdiJ4HTVsp1tovT6pQF//GsZZUJdidCodJlv7GEiMZnwNIUhpz8KttAIt2hm+4cqTvcN1gJiSMdGZj/sBQ6Zt/aX+FFsIOCMLVTtCbU69hSkYAONH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0yb9dWWq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0yb9dWWq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95081F000E9;
	Mon, 27 Jul 2026 04:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785127011;
	bh=0MaIGjJY9y/wBSIek2BQLoMemqiOK9OCTfXXN8nIrn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0yb9dWWqEWFFlUftFR9hIdi1F8mYTwzmD9mTLD0JYCqW+8iPe1MkLN3MXuAcsL1qJ
	 OBirWFLhY5vWszZpvsZPuM2ukiwYdtk0ZiFItqpKpduRGRbtbp5dymsZZ0akpFjyx4
	 pboXmHWGi0Qf1X4IYdSD/dy3YpHpYz/flQbodAvs=
Date: Mon, 27 Jul 2026 06:35:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Aryan Krishnan <aryankrishnan4b@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: apply clang-format cleanup
Message-ID: <2026072754-finishing-utilize-558c@gregkh>
References: <20260727040649.54338-1-aryankrishnan4b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727040649.54338-1-aryankrishnan4b@gmail.com>

On Mon, Jul 27, 2026 at 09:36:39AM +0530, Aryan Krishnan wrote:
> From: Aryan <aryankrishnan4b@gmail.com>
> 
> This patch formats the drivers/staging/rtl8723bs directory using
> clang-format, hence reducing the number of errors by 2, warnings by 66,
> and CHECKs by 4,685.
> 
> This is a purely mechanical, whitespace/formatting-only change with
> no functional impact.

Which, if we wanted to, we could have done already, but that's not the
point here in staging.  The point is to have a place where people can
learn how to contribute to the kernel in an easy way.  By just using an
automated tool, no one learns much :(

As my bot says for this patch:

----------------

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

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
