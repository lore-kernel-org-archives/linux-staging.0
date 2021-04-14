Received: from smtprelay.hostedemail.com (smtprelay0058.hostedemail.com [216.40.44.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1736D6D14
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 08:32:37 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave02.hostedemail.com (Postfix) with ESMTP id D57A6180D716C
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 08:32:36 +0000 (UTC)
Received: from omf05.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay02.hostedemail.com (Postfix) with ESMTP id EA65B4F9CB8B;
	Wed, 14 Apr 2021 08:32:29 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf05.hostedemail.com (Postfix) with ESMTPA id 00C88B2798;
	Wed, 14 Apr 2021 08:32:28 +0000 (UTC)
Message-ID: <d03e8b4ce25fe9e3b5e5597d83802eea83e7caa2.camel@perches.com>
Subject: Re: [PATCH 12/19] staging: rtl8723bs: remove unnecessary bracks on
 DBG_871X removal sites
From: Joe Perches <joe@perches.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Fabio Aiuto
	 <fabioaiuto83@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Wed, 14 Apr 2021 01:32:27 -0700
In-Reply-To: <20210413145245.GG6021@kadam>
References: <cover.1617802415.git.fabioaiuto83@gmail.com>
	 <35f5edf0f39b717b3de3ad7861cbaa5f4ba60576.1617802415.git.fabioaiuto83@gmail.com>
	 <20210413145245.GG6021@kadam>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 00C88B2798
X-Spam-Status: No, score=0.10
X-Stat-Signature: xd3di5p38fnfpm3u6iu38r85oak485wx
X-Rspamd-Server: rspamout04
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19OYrLfAlGdjVpbOKSYlKEKzknU7FRL29Q=
X-HE-Tag: 1618389148-702812

On Tue, 2021-04-13 at 17:52 +0300, Dan Carpenter wrote:
> On Wed, Apr 07, 2021 at 03:49:36PM +0200, Fabio Aiuto wrote:
> > @@ -2586,11 +2583,9 @@ static int rtw_dbg_port(struct net_device *dev,
> >  
> > 
> >  								plist = get_next(plist);
> >  
> > 
> > -								if (extra_arg == psta->aid) {
> > -									for (j = 0; j < 16; j++) {
> > +								if (extra_arg == psta->aid)
> > +									for (j = 0; j < 16; j++)
> >  										preorder_ctrl = &psta->recvreorder_ctrl[j];
> > -									}
> > -								}
> 
> I think Greg already applied this so no stress (don't bother fixing),
> but you removed a bit too much on this one.  Multi-line indents normally
> get curly braces for readability.  In other words:
> 
> 				if (extra_arg == psta->aid) {
> 					for (j = 0; j < 16; j++)
> 						preorder_ctrl = &psta->recvreorder_ctrl[j];
> 				}
> 
> regards,
> dan carpenter
> 


