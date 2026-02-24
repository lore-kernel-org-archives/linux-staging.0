Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A753E3B8D45;
	Tue, 24 Feb 2026 18:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956003; cv=none; b=ScEYacnQWNhjRMBW2XEmP6g56qcDmXsH1fy1ZtDdHdHJZ5/lop7EynTYW3v9SMF5L3PVPyf9In10DpM9Zf2T8wxAHLi2CDClLWNJ1WH1lujStVGlsIEZBa/qPS/LskCcpxLnBwlO7sgEIQooGi5AUflDekMq55e/WalHmksjGc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956003; c=relaxed/simple;
	bh=Z1+0ECWyxuAQRQkz0hgfQo0rVB5B354CLvQ7Vv0qX48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAnxDZAvtpCZUqYfpNU/E2kWYaHfaM9uXotNimm0xAHBgbaZ9TqX6wjFNYWoWwCoGxwE0PLuc6yzkK6fkImS7XpwtO3xJX5hDfnJ2hwuisSh4b14zsq6NdnSO6JpYM2tu9pg0xf/HQpAc81Ke3DDKLtEgxZwJDF1canv5ypWIuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WteqMhbn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WteqMhbn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7B4C19425;
	Tue, 24 Feb 2026 18:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771956003;
	bh=Z1+0ECWyxuAQRQkz0hgfQo0rVB5B354CLvQ7Vv0qX48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WteqMhbnilOOYqztTgWK8koe7P4wHxbRhi8lwJQvqy4iV95wGmaQcA2zNzGN6VqN2
	 n8VeUc7BkDxrJx6GRQqRJTb8pdCeEg4kkU9phr7hC+4FjR+qcXDdnaN+MrtyGFyxyz
	 UKjuUsr4L8lhSAiUVTcpLF/BNcvEXypSL++HaB6k=
Date: Tue, 24 Feb 2026 09:59:56 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: tomasz.unger@yahoo.pl, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] staging: rtl8723bs: convert single-line comment
 to multi-line format
Message-ID: <2026022431-splotchy-prison-d68a@gregkh>
References: <20260223200006.145296-1-tomasz.unger@yahoo.pl>
 <20260223200006.145296-2-tomasz.unger@yahoo.pl>
 <DGMXXS3DIY2Z.3GUN0MJI6S15M@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGMXXS3DIY2Z.3GUN0MJI6S15M@gmail.com>

On Mon, Feb 23, 2026 at 11:25:47PM -0600, Ethan Tidmore wrote:
> On Mon Feb 23, 2026 at 2:00 PM CST, tomasz.unger wrote:
> > From: Tomasz Unger <tomasz.unger@yahoo.pl>
> >
> > Convert a long single-line comment to multi-line format
> > as per coding-style.rst.
> >
> > Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> > ---
> > v3: Split into two separate patches as requested by Greg Kroah-Hartman.
> > v2: Added multi-line comment format, changed to codespell.
> >
> >  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> > index 74c31a97f093..cffb1a9d36fa 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> > @@ -597,7 +597,9 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
> >  
> >  		i = _rtw_camid_search(adapter, addr, kid);
> >  		if (i >= 0) {
> > -			/* Fix issue that pairwise and group key have same key id. Pairwise key first, group key can overwrite group only(ex: rekey) */
> > +			/* Fix issue that pairwise and group key have same key id.
> > +			 * Pairwise key first, group key can overwrite group only(ex: rekey)
> > +			 */
> 
> Almost, the correct format is this:
> 
> /*
>  * Fix issue ...
>  * ...
>  */ 

Except for the network stack/drivers.  So this _is_ correct, as this is
a network driver.

thanks,

greg k-h
