Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B4E7E;
	Wed, 19 Oct 2022 06:47:46 +0000 (UTC)
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id B05CFA054E;
	Wed, 19 Oct 2022 06:08:11 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf20.hostedemail.com (Postfix) with ESMTPA id E84DB2002D;
	Wed, 19 Oct 2022 06:07:54 +0000 (UTC)
Message-ID: <49002a284dd29b8f784b52cb1527e687183ca175.camel@perches.com>
Subject: Re: [PATCH 4/4] staging: r8188eu: use htons macro instead of
 __constant_htons
From: Joe Perches <joe@perches.com>
To: Deepak R Varma <drv@mailo.com>, outreachy@lists.linux.dev, 
	Larry.Finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Date: Tue, 18 Oct 2022 23:08:06 -0700
In-Reply-To: <595559852924cc1b58778659d2dbca8e263ee9d8.1666011479.git.drv@mailo.com>
References: <cover.1666011479.git.drv@mailo.com>
	 <595559852924cc1b58778659d2dbca8e263ee9d8.1666011479.git.drv@mailo.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Spam-Status: No, score=-0.35
X-Stat-Signature: i8uc1r887uq5cmy39ehk47npqnomphsr
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: E84DB2002D
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/kSBruECZdtofFGtexfl+pATe3DPBkCf0=
X-HE-Tag: 1666159674-263680

On Mon, 2022-10-17 at 18:54 +0530, Deepak R Varma wrote:
> Macro "htons" is more efficiant and clearer. It should be used for
> constants instead of the __contast_htons macro. Resolves following

typo: __constant_htons

> checkpatch script complaint:
> 	WARNING: __constant_htons should be htons
[]
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/=
r8188eu/core/rtw_br_ext.c
[]
> @@ -612,14 +612,14 @@ void dhcp_flag_bcast(struct adapter *priv, struct s=
k_buff *skb)
>  	if (!priv->ethBrExtInfo.dhcp_bcst_disable) {
>  		__be16 protocol =3D *((__be16 *)(skb->data + 2 * ETH_ALEN));
>=20
> -		if (protocol =3D=3D __constant_htons(ETH_P_IP)) { /*  IP */
> +		if (protocol =3D=3D htons(ETH_P_IP)) { /*  IP */
>  			struct iphdr *iph =3D (struct iphdr *)(skb->data + ETH_HLEN);
>=20
>  			if (iph->protocol =3D=3D IPPROTO_UDP) { /*  UDP */
>  				struct udphdr *udph =3D (struct udphdr *)((size_t)iph + (iph->ihl <<=
 2));
>=20
> -				if ((udph->source =3D=3D __constant_htons(CLIENT_PORT)) &&
> -				    (udph->dest =3D=3D __constant_htons(SERVER_PORT))) { /*  DHCP re=
quest */
> +				if ((udph->source =3D=3D htons(CLIENT_PORT)) &&
> +				    (udph->dest =3D=3D htons(SERVER_PORT))) { /*  DHCP request */

OK, this bit seems fine

>  					struct dhcpMessage *dhcph =3D
>  						(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));

IMO: this existing code however is ugly.
     Casting a pointer to a size_t isn't great.

Perhaps:

				struct dhcpMessage *dhcp;

				dhcp =3D (void *)udhp + sizeof(struct udphdr);

in a separate patch.

> 					u32 cookie =3D be32_to_cpu((__be32)dhcph->cookie);

And dhcph->cookie already is a __be32 so the cast is pointless.

drivers/staging/r8188eu/core/rtw_br_ext.c-598-  __be32 cookie;

