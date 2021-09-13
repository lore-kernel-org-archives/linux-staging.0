Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ABA3FD0
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 16:22:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F308960F6C;
	Mon, 13 Sep 2021 16:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1631550142;
	bh=Zv4rIie9czFFW4nMHFLTU7dGWvzL1ntTYFHFFdQiEys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tbin15R0e8bdMGqtkg1I4QRzfPEkejA7QahChl9nGK759K7/9ONva5k87T0ikPDop
	 0vU1pvbXLYKbltMahFuXXpsfEzpemPp0rbN2li+M984kAcVxiNWhswgrpmCPCXvK4k
	 XQW3dEYUFFR0mCYm7vzNmEVpCydwWk3Uc3x+RHI8=
Date: Mon, 13 Sep 2021 18:22:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] staging: r8188eu: more power management cleanup
Message-ID: <YT96vEoZmj89GMBJ@kroah.com>
References: <20210911161019.26881-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210911161019.26881-1-martin@kaiser.cx>

On Sat, Sep 11, 2021 at 06:10:15PM +0200, Martin Kaiser wrote:
> bHWPwrPindetect is always 0 for the r8188eu driver. This makes a lot of
> code unreachable.
> 
> Tested with Edimax EW-7811Un V2 on an ARM32 embedded system.
> 
> Martin Kaiser (4):
>   staging: r8188eu: bHWPwrPindetect is always false
>   staging: r8188eu: brfoffbyhw is always false
>   staging: r8188eu: remove rtw_hw_suspend
>   staging: r8188eu: remove rtw_hw_resume
> 
>  drivers/staging/r8188eu/core/rtw_cmd.c        | 10 --
>  drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 20 ----
>  .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  4 +-
>  drivers/staging/r8188eu/hal/usb_halinit.c     | 14 ---
>  drivers/staging/r8188eu/include/osdep_intf.h  |  2 -
>  drivers/staging/r8188eu/include/rtw_pwrctrl.h |  2 -
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  7 --
>  drivers/staging/r8188eu/os_dep/usb_intf.c     | 99 -------------------
>  8 files changed, 2 insertions(+), 156 deletions(-)
> 
> -- 
> 2.20.1
> 
> 

I have applied 2 of these, please rebase and resend the rest.

thanks,

greg k-h
