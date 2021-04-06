Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302EB70
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 14:11:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05ADC613A7;
	Tue,  6 Apr 2021 14:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617718293;
	bh=wq4U+4ecsCCR/Rbtqkka4myOOcVmx4VEjHscpWZCLPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+mea4rvGOW13dfwSFP/PbmTlYrG0QRLtZfbmryo9FUxkj2TRNcuQkA6gHgmZGWEY
	 CMa/JCjYkWRj0QLL2QE7qJ6aPs5bPhlQa3/BkkavQcwgXPLE2ca4IHNoFBoYcAR1S4
	 WaeclgvYzwY+u85DZhrQF26NsbEkw2LhGh/OP2zQ=
Date: Tue, 6 Apr 2021 16:11:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH v2] staging: rtl8723bs: hal: Remove
 camelcase in Hal8723BReg.h
Message-ID: <YGxsExq2fcQvrN99@kroah.com>
References: <20210406130556.1417-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406130556.1417-1-fmdefrancesco@gmail.com>

On Tue, Apr 06, 2021 at 03:05:56PM +0200, Fabio M. De Francesco wrote:
> Remove camelcase in some symbols defined in Hal8723BReg.h. These symbols
> are not used anywhere else, therefore this patch does not break the driver.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/Hal8723BReg.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

If this is "v2", you need to put below the --- line what changed from
v1.

Please fix up and send a v3.

thanks,

greg k-h
