Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE85D6D00
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 14:12:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E41B961007;
	Fri,  9 Apr 2021 14:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617977560;
	bh=H+p7sz3QwAUi4pf0kx+inkj6rVgLwICxUqcknon1Udg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQwpOMyilhqv0pZzlwG6vkrbIBcneuoQGW6GHVmTPyK+InAaaOF8GX37rjd//lQf2
	 FXhWFn90m3mddKPRoWe70Zjdqv18KlRMFX7c5LX7cwo7+zuF5vCDWCpMrnb0YFeSBA
	 OXPYfKYlH6YCV9OjCDMh8eLSP0ez43bGmDn51L9A=
Date: Fri, 9 Apr 2021 16:12:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8723bs: Change the type
 and use of a variable
Message-ID: <YHBg1Sy2509vBtrA@kroah.com>
References: <20210408111942.19411-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408111942.19411-1-fmdefrancesco@gmail.com>

On Thu, Apr 08, 2021 at 01:19:42PM +0200, Fabio M. De Francesco wrote:
> Change the type of fw_current_in_ps_mode from u8 to bool, because
> it is used everywhere as a bool and, accordingly, it should be
> declared as a bool. Shorten the controlling
> expression of an 'if' statement.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_intf.c        | 2 +-
>  drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I now have 3 patches, I think, for this same driver, from you, and I
have no idea what order they should be applied in.

So I'm going to drop them all.  Can you please resend me a patch series,
with all of the outstanding patches sent to me from you that I have not
applied yet, so that I know which ones to look at and what order to
apply them in?

thanks,

greg k-h
