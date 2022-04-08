Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EED3366;
	Fri,  8 Apr 2022 05:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C06AC385A1;
	Fri,  8 Apr 2022 05:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649394589;
	bh=wW/WiXjDRjhOQJ2j+/wUQxXY5ErhWXLkWm2Z+gRGVpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RZ962WN+gcwZp4+6kLgbFVwSQUcskTC7E+dJhstGSXlDM6KOos100DfkNDYFDtCF8
	 M6hjRtMqQzWPcmgAcQ5JQPJt6kpyDVna2e3zMboGa+S5fjAj+gXXIEgUJqWdYe703u
	 BzwI3H7x9JHHvgr3+LHj/0I/PEa6pFYIQpjnULVM=
Date: Fri, 8 Apr 2022 07:09:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Rebecca Mckeever <remckee0@gmail.com>, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8192u: replace ternary statement with
 if and assignment
Message-ID: <Yk/Dmy7PYqn532M+@kroah.com>
References: <cover.1649378587.git.remckee0@gmail.com>
 <36059ec66a2f3d58a8e339aa4f262772eabd3ef0.1649378587.git.remckee0@gmail.com>
 <alpine.DEB.2.22.394.2204080614400.2199@hadrien>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2204080614400.2199@hadrien>

On Fri, Apr 08, 2022 at 06:15:14AM +0200, Julia Lawall wrote:
> 
> 
> On Thu, 7 Apr 2022, Rebecca Mckeever wrote:
> 
> > Replace ternary statement with an if statement followed by an assignment
> > to increase readability and make error handling more obvious.
> > Found with minmax coccinelle script.
> >
> > Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
> > ---
> >  drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
> > index 78cc8f357bbc..9885917b9199 100644
> > --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
> > +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
> > @@ -470,7 +470,9 @@ int ieee80211_wx_get_encode(struct ieee80211_device *ieee,
> >  		return 0;
> >  	}
> >  	len = crypt->ops->get_key(keybuf, SCM_KEY_LEN, NULL, crypt->priv);
> > -	erq->length = (len >= 0 ? len : 0);
> > +	if (len < 0)
> > +		len = 0;
> > +	erq->length = len;
> 
> Maybe you could use max here?

Dan said to not do this on based on the first submission :)

