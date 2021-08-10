Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA8370
	for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 10:23:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B969560F94;
	Tue, 10 Aug 2021 10:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1628590980;
	bh=0128r8WY+OE77bTycxugMCEdSZ1435Mwfm+tkWVE0xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pLPn3O0wQDNoZa5740UD9H9e+aNm2189FbQH1FnlQAc6jVOct0TqovzyHfhfgg5zI
	 dEKWdLutrlVskfw+sQkoc6AJ3MucnjsRxiQ/4nkRy7EPsMg54ih9knVYmPswbRUo3V
	 tLjXjXhXA7zCiXo1LOYD9r4jp68pSZCFr7sTDq1o=
Date: Tue, 10 Aug 2021 12:22:56 +0200
From: gregkh <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Phillip Potter <phil@philpotter.co.uk>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: r8188eu: remove rtw_ioctl function
Message-ID: <YRJTgMI5CaG7VdGx@kroah.com>
References: <20210810074504.957-1-phil@philpotter.co.uk>
 <CAK8P3a2n6WfsQUKP7W4VytJ6K=CGcfOz-eSc=6FzvkANWkk87A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2n6WfsQUKP7W4VytJ6K=CGcfOz-eSc=6FzvkANWkk87A@mail.gmail.com>

On Tue, Aug 10, 2021 at 10:08:31AM +0200, Arnd Bergmann wrote:
> On Tue, Aug 10, 2021 at 9:45 AM Phillip Potter <phil@philpotter.co.uk> wrote:
> > -int rtw_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
> > -{
> > -       struct iwreq *wrq = (struct iwreq *)rq;
> > -       int ret = 0;
> > -
> > -       switch (cmd) {
> > -       case RTL_IOCTL_WPA_SUPPLICANT:
> > -               ret = wpa_supplicant_ioctl(dev, &wrq->u.data);
> > -               break;
> > -#ifdef CONFIG_88EU_AP_MODE
> > -       case RTL_IOCTL_HOSTAPD:
> > -               ret = rtw_hostapd_ioctl(dev, &wrq->u.data);
> > -               break;
> > -#endif /*  CONFIG_88EU_AP_MODE */
> > -       case SIOCDEVPRIVATE:
> > -               ret = rtw_ioctl_wext_private(dev, &wrq->u);
> > -               break;
> 
> 
> I think these functions are all defined 'static' in the same file, so
> removing the
> caller will cause a warning about an unused function. Better remove the
> called functions along with the caller.

I get no build warnings/errors with this patch applied, which is odd.

So I'll take this for now, but a follow-on patch to remove these unused
functions would be great to have.

thanks,

greg k-h
