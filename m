Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F34AA460
	for <linux-staging@lists.linux.dev>; Tue,  8 Nov 2022 19:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6239C433D6;
	Tue,  8 Nov 2022 19:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667936636;
	bh=TQ6VFDWTvj3p3Yd6Y1xo0jQurPlby9PFkfx1GZjMErk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bfz7D7gmLm2Br9AJtb6DgitIxC8cghs5DDRlyOpX+d5CZl/XoNyMi7tNZS70hvXM0
	 1DIiEkdbbWBvTXqAyHzMVc7ysPOaEwU9483leLU3uhJTjfRhjN4V+iOltT3b4Wholr
	 APtqJj0WUM/JnyhEv/ax7UIyyR9WhEHRLiJrbmHM=
Date: Tue, 8 Nov 2022 20:43:52 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: staging/wlan-ng query: convert to flexible array member
Message-ID: <Y2qxeDQ+76CvfN1c@kroah.com>
References: <Y2px+zOGjkpGh6qC@qemulion>
 <Y2p29zc/TeX8OFWU@kroah.com>
 <Y2p5hqdFo5UZoHUY@qemulion>
 <Y2p7TOeg8vzK0rvB@kroah.com>
 <Y2qT0zSlhtQrYwl+@qemulion>
 <Y2qgs3hu95Okjs2w@kroah.com>
 <Y2qiMbpBobzvR4ED@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2qiMbpBobzvR4ED@qemulion>

On Wed, Nov 09, 2022 at 12:08:41AM +0530, Deepak R Varma wrote:
> On Tue, Nov 08, 2022 at 07:32:19PM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Nov 08, 2022 at 11:07:23PM +0530, Deepak R Varma wrote:
> > > On Tue, Nov 08, 2022 at 04:52:44PM +0100, Greg Kroah-Hartman wrote:
> > > > On Tue, Nov 08, 2022 at 09:15:10PM +0530, Deepak R Varma wrote:
> > > > > On Tue, Nov 08, 2022 at 04:34:15PM +0100, Greg Kroah-Hartman wrote:
> > > > > 	  MODPOST drivers/staging/wlan-ng/Module.symvers
> > > > > 	  LD [M]  drivers/staging/wlan-ng/prism2_usb.ko
> > > > > 	  BTF [M] drivers/staging/wlan-ng/prism2_usb.ko
> > > > > 	drv@qemulion:~/git/kernels/staging$
> > > > > </snip>
> > > > >
> > > >
> > > > Test the device to make sure it still works?
> > >
> > > I was able to build and load the driver on my machine. I do not have p54 device
> > > to test. Is there another way to test it? Some sort of a udev program???
> >
> > You need the real hardware to test it properly.
> 
> Do you know if I work with someone to test the change locally rather than
> sending in a untested change?

If you can find someone, sure!
