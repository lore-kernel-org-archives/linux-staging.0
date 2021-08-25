Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2174372
	for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 09:23:32 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-121-slYRAeD_NeiPOZBTIJBABQ-1; Wed, 25 Aug 2021 10:23:30 +0100
X-MC-Unique: slYRAeD_NeiPOZBTIJBABQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Wed, 25 Aug 2021 10:23:28 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Wed, 25 Aug 2021 10:23:28 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Aakash Hemadri' <aakashhemadri123@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 3/5] staging: r8188eu: incorrect type in
 csum_ipv6_magic
Thread-Topic: [PATCH v4 3/5] staging: r8188eu: incorrect type in
 csum_ipv6_magic
Thread-Index: AQHXmEBzodgQnjGhvkqCA8EvgQbhz6uD8/vA
Date: Wed, 25 Aug 2021 09:23:28 +0000
Message-ID: <f2ab21eab23c4863b1b5c004a75d834d@AcuMS.aculab.com>
References: <cover.1629563318.git.aakashhemadri123@gmail.com>
 <392082864befe91bb03d16ff7ca5e57ba2a8e549.1629563318.git.aakashhemadri123@gmail.com>
In-Reply-To: <392082864befe91bb03d16ff7ca5e57ba2a8e549.1629563318.git.aakashhemadri123@gmail.com>
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

From: Aakash Hemadri
> Sent: 23 August 2021 18:00
>=20
> Fix sparse warning:
> > rtw_br_ext.c:771:84:    got restricted __be16 [usertype] payload_len
> > rtw_br_ext.c:773:110: warning: incorrect type in argument 2
>     (different base types)
> > rtw_br_ext.c:773:110:    expected int len
> > rtw_br_ext.c:773:110:    got restricted __be16 [usertype] payload_len
>=20
> csum_ipv6_magic and csum_partial expect int len not __be16, use
> be16_to_cpu()

This is a behaviour change on LE systems.
Even if you are testing on BE the commit message should say
that it fixes the length passed to the checksum code and
was detected by sparse.

...
>  =09=09=09hdr->icmp6_cksum =3D csum_ipv6_magic(&iph->saddr, &iph->daddr,
> -=09=09=09=09=09=09iph->payload_len,
> +=09=09=09=09=09=09be16_to_cpu(iph->payload_len),
>  =09=09=09=09=09=09IPPROTO_ICMPV6,
> -=09=09=09=09=09=09csum_partial((__u8 *)hdr, iph->payload_len, 0));
> +=09=09=09=09=09=09csum_partial((__u8 *)hdr, be16_to_cpu(iph->payload_len=
), 0));

Oh - that code is indented far too many times.
I had to delete a load of tabs to stop my mail crapping it.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

