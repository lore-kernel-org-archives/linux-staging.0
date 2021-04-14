Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879AC72
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 08:27:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8AA19613C4;
	Wed, 14 Apr 2021 08:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618388874;
	bh=bsj0yTP1PFUb/V2oR3gLTK6H+GD+8Hj8YaUWcNDooNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nbu5hnKaG5FnRqZMHYvaz7PTjFo2kSpnEfqclxIHjWqDW1x4SJ/SVKhLFH9VLOU0z
	 JYva32lguS00R+s0lc9C3lri+fFuoS21sAZAQm5GYBZxRllBrYioOwrMSP4YZWn1BZ
	 DYAipfmpJiHAC/p7rI4HiD9no8R00M5PXfoV+V1k=
Date: Wed, 14 Apr 2021 10:27:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove sdio_drv_priv structure
Message-ID: <YHanh+kO3Z6qi9Wx@kroah.com>
References: <20210413171124.174008-1-hello@bryanbrattlof.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413171124.174008-1-hello@bryanbrattlof.com>

On Tue, Apr 13, 2021 at 05:11:39PM +0000, Bryan Brattlof wrote:
> The sdio_drv_priv structure is a small wrapper around sdio_driver in
> linux/mmc/sdio_func.h with an added drv_registered integer.
> 
> drv_registered is never used anywhere in the driver and only assigned to
> during the sdio registering and unregistering process. We can safely
> remove sdio_drv_priv and use the sdio_driver structure directly.
> 
> Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 32 ++++++--------------
>  1 file changed, 9 insertions(+), 23 deletions(-)

Does not apply to my tree :(

Please rebase and resend.

thanks,

greg k-h
