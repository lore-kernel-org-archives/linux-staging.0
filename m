Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D3070
	for <linux-staging@lists.linux.dev>; Sun, 25 Jul 2021 16:38:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E98860295;
	Sun, 25 Jul 2021 16:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627231102;
	bh=OeOmKuniJGa777vFw6wze0AYSgrohQrzXyVZL8teTa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6h4D+Mw/nAUslgxCIJhHKQbscpZSt7O2dj0PljMukqbCEnTLsHxDRhD+nsjCW6rH
	 ZeQAFBH3nofy/zFd341WiQxqsOYQ0YYnH8b5jKhsp1Fzgg3EZu5TBJTm14gFiioD4V
	 IO2tN/XOmCLM9wNOH3bjejTeh8gnGhqWsYvrh+a4=
Date: Sun, 25 Jul 2021 18:38:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Martin Kaiser <martin@kaiser.cx>, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/18] staging: rtl8188eu: remove unused _HAL_INTF_C_
 define
Message-ID: <YP2Te4es2Xa8ygp+@kroah.com>
References: <20210725155902.32433-1-martin@kaiser.cx>
 <20210725155902.32433-9-martin@kaiser.cx>
 <2bfef837-e8f6-0a89-b0ac-967de12ed067@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2bfef837-e8f6-0a89-b0ac-967de12ed067@wanadoo.fr>

On Sun, Jul 25, 2021 at 06:32:10PM +0200, Christophe JAILLET wrote:
> Le 25/07/2021 à 17:58, Martin Kaiser a écrit :
> > This define can be removed.
> > 
> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---
> >   drivers/staging/rtl8188eu/hal/hal_intf.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/staging/rtl8188eu/hal/hal_intf.c b/drivers/staging/rtl8188eu/hal/hal_intf.c
> > index f09620c54e69..3e132e00c81c 100644
> > --- a/drivers/staging/rtl8188eu/hal/hal_intf.c
> > +++ b/drivers/staging/rtl8188eu/hal/hal_intf.c
> > @@ -5,7 +5,6 @@
> >    *
> >    ******************************************************************************/
> > -#define _HAL_INTF_C_
> >   #include <hal_intf.h>
> >   uint rtw_hal_init(struct adapter *adapt)
> > 
> 
> Hi,
> 
> This one looks like an include guard.
> 
> #ifndef _HAL_INTF_C_
> #define _HAL_INTF_C_
> ...
> #endif /* _HAL_INTF_C_ */
> 
> ?

But it really does not do anything, so should be dropped as the patch
does.

Unless I am reading the code wrong?

greg k-h
