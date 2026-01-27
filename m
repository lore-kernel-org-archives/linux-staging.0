Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FBB35CB81;
	Tue, 27 Jan 2026 14:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524910; cv=none; b=DzXBEUc1CTTNF0GN2SX+KEVN/w10+KE1N/hCgZYPAoapc2vmLnAEH3I8l+0E51Mr6+F3lmhIyTYEihJ58bNkF5bcvX4S8YA3yvb99s9/JrxS8h4TjbQU66cUG/sUM4GRN9DWipmlrHTPGYA+XCGADro9gsCUKG7rmH64xYVjjGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524910; c=relaxed/simple;
	bh=5KQedz9j94n9fZ5wiaSWG07Aohs1tiX/l9pNmvEXcVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBRe0LBRVVNui7vKeTUmHmrerCvq7rLy2A9Ay41dTQ/58qv2Py7HVtDhE3NXWG9snCy9NeETyPrYy4/YMeTC2o2vivjWm1s4KlUhlDLa1CaarVN6K/HRZp+wAZwDsh9wGyBytsSkYquI2vWtwFsSkD7TU+3a47jX1GFr2La0rYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cXK2PrVN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cXK2PrVN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8698C116D0;
	Tue, 27 Jan 2026 14:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769524909;
	bh=5KQedz9j94n9fZ5wiaSWG07Aohs1tiX/l9pNmvEXcVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cXK2PrVN8u0Dwnh1cTC84rlfg8cA0NyMzbL4ms3++FLSxzIYYzN4iuX3FVAL7nbVD
	 bCUkZSTDP8KKHgFOmKxxO79ZBddiO0jOXkhLPticbbZR5LdoXFVXAEz4FYyumjzQ1G
	 9y39QJOD6oGiwRIoycosqIar5Vk8VyXRDoX+qMxY=
Date: Tue, 27 Jan 2026 15:41:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: dan.carpenter@linaro.org, straube.linux@gmail.com, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] staging: rtl8723bs: coding style and refactoring
 cleanups
Message-ID: <2026012735-wreckage-visible-8d33@gregkh>
References: <20260122164751.37796-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122164751.37796-1-khushalchitturi@gmail.com>

On Thu, Jan 22, 2026 at 10:17:48PM +0530, Khushal Chitturi wrote:
> This patch series performs minor refactoring and coding style cleanups in
> the rtl8723bs driver, focusing on rtw_xmit.c and addressing checkpatch.pl
> warnings.
> 
> ---
> Changelog:
> v3 -> v4: Updated rename scope, cleaned up formatting, comments, and
> parentheses.
> v2 -> v3: Resubmitted as a versioned series to avoid threading confusion.
> v1 -> v2: Fixed incorrect commit messages.
> 
> Note: I noticed this driver uses a custom N_BYTE_ALIGMENT macro for memory
> alignment. Would it be acceptable if I send a follow-up patch converting
> this to PTR_ALIGN since it's more commonly used in the kernel?
> 
> Khushal Chitturi (3):
>   staging: rtl8723bs: simplify boolean expressions
>   staging: rtl8723bs: rename LinkDetectInfo and clean up related code
>   staging: rtl8723bs: fix line length and alignment issues
> 
>  drivers/staging/rtl8723bs/core/rtw_cmd.c      | 102 ++++++------
>  .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  15 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme.c     |  16 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  10 +-
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |   2 +-
>  drivers/staging/rtl8723bs/core/rtw_recv.c     |   4 +-
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     | 149 +++++++++++-------
>  drivers/staging/rtl8723bs/hal/hal_btcoex.c    |   6 +-
>  .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |   4 +-
>  drivers/staging/rtl8723bs/include/rtw_mlme.h  |  31 ++--
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |   2 +-
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c   |   8 +-
>  12 files changed, 194 insertions(+), 155 deletions(-)
> 
> -- 
> 2.52.0
> 

Does not apply to my tree at all, please rebase and resend.

thanks,

greg k-h
