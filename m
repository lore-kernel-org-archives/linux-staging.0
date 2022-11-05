Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7E52591;
	Sat,  5 Nov 2022 15:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667660429; bh=SnaBD66+CDHSlpPtuF40RHI1mG87+sDwbq0pZrPokVI=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=SaM3qw62sNKSPLVw3W8/5Mo6O0x8ak/rEIg+H1t/AOZyhGH/WMY6jOrPYAjCjKRCa
	 2PPhTee+IZzSthyj9UQ2dEPFftCaP/ROIMzhHAhYPmbzrM+k7tzRuSuD1pKg0LY9qy
	 cmiosiGGTgw+JNvXwyps57p/83YSJhVGKuFsR0B8=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Sat,  5 Nov 2022 16:00:29 +0100 (CET)
X-EA-Auth: dqXraEsnrkDTnyc+sL0q+zBlgL4eFjGhqqaFty33MJVnZelEYPwmFbVVYEeqin6Y/jkgf9lQARR1KDVbywxfvoN0e1IkOeGp
Date: Sat, 5 Nov 2022 20:30:23 +0530
From: Deepak R Varma <drv@mailo.com>
To: Joe Perches <joe@perches.com>
Cc: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumarpraveen@linux.microsoft.com,
	saurabh.truth@gmail.com
Subject: Re: [PATCH 4/4] staging: r8188eu: use htons macro instead of
 __constant_htons
Message-ID: <Y2Z6h4CvyujWBkZJ@qemulion>
References: <cover.1666011479.git.drv@mailo.com>
 <595559852924cc1b58778659d2dbca8e263ee9d8.1666011479.git.drv@mailo.com>
 <49002a284dd29b8f784b52cb1527e687183ca175.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49002a284dd29b8f784b52cb1527e687183ca175.camel@perches.com>

On Tue, Oct 18, 2022 at 11:08:06PM -0700, Joe Perches wrote:
> On Mon, 2022-10-17 at 18:54 +0530, Deepak R Varma wrote:
> > Macro "htons" is more efficiant and clearer. It should be used for
> > constants instead of the __contast_htons macro. Resolves following
>
> typo: __constant_htons
>
> > checkpatch script complaint:
> > 	WARNING: __constant_htons should be htons
> []
> > diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> []
> > @@ -612,14 +612,14 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
> >  	if (!priv->ethBrExtInfo.dhcp_bcst_disable) {
> >  		__be16 protocol = *((__be16 *)(skb->data + 2 * ETH_ALEN));
> >
> > -		if (protocol == __constant_htons(ETH_P_IP)) { /*  IP */
> > +		if (protocol == htons(ETH_P_IP)) { /*  IP */
> >  			struct iphdr *iph = (struct iphdr *)(skb->data + ETH_HLEN);
> >
> >  			if (iph->protocol == IPPROTO_UDP) { /*  UDP */
> >  				struct udphdr *udph = (struct udphdr *)((size_t)iph + (iph->ihl << 2));
> >
> > -				if ((udph->source == __constant_htons(CLIENT_PORT)) &&
> > -				    (udph->dest == __constant_htons(SERVER_PORT))) { /*  DHCP request */
> > +				if ((udph->source == htons(CLIENT_PORT)) &&
> > +				    (udph->dest == htons(SERVER_PORT))) { /*  DHCP request */
>
> OK, this bit seems fine
>
> >  					struct dhcpMessage *dhcph =
> >  						(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
>
> IMO: this existing code however is ugly.
>      Casting a pointer to a size_t isn't great.

Hello Joe,
Other thank looking ugly, is there any impact / risk associated with such
casting? I tried to look for the reasons myself but did not find anything
relevant or to the point.

Thank you,
./drv

>
> Perhaps:
>
> 				struct dhcpMessage *dhcp;
>
> 				dhcp = (void *)udhp + sizeof(struct udphdr);
>
> in a separate patch.
>
> > 					u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
>
> And dhcph->cookie already is a __be32 so the cast is pointless.
>
> drivers/staging/r8188eu/core/rtw_br_ext.c-598-  __be32 cookie;
>


