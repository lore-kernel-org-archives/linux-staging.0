Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBFC371877
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946368; cv=none; b=ZdgcklxacaaNpsnCd4da4WcNo7WRd786suA00RGpPxwOKrTIcWiMOGB0XVwUgypzK2/OKWdS4sozo23pVOiI20KaXuZsnVOvDC1GWg5rYCIFfwdF3bPMnIuGkyshdAq7XPwdDrwOckin52n8V7bRTQ0HNrdbldpybtdX7mqw79g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946368; c=relaxed/simple;
	bh=vr7U+aHwP8lHjejuih22Eg9LVWrfYAn1KrVOheNKGgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFIH+XUF4nAfvdLa5ACDycPFJAZURaCWZ8d4JDNYJKyvnyQEHCuPVm8kUCVsHQWaXUNwChArryaIHk8xHfNh9q4a7Dj8/WNDy6mERUImlQq9PwTlmIpeepLMI4dGESYAT42skiFtJJXZms02MmNAAz5y0dJiFLyf+LGrpY0X1lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gl81Hp78; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gl81Hp78"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1DECC19423;
	Tue, 31 Mar 2026 08:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774946368;
	bh=vr7U+aHwP8lHjejuih22Eg9LVWrfYAn1KrVOheNKGgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gl81Hp788Jo4MpUfwA7zpIbmJQHJvqUOZVyvHpt/4F1hDvsjZ2tczR5hPuS51FyUh
	 iFU8arib3Vs/jlezEP6BvdyHZw2KTCT6QYjfq2YxCN6chnmzdmqBtDe5Lxg/2Df7r2
	 VQKe2IaM7+ZZ/PxBPOPHnq/B37giFE6VzIj+jV+o=
Date: Tue, 31 Mar 2026 10:39:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: Luka Gejak <luka.gejak@linux.dev>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 2/2] staging: rtl8723bs: cleanup code style and
 parentheses
Message-ID: <2026033112-flaccid-brittle-d680@gregkh>
References: <20260330184640.17795-1-khomenkov@mailbox.org>
 <20260330184640.17795-3-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330184640.17795-3-khomenkov@mailbox.org>

On Mon, Mar 30, 2026 at 09:46:39PM +0300, Andrei Khomenkov wrote:
> Cleanup the driver code to better match the kernel coding style.
> This patch includes:
>  - Removal of redundant parentheses in if-statements and expressions.
>  - Adding missing spaces around bitwise and logical operators.
>  - Reformatting multi-line conditions for better readability.
>  - Reformatting long conditions for better readability.
> 
> These changes are purely cosmetic and do not alter the driver logic.
> 
> Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>

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
