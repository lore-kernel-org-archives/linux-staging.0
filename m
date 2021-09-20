Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2973FC0
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 11:46:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D46461077;
	Mon, 20 Sep 2021 11:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632138386;
	bh=OcsIjYKdpluzbdy63M2OoRjs4f9NpVzJltEYhjs8Cjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aklr7x91ty0cSya0HV4EgH+H0K4Z3M9YWvZgMVyI5bApM4JdVw3WkmYqCUjH+Qfbt
	 zBRkLgsXTKmMjsa4lUiymwbT8C/ATQSfG9qJ8O5CEEC1Pd13lyfJTz8j2cEEv3ZK5B
	 P8DBNequtzkL1HxMuAf1i7cfkmFiXFKkvbu3FbCM=
Date: Mon, 20 Sep 2021 13:46:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH v8 01/19] staging: r8188eu: clean up symbols
 usbctrl_vendorreq()
Message-ID: <YUh0kDY8tALo7QBQ@kroah.com>
References: <20210919235356.4151-1-fmdefrancesco@gmail.com>
 <20210919235356.4151-2-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210919235356.4151-2-fmdefrancesco@gmail.com>

On Mon, Sep 20, 2021 at 01:53:38AM +0200, Fabio M. De Francesco wrote:
> Clean up symbol names in usbctrl_vendorreq():
> 
> 	pdata => data;
>         pio_priv => io_priv;
>         pintfhdl => intfhdl.

Odd mix of tabs and spaces :(

Anyway, what does intfhdl mean?

Ugh, that's a horrible structure name for a driver, but that's not your
fault.  However, isn't 'intf' a better name for this thing as that is
how the driver does use it in other structures?

This isn't windows, where "handles" are used all over the places.  We
have real structures :)

thanks,

greg k-h
