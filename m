Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D58D3FCF
	for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 13:52:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80E6561056;
	Thu, 16 Sep 2021 13:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1631800327;
	bh=PVPBKtiUBKzN5oWP2AP+VB1YQFhqbU8dENfIk9m5jDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xxROAd1nkGdHWzHKoyJwnTqY0MeGVMlvq/Q7+B6h6Gz/6SphXi7RquCXBRAmVvc5B
	 c3XVv+PHVjUw4xNv1q82qzv934ZXOgAxLhSauwqc9NVIjUuksBgp9fUfIr3D+n9hbD
	 lwYvfIR+3gZejW4c/zCOm13jMSn5MNWLPAwKDG8Q=
Date: Thu, 16 Sep 2021 15:52:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v6 14/19] staging: remove struct _io_ops
Message-ID: <YUNMBOcolb+5S4I5@kroah.com>
References: <20210915211103.18001-1-fmdefrancesco@gmail.com>
 <20210915211103.18001-15-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915211103.18001-15-fmdefrancesco@gmail.com>

On Wed, Sep 15, 2021 at 11:10:58PM +0200, Fabio M. De Francesco wrote:
> From: Pavel Skripkin <paskripkin@gmail.com>
> 
> Finally struct _io_ops is unused, so remove it.
> 
> Co-developed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>  drivers/staging/r8188eu/hal/usb_ops_linux.c |  6 -----
>  drivers/staging/r8188eu/include/rtw_io.h    | 25 ---------------------
>  drivers/staging/r8188eu/include/usb_ops.h   |  2 --
>  3 files changed, 33 deletions(-)

Subject line is missing the driver name :(
