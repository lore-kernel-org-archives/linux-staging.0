Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D9270
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 15:04:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B3B1613B7;
	Tue, 13 Apr 2021 15:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618326290;
	bh=Zc0jTEgteZ4V3OV0BMx/XYPFzvMef4niL0JXkTqU9fU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jNKrStN1RP+hWMQ+71gb/B90IFn0pSqlxDsNKAEOyp20zDsIl/PEyItF3BdsoSYxm
	 HWdXRILUvQbkdfMBkqtzVDmBoPb7aGDwKjeiTR3FnktWL5Ef0FmwJhWgAsELyLmsL2
	 sDNJH70W4xgpL4PJpDZhxowFshx004YFnAJ78sok=
Date: Tue, 13 Apr 2021 17:04:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8192u: ieee80211:
 Replaced strncpy() with strscpy()
Message-ID: <YHWzENKgthTasHNO@kroah.com>
References: <20210413123041.24260-1-fmdefrancesco@gmail.com>
 <4666289.4L6Ep8XSK1@linux.local>
 <YHWZoY6B8sOiflwy@kroah.com>
 <5414987.Cp2PYjnBm2@linux.local>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5414987.Cp2PYjnBm2@linux.local>

On Tue, Apr 13, 2021 at 03:24:31PM +0200, Fabio M. De Francesco wrote:
> On Tuesday, April 13, 2021 3:16:17 PM CEST Greg Kroah-Hartman wrote:
> > On Tue, Apr 13, 2021 at 03:12:02PM +0200, Fabio M. De Francesco wrote:
> > > On Tuesday, April 13, 2021 2:59:29 PM CEST Greg Kroah-Hartman wrote:
> > > > On Tue, Apr 13, 2021 at 02:30:41PM +0200, Fabio M. De Francesco 
> wrote:
> > > > > Replaced strncpy() with strscpy() because of compilation time
> > > > > warnings
> > > > > about possible truncation of output [-Wstringop-truncation].
> > > > 
> > > > build warnings?  What build warnings?
> > > 
> > > drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c:1388:5: warning:
> > > ‘strncpy’ output may be truncated copying 32 bytes from a string of
> > > length 32 [-Wstringop-truncation]
> > > 
> > >  1388 |     strncpy(tmp_ssid, ieee->current_network.ssid,
> > > 
> > > IW_ESSID_MAX_SIZE);
> > 
> > That's implying that there is a real bug here, not that just replacing
> > it with a different call is going to solve this, right?
> > 
> > And how do you see that, I can't see that in my builds.
> >
> I see that with flag W=1 like in 
> make -j8 drivers/staging/rtl8192u/ W=1

Ah, no one "normal" builds with "W=1" :)

> However I also think it's not a real issue in this context.
> Just that strscpy() is preferred and get rid of warnings.
> You only can judge if a patch is worth.
> I just thought that gcc is (mostly) right in pointing out warnings like 
> that.

Check and verify if this is wrong as-is and if so, then replace it
properly.  Don't just blindly to a search/replace, as that's not ok
here.

thanks,

greg k-h
