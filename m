Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304032FB0
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 17:55:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80B6260FE6;
	Tue, 17 Aug 2021 17:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629222938;
	bh=xhUQM2AVefdOM0NxRCwRXweqyFuZlea7H723WnziN4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HJmlx1AA/5Sf/R9MvdGN5jM9Q/3Lw729FxcHRe6uEesGxAXYj8Cva17gMRY+FxhVz
	 RY3GmoNP/wNaPmkktbLVNRWu3vQGnkFQfutULb+qpLImcsPzCaJKR+I9yk6laEDED1
	 DL9ZBCKDd35wln+g4OT6M1WdC1vmIimgaLnyHqWc=
Date: Tue, 17 Aug 2021 19:55:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] staging: r8188eu: Remove code depending on
 NAT25_LOOKUP
Message-ID: <YRv4GLL0BsMm/lf3@kroah.com>
References: <20210816175138.21633-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816175138.21633-1-fmdefrancesco@gmail.com>

On Mon, Aug 16, 2021 at 07:51:38PM +0200, Fabio M. De Francesco wrote:
> Remove all the code related to the management of the NAT25_LOOKUP
> method in nat25_db_handle(). The only function that used that method was
> the now deleted nat25_handle_frame(). Remove the NAT25_LOOKUP entry from
> the NAT25_METHOD enum because it is not anymore used everywhere else in
> the code of the driver.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> v2: Patch rebased against the latest Greg K-H's tree.
> 
>  drivers/staging/r8188eu/core/rtw_br_ext.c    | 112 -------------------
>  drivers/staging/r8188eu/include/rtw_br_ext.h |   1 -
>  2 files changed, 113 deletions(-)

This change adds a build warning, which is not allowed.

Please merge this, and the 3/3 patch into a single change, so that it
all is removed together, causing no build warnings at any point in time.

thanks,

greg k-h
