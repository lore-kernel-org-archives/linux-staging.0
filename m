Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ECE375AC2
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 16:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886402; cv=none; b=LmlJX/pXyK9mRhcdy5V85ANOCFTJImc0+ZBrfxJVV9nMBw9B/Aw9MDS/Ya9fWMm75aZqQsBnKaRG7sDo+QcFiyi6T3J1DIdIEY9+Y+2m+agBTmyOjo3lUgf4Q70kc4A77TZSuEN3duZrAY7+V20h+4+5aWOiNHmttKSh8NF8Y3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886402; c=relaxed/simple;
	bh=IVBs/IwjeQyYrygpQU50bBHwWdM7wgfvBxeQ9jBxvYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KysFNMlh9kEz3eeOYvedp9oBe+eoFLo0G2pY3SYXgjMGTuIpDVdYJ34ufA3yZUFvr1J2gUKidiumq7IPT7/UZkZN264jW6mwmy2dmKynT5ttDne0lWB401wTVoOPx9RJkYQ7K9nQpqwPzCKBkvVhyb+cFh2L/icz0vGzQbKJE9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Mi/MXGBa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Mi/MXGBa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E02C4CEF7;
	Mon, 30 Mar 2026 16:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774886402;
	bh=IVBs/IwjeQyYrygpQU50bBHwWdM7wgfvBxeQ9jBxvYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mi/MXGBa4IyTIKRKYuSpzc6wx1uAXyUCNCmcD34g76SxXhtDt2TLMpGTTlIOdqJrC
	 gI2bI1I/AonCsp1bnIGo/oKUfn52ILEuqkJNqI0F9SiTq9JYEzeYvUUXEtmnTKMtD+
	 n3IBUSGq+FN48tTSFTBL4SahutwIablCT2KR3NH4=
Date: Mon, 30 Mar 2026 17:59:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: clean up booleans and parentheses
Message-ID: <2026033039-backed-parsnip-7096@gregkh>
References: <20260325110143.35466-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325110143.35466-1-khomenkov@mailbox.org>

On Wed, Mar 25, 2026 at 02:01:43PM +0300, Andrei Khomenkov wrote:
> Simplify boolean comparisons and remove unnecessary parentheses to
> improve code readability and match the kernel coding style.
> 
> Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
> ---
>  drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  4 +-
>  .../staging/rtl8723bs/core/rtw_ieee80211.c    |  2 +-
>  .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 40 +++++------
>  drivers/staging/rtl8723bs/core/rtw_mlme.c     |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  4 +-
>  drivers/staging/rtl8723bs/core/rtw_recv.c     | 69 ++++++++++---------
>  drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  2 +-
>  .../staging/rtl8723bs/core/rtw_wlan_util.c    | 16 ++---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     | 31 +++++----
>  drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 10 +--
>  drivers/staging/rtl8723bs/hal/hal_com.c       |  2 +-
>  .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  2 +-
>  drivers/staging/rtl8723bs/hal/hal_intf.c      |  4 +-
>  drivers/staging/rtl8723bs/hal/odm.c           |  9 ++-
>  .../staging/rtl8723bs/hal/odm_CfoTracking.c   |  2 +-
>  drivers/staging/rtl8723bs/hal/odm_DIG.c       | 22 +++---
>  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  2 +-
>  drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   | 10 +--
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  9 +--
>  .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  2 +-
>  .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  2 +-
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  6 +-
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 41 +++++------
>  .../staging/rtl8723bs/os_dep/sdio_ops_linux.c |  4 +-
>  drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 11 ++-
>  25 files changed, 153 insertions(+), 155 deletions(-)
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
