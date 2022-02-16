Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CDA23CB
	for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 10:01:22 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-125-zknZPiwIOKCgjs6-SThh8g-1; Wed, 16 Feb 2022 10:01:20 +0000
X-MC-Unique: zknZPiwIOKCgjs6-SThh8g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Wed, 16 Feb 2022 10:01:18 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Wed, 16 Feb 2022 10:01:18 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Phillip Potter' <phil@philpotter.co.uk>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>
CC: "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
	"Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>,
	"straube.linux@gmail.com" <straube.linux@gmail.com>, "martin@kaiser.cx"
	<martin@kaiser.cx>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "paskripkin@gmail.com" <paskripkin@gmail.com>
Subject: RE: [PATCH v2 15/15] staging: r8188eu: correct long line warnings
 near prior DBG_88E calls
Thread-Topic: [PATCH v2 15/15] staging: r8188eu: correct long line warnings
 near prior DBG_88E calls
Thread-Index: AQHYItG4AG5zz49180KoVbkPst1S56yV8RBA
Date: Wed, 16 Feb 2022 10:01:18 +0000
Message-ID: <84f4a761263444c2940165dc403afb33@AcuMS.aculab.com>
References: <20220216010709.791-1-phil@philpotter.co.uk>
 <20220216010709.791-16-phil@philpotter.co.uk>
In-Reply-To: <20220216010709.791-16-phil@philpotter.co.uk>
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

From: Phillip Potter
> Sent: 16 February 2022 01:07
>=20
> Where it is possible (without out-of-patch-series-scope large scale
> refactoring), correct code to remove checkpatch warnings about lines
> that are too long, also correcting operator spacing where appropriate
> for these lines as well. These warnings occur mostly due to so many
> DBG_88E removals and parentheses tweaks etc. being adjacent to such
> long lines, which are therefore included in the resultant diff.
...

Somewhere my copy of this seems to have got its tabs deleted.
I blame outlook :-)

> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/=
r8188eu/core/rtw_br_ext.c
> index ddc3a2c8aaca..d68611ef22f8 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -382,7 +382,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_b=
uff *skb, int method)
>  if (protocol =3D=3D ETH_P_IP) {
>  struct iphdr *iph =3D (struct iphdr *)(skb->data + ETH_HLEN);
>=20
> -if (((unsigned char *)(iph) + (iph->ihl<<2)) >=3D (skb->data + ETH_HLEN =
+ skb->len))
> +if (((unsigned char *)(iph) + (iph->ihl << 2)) >=3D (skb->data + ETH_HLE=
N + skb->len))

You can delete at least three sets of () from that line.

>  return -1;
>=20
>  switch (method) {
> @@ -451,7 +451,11 @@ int nat25_db_handle(struct adapter *priv, struct sk_=
buff *skb, int method)
>  pOldTag =3D (struct pppoe_tag *)__nat25_find_pppoe_tag(ph, ntohs(PTT_REL=
AY_SID));
>  if (pOldTag) { /*  if SID existed, copy old value and delete it */
>  old_tag_len =3D ntohs(pOldTag->tag_len);
> -if (old_tag_len+TAG_HDR_LEN+MAGIC_CODE_LEN+RTL_RELAY_TAG_LEN > sizeof(ta=
g_buf))
> +if (old_tag_len +
> +    TAG_HDR_LEN +
> +    MAGIC_CODE_LEN +
> +    RTL_RELAY_TAG_LEN >
> +    sizeof(tag_buf))
>  return -1;

That change really doesn't help readability at all.
There isn't much point shortening it that much like that, especially
since the here is a line that is nearly as long just above.

The real fix is to reduce the number of levels of indentation
to something sane.
I suspect that use of continue, break and return will help.

The other line length changes have much the same problem
but not as sever.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

