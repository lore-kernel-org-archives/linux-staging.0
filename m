Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A367C
	for <linux-staging@lists.linux.dev>; Thu, 26 May 2022 12:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3182C385A9;
	Thu, 26 May 2022 12:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1653566739;
	bh=EZ83Wu0JIwui5tEnq9zsFh1J1HyLzUwNJ/Dy+pO3xvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fPMbA5axeabY/ZFxS5rXuKPt7XWp+0mcWg2WC6lVFuvYINemHq5i+oKy9KK0Ni1em
	 1DwXq0tblKIBK/yrgHoHB0Z6wZ8DflmvuNsHdkMm7/nKr4u6ItwVgpZ0/KZGLEUTXF
	 bffFTjnx5WVhBb8RP8cOYiMmQq95qAN71k7EofXU=
Date: Thu, 26 May 2022 14:05:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Denis Efremov <efremov@linux.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	dan.carpenter@oracle.com, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, stable <stable@vger.kernel.org>
Subject: Re: [PATCH v5.10] staging: rtl8723bs: prevent ->Ssid overflow in
 rtw_wx_set_scan()
Message-ID: <Yo9tEA6AXBg9CV8y@kroah.com>
References: <YoZk3YLEDYKGG5xe@kroah.com>
 <20220520035730.5533-1-efremov@linux.com>
 <YounkTGwmcQns3vy@kroah.com>
 <22589460-930c-b307-acf0-2a49f5f5261f@linux.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22589460-930c-b307-acf0-2a49f5f5261f@linux.com>

On Mon, May 23, 2022 at 09:41:09PM +0400, Denis Efremov wrote:
> Hi,
> 
> On 5/23/22 19:26, Greg KH wrote:
> > On Fri, May 20, 2022 at 07:57:30AM +0400, Denis Efremov (Oracle) wrote:
> >> This code has a check to prevent read overflow but it needs another
> >> check to prevent writing beyond the end of the ->Ssid[] array.
> >>
> >> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> >> Cc: stable <stable@vger.kernel.org>
> >> Signed-off-by: Denis Efremov (Oracle) <efremov@linux.com>
> >> ---
> >>  drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 6 ++++--
> >>  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > And only 5.10 needs this?  What about all other kernel branches?
> > 
> 
> >From 5.10, 5.4, 4.19, to 4.14.
> 
> There is a small spaces conflict in 5.4-4.14 kernels because of
> c77761d660a6 staging: rtl8723bs: Fix spacing issues
> 
> I sent another patch to handle it.

Thanks, all now queued up.

greg k-h
