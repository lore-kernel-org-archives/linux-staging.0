Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111D129CA
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 17:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667754582; bh=Ld/Z16g7SIkkL1FuhUxiyS6/Ac1WX31pQ6hpg87mRYs=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=YGgoBwQl+x0DQzZJTg3CdGqDeP959qF0N92Rwae2iuXZ2bVMBKV0R++f4aXTQUVZo
	 obTb7lx6LuNxWgI4exU1XJTcGTHAG1rAaDZDz0mSMUZZkrBoGi28pgnYtpi2eG+VCH
	 CHOGGP2OzgEN4Zo+spXOihJDx61XmS/HVGLwopyM=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Sun,  6 Nov 2022 18:09:42 +0100 (CET)
X-EA-Auth: f0nvYiJw7c9bc6Q1tpvtSx9cFvZUG+UprOPKaN5pVi/ekrch3L6XtGyMy13HMutgeFHvR1Kk/KHaFP6aK2X01ScK4GRtximP
Date: Sun, 6 Nov 2022 22:39:25 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: simplify complex pointer casting
Message-ID: <Y2fqRTWZ/MTsrM+N@qemulion>
References: <Y2dvmdGxQfmK4O6F@qemulion>
 <Y2fkOjPM0aEfJQOl@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2fkOjPM0aEfJQOl@kroah.com>

On Sun, Nov 06, 2022 at 05:43:38PM +0100, Greg Kroah-Hartman wrote:
> On Sun, Nov 06, 2022 at 01:56:01PM +0530, Deepak R Varma wrote:
> > Pointers to structures udphdr and dhcpMessage are derived by casting
> > adjacent pointers with size_t. Such typecast of pointer using size_t
> > is not preferred. The code looks complex and delicate. Simplify such
> > casting by utilizing generic "void *" casting.
> > While at this change, remove the unnecessary __be32 casting for member
> > variable "cookie".
>
> Wait, why is that unecessary?

Hello Greg,
cookie is already defined to be a __be32 type as part of the dhcpMesssade
structure declared in the same file.

 15 struct dhcpMessage {
 14         u_int8_t op;
  1         u_int8_t file[128];
597         __be32 cookie;
  1         u_int8_t options[308]; /* 312 - cookie */
  2 };
  3

>
> And why is that part of this change, that should be a separate one, so
> that it can be reverted when it's found to be buggy :)

Sounds good. I will submit that as a separate patch.
>
> >
> > Suggested-by: Joe Perches <joe@perches.com>
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  drivers/staging/r8188eu/core/rtw_br_ext.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> > index a23f7df373ed..e9b0906d0d74 100644
> > --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> > +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> > @@ -610,13 +610,15 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
> >  			struct iphdr *iph = (struct iphdr *)(skb->data + ETH_HLEN);
> >
> >  			if (iph->protocol == IPPROTO_UDP) { /*  UDP */
> > -				struct udphdr *udph = (struct udphdr *)((size_t)iph + (iph->ihl << 2));
> > +				struct udphdr *udph = (void *)iph + (iph->ihl << 2);
> >
> >  				if ((udph->source == htons(CLIENT_PORT)) &&
> >  				    (udph->dest == htons(SERVER_PORT))) { /*  DHCP request */
> > -					struct dhcpMessage *dhcph =
> > -						(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
> > -					u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
> > +					u32 cookie;
> > +					struct dhcpMessage *dhcph;
>
> Why reorder these variables?

No specific reason. Since next instruction is associated with *dhcph, I thought
it will simpler to follow. I will revise and resend.

>
> > +
> > +					dhcph = (void *)udph + sizeof(struct udphdr);
> > +					cookie = be32_to_cpu(dhcph->cookie);
>
> The cookie change should be separate please.

Sounds good. Will split the patch into a patch set and resubmit.
>
> thanks,
>
> greg k-h
>


