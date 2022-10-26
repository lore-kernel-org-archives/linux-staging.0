Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B551374;
	Wed, 26 Oct 2022 13:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666791886; bh=ysuEu2gcIIZ9Gls3WpW2bMj8egi1afgluP/NBc5EWnw=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=HmW0HhlZBEtQaXq4byFmXum8bkT8E96SObxAfid3j2s2cB79r4Yo29QJT5ip/cWxf
	 hPTcI+GQvnVGwAkFGPxQF7mS8PlZN04v9OQhGspAbZI5gaELFtlATFWXnKRuIzQEO9
	 XWCdXikR3FZwDtb6+MJzO0+Eby3yV/jBzzT0aDtY=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via [213.182.55.206]
	Wed, 26 Oct 2022 15:44:46 +0200 (CEST)
X-EA-Auth: N64AvuwQIp1I6Tw9cugKwmAqQwT+msEiS9FYfZa5FQBqVXeGcp75mkjIq995/MNmMfQMYPIEE1BZ3hgkWpENz5mYrJibjHPf
Date: Wed, 26 Oct 2022 19:14:43 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8192u: remove unused macro definition
Message-ID: <Y1k5y5PVT6t0+OIS@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1666754500.git.drv@mailo.com>
 <b7053d8737c048d6a878609f0ec24d66b18c5abd.1666754500.git.drv@mailo.com>
 <Y1kyr/hWqbKCzaaR@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1kyr/hWqbKCzaaR@kroah.com>

On Wed, Oct 26, 2022 at 03:14:23PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Oct 26, 2022 at 08:58:44AM +0530, Deepak R Varma wrote:
> > Pre-processor macros that are defined but are never used should be
> > cleaned up to avoid unexpected usage.
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  drivers/staging/rtl8192u/ieee80211/ieee80211.h | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211.h b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
> > index 00c07455cbb3..0b3dda59d7c0 100644
> > --- a/drivers/staging/rtl8192u/ieee80211/ieee80211.h
> > +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
> > @@ -230,8 +230,6 @@ struct cb_desc {
> >  #define ieee80211_unregister_crypto_ops ieee80211_unregister_crypto_ops_rsl
> >  #define ieee80211_get_crypto_ops	ieee80211_get_crypto_ops_rsl
> >
> > -#define ieee80211_ccmp_null		ieee80211_ccmp_null_rsl
> > -
> >  #define free_ieee80211			free_ieee80211_rsl
> >  #define alloc_ieee80211			alloc_ieee80211_rsl
>
> These #defines are a mess, please look into unwinding them as they
> should not be needed at all.

Hello Greg,
I would like to know what you mean by "unwind them". Is there a documentation or past
commit that I can review to understand the expectations better?

Thank you,
./drv

>
> thanks,
>
> greg k-h
>


