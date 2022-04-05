Received: from KOR01-PS2-obe.outbound.protection.outlook.com (mail-eopbgr1280098.outbound.protection.outlook.com [40.107.128.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A91015A8
	for <linux-staging@lists.linux.dev>; Tue,  5 Apr 2022 01:31:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmwkAwZj2PSuzN2x6Bsl0pjT7FY9gw4CD1fE7K+MGtDG7IiYxOETuMCqBkoCtFKzdwJE6O2/x8aGVeBscnhNKSUG7hhG9tcw5QUfGSPH0cgGYEovNZaDIt5nSpV5130euj1/Fs1HDjM7veZpjGukVEWyccnb4FU9VE1h5hhKH9ANFbcStaXCGEC1jXbE7kDYlYetbu20yKjFHQn/uavQczPE6PeENWTL7JtrEqNjqzs07aX99lyvOju0gjuKWnI1ZN1lOuLFzVwbw+tYDvP51DMEGevbMleRgJyJIpS6GpCAlhNQ8qR6ch0pw7o6CKvrrRRR2EYvi0TixkeuPzx0rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3sfDYCv6A2V5/7OHWcR+lcxfGzTKVGfmg/rBCS8IQs=;
 b=WFgXg4RcDv0Pmz7RpXvgC6vsDtYI0luP/OGMndV/OH01vX74cDItCVA5IPzgU/Dfb7mLd3seKRrfDrhPwvHbwCopXIsj98DJtKzG/94/UO6KiraGtQ6l9GvtueEQWXxwHRMj3/ih2RQsC2zeG+XIvHIBWPi/lMSALtJJOYBv/oYeiHNSTzrTbCCzxRn2dr9uiQFo7vl0VG1aw7em0bOWzR4eiLtXwW7Y6rF2Ucu/ZtRJvaSCxelLbClj8IEbFKxLvJrhON2LpH08AKO5cfPLbj62ZuXft5zbRo8Rv8XQNjRerjQ7m72NxeX7bKMwVQkPbvhGGmlJ2tVLAPAPJygE/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3sfDYCv6A2V5/7OHWcR+lcxfGzTKVGfmg/rBCS8IQs=;
 b=ArWQRfDiq7KnzsmUOEv8GGJp8C5bfzwt9ua2kECcMiGMcEszUmuquEzuRjCR8EiKuYkeFcUQsTB/BAiCfRV+ChJcuhwjh2JKCHNJSXv2IUldyuEv9fj2teJFByYs1dpVN/obLvM9nGC2Cuon2JRkOjGXOV5QjWk0h0N/73PAz9s=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PS2P216MB0451.KORP216.PROD.OUTLOOK.COM (2603:1096:300:28::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.31; Tue, 5 Apr 2022 01:31:29 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::194d:3409:b632:abb3]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::194d:3409:b632:abb3%7]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 01:31:29 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Palmer
	<daniel@0x0f.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Dafna
 Hirschfeld <dafna.hirschfeld@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "open list:STAGING SUBSYSTEM"
	<linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "kernel@collabora.com"
	<kernel@collabora.com>, "dafna3@gmail.com" <dafna3@gmail.com>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>,
	"kiril.bicevski@collabora.com" <kiril.bicevski@collabora.com>, lafley.kim
	<lafley.kim@chipsnmedia.com>, Scott Woo <scott.woo@chipsnmedia.com>,
	"olivier.crete@collabora.com" <olivier.crete@collabora.com>,
	"dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
	"rdunlap@infradead.org" <rdunlap@infradead.org>
Subject: RE: [PATCH v6 4/6] staging: media: wave5: Add TODO file
Thread-Topic: [PATCH v6 4/6] staging: media: wave5: Add TODO file
Thread-Index:
 AdhE2oqP+oIiPzQWQ0K4SA0PHTLaRQACbQWwAAOtSIAAAF5TAAAAVKQAAABKgQAAAROGgADjmdUQ
Date: Tue, 5 Apr 2022 01:31:29 +0000
Message-ID:
 <SL2P216MB1246EC8CFE37CE115B4B9655FBE49@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References:
 <SL2P216MB12463DE2E1E100E2498A5C33FBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <SL2P216MB1246D7900A0B9620F1E1A038FBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <YkWRN4ac0ivRn4aB@kroah.com>
 <CAFr9PXm3Mvr0guGoPDKmashMhFG6OQMvXHxwX-SD5ZHPi_sw4g@mail.gmail.com>
 <YkWV6HGkGHvgSwCj@kroah.com>
 <CAFr9PX=s0CRtcVw_5xk7F6MRZ+svFK_cUDRzdaOFxcPGe4tBmA@mail.gmail.com>
 <YkWfFUjvgGfvAg3r@kroah.com>
In-Reply-To: <YkWfFUjvgGfvAg3r@kroah.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56cd7a35-4e1e-4dc9-97b3-08da16a4026a
x-ms-traffictypediagnostic: PS2P216MB0451:EE_
x-microsoft-antispam-prvs:
 <PS2P216MB0451BA768D25E61EE8E3101FFBE49@PS2P216MB0451.KORP216.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Ci6ycNjrSLhAR3tiWURs3QHqlYSwkwrgc4BGc93QROXhwFOcJO8oHhZTMCFndDbBZG4mptum5IeQP8dm0f+HlLolUBabUbFeBiXkkxl46EH6X7GwhkwJInOLiWQJP4xH6znZA59aH4eb6+JnvYbeCRcNVDN9byt2zIGHecrqzHz50IPZsfxOtML3QCvpeGw5qNCvB7w4lr2OsyU3AtIXVPmWW5UfzZR0artnp4yAl8CTO14F1ffsaxjnn78od1116mUzWp3DHj+aysj/hOhNwnmXnFF222fwlbUukOsohpy5PyBZtTz7ljHQukd6zVQ8N2yX+8ikmK7OffJio0/v+cULr8o/QnqrUKfyeKuK2D4zA24gmlk2n/kD+JR8rQssE5rwyvQBVAVzW1ZKqrBA/Z4HiGns6PlFW8bODdtF/XR7fgnMdYLG9Nwb3tguX5F1A7MyNQMiQaSaY4uf/KcgVkHhtBj6sH2VeHZb0aH1mjDdyYEtRzfKg9myehjneMI0HJiZ7mHPuHksbKWv/tgPbG1gT5JV5A6qz6z1/5Btt03UNkeSL2Vf3rvbYGd1k/9HGFvV2UsALdt1Dn2l19f1vKym4jhTmxTxLgXwHSQvMQht3854acLODkRz8GYrQ6OtmmUz3LucSQFeXK/offkznhSEfQnUCKaowD9wlLQb6F6Pd4GrzJRcCGuZUc8UJULUTtq8ZOIXahMX0Vmx0ougERMXXexh/2UTpbElFMBT1E0pT8pxWq3lTHZ+OYX73hOK/kXILO7/oJqBuB0hoQH35m2QdPpPOgG8bqTwiFS3/r8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(39840400004)(396003)(366004)(346002)(376002)(136003)(2906002)(53546011)(966005)(55016003)(7696005)(6506007)(508600001)(9686003)(8936002)(44832011)(33656002)(5660300002)(52536014)(83380400001)(86362001)(110136005)(71200400001)(316002)(38070700005)(186003)(54906003)(38100700002)(122000001)(7416002)(26005)(64756008)(66446008)(4326008)(8676002)(66946007)(66476007)(66556008)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?A/O8kWwmDE6Z0OqvlK6uXMNJQq9TkvK5noobrub0fj8QfeMv1ctCOGdAG45s?=
 =?us-ascii?Q?gazjGGjOgfaae9kcwYuk8GKE5NT7ug6ykTY3be9fLH3CKszG444Juo8OzFcV?=
 =?us-ascii?Q?ZfvXOBKUu8VwHaW+8wkQ9lR2O4CnULrz0QEzwRbjO6ItoJLvcW2p6YuMwe3b?=
 =?us-ascii?Q?KzPb059mv66Ap+k2U3n8PM+r3SyhLBIF7BMsKUMyaedwGsMFpqstMxHaZ/pv?=
 =?us-ascii?Q?96nWuetiwzNFMFeAc+rCYpayNZu2phfo0+qcsXajPfR9jtXEZLqVUBhks0G/?=
 =?us-ascii?Q?9NTp/o/9vviOZLWItF4sDhfJMuiX4BY1P6iAeTRMWhTMf79DCCFOr0j4YiDR?=
 =?us-ascii?Q?PL12AlK+IP1Xs7mlAIFFTBBuV+CmQIy6k/W2LvgUQGlTAEDY57Tx+tyEgaBO?=
 =?us-ascii?Q?Gj9UTotWdblOXm0AxBKlEo8HUwgN0x04HsPFqt4eFv/k5QCL9dD/c4i4mbVr?=
 =?us-ascii?Q?tfutbP9hEPGlfG+vj/PdAqGL1nzILQlqmFRr25U2vPSbSF8W3s5RVSxLbrV1?=
 =?us-ascii?Q?q8iuO7H1QVGOE2toPyOIPP8MdSB6gI52B1cgb5KZ6KwYEx02ZshBto/OKA5F?=
 =?us-ascii?Q?KhaCCNVPl4lAMrleGZGmR2Us6a65ntLe2Tiien2MMEsEhzx75NpOUZeZDA52?=
 =?us-ascii?Q?D3DSEP5cDTXWfsV4pZEXnZR2sjxW3PJzXGVnpLqVd4tR44pG5jb0XsjOzBiZ?=
 =?us-ascii?Q?mzxerp+yDGbhSEFrzUgxSoeAUYzyh07A8axTegtiPdrHEDZSZQSRqr3aat75?=
 =?us-ascii?Q?vfJX7TrGAZHN5VqLASRYbG06sslVedWbIVrHOeynPJZEAUnMK4STQ+XGj8h+?=
 =?us-ascii?Q?1M25zpdvuAqFh1m/X+6mi0CkqQqE/WsYZNkgT5hGT+f7jxgv29LB3ZS4YM91?=
 =?us-ascii?Q?0puRwZqJycTFhqBcInXuk6ywwAlsE5K2QsXTQaSjYIUHJrHpE2QnYBcasHlU?=
 =?us-ascii?Q?hArEogqqGKh/Dr8Daqrz7EF4z6pYW87K7ogCwfXWqNqhWPuGFXVxPvtM+usf?=
 =?us-ascii?Q?67y/q2abdThJLUD/kJ2PCkjCrCu2pAIb7YkEfPKRJybbaeQQXvSr7/opPGl2?=
 =?us-ascii?Q?cdrQVrt3YsEYv1xkJFnywQDLm498kdOHPN21TGoE6gue03fwtPUJ2Zmwzd2T?=
 =?us-ascii?Q?UEsD4EE1j8+JtY/5JB/StH4F8ngruGTWvVe1xZUmW+qEP0zF0kdNvREI+faM?=
 =?us-ascii?Q?c56W+m3VEfgea6n1E27AJkFc1161vVdp9/EgAVD0BRUA7yISFUH+shw9WXod?=
 =?us-ascii?Q?LJD6e2PSTIWh7H5xsqKL6G+N7LMQ+D7Jkjv+/aASErTZ7nPU/AQYYCZJ1sBP?=
 =?us-ascii?Q?LAj/a/PAwIpHMATTClsp89zPXbL56J9tqsGa+paFUyZpz432iuTSaEUA3Wd0?=
 =?us-ascii?Q?jXqRF5L4iM7xZTM5FX8l2CsfSCodjl9/XpCPxJUv/MI70cFo/xaywm80M5/v?=
 =?us-ascii?Q?DIe3T9m57yhuIWwGoiyFq7Fr9Bc4m0xcst2PD5mlm2YATZiOXZpu6SGKnwb/?=
 =?us-ascii?Q?4le63Bk/Sd34dL/iiwAAtK+Xg8h5ZTtUceYPb0iYqMjuYOq36JgmW+gH4cyh?=
 =?us-ascii?Q?iLImgTPR0dridGzW/y78iQ7uyfswIn0Yv/rCI9EgdinxRLwAaNV7jFk8WpDQ?=
 =?us-ascii?Q?ehZ60NF2W6jlYXofc4ARh48mwkEDqInQJbBDMMVvFBl7IT9LPKnIPizfIofp?=
 =?us-ascii?Q?Hbe9XtSAvAfmCd4J9vuCFv8CETLDgYnRwXfRG1V1Bs1zgUjayn2OjnCjYThW?=
 =?us-ascii?Q?EJem5XJMdqj/A603iw9Bm6FGxGcy7+8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 56cd7a35-4e1e-4dc9-97b3-08da16a4026a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2022 01:31:29.6396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rq7IoKpc55i9B+CL7sUKMMJjOYYHntLXeMShHGANBKRVsNxB2ssyVSdu9J5NabAo2glLW74a8JhR1kQhUg1c0Wrpn1T9X+JE2DhfxBTWz1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB0451

Sorry for insufficient information in TODO file.

The j721s2 board which i've tested v4l2 driver is already existed.
- https://lwn.net/Articles/877594/
- I will update the TODO file to include the test result of J721S2 EVM boar=
d.

And, I'm going to work with this driver to get it out of staging.

> -----Original Message-----
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Thursday, March 31, 2022 9:31 PM
> To: Daniel Palmer <daniel@0x0f.com>
> Cc: Nas Chung <nas.chung@chipsnmedia.com>; linux-media@vger.kernel.org;
> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; open list:STAGING SUBSYSTEM <linux-
> staging@lists.linux.dev>; open list <linux-kernel@vger.kernel.org>;
> laurent.pinchart@ideasonboard.com; hverkuil@xs4all.nl; kernel@collabora.c=
om;
> dafna3@gmail.com; bob.beckett@collabora.com; kiril.bicevski@collabora.com=
;
> lafley.kim <lafley.kim@chipsnmedia.com>; Scott Woo
> <scott.woo@chipsnmedia.com>; olivier.crete@collabora.com;
> dan.carpenter@oracle.com; rdunlap@infradead.org
> Subject: Re: [PATCH v6 4/6] staging: media: wave5: Add TODO file
>=20
> On Thu, Mar 31, 2022 at 09:00:28PM +0900, Daniel Palmer wrote:
> > Hi Greg,
> >
> > On Thu, 31 Mar 2022 at 20:52, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > > According to the text in this driver, it will not work on these
> > > hardware as it is broken.  Unless that text is incorrect?
> >
> > I think that's for risc-v.
> > The other chip this is in is ARM Cortex A7. The crusty vendor linux
> > BSP for this chip manages to play videos using it so it does work in a
> > real piece of hardware.
>=20
> So are you going to be able to work with this driver to get it out of
> staging if you have the hardware?  Otherwise it makes no sense to stick i=
t
> here for a year without anyone being able to work on it.
>=20
> thanks,
>=20
> greg k-h
