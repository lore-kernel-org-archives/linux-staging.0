Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC96C3208
	for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 18:49:32 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1opDN8-0004py-E0; Sun, 30 Oct 2022 19:49:26 +0100
Date: Sun, 30 Oct 2022 19:49:26 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Joe Perches <joe@perches.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: r8188eu: remove get_da
Message-ID: <20221030184926.t3kbwv63te3g6ezo@viti.kaiser.cx>
References: <20221029171011.1572091-1-martin@kaiser.cx>
 <20221029171011.1572091-3-martin@kaiser.cx>
 <b96575df57afd5f598b124c540063b698af10706.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b96575df57afd5f598b124c540063b698af10706.camel@perches.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Joe Perches (joe@perches.com):

> On Sat, 2022-10-29 at 19:10 +0200, Martin Kaiser wrote:
> > Replace the last get_da call with ieee80211_get_DA and remove the get_da
> > function.
> []
> > diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
> []
> > @@ -125,7 +126,7 @@ void update_recvframe_phyinfo_88e(struct recv_frame *precvframe, struct phy_stat
> >  		 get_bssid(&padapter->mlmepriv), ETH_ALEN));

> >  	pkt_info.bPacketToSelf = pkt_info.bPacketMatchBSSID &&
> > -				 (!memcmp(get_da(wlanhdr),
> > +				 (!memcmp(ieee80211_get_DA(hdr),
> >  				  myid(&padapter->eeprompriv), ETH_ALEN));

> trivia:

> As both of the addresses returned are minimum __aligned(2),
> these memcmp uses could be ether_addr_equal

Thanks, I'll fix this in a separate patch and keep this pattern in mind
for other parts of the code.

> Look for ETH_ALEN

> $ git grep ETH_ALEN drivers/staging/r8188eu/

> Perhaps see if the memcpy/memcmp uses with ETH_ALEN could be
> converted to ether_addr_copy/ether_addr_equal or any of the
> other is_<foo>_ether_addr calls.

