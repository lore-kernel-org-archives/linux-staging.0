Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6AD19E992;
	Wed,  8 Jul 2026 05:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783486972; cv=none; b=hisHh8421IiRK678HRHvYGgHKc5Y3NKkA/RyWDtsV/3VOQa48swWZ6oPmU8ivSK4HgXAv+Dz5wukMwKYooXUJC7EmNA+bDj4et5SpggY4nwOYRC627fplwAER9+FlYsS/+ZoMdVvn9bPiWOKKa3hjhP7f2yMek7HlpVGAmaRqcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783486972; c=relaxed/simple;
	bh=eXQwSzsB5+nVUe9jQ/5Ckob1h14dMXTZL3hCm0MEzwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ok2wVH6/7szBmmWFFo8fwZNq9JtzkN68uEZgK5t074cPjE0kyq0rNlv1gdWKeTdxHo6sSeBWWhSpl/GHcZo1aN+djaJFlaGEEOh+cXKhnvXXGoweAF/7M5ysAQL4CKl1S6BguvR+9YLkIe/N4RUVy+KgRxf5XIdaPhNmnD3Tts8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rTGlleYx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rTGlleYx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B821F000E9;
	Wed,  8 Jul 2026 05:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783486970;
	bh=mQshHUPAkxs0WpuiuXR0v3FmcV8rTIqRoQwCwFP/7H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rTGlleYx6U8jziDVhinC5bd2ygBxHK0R/tU4zHg/zY3MhLvawx/mu2d9ifbIUefDF
	 pKjs24HeOI4geouem1kiT7RS6xfzHzpJs1z78ZlQVEZpfNU3wNVvq17N77pKqwzJ4k
	 qotLDe5NJKKVrN5NFKzup0gJ2S9jNFugPTrKxklw=
Date: Wed, 8 Jul 2026 07:02:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jinke Wu <coolbeaner@126.com>
Cc: error27@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] staging: rtl8723bs: clean up coding style in
 rtw_mlme_ext
Message-ID: <2026070830-squiggle-salvaging-be72@gregkh>
References: <20260707171450.70997-1-coolbeaner@126.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707171450.70997-1-coolbeaner@126.com>

On Wed, Jul 08, 2026 at 01:14:45AM +0800, Jinke Wu wrote:
> This patch series splits the original v1 patch into a 5-part series
> to properly isolate different types of coding style cleanups, as
> requested during the v1 review.
> 
> To keep each patch strictly focused on a single logical change:
> 1. Patch 1 fixes the operator spacing warnings.
> 2. Patch 2 resolves the line length and alignment issues that were
>    consequently introduced or exposed by the spacing fixes in Patch 1.
> 3. Patches 3, 4, and 5 clean up other style issues (nested assignments,
>    parentheses, boolean checks) within the same affected code blocks.
> 
> By structuring the series this way, each patch achieves 100% historical
> purity without interfering with unrelated parts of the file.
> 
> Changes in v2:
> - Split the omnibus v1 patch into 5 dedicated, standalone patches.
> 
> Jinke Wu (5):
>   staging: rtl8723bs: fix operator spacing in rtw_mlme_ext
>   staging: rtl8723bs: fix line length and alignment in rtw_mlme_ext
>   staging: rtl8723bs: split nested assignment in OnAssocRsp
>   staging: rtl8723bs: remove unnecessary parentheses in issue_asocrsp
>   staging: rtl8723bs: simplify boolean comparison in send_beacon
> 
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 227 ++++++++++--------
>  1 file changed, 126 insertions(+), 101 deletions(-)


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
