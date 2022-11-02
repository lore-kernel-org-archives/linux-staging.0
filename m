Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA307C;
	Wed,  2 Nov 2022 07:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363D4C433D6;
	Wed,  2 Nov 2022 07:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667374139;
	bh=PqmmqrMvPpwusmfzs25Ti0ixsJP9q/A+fj2LM+9egvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XqrH3xDIeM0b5sTwegyRBlHHXq9ZtEE5eFDkazHzbdh+VJYTsUHUGWuiFOV07SRJO
	 XSX0yoH0bFfVAhxo6P3KCMk15RvFuriHPS273ve2c4msaP/+qSV+auMJsJm8Eq8uiQ
	 GNetBdjcjw27uJ0pUglzNLyR4GKhEdF6FIWc7jhA=
Date: Wed, 2 Nov 2022 08:29:52 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: outreachy@lists.linux.dev, Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: r8188eu: remove unwanted variable
 implementation
Message-ID: <Y2IccKxNDyd/MEqY@kroah.com>
References: <Y2F/CtEnjWlHgw9f@ubunlion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2F/CtEnjWlHgw9f@ubunlion>

On Wed, Nov 02, 2022 at 01:48:18AM +0530, Deepak R Varma wrote:
> Local variables intended as the function return value are
> initialized but their value does not change during function
> execution. The initial value assigned to the variable is simply
> returned to the caller. This makes the variable declaration
> unnecessary and the initial value can be directly returned.
> 
> Following table lists the initial commits when the variables were first
> introduced but have not been used since inception:
> 
> Variable  Function	File			     Inception Commit
> ret	  rtw_sta_flush	r8188eu/core/rtw_ap.c	     [1]
> ret	  amsdu_to_msdu r8188eu/core/rtw_recv.c	     [2]
> ret	  rtw_p2p_set	r8188eu/os_dep/ioctl_linux.c [3]
> 
> [1] 'commit 9a7fe54ddc3a ("staging: r8188eu: Add source files for new driver - part 1")'
> [2] 'commit 1cc18a22b96b ("staging: r8188eu: Add files for new driver - part 5")'
> [3] 'commit a2c60d42d97c ("staging: r8188eu: Add files for new driver - part 16")'
> 
> However, local variable pull of the function update_txdesc from file
> r8188eu/hal/rtl8188eu_xmit.c was in use prior to introduction of
> commit ID [4] 7bdedfef085bb65. The clean-up associated with this
> commit left the variable pull redundant.
> 
> [4] 'commit 7bdedfef085b ("staging: r8188eu: Remove mp, a.k.a. manufacturing process, code")'
> 
> The patch is produced using the following coccicheck options:
>    COCCI=./scripts/coccinelle/misc/returnvar.cocci
>    M=driver/staging/r8188eu/
>    MODE=patch
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> 
> Changes in v2:
>    1. Include reason for why the variable declarations are not useful. Suggested
>       by Julia Lawall <julia.lawall@inria.fr>

Does not apply to my tree at all :(

Please rebase and resubmit.

thanks,

greg k-h

