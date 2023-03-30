Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFFA10E7
	for <linux-staging@lists.linux.dev>; Thu, 30 Mar 2023 20:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FA7C433D2;
	Thu, 30 Mar 2023 20:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680209614;
	bh=wEGZ+6j3CKnjQ3nGoAdQWclI5P8LTLHhql9Q0wON1hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rcee/cJS4Jjr3mhLvzkHAllhW76FLqEqnV5qunxsiQf90Rau10W8J3LKl8jf1K4sM
	 6OAQj3lagd5cDrkMCrdwPFTtK6S0kofvwUvIAhc9xsSpJQNsuhmgPEL3SvIHu7e5Gy
	 axRRUwTYbq+RaDNmU3lcLhzfVzXYW6GUt0pm+jW8=
Date: Thu, 30 Mar 2023 22:53:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Joel C. Chang" <jcchangg3@gmail.com>
Cc: linux-staging@lists.linux.dev, driverdev-devel@linuxdriverproject.org
Subject: Re: [PATCH] staging: ks7010: remove unnecesary parentheses
Message-ID: <ZCX2yxHVwCZ930WH@kroah.com>
References: <ZCWEM7DCDUEOzBe9@joel-ubuntu-desktop>
 <ZCWFcosyX0PllKLI@kroah.com>
 <ZCXBO0cugdyR80g3@joel-ubuntu-desktop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCXBO0cugdyR80g3@joel-ubuntu-desktop>

On Fri, Mar 31, 2023 at 01:04:59AM +0800, Joel C. Chang wrote:
> On Thu, Mar 30, 2023 at 02:49:54PM +0200, Greg KH wrote:
> > On Thu, Mar 30, 2023 at 08:44:35PM +0800, Joel Camilo Chang Gonzalez wrote:
> > > Remove parentheses not needed in if statement
> > > 
> > > Signed-off-by: Joel Camilo Chang Gonzalez <jcchangg3@gmail.com>
> > > ---
> > >  drivers/staging/ks7010/ks_hostif.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
> > > index af3825578d85..8bded7e88ce7 100644
> > > --- a/drivers/staging/ks7010/ks_hostif.c
> > > +++ b/drivers/staging/ks7010/ks_hostif.c
> > > @@ -129,7 +129,7 @@ int get_current_ap(struct ks_wlan_private *priv, struct link_ap_info *ap_info)
> > >  	size = (ap_info->rsn.size <= RSN_IE_BODY_MAX) ?
> > >  		ap_info->rsn.size : RSN_IE_BODY_MAX;
> > >  	if ((ap_info->rsn_mode & RSN_MODE_WPA2) &&
> > > -	    (priv->wpa.version == IW_AUTH_WPA_VERSION_WPA2)) {
> > > +	    priv->wpa.version == IW_AUTH_WPA_VERSION_WPA2) {
> > 
> > If you look in the archives, you will see that I reject this type of
> > patch all the time.
> > 
> > Also, please use scripts/get_maintainer.pl to determine who to send this
> > to, you used a very old mailing list address that is long dead.
> > 
> > thanks,
> > 
> > greg k-h
> 
> Thanks for the input. I wasn't sure who to send it to, since the TODO in
> the driver and the script have different email addresses.
> 
> Is there a place to check for inactive mailing lists?

Just trust the get_maintainer.pl script, it knows what to do.

thanks,
greg k-h
