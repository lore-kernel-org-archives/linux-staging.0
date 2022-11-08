Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F798BF9
	for <linux-staging@lists.linux.dev>; Tue,  8 Nov 2022 18:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C28C433D6;
	Tue,  8 Nov 2022 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667932342;
	bh=OwrQ3wuL3K7MOqwn3XN+uxBYVP8gb/V83kD7QDu5EgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dnu7n2c/E7hT/Yxlan9JkuYoScQ0dOTbVw7IvQpNzC0VscRa9fHvPpryQPs5FPY0V
	 B5A0bEAjsliLmpIcZ0e9fvv9pb0Q32x5krGJ45Wk5d/uglwDmWU/BAf12TYSfej4YY
	 V6L1lsWpoJ4hHoXqUGJF24PU2k+DNIyRhc3V+Yco=
Date: Tue, 8 Nov 2022 19:32:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: staging/wlan-ng query: convert to flexible array member
Message-ID: <Y2qgs3hu95Okjs2w@kroah.com>
References: <Y2px+zOGjkpGh6qC@qemulion>
 <Y2p29zc/TeX8OFWU@kroah.com>
 <Y2p5hqdFo5UZoHUY@qemulion>
 <Y2p7TOeg8vzK0rvB@kroah.com>
 <Y2qT0zSlhtQrYwl+@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2qT0zSlhtQrYwl+@qemulion>

On Tue, Nov 08, 2022 at 11:07:23PM +0530, Deepak R Varma wrote:
> On Tue, Nov 08, 2022 at 04:52:44PM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Nov 08, 2022 at 09:15:10PM +0530, Deepak R Varma wrote:
> > > On Tue, Nov 08, 2022 at 04:34:15PM +0100, Greg Kroah-Hartman wrote:
> > > 	  MODPOST drivers/staging/wlan-ng/Module.symvers
> > > 	  LD [M]  drivers/staging/wlan-ng/prism2_usb.ko
> > > 	  BTF [M] drivers/staging/wlan-ng/prism2_usb.ko
> > > 	drv@qemulion:~/git/kernels/staging$
> > > </snip>
> > >
> >
> > Test the device to make sure it still works?
> 
> I was able to build and load the driver on my machine. I do not have p54 device
> to test. Is there another way to test it? Some sort of a udev program???

You need the real hardware to test it properly.

