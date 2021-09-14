Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851BB3FD0
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 07:15:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B01761163;
	Tue, 14 Sep 2021 07:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1631603702;
	bh=GkbZv416XVxgZ7KC/sJpNSy6lMiYhkfOz6Mo4NJgI1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GXxOtrMLRTxyKajaYRjbaqvp8CzJUDNH2WK218UT2l27Y4oGvpmHQQdp30BkmpjCI
	 YyRXb+q8YF+BeTzTZ+cTHv17kj7JlNskQaR0BIDBThUmjAkDtObMwy6YpnK6xtm2Pa
	 ckJlrxyPyMReLFYXD/7UvK8N+Nmz7YNScNT6l0dY=
Date: Tue, 14 Sep 2021 09:14:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] staging: r8188eu: more power management cleanup
Message-ID: <YUBL89DoPPtRRJqW@kroah.com>
References: <20210911161019.26881-1-martin@kaiser.cx>
 <20210913185957.3166-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913185957.3166-1-martin@kaiser.cx>

On Mon, Sep 13, 2021 at 08:59:55PM +0200, Martin Kaiser wrote:
> bHWPwrPindetect is always 0 for the r8188eu driver. This makes a lot of
> code unreachable.
> 
> Tested with Edimax EW-7811Un V2 on an ARM32 embedded system.
> 
> v2:
> - rebased against today's staging-testing branch
> 
> Martin Kaiser (2):
>   staging: r8188eu: brfoffbyhw is always false
>   staging: r8188eu: remove rtw_hw_resume
> 
>  drivers/staging/r8188eu/include/osdep_intf.h  |  1 -
>  drivers/staging/r8188eu/include/rtw_pwrctrl.h |  1 -
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  7 ----
>  drivers/staging/r8188eu/os_dep/usb_intf.c     | 40 -------------------
>  4 files changed, 49 deletions(-)
> 
> -- 
> 2.20.1
> 
> 

Series does not apply to my tree :(
