Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1141633E2
	for <linux-staging@lists.linux.dev>; Tue,  8 Nov 2022 18:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667932726; bh=TPAj0q+ojgQRR92+IWucBz3U88D6H7YDwaMa5MVeU64=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=Sg7aODFKmyNFHj/x85Of7QDEmx2jDFt7Djw/z3Gy3nHtF/Uza06H+5DJSPSvpHfFX
	 60XjlbxgYHMDNNioCEcvrQ5HJWb6yJnAgWPb6XyqDy+S3NgPZv9HnONpfhnZiOKAMD
	 iFazhp7sssZ1NYEFsxjNYG4O6Y1xR12cuIzg2vqk=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Tue,  8 Nov 2022 19:38:46 +0100 (CET)
X-EA-Auth: TZqfKQaxwqdVg2PYONWFARJueSPXgTQI1O0AWkSXOUQBZS2NqQ3vrLk4zMjWIK50AYtvfRt0sl+aZ1G3aSxj1/mIPTVcU/xg
Date: Wed, 9 Nov 2022 00:08:41 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: staging/wlan-ng query: convert to flexible array member
Message-ID: <Y2qiMbpBobzvR4ED@qemulion>
References: <Y2px+zOGjkpGh6qC@qemulion>
 <Y2p29zc/TeX8OFWU@kroah.com>
 <Y2p5hqdFo5UZoHUY@qemulion>
 <Y2p7TOeg8vzK0rvB@kroah.com>
 <Y2qT0zSlhtQrYwl+@qemulion>
 <Y2qgs3hu95Okjs2w@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2qgs3hu95Okjs2w@kroah.com>

On Tue, Nov 08, 2022 at 07:32:19PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Nov 08, 2022 at 11:07:23PM +0530, Deepak R Varma wrote:
> > On Tue, Nov 08, 2022 at 04:52:44PM +0100, Greg Kroah-Hartman wrote:
> > > On Tue, Nov 08, 2022 at 09:15:10PM +0530, Deepak R Varma wrote:
> > > > On Tue, Nov 08, 2022 at 04:34:15PM +0100, Greg Kroah-Hartman wrote:
> > > > 	  MODPOST drivers/staging/wlan-ng/Module.symvers
> > > > 	  LD [M]  drivers/staging/wlan-ng/prism2_usb.ko
> > > > 	  BTF [M] drivers/staging/wlan-ng/prism2_usb.ko
> > > > 	drv@qemulion:~/git/kernels/staging$
> > > > </snip>
> > > >
> > >
> > > Test the device to make sure it still works?
> >
> > I was able to build and load the driver on my machine. I do not have p54 device
> > to test. Is there another way to test it? Some sort of a udev program???
>
> You need the real hardware to test it properly.

Do you know if I work with someone to test the change locally rather than
sending in a untested change?


Thank you,
./drv
>


