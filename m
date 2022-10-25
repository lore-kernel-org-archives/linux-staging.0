Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84496748E
	for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 17:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DF4C433C1;
	Tue, 25 Oct 2022 17:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666719716;
	bh=gv9PwVUyWgrXj7zQoxaQauZIPiBzecYujC3cS68ufB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l/+qixbZDZyHwATVQTlsAc+xvt4Ztq9XuVb8icE2DTH4DmXvht/Va8MftTTbmRtyo
	 wxz7zc7ohfcwpDCCXABy26oXFN6kTdQbNomJTPGludml4ABp7mmJtytcPNCIkxCsh3
	 pzgDXtAVRP4VWUIcQNXFPALK/LHIjY2kxljoiQNA=
Date: Tue, 25 Oct 2022 19:41:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, dan.carpenter@oracle.com,
	kvalo@kernel.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192e: remove bogus ssid character sign
 test
Message-ID: <Y1gf4TpHMQlxharg@kroah.com>
References: <Y1e+SmS3O2ZaPVoe@kroah.com>
 <20221025122150.583617-1-Jason@zx2c4.com>
 <f0b755d2-6d73-5b04-e013-59f622e143da@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0b755d2-6d73-5b04-e013-59f622e143da@gmail.com>

On Tue, Oct 25, 2022 at 07:35:08PM +0200, Philipp Hortmann wrote:
> On 10/25/22 14:21, Jason A. Donenfeld wrote:
> > This error triggers on some architectures with unsigned `char` types:
> > 
> > drivers/staging/rtl8192e/rtllib_softmac_wx.c:459 rtllib_wx_set_essid() warn: impossible condition '(extra[i] < 0) => (0-255 < 0)'
> > 
> > But actually, the entire test is bogus, as ssids don't have any sign
> > validity rules like that. So just remove this check look all together.
> > 
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: linux-staging@lists.linux.dev
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > ---
> > Changes v1->v2:
> > - Remove ssid sign test entirely rather than casting to `s8 *`.
> > 
> >   drivers/staging/rtl8192e/rtllib_softmac_wx.c | 9 +--------
> >   1 file changed, 1 insertion(+), 8 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> > index f9589c5b62ba..1e5ad3b476ef 100644
> > --- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> > +++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> > @@ -439,7 +439,7 @@ int rtllib_wx_set_essid(struct rtllib_device *ieee,
> >   			union iwreq_data *wrqu, char *extra)
> >   {
> > -	int ret = 0, len, i;
> > +	int ret = 0, len;
> >   	short proto_started;
> >   	unsigned long flags;
> > @@ -455,13 +455,6 @@ int rtllib_wx_set_essid(struct rtllib_device *ieee,
> >   		goto out;
> >   	}
> > -	for (i = 0; i < len; i++) {
> > -		if (extra[i] < 0) {
> > -			ret = -1;
> > -			goto out;
> > -		}
> > -	}
> > -
> >   	if (proto_started)
> >   		rtllib_stop_protocol(ieee, true);
> 
> This patch cannot be applied on:
> [PATCH] staging: rtl8192e: use explicitly signed char
> On 10/24/22 18:30, Jason A. Donenfeld
> As line 456 was changed.

This now in my staging-linus branch, so perhaps you applied it to the
wrong one.

thanks,

greg k-h
