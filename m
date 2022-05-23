Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF162258E
	for <linux-staging@lists.linux.dev>; Mon, 23 May 2022 15:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC89C385A9;
	Mon, 23 May 2022 15:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1653319572;
	bh=Tn18BFV/rU6iBwpcbPUyBxptSd3tEtMVOtluoy49Yi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xSpPWAZsmg72NIc2h88A/wShFKIanQjFYWsbA6cspbAR46ED9hMchHbtVsuR/Bvib
	 nZwp+S/JSnFUeONrEVJ5Dl2JVlIaDLq8XywanIcRMvGimAQvUl9Mc/El00hQRoWUQg
	 laC0SUpyAVSveesmiS8xPBPS23AH0vh5etZh7tP4=
Date: Mon, 23 May 2022 17:26:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Denis Efremov (Oracle)" <efremov@linux.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	dan.carpenter@oracle.com, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, stable <stable@vger.kernel.org>
Subject: Re: [PATCH v5.10] staging: rtl8723bs: prevent ->Ssid overflow in
 rtw_wx_set_scan()
Message-ID: <YounkTGwmcQns3vy@kroah.com>
References: <YoZk3YLEDYKGG5xe@kroah.com>
 <20220520035730.5533-1-efremov@linux.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520035730.5533-1-efremov@linux.com>

On Fri, May 20, 2022 at 07:57:30AM +0400, Denis Efremov (Oracle) wrote:
> This code has a check to prevent read overflow but it needs another
> check to prevent writing beyond the end of the ->Ssid[] array.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable <stable@vger.kernel.org>
> Signed-off-by: Denis Efremov (Oracle) <efremov@linux.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

And only 5.10 needs this?  What about all other kernel branches?

thanks,

greg k-h
