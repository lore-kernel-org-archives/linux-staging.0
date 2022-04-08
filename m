Received: from relay3.hostedemail.com (relay3.hostedemail.com [64.99.140.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A01C362;
	Fri,  8 Apr 2022 06:33:16 +0000 (UTC)
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay11.hostedemail.com (Postfix) with ESMTP id 692B980C8C;
	Fri,  8 Apr 2022 06:14:59 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf05.hostedemail.com (Postfix) with ESMTPA id 9A66F2001A;
	Fri,  8 Apr 2022 06:14:52 +0000 (UTC)
Message-ID: <34d0ad73f44ff4990f6bee49105ac49bb55352a5.camel@perches.com>
Subject: Re: [PATCH v2 1/2] staging: rtl8192u: replace ternary statement
 with if and assignment
From: Joe Perches <joe@perches.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Julia Lawall
	 <julia.lawall@inria.fr>
Cc: Rebecca Mckeever <remckee0@gmail.com>, outreachy@lists.linux.dev, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Thu, 07 Apr 2022 23:14:51 -0700
In-Reply-To: <20220408055732.GO3293@kadam>
References: <cover.1649378587.git.remckee0@gmail.com>
	 <36059ec66a2f3d58a8e339aa4f262772eabd3ef0.1649378587.git.remckee0@gmail.com>
	 <alpine.DEB.2.22.394.2204080614400.2199@hadrien>
	 <20220408055732.GO3293@kadam>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 9A66F2001A
X-Spam-Status: No, score=-4.79
X-Stat-Signature: u4og487og7ehspsp5guqhsgjtw76i9ch
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+cZfbi4qHorwDzKAdQesA7qUgqDtKrODY=
X-HE-Tag: 1649398492-439562

On Fri, 2022-04-08 at 08:57 +0300, Dan Carpenter wrote:
> On Fri, Apr 08, 2022 at 06:15:14AM +0200, Julia Lawall wrote:
> > On Thu, 7 Apr 2022, Rebecca Mckeever wrote:
> > 
> > > Replace ternary statement with an if statement followed by an assignment
> > > to increase readability and make error handling more obvious.
> > > Found with minmax coccinelle script.
[]
> > > diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
[]
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

A comment would be useful as it's not obvious it's an 'error' path.
One has to read all 3 get_key functions to determine that.


