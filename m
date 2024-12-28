Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02olkn2022.outbound.protection.outlook.com [40.92.15.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9871E9474
	for <linux-staging@lists.linux.dev>; Sat, 28 Dec 2024 16:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.15.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735405068; cv=fail; b=OFC+yor63Vv+H77qNhJUxhU91TwTlOJrimiyRSKEb3iuMPGs0emXNIwsLVaBEOfddIuhVfNn1VaMgqxN/w8LTYpAo1+gasqMNIAE1P/OK+2IThF0da4No1mIjhZTmr8oCDSrVaYq/B8/F5XqfVptQDeOQlt/Fxkc5PB0KIUnpDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735405068; c=relaxed/simple;
	bh=mGcekdHye5rXcGRf0RIRmI6hS9jInn+C76SVOy9E9yc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rpfu5KAoCiX6vOZKdkdD18GEFbyTjwB15VntqBNupof4golSZxrk5ZDr+m4Ug+yn8HUAgK3C1oRZxNgYAWX14dqzgPmoq1jabMD7ZzSljIRpbt9MfpxamilRa2ywdCaVJrOq9tKw/mu9oaFMRnO0hAol1UnlN7WeZ+eNDpVunYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=oRzwgY3a; arc=fail smtp.client-ip=40.92.15.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="oRzwgY3a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T34V0r/gWXhYdNZNdCoiVdH7dgbQEiEe3MvmV0VEz9mUivZ7ax6CCDhSTafzCWVtJpDXynEQVEwr3MxrUwqcnr/KJZuAhCFFhXhaFbvkdlxHPL9bCC6Qdz7A3OWwYIrda2KDLQMc/eNtawixkt/lje7T9ZvUMug3E7oNQB8gdtGwItRZ+vBCsYpMQHdvLTYRMKNbRVBGJAWYR1efuj442haDUbeJIxxVvjYpQkr6FwCkLzZPspetAdM4A8mWj6kG6ihSGAneQ0n5TjgzCBN4g+cHd9d/G12YJrv5lIqAB5v9WUNcKcjLcy4S/9Sfb5zS2Kvrc9fZriOpFHwh0wISJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSUNUz0fg+Cov8kh6I68eBQTNB5MU3lyFmS43dUabNs=;
 b=vSPFODbY21fcqMy7bMkHF0QUPcltap8ajiZZfg4z6YR7w+a2NMJq9HUsUWZ4vczCFVyxvoOekal7YrxmSXvk1aHXgzUrQImlfSvIAjE19ACwzVH9qq0kHxZhCthjTXts81rXyQXGfoqZztDvW1S27JK6SDkRvLQlHQdinhihNmEky5KTfZ0/HKZxAloGQ5O34uHl3GJ8/zOGibIRYaC4UHccs4QP9O85cuTzcGJnvzXNyYb/SZlIA3FD25LUFeXArxyOXAjDJruSlE87l2Fkajx5tm0o/iTCqyTiaVVa4MEv9S7fjum2jFGmdNuGfXi7veb7wDxG2xBtFxDPiURYCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSUNUz0fg+Cov8kh6I68eBQTNB5MU3lyFmS43dUabNs=;
 b=oRzwgY3aKef5wPSCSniVsnAv357xGjxMysn+H5qfZlspAhGVXLIBij65FNf5DP2eIx/Shgiq+pJkc/ufeE04AYnWpPeqd11JQuDGOx+RG120Z5Y6r1XI4ujbha2SDZHCUt65v+RUbipe8D6m9YPi/eqHnEzUr8WMUS1MajePuPq3ydNU20Dg9XzFQWabgg2P6cnlQGUKMHinkSekeSgfx9OhhJAB+s1G2duXLsP5Kky46EZFK3pWOQ6Zlo/qlZdYI4Z/8DVXqYBLaRNBb46TXGQ3RsWqawZ3pd93+BoTncsQYKTsDmVFgn1Bi/V5nMcljWgX6dtsGod7iPkgI8CQfQ==
Received: from SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:a03:570::8)
 by CY5P223MB0516.NAMP223.PROD.OUTLOOK.COM (2603:10b6:930:24::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.17; Sat, 28 Dec
 2024 16:57:44 +0000
Received: from SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM
 ([fe80::b5cd:c37a:bd3e:e3fd]) by SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM
 ([fe80::b5cd:c37a:bd3e:e3fd%4]) with mapi id 15.20.8293.000; Sat, 28 Dec 2024
 16:57:44 +0000
From: Steven Davis <goldside000@outlook.com>
To: "johan@kernel.org" <johan@kernel.org>, "elder@kernel.org"
	<elder@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "greybus-dev@lists.linaro.dev" <greybus-dev@lists.linaro.dev>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Steven Davis
	<goldside000@outlook.com>
Subject: [PATCH] staging: greybus: Log driver_register() failure
Thread-Topic: [PATCH] staging: greybus: Log driver_register() failure
Thread-Index: AQHbWUmdXOVjeNYgGkqFSuYEhhIBGA==
Date: Sat, 28 Dec 2024 16:57:44 +0000
Message-ID: <20241228165720.16552-1-goldside000@outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2P223MB1026:EE_|CY5P223MB0516:EE_
x-ms-office365-filtering-correlation-id: cfa79a10-d8a1-4248-5a49-08dd2760bf9d
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|19110799003|461199028|15080799006|38102599003|8062599003|102099032|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?DZ04eqR4S6voGpaoZgow1enucl/BFbx7RPguyasFVzbxr89g6CL1STWyZh?=
 =?iso-8859-1?Q?PuyY8Np+j8/A5C/lfFRhuCZ+pVDkXqVPDMnG31c4UkNTPI9g6NMfcfDfYG?=
 =?iso-8859-1?Q?YR/BxY5HbIO4Th2QuRgqaKOzJWAp2KbbGMT2SioTX7+JQX1c/DanKsi27Q?=
 =?iso-8859-1?Q?FIKm8hdHsTbG7lz50GkyKOT04/QTi+7qM18y5YgcPaPhv8XrLKet/Pgzye?=
 =?iso-8859-1?Q?eHHKBCYEOrs2YO7YFZRbCAqVQMiOt249+VVsECb387D068FekYGGOU03Wt?=
 =?iso-8859-1?Q?qlCpZJmuqqGu14H2+jahjesmlqBvc87/oqLx+74jl6OrUcXSBp24fEwZA2?=
 =?iso-8859-1?Q?vkuae8i8oBpmKxLPbkYVNb+B4dn/8axBbYqbRJKINtTo56UAnxROwk7R8z?=
 =?iso-8859-1?Q?4X0ocj/t2NdQ24QaeylRfs/KOp8M9MZDkUfmiI4binPIZtqbTSakXEQo+r?=
 =?iso-8859-1?Q?SDsAckOk02LnPZ5OA8X/Ul005wBMoYJxtz29cQbwZwsCE4xDD7WYch0c3o?=
 =?iso-8859-1?Q?P+JtHormWIRmX+T7D89TOuWmFygHsnv/+e1coCxpA7EnjuGcpkkC/WYk0F?=
 =?iso-8859-1?Q?BEYIkZj2DLPNbuKIw+WSzpgjLOTWwlUMMfAb9lyhENpkvn1Bg5Vz/DnVEM?=
 =?iso-8859-1?Q?COKngn7zrc4pEKNYrlpzVgKSkix9rM5Z7/31n1WdJNowZ1SEi5aXXaP9Vx?=
 =?iso-8859-1?Q?EKm8+sokYYc62V+oXMDZ7TSzDOSef9AsahrVgGoegUo8XRbWw0lomcarqW?=
 =?iso-8859-1?Q?5hRXIFVRIYx3zFdOuDLxTTXyQEN9YhkjwqYbuNoHppBbtnTXIWQBVbSXOt?=
 =?iso-8859-1?Q?5ze9pGW0jAkz49Br+Thjbn6KJWayqffmDXpSxkrXPgbVzujcNB96aGx22g?=
 =?iso-8859-1?Q?kwPLDPFJW3Zn2ZGks/wJoPfFhMXweyafyIfE1NuzCXGvkk/98pT9mEt1vU?=
 =?iso-8859-1?Q?hnjn7O8hc4h0l4+Sx7NZ1u7IoUjuIcgEls4fqX9fAZ9hYs9oUcjSk+umwu?=
 =?iso-8859-1?Q?A6Ly94fBrheeL4VeglMMoiOjJ0St1JCfPPblzTO9FKsOdfzR/Uenr7cBFJ?=
 =?iso-8859-1?Q?sYc6F6DeKM3paeKsfLEzq6fwmkYhjpszooNV7lmianqCt60aVazrgQvVGH?=
 =?iso-8859-1?Q?iJixoXgp6YBJCz4HovAe1vFfNjfTU=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gK0mmUnwltM+5DDXjJPJzP0moONrGdWHvinmu7Z2zdI6ZIBs0W9/XSGfrr?=
 =?iso-8859-1?Q?s/j4AKbIT0sXl82vDHoYjt1HnV3NKdinFDlj9OYX97T6XPvN781eZR0DQK?=
 =?iso-8859-1?Q?ajycwlCw/gX+HUMtN+fKuggthQS69tKeekKheeeV9auNGkRZ3TTOMn/AcN?=
 =?iso-8859-1?Q?KXQryQlUYSERGrX8y7TRw7M12Q7wJdXklgYI0eXFYiE1eT5OKnia5Cbz/I?=
 =?iso-8859-1?Q?rH2tKx8FUHcDhpjRhf8W1KHDpEOix1GnCntIVvwNAA0pXK0V/rEtIleslM?=
 =?iso-8859-1?Q?WPEKjJpJFNjKpmCg9N4K/jbvkNTBNPZVq4l9iuZ21ItiziPh3gHycr0+DI?=
 =?iso-8859-1?Q?n6pRZRysXX0qqZxvVCQLeQwVyjXeSw9zc+Cf7Bp6V6hOpbbaZOxnvGbTqD?=
 =?iso-8859-1?Q?E0mTtFO01c2GXuzX7Q4H/Llq7I0o6QYy49UXk6qrLYvEQhzZmEzELnA56M?=
 =?iso-8859-1?Q?viQn/qohk8UgBrQte9l2J7gc02q4T3OKlAAzz2CkJ342Gg5XYqHSEubg2p?=
 =?iso-8859-1?Q?fe0d6DpKEBFOFL6SKxpoKQnBw3j5yjtTCZ+PyXLFpvWVYG7seB4PyqAdtk?=
 =?iso-8859-1?Q?HAStD00LtCS9mbKKYR4kxHB0Z6SWuhrFzmG2KhR3xekcwBqtJF7INzRgD0?=
 =?iso-8859-1?Q?BV/QKz7NWlju8UDTBijFgiOL4J9A+9IU8Tu8u8+Vz1c/GxtLviM4YQdzmf?=
 =?iso-8859-1?Q?S5RLcW1V2BWz0SqAso36+zbBo4RIBTHouY1xMe7ieFDMKADskLsTf7zjCu?=
 =?iso-8859-1?Q?a2CmFxAg4CABgQgBga9QiIbho1FlbDpbLM1jkxo/rCAv2bjb4NMr4hG4th?=
 =?iso-8859-1?Q?0ElmTI0hMJizrEEOAr3KaHKw4iLvAv90kE9fpEgLI88LhqFo0GypiiR2dR?=
 =?iso-8859-1?Q?kQUG6pwWhPXYpRDM6uDHSRpowc7VahH3Oh7+SrVR1wKX1FeD1yICXK5pc7?=
 =?iso-8859-1?Q?mSDXIGAcIr+9zLFjxTCl0uCKQkHoIkgBSHZtDYleBsIcF/w4QpO7leTqhJ?=
 =?iso-8859-1?Q?bOf9Y/xOPxiXf07v3qAl3kY3QBPYjEYEhCmAwKvL9N7zhQRn15ubydMq0P?=
 =?iso-8859-1?Q?AWM+9Lfh8YuZh/TmyrF8Y4MNBn7HP+rstiVgxUUtlXuzkDGZ8NC2Ut7N+n?=
 =?iso-8859-1?Q?XK5S6kOMhcWJtOMklHb/uGGYksyXj0mluAT0ISy4mllUgZSka6llPJW2fl?=
 =?iso-8859-1?Q?8MlhaNaiS5D8+aLoEFqmvj7r5XUy3uA7xHVRxvdPhqJ/wxCazxcAlwFHPL?=
 =?iso-8859-1?Q?pIR15J0DoFJwXQHMg/kbAbyG6eUBqetbHTgI90kaU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa79a10-d8a1-4248-5a49-08dd2760bf9d
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2024 16:57:44.1274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5P223MB0516

Currently, if driver_register() fails, it just returns retval
and fails silently. This behavior may make the error more difficult
to debug, as the error is not logged.

Adding pr_err() here will log the error descriptively, along with
driver name and the value that retval returned. That way, the error
is not silent and the user can see what happened.

Signed-off-by: Steven Davis <goldside000@outlook.com>
---
 drivers/staging/greybus/gbphy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbph=
y.c
index 6adcad286..c6d1030b7 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -204,8 +204,10 @@ int gb_gbphy_register_driver(struct gbphy_driver *driv=
er,
 	driver->driver.mod_name =3D mod_name;
=20
 	retval =3D driver_register(&driver->driver);
-	if (retval)
+	if (retval) {
+		pr_err("failed to register driver %s: %d\n", driver->name, retval);
 		return retval;
+	}
=20
 	pr_info("registered new driver %s\n", driver->name);
 	return 0;
--=20
2.39.5

