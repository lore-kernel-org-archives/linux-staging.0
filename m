Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC12229CA
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 14:45:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD4D060F5B;
	Fri, 17 Sep 2021 14:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1631889932;
	bh=ULeRIIIFttKb+b4QoTM0Wj+fNNtwkoySJ0NifURqcYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0YUF0xQ2ApWpA7Gb2ZOzLP5X9zHsBQKrhr9uF00QzULRewUj7i3q1JbFgMRGOqsw9
	 W/YTjgaycqi7fox8DKJsLHmq5nLhSk1HnwN2pqxsX4ndcun830ZSR2Ws8cdWirDDXH
	 oM1fJA6jsp/G1P13R4bgwqVPAAXZ1DHWaYZT8IWU=
Date: Fri, 17 Sep 2021 16:45:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v7 16/19] staging: r8188eu: clean up rtw_read*() and
 rtw_write*()
Message-ID: <YUSqCYKOulGjk1lZ@kroah.com>
References: <20210917071837.10926-1-fmdefrancesco@gmail.com>
 <20210917071837.10926-17-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917071837.10926-17-fmdefrancesco@gmail.com>

On Fri, Sep 17, 2021 at 09:18:34AM +0200, Fabio M. De Francesco wrote:
> Clean up rtw_read{8,16,32}() and rtw_write{8,16,32,N}() in usb_ops_linux.c.
> 
> 1) Rename variables:
>         length => len
>         pio_priv => io_priv
>         pintfhdl => intfhdl
>         wvalue => address.

Wait, why are you changing wvalue?  Isn't that the USB name for this
variable in the USB message sent to the device?  Check the USB spec
before changing this, that is a common field and probably should not be
changed.

thanks,

greg k-h
