Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE557C
	for <linux-staging@lists.linux.dev>; Wed, 30 Mar 2022 19:44:46 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-255-sTVwhZujNvyjZOKRNVF1Hw-1; Wed, 30 Mar 2022 20:44:44 +0100
X-MC-Unique: sTVwhZujNvyjZOKRNVF1Hw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Wed, 30 Mar 2022 20:44:41 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Wed, 30 Mar 2022 20:44:41 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Charlie Sands' <sandsch@northvilleschools.net>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>,
	"phil@philpotter.co.uk" <phil@philpotter.co.uk>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Subject: RE: [PATCH V2] staging: r8188eu: Fix sparse endianness warnings
Thread-Topic: [PATCH V2] staging: r8188eu: Fix sparse endianness warnings
Thread-Index: AQHYRGdq3t0D07ysn0eWtIbomAsTtKzYUyUw
Date: Wed, 30 Mar 2022 19:44:41 +0000
Message-ID: <4c7f9a23c9f64662bfef2b4452c3cca4@AcuMS.aculab.com>
References: <YkSnBW70kruOyN9h@sckzor-linux.localdomain>
In-Reply-To: <YkSnBW70kruOyN9h@sckzor-linux.localdomain>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Charlie Sands
> Sent: 30 March 2022 19:53
>=20
> This patch fixes sparse warnings about the endianness of different
> pieces of data in the driver.
>=20
> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for
> RTL8188eu driver")
> Signed-off-by: Charlie Sands <sandsch@northvilleschools.net>
> ---
> V2: Added the "fixes" line to the commit at the request of Dan Carpenter.
>=20
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/=
r8188eu/core/rtw_br_ext.c
> index d68611ef22f8..ed41c4e30262 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -70,7 +70,7 @@ static int __nat25_add_pppoe_tag(struct sk_buff *skb, s=
truct pppoe_tag *tag)
>  =09struct pppoe_hdr *ph =3D (struct pppoe_hdr *)(skb->data + ETH_HLEN);
>  =09int data_len;
>=20
> -=09data_len =3D tag->tag_len + TAG_HDR_LEN;
> +=09data_len =3D be16_to_cpu(tag->tag_len) + TAG_HDR_LEN;
>  =09if (skb_tailroom(skb) < data_len)
>  =09=09return -1;
>=20
> @@ -432,7 +432,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_b=
uff *skb, int method)
>  =09=09/*                Handle PPPoE frame                 */
>  =09=09/*---------------------------------------------------*/
>  =09=09struct pppoe_hdr *ph =3D (struct pppoe_hdr *)(skb->data + ETH_HLEN=
);
> -=09=09unsigned short *pMagic;
> +=09=09__be16 *pMagic;
>=20
>  =09=09switch (method) {
>  =09=09case NAT25_CHECK:
> @@ -471,7 +471,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_b=
uff *skb, int method)
>  =09=09=09=09=09=09tag->tag_len =3D
> htons(MAGIC_CODE_LEN+RTL_RELAY_TAG_LEN+old_tag_len);
>=20
>  =09=09=09=09=09=09/*  insert the magic_code+client mac in relay tag */
> -=09=09=09=09=09=09pMagic =3D (unsigned short *)tag->tag_data;
> +=09=09=09=09=09=09pMagic =3D (__be16 *)tag->tag_data;
>  =09=09=09=09=09=09*pMagic =3D htons(MAGIC_CODE);
                                              ^ cpu_to_be32()
>  =09=09=09=09=09=09memcpy(tag->tag_data+MAGIC_CODE_LEN, skb->data+ETH_ALE=
N,
> ETH_ALEN);
>=20
> @@ -557,9 +557,11 @@ int nat25_db_handle(struct adapter *priv, struct sk_=
buff *skb, int method)
>  =09=09=09=09=09=09struct icmp6hdr  *hdr =3D (struct icmp6hdr *)(skb->dat=
a + ETH_HLEN +
> sizeof(*iph));
>  =09=09=09=09=09=09hdr->icmp6_cksum =3D 0;
>  =09=09=09=09=09=09hdr->icmp6_cksum =3D csum_ipv6_magic(&iph->saddr, &iph=
->daddr,
> -=09=09=09=09=09=09=09=09=09=09iph->payload_len,
> +=09=09=09=09=09=09=09=09=09=09be16_to_cpu(iph->payload_len),
>  =09=09=09=09=09=09=09=09=09=09IPPROTO_ICMPV6,
> -=09=09=09=09=09=09=09=09=09=09csum_partial((__u8 *)hdr, iph-
> >payload_len, 0));
> +=09=09=09=09=09=09=09=09=09=09csum_partial((__u8 *)hdr,
> +=09=09=09=09=09=09=09=09=09=09be16_to_cpu(iph->payload_len),
> +=09=09=09=09=09=09=09=09=09=090));

That line continuation is horrid.
netdev probably wants the continuation under the (.
But it might be best to assign the result of csum_partial()
to a variable.

=09David

>  =09=09=09=09=09}
>  =09=09=09=09}
>  =09=09=09}
> --
> 2.35.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

