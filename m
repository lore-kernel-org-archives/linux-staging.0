Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D7729CA
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 14:44:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D24860F5B;
	Fri, 17 Sep 2021 14:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1631889875;
	bh=+Hg/+BfWwo03yKEs5Bbuny3+dk6KDoxUqDrZJkTkIM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r3zRsZNEddp6obXcwYzM/GjWxK+HxAoSYubfD8EcE37EiYioYi7QmPRdyOJdsCueM
	 m1TLt856AWgCdw4D7vJMYaUttfngVoI+1nO6sUQzbBkJsAqYo+azJffUVUFDvJA4YF
	 WoY8G3T0GBrXxito+C0oKplLWtZ/AQGmUr2GleBw=
Date: Fri, 17 Sep 2021 16:44:33 +0200
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
Message-ID: <YUSp0eIu22iiT58f@kroah.com>
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
> 2) Remove unnecessary casts.
> 3) Fix types.  Use __le16 instead of __le32.

Again, should be 3 changes.

thanks,

greg k-h
