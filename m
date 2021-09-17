Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47EA3FC5
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 14:44:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64D9660F9C;
	Fri, 17 Sep 2021 14:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1631889859;
	bh=pUUgn5EpX2DVFZW5+R/+upMeQszcZdrUJ+S9rLWFIfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BSe7UA7GNyc/RXQ2NxNZ+pNPO0Q+KnJocHbJSrowb8vte234uGtj+PKEePqr7gTdT
	 g78yUiurVBo+15eIFsss3JO9LgTMz+x5gvLk8Xrit5Q4NIRecW13+qf9xwoQsUO3ZJ
	 qo2j2St7YV7P1PR4C0jTwByS/TJ2tm4sU/slQ6cY=
Date: Fri, 17 Sep 2021 16:44:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v7 15/19] staging: r8188eu: clean up usbctrl_vendorreq()
Message-ID: <YUSpwTneDgRtUBvM@kroah.com>
References: <20210917071837.10926-1-fmdefrancesco@gmail.com>
 <20210917071837.10926-16-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917071837.10926-16-fmdefrancesco@gmail.com>

On Fri, Sep 17, 2021 at 09:18:33AM +0200, Fabio M. De Francesco wrote:
> Clean up usbctrl_vendoreq() in usb_ops_linux.c.
> 
> List of changes:
> 
> 1) Rename variables:
> 	pdata => data
>         pio_priv => io_priv
>         pintfhdl => intfhdl
>         wvalue => address.
> 2) Reorder variables declarations according to the "Reverse Xmas Tree"
>    style.
> 3) Remove unncecessary test for "!pIo_buf".
> 4) Move comments one line below code.
> 5) Remove unnecessary excess parentheses.
> 6) Remove unnecessary extra spaces.
> 7) Remove unnecessary comments.
> 8) Fix grammar errors (checksumed => checksummed).

When you find yourself listing all of the different things you have done
in a single commit, that is a HUGE hint that you need to break this up
into smaller pieces.

Please do so here, this should not be just one change, as it's almost
impossible to look at this and "know" it's all still the same logic
happening here.  But if you had broken this down into 8 different
changes, then it would have been obvious and I could easily have applied
the changes.

I've taken the first 14 patches in this series, it's great work, thank
you all for doing this.  But this, and the remaining patches in here
need to be split up more to make it obvious that the changes are correct
and should be accepted.  Please feel free to start the numbering of the
patch series over now, given that the first 14 are now merged into my
tree.

thanks,

greg k-h
