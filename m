Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B552114
	for <linux-staging@lists.linux.dev>; Wed,  9 Nov 2022 06:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667976699; bh=ExypxdAet/mf4rZXfaz8Msk/ciHV77CT05iXnSAj0K0=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=esikdfQFWrWPohf8OZh6U6Sxk6hAeO4u7sWVO4nyuZbNy6B71pYxqQ5q7R6iqTrFn
	 wMWlMvwJwWdrB/YkLRceWxhvE6vso26coXcOmuyLG2K3c/jFarIGvFt3vbm9u/l4Fy
	 QSPsdAYNGpC5e747iEyLIgSMrSNaUL5HvqwTzGnU=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Wed,  9 Nov 2022 07:51:39 +0100 (CET)
X-EA-Auth: HzTQK8+OWDs0qY3dbkyDZ/7/IRH01+0Cn+3bQVowOWiV2Ds32Ar+ww2qQMm6mfUgLy125X4SQjVpfy61iIxROpYdwu3peC48
Date: Wed, 9 Nov 2022 12:21:30 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: staging/wlan-ng query: convert to flexible array member
Message-ID: <Y2tN8u5zwH5Ufkgd@qemulion>
References: <Y2px+zOGjkpGh6qC@qemulion>
 <Y2p29zc/TeX8OFWU@kroah.com>
 <Y2p5hqdFo5UZoHUY@qemulion>
 <Y2p7TOeg8vzK0rvB@kroah.com>
 <Y2qT0zSlhtQrYwl+@qemulion>
 <Y2qgs3hu95Okjs2w@kroah.com>
 <Y2qiMbpBobzvR4ED@qemulion>
 <Y2qxeDQ+76CvfN1c@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2qxeDQ+76CvfN1c@kroah.com>

On Tue, Nov 08, 2022 at 08:43:52PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Nov 09, 2022 at 12:08:41AM +0530, Deepak R Varma wrote:
> > On Tue, Nov 08, 2022 at 07:32:19PM +0100, Greg Kroah-Hartman wrote:
> > > > > Test the device to make sure it still works?
> > > >
> > > > I was able to build and load the driver on my machine. I do not have p54 device
> > > > to test. Is there another way to test it? Some sort of a udev program???
> > >
> > > You need the real hardware to test it properly.
> >
> > Do you know if I work with someone to test the change locally rather than
> > sending in a untested change?
>
> If you can find someone, sure!

Hello Greg,
I reached out to couple of recent patch authors to check if they are able to
help test the change.

Hello all,
Does anyone have a hardware that can test prism2_usb [wlan-ng] driver change? I
assume it would be quick to test the change I am proposing. Let me know if you
are able to help.

Thank you!
./drv


>


