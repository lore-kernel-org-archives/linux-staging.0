Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18011D6AA
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 05:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772171958; cv=none; b=nRbqnZCXVznILi+2XKbh7VAHGXuGxpmwR6NDp8QMz+nGHObXu3gznVV+mlHw+pnjnGtPAsNBD2amwr96thPJ0ZjWqwhhJr3dRwTgkK0BrjXQoB9etUDX3N9c7T1lkDZb/iihHhUHfjvXPpPq3lZUmuc2cBE4wreGnoHqi2S4wxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772171958; c=relaxed/simple;
	bh=AGhbKDRTIdi3GTA9YCdKoHgADUNNj7NcmXCA/XbQmQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nby7rR8alVMpmBTQGyUFRviFLqIbupTt3USi9QZYyoAt1OLRjtcSpIXAuJAGi1gdm4brBkZ8B0bcGTZRzHXmyC6hbH+75bY9gwcQCcBg4dmYp2YgylGFCPE0/VmOltBPkI7t97gAO16R4clLUV0PKblqtMbmwyecX1ZMxYgDuEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IRiIwFh9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IRiIwFh9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B355C116C6;
	Fri, 27 Feb 2026 05:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772171958;
	bh=AGhbKDRTIdi3GTA9YCdKoHgADUNNj7NcmXCA/XbQmQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IRiIwFh9i03e1fNfdimy9doTTFoZLfCYAVe8CNb2yh7mWRnizo2aRCbwyCpWMlRFz
	 5+qqhRc2z2+/uXGp+sZjmUqBSBmj9wt4cKBeNIIAj0xioSmYIRPdzgtxMwrkuJ4wd/
	 H0/AMKirTUbPtM5T6mqroo1osYPW12wmt1rGO1JE=
Date: Thu, 26 Feb 2026 21:59:10 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 12/12] staging: rtl8723bs: remove unnecessary casts in
 ioctl_cfg80211.c
Message-ID: <2026022642-agreeably-paralysis-65c3@gregkh>
References: <20260226100255.167059-14-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226100255.167059-14-giorgitchankvetadze1997@gmail.com>

On Thu, Feb 26, 2026 at 02:02:56PM +0400, Giorgi Tchankvetadze wrote:
> Remove unnecessary pointer casts in memset(), memcpy(), and memcmp()
> calls. These functions accept void * arguments, so explicit casts
> are not needed.
> 
> No functional change. Object code verified identical before and after.
> 
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 46 ++++++++++---------
>  1 file changed, 25 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 7cb0c6f22bf3..eafedf91fa6e 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -93,9 +93,8 @@ static struct ieee80211_channel rtw_2ghz_channels[] = {
>  
>  static void rtw_2g_channels_init(struct ieee80211_channel *channels)
>  {
> -	memcpy((void *)channels, (void *)rtw_2ghz_channels,
> -	       sizeof(struct ieee80211_channel) * RTW_2G_CHANNELS_NUM
> -	);
> +	memcpy(channels, rtw_2ghz_channels,
> +	       sizeof(struct ieee80211_channel) * RTW_2G_CHANNELS_NUM);

You changed the style at the same time.  While overall a good thing,
please only do one type of change at once.

thanks,

greg k-h
