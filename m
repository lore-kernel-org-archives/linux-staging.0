Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFF1F4FA;
	Mon,  9 Mar 2026 16:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075008; cv=none; b=KFbEvzPaREBLpMfJa+IabHm0Ts+f+FYYaNhOPMeDiD4kW98mV1me97SjckcePYIKd/LH3Jj7QP0veuLVw+/C1GCG4v+aV3uZu8484WNk4u3xmXDiBlxLtKDItT5lhK81CIE4ieWkBr3TI31aOYMWpJ0EMfGjWTuk77JQULwKwE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075008; c=relaxed/simple;
	bh=HYVhV6G+PJ4v3ntNG70yuKVA9dP8WmXPKr4EcbcJ45M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDRSuW9KEkkpV+7TgCY40ug5PTp8tTLt5sLZoeHB9bWPrOf09IXfbDbSQn/1Wh/Y4aIFPzjmyvdGAbRP9bW6KgQjukF7jUtUQP/SFIOPjmD9+x6HcW3Bg9nNKfLrmc2313WLsM9+YR4QVpU2eG7BHVcSBfN7PgyrZo8v6ZN79hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cFhlM2Jq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cFhlM2Jq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743E7C4CEF7;
	Mon,  9 Mar 2026 16:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773075007;
	bh=HYVhV6G+PJ4v3ntNG70yuKVA9dP8WmXPKr4EcbcJ45M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cFhlM2Jq72t2TXSYAAbJ9UjJGUQEybu2fOxMs17w9tzmqM70TAgq/hXeSkar1V7DP
	 LZlV1QAJobSEJi9JnvxSEjznzSZlJgpb1/3UlhTpb0dof2i7QAqF4S5y4RviPrJpmP
	 MnHe9QyAA5lHRkrp0q2qBu1OKZpFQ25fd303p7G0=
Date: Mon, 9 Mar 2026 17:50:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayan Mahmood <ayanmahmood249@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix line length in rtw_pwrctrl.c
Message-ID: <2026030948-barbecue-ravioli-555a@gregkh>
References: <20260307235701.7388-1-ayanmahmood249@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307235701.7388-1-ayanmahmood249@gmail.com>

On Sat, Mar 07, 2026 at 11:57:01PM +0000, Ayan Mahmood wrote:
> Refactor lines exceeding 100 characters in rtw_pwrctrl.c to comply
> with kernel coding style as noted in the driver TODO.
> 
> Signed-off-by: Ayan Mahmood <ayanmahmood249@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)


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
