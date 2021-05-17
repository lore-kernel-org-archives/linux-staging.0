Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7704370
	for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 09:03:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6790E610FA;
	Mon, 17 May 2021 09:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621242183;
	bh=gUm10dUf7/+1mJLO5+h9BYtkSzLqC7rGuCMNeD5x/QQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eRm58A+Po82x7w95vbhr3Ay/dAexkc6TwlY75gPGqbuRRZrpuGZkidKwTTDiFrF5b
	 5eEJkmtOvOE3uHJ6WUk56SR1hbZPQenObObSgvwlLuYRSUHu0QghuMUiTfFDkFQJNA
	 r4YXsSz+OIYQOp++ZTaqJJTv5KcQ37MSvtV1EIBfWg9rDYOBsU7Ss/PX3SwXw9s8Bj
	 /p23lO1tI9QAA94oLZZObABo8oUSjQnrT79pNeLY2HFvGIaEFBebNqHm0tG8/VsfAW
	 OyI5i3xemMd1nJD4vFavP07ZY0DrTX6B6oLrGJWvc9GDoBIs1uKl3UVpxfMKqF0M2I
	 m84dPm3FtfPhw==
Date: Mon, 17 May 2021 11:02:58 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com, Pavel Machek
 <pavel@ucw.cz>, linux-leds@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab@kernel.org>, devel@driverdev.osuosl.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/17] Add an experimental driver for Intel NUC leds
Message-ID: <20210517110258.341da12c@coco.lan>
In-Reply-To: <YKIm8TNJfXIMFl+W@kroah.com>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
	<YKIm8TNJfXIMFl+W@kroah.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 17 May 2021 10:18:57 +0200
Greg KH <gregkh@linuxfoundation.org> escreveu:

> On Sun, May 16, 2021 at 12:53:28PM +0200, Mauro Carvalho Chehab wrote:
> > Hi Greg,
> > 
> > This series add support for the LEDs found at Intel NUCs since
> > NUC version 6.
> > 
> > On several NUC models, the function of the LEDs are programmable,
> > which allow them to indicate several different hardware events.
> > 
> > They can even be programmed to represent an userspace-driven event.
> > 
> > Some models come with single colored or dual-colored LEDs, but
> > high end models have RGB LEDs.
> > 
> > Programming them can ether be done via BIOS or by the OS.
> > 
> > There are 3 different API types, and there is already some OOT
> > drivers that were written to support them, using procfs, each
> > one using a different (and IMO confusing) API.
> > 
> > After looking at the existing drivers and not liking the uAPI
> > interfaces there, I opted to write a new driver from scratch,
> > unifying support for all different versions and using sysfs
> > via the leds class.  
> 
> Just do this the "right way" and not add it to staging first.  Just use
> the existing LED class apis and all should be fine, no need for doing
> anything unusual here.

I'm using the standard LED class already (but not triggers), and the
standard WMI support.

Still, this API is complex, as it controls the LED behavior even when
the machine is suspended. I would feel more comfortable if the ABI
is not set into a stone at the beginning.

But it is your and Pavel's call.

Thanks,
Mauro
