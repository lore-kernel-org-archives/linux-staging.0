Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBF6EBE
	for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 10:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A5CC433D6;
	Tue, 25 Oct 2022 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666694679;
	bh=y0fhIZHdL2tj9M5OvvCMMhfCMRAwQjchg5BOYDbVnyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bfdJ4DrKUOgvvLHp3xP8Jc01uDkPq+dcyYwKxaI2yIgY6tJW1xLSi4ac36KRBdD+A
	 NYpzikXouwA+kgtbPVgSdIziLhyGg1x9xqmFZA59tVqWqOD8chCgRitnwEMP3CVeoE
	 X97/zlqMdlf1moAf2nGdn70XCUcHDgmV5/AxW9Js=
Date: Tue, 25 Oct 2022 12:45:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@oracle.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8192e: use explicitly signed char
Message-ID: <Y1e+SmS3O2ZaPVoe@kroah.com>
References: <20221024163005.536097-1-Jason@zx2c4.com>
 <Y1eADgj7fLKegXDH@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1eADgj7fLKegXDH@kadam>

On Tue, Oct 25, 2022 at 09:19:58AM +0300, Dan Carpenter wrote:
> On Mon, Oct 24, 2022 at 06:30:05PM +0200, Jason A. Donenfeld wrote:
> > With char becoming unsigned by default, and with `char` alone being
> > ambiguous and based on architecture, signed chars need to be marked
> > explicitly as such. In this case, passing `char *extra` is part of the
> > iw API, and that extra is mostly intended to be somewhat opaque. So just
> > cast to `s8 *` for the sign test. This fixes warnings like:
> > 
> > drivers/staging/rtl8192e/rtllib_softmac_wx.c:459 rtllib_wx_set_essid() warn: impossible condition '(extra[i] < 0) => (0-255 < 0)'
> > 
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: linux-staging@lists.linux.dev
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > ---
> >  drivers/staging/rtl8192e/rtllib_softmac_wx.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> > index f9589c5b62ba..4563e3b5bd47 100644
> > --- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> > +++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> > @@ -456,7 +456,7 @@ int rtllib_wx_set_essid(struct rtllib_device *ieee,
> >  	}
> >  
> >  	for (i = 0; i < len; i++) {
> > -		if (extra[i] < 0) {
> > +		if (((s8 *)extra)[i] < 0) {
> 
> I agree with Linus that this if statement is nonsense and should just be
> deleted.

Yeah, I agree as well, let's just delete this invalid check.  No other
wifi driver cares about ssid characters like this.

thanks,

greg k-h
