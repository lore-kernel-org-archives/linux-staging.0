Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C61C72
	for <linux-staging@lists.linux.dev>; Thu,  2 Sep 2021 09:24:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96AB96108B;
	Thu,  2 Sep 2021 09:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630574657;
	bh=VgEI2i4ZAs/h+EYvY3IzMrFuSHJvnX+iqn/RMGhHHL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JEVasX8kPBjUklqRLYiCF84foaXIEVAfp0S4hDOI++ACdlC4S7zIusPIthzNw++Ro
	 4LdtemNY8jIJLOCzftDb/BHLff62tm8TFNOS4XTlx23WnbuZ1AjblvzAZ/ZfM7Dir7
	 UJSw7dYQrKx+JAO48ShWzz8+XoBUYP3XXWdSIyJs=
Date: Thu, 2 Sep 2021 11:23:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx,
	fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: r8188eu: remove unused constants from wifi.h
Message-ID: <YTCYL85eGWP+s2JX@kroah.com>
References: <20210829180717.15393-1-straube.linux@gmail.com>
 <YTCYFu6fAi5vs2IE@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTCYFu6fAi5vs2IE@kroah.com>

On Thu, Sep 02, 2021 at 11:23:34AM +0200, Greg KH wrote:
> On Sun, Aug 29, 2021 at 08:07:16PM +0200, Michael Straube wrote:
> > The constants WLAN_REASON_PWR_CAPABILITY_NOT_VALID and
> > WLAN_REASON_SUPPORTED_CHANNEL_NOT_VALID defined in wifi.h
> > are unused, remove them.
> > 
> > Signed-off-by: Michael Straube <straube.linux@gmail.com>
> > ---
> >  drivers/staging/r8188eu/include/wifi.h | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
> > index 0b3fd94cea18..eb07ac9b8943 100644
> > --- a/drivers/staging/r8188eu/include/wifi.h
> > +++ b/drivers/staging/r8188eu/include/wifi.h
> > @@ -126,8 +126,6 @@ enum WIFI_REASON_CODE	{
> >  #define WLAN_REASON_DISASSOC_STA_HAS_LEFT 8
> >  #define WLAN_REASON_STA_REQ_ASSOC_WITHOUT_AUTH 9 */
> >  /* IEEE 802.11h */
> 
> This comment can now be deleted, right?

Ah, you do it on the follow-in patch, nevermind...
