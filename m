Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0342F26
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 09:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA22C004E1;
	Tue,  8 Feb 2022 09:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1644312634;
	bh=p+wZ9FA61c2TpCDag2GOKRF1CT5fzUtmZlu4O3jb2hA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kvbqgd07MKSZuhkj71ckxzwQhThhQdOUpkRBhHBCUlV6hB13/RICCzjxzi2ELnwbL
	 7RBLh4onXANruo+iDyjDIR4vrSX0KC69K5DlLv9UTnaRT1FtoDKuqrdpKEoG6JrWFq
	 U5xTVxpIWexi2jvTvwMNTzL41OkzqJzcmgV3GfrU=
Date: Tue, 8 Feb 2022 10:30:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] staging: r8188eu: remove ishighspeed from dvobj_priv
Message-ID: <YgI4N1X18cr9QApA@kroah.com>
References: <20220206175925.461426-1-martin@kaiser.cx>
 <20220206175925.461426-6-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220206175925.461426-6-martin@kaiser.cx>

On Sun, Feb 06, 2022 at 06:59:25PM +0100, Martin Kaiser wrote:
> There's no need to store the usb device speed in struct dvobj_priv.
> 
> We can read the speed from struct usb_device. dvobj_priv has a pointer
> to the usb_device.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/core/rtw_iol.c      | 4 +++-
>  drivers/staging/r8188eu/hal/usb_halinit.c   | 4 ++--
>  drivers/staging/r8188eu/include/drv_types.h | 1 -
>  drivers/staging/r8188eu/include/usb_ops.h   | 2 +-
>  drivers/staging/r8188eu/os_dep/usb_intf.c   | 8 --------
>  5 files changed, 6 insertions(+), 13 deletions(-)

This commit did not apply probably due to other changes to the driver at
the same time by other patch series.  Can you rebase it and resend?  The
other 4 were fine and now in my tree.

thanks,

greg k-h
