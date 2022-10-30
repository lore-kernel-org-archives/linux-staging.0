Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006946AA8
	for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 14:28:46 +0000 (UTC)
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 07927A04BD;
	Sun, 30 Oct 2022 14:28:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf15.hostedemail.com (Postfix) with ESMTPA id 22ADE18;
	Sun, 30 Oct 2022 14:28:24 +0000 (UTC)
Message-ID: <b96575df57afd5f598b124c540063b698af10706.camel@perches.com>
Subject: Re: [PATCH 2/2] staging: r8188eu: remove get_da
From: Joe Perches <joe@perches.com>
To: Martin Kaiser <martin@kaiser.cx>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter
 <phil@philpotter.co.uk>, Michael Straube <straube.linux@gmail.com>, Pavel
 Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Sun, 30 Oct 2022 07:28:41 -0700
In-Reply-To: <20221029171011.1572091-3-martin@kaiser.cx>
References: <20221029171011.1572091-1-martin@kaiser.cx>
	 <20221029171011.1572091-3-martin@kaiser.cx>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: uxh9eifab6njfoysu3ntwaouysfb6fcw
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 22ADE18
X-Spam-Status: No, score=1.40
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19tf9x7p6jWCbqsmvZ3+oLcIrpPI3DRclo=
X-HE-Tag: 1667140104-145811

On Sat, 2022-10-29 at 19:10 +0200, Martin Kaiser wrote:
> Replace the last get_da call with ieee80211_get_DA and remove the get_da
> function.
[]
> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c b/drivers/stag=
ing/r8188eu/hal/rtl8188e_rxdesc.c
[]
> @@ -125,7 +126,7 @@ void update_recvframe_phyinfo_88e(struct recv_frame *=
precvframe, struct phy_stat
>  		 get_bssid(&padapter->mlmepriv), ETH_ALEN));
> =20
>  	pkt_info.bPacketToSelf =3D pkt_info.bPacketMatchBSSID &&
> -				 (!memcmp(get_da(wlanhdr),
> +				 (!memcmp(ieee80211_get_DA(hdr),
>  				  myid(&padapter->eeprompriv), ETH_ALEN));

trivia:

As both of the addresses returned are minimum __aligned(2),
these memcmp uses could be ether_addr_equal

Look for ETH_ALEN

$ git grep ETH_ALEN drivers/staging/r8188eu/

Perhaps see if the memcpy/memcmp uses with ETH_ALEN could be
converted to ether_addr_copy/ether_addr_equal or any of the
other is_<foo>_ether_addr calls.

