Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5193971
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 13:16:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41781611C9;
	Tue, 13 Apr 2021 13:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618319779;
	bh=52pCO/Ubuan7rPzq3r31wCXDbf6qMbBIH5fFiq9gt+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fwP8Nd+L4ncHkZQX6pzVY0hqT4y9UILLukBCFlGDtcoOPUPylWvpsN+yX6d5r48zY
	 oG33aPwqpeCgVk+csC0mpe7k3f7Rdrm+AFi1uSO8iGqMk/G8/4fVE6PercvNU0orIm
	 j0wc5J6spqGFbTIdNh45w/wU+mJ43OQqHUR2SQjs=
Date: Tue, 13 Apr 2021 15:16:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8192u: ieee80211:
 Replaced strncpy() with strscpy()
Message-ID: <YHWZoY6B8sOiflwy@kroah.com>
References: <20210413123041.24260-1-fmdefrancesco@gmail.com>
 <YHWVsahY4nfo9xF/@kroah.com>
 <4666289.4L6Ep8XSK1@linux.local>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4666289.4L6Ep8XSK1@linux.local>

On Tue, Apr 13, 2021 at 03:12:02PM +0200, Fabio M. De Francesco wrote:
> On Tuesday, April 13, 2021 2:59:29 PM CEST Greg Kroah-Hartman wrote:
> > On Tue, Apr 13, 2021 at 02:30:41PM +0200, Fabio M. De Francesco wrote:
> > > Replaced strncpy() with strscpy() because of compilation time warnings
> > > about possible truncation of output [-Wstringop-truncation].
> > 
> > build warnings?  What build warnings?
> >
> drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c:1388:5: warning: 
> ‘strncpy’ output may be truncated copying 32 bytes from a string of length 
> 32 [-Wstringop-truncation]
>  1388 |     strncpy(tmp_ssid, ieee->current_network.ssid, 
> IW_ESSID_MAX_SIZE);

That's implying that there is a real bug here, not that just replacing
it with a different call is going to solve this, right?

And how do you see that, I can't see that in my builds.


> > 
> > > Furthermore, according to the Linux official documentation, strscpy()
> > > is
> > > preferred to strncpy.
> > > 
> > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > ---
> > > 
> > >  drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> > > b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c index
> > > 25ea8e1b6b65..aa58eedf5e86 100644
> > > --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> > > +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> > > @@ -1385,12 +1385,12 @@ inline void ieee80211_softmac_new_net(struct
> > > ieee80211_device *ieee, struct ieee> 
> > >  			 * essid provided by the user.
> > >  			 */
> > >  			
> > >  			if (!ssidbroad) {
> > > 
> > > -				strncpy(tmp_ssid, ieee-
> >current_network.ssid, IW_ESSID_MAX_SIZE);
> > > +				strscpy(tmp_ssid, ieee-
> >current_network.ssid, IW_ESSID_MAX_SIZE);
> > 
> > Are you sure you can just replace this like this?
> >
> I surely was... but now I'm not anymore, since your review :)
> 
> Maybe you mean I have to check possible return of -E2BIG?
> Did you mean something else?
> May you please elaborate further?

If it was as simple as search/replace, we would have already done that
on the whole codebase at once.  It's not that simple :)

thanks,

greg k-h
