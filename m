Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2E75F
	for <linux-staging@lists.linux.dev>; Thu, 25 Mar 2021 07:49:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 40E8061574;
	Thu, 25 Mar 2021 07:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1616658577;
	bh=Z6AdtYNRcQDu8jslmJqvzfkJlEgJk3BeyjR/NpKGz3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JAW3CAljmXyDfOuMIkfI/1fQjkuFrGdNjfsY17CbiuMeXQR2+a991Ek3gBSdAD6bN
	 RtdX1mzqwndo9pyHd0Se2eYtuxox9xC0egKGnAktPoseM5Rqdml2YSqYEvW2f9y7gd
	 T0eEhHOvdiTihcsTlzale1eAcUzT6xlISoHknxNE=
Date: Thu, 25 Mar 2021 08:49:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Wan Jiabing <wanjiabing@vivo.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kael_w@yeah.net
Subject: Re: [PATCH] [v2] drivers: staging: _adapter is declared twice
Message-ID: <YFxAjxnJk3qTJxNV@kroah.com>
References: <20210325074150.860167-1-wanjiabing@vivo.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325074150.860167-1-wanjiabing@vivo.com>

On Thu, Mar 25, 2021 at 03:41:47PM +0800, Wan Jiabing wrote:
> struct _adapter has been declared at 23rd line. 

Trailing whitespace :(

> Remove the duplicate.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  drivers/staging/rtl8712/drv_types.h | 2 --
>  1 file changed, 2 deletions(-)

If this is a v2 patch, you need to list what you changed below the ---
line as documented.

Please fix up and resend a v3.

thanks,

greg k-h
