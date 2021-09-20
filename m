Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8B93FC0
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 10:34:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6386360F3A;
	Mon, 20 Sep 2021 10:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632134063;
	bh=LfZYAn6EQhZA6F2F/DFBpPbHtCyDTeRyH9Is5A/P9Ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GgMNk+1Q7noIVbEQGXW7gR93/rCIauY6JM0bpbshZiTFTjnIg0qjVISa+60Dia0PX
	 LZgtMb6s89Q9CTeZhwQSLyzR1BHpF9CcZqi9ACeiR3FQsonML7scma0RcWsuxWWnkE
	 hTLTaH+Qs3eXEU+LZS5brHhR4KppwTPJgByIA16Q=
Date: Mon, 20 Sep 2021 12:34:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Michael Straube <straube.linux@gmail.com>, Larry.Finger@lwfinger.net,
	martin@kaiser.cx, fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] staging: r8188eu: remove unused functions from
 rtw_ap.c
Message-ID: <YUhjrW2dJxMhbqZO@kroah.com>
References: <20210919153659.20826-1-straube.linux@gmail.com>
 <YUedLaAAp1jZiUvL@equinox>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUedLaAAp1jZiUvL@equinox>

On Sun, Sep 19, 2021 at 09:27:25PM +0100, Phillip Potter wrote:
> On Sun, Sep 19, 2021 at 05:36:53PM +0200, Michael Straube wrote:
> > This series removes all unused functions from rtw_ap.c.
> > 
> > Michael Straube (6):
> >   staging: r8188eu: remove ap_sta_info_defer_update()
> >   staging: r8188eu: remove rtw_acl_add_sta()
> >   staging: r8188eu: remove rtw_acl_remove_sta()
> >   staging: r8188eu: remove rtw_ap_inform_ch_switch()
> >   staging: r8188eu: remove rtw_check_beacon_data()
> >   staging: r8188eu: remove rtw_set_macaddr_acl()
> > 
> >  drivers/staging/r8188eu/core/rtw_ap.c    | 584 -----------------------
> >  drivers/staging/r8188eu/include/rtw_ap.h |   6 -
> >  2 files changed, 590 deletions(-)
> > 
> > -- 
> > 2.33.0
> > 
> 
> Dear Michael,
> 
> Looks good to me, built and tested here with no warnings and driver
> working fine still. Many thanks.
> 
> For all six patches:
> Acked-by: Phillip Potter

Nit, in the future, I need an email after that to have the tools pick it
up automatically.  It should have looked like:
	Acked-by: name <email@address>

thanks,

greg k-h
