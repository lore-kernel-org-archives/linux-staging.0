Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF34623;
	Fri,  8 Apr 2022 08:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fZZ16rD9b0u2RViOVs+LJJdsC5uqvAuSjxxabYBNoi0=;
  b=URLpjXWkCOdrk2HRgoR9ugF8+E7LejuRz+d85uUlryZ15T5PLQ3javxl
   GztOI4W9tQAAH4G3XHeXSBSTGnDB0hG26ePOLyGXW/0D14V0VvKsooEko
   vKZWA3pc/Vx9RGovReEQx//trqRHgYGUjawPyudk5zBBc/w8rTlarLcXE
   I=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,244,1643670000"; 
   d="scan'208";a="10959734"
Received: from unknown (HELO hadrien) ([95.128.147.62])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 10:50:58 +0200
Date: Fri, 8 Apr 2022 10:50:57 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Dan Carpenter <dan.carpenter@oracle.com>
cc: Rebecca Mckeever <remckee0@gmail.com>, outreachy@lists.linux.dev, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8192u: replace ternary statement with
 if and assignment
In-Reply-To: <20220408055732.GO3293@kadam>
Message-ID: <alpine.DEB.2.22.394.2204081049010.2168@hadrien>
References: <cover.1649378587.git.remckee0@gmail.com> <36059ec66a2f3d58a8e339aa4f262772eabd3ef0.1649378587.git.remckee0@gmail.com> <alpine.DEB.2.22.394.2204080614400.2199@hadrien> <20220408055732.GO3293@kadam>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 8 Apr 2022, Dan Carpenter wrote:

> On Fri, Apr 08, 2022 at 06:15:14AM +0200, Julia Lawall wrote:
> > On Thu, 7 Apr 2022, Rebecca Mckeever wrote:
> >
> > > Replace ternary statement with an if statement followed by an assignment
> > > to increase readability and make error handling more obvious.
> > > Found with minmax coccinelle script.
> > >
> > > Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
> > > ---
> > >  drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
> > > index 78cc8f357bbc..9885917b9199 100644
> > > --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
> > > +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
> > > @@ -470,7 +470,9 @@ int ieee80211_wx_get_encode(struct ieee80211_device *ieee,
> > >  		return 0;
> > >  	}
> > >  	len = crypt->ops->get_key(keybuf, SCM_KEY_LEN, NULL, crypt->priv);
> > > -	erq->length = (len >= 0 ? len : 0);
> > > +	if (len < 0)
> > > +		len = 0;
> > > +	erq->length = len;
> >
> > Maybe you could use max here?
>
> Initially Rebecca did use max() but I NAKed it.  It's really not less
> readable.  Better to handle the error explicitly.  Keep the error path
> indented two tabs.  Separate from the success path.

OK.  I have a hard time seeing that as an error path, though, with no
return or goto.  I guess it's error and recover.  OK either way.

julia
