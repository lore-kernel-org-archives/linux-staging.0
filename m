Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DE02206A5
	for <linux-staging@lists.linux.dev>; Fri,  6 Dec 2024 18:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.58.85.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733508178; cv=none; b=VU+pLz5zhEbgWVG9nPHqK67TESE5+U6KQKRpLryMGErd44kk4r/V+pdBWi6Ldk826C2lqdOdcxY5a9pRATX8KH1JVI+UbeUVz2+14UQOckUrkThTOwObhq4wJZ010sOqqRyogHEcTl5Wwi5hvn4yhGSkHL1WmwH6jf0zjudqsbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733508178; c=relaxed/simple;
	bh=frdiTPh5k8CmyYnrdjopta0oWe7otGMlgOrxo3XFMrs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=QvFM1HmBWWcpLgZmXmQg0aARumxF7d8RNw9exoi9ukiOvz7zMhOi96S4zs5PxIDPE5+5pAPwwDP3CqFuOmE2/qqknImhlb8DcpN1lxNoM/+zAiUgXx17WmJpQUWkUbTxOWQzriR+oQzM3XWQEGpkILqytcpZnuoVNxoCEo8NFNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass smtp.mailfrom=aculab.com; arc=none smtp.client-ip=185.58.85.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aculab.com
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-172-DfBVzvTdMzWT01Ic5J-YWQ-1; Fri, 06 Dec 2024 18:02:53 +0000
X-MC-Unique: DfBVzvTdMzWT01Ic5J-YWQ-1
X-Mimecast-MFC-AGG-ID: DfBVzvTdMzWT01Ic5J-YWQ
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 6 Dec
 2024 18:02:07 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 6 Dec 2024 18:02:07 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Dave Penkler' <dpenkler@gmail.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>
Subject: RE: [PATCH v5] staging: gpib: Fix i386 build issue
Thread-Topic: [PATCH v5] staging: gpib: Fix i386 build issue
Thread-Index: AQHbRnNeLNtjyv8mxUi5PXXR1xkkjbLZhFyw
Date: Fri, 6 Dec 2024 18:02:07 +0000
Message-ID: <ba3bf2c6c59f4019a3d502cb0b703d7b@AcuMS.aculab.com>
References: <20241204162128.25617-1-dpenkler@gmail.com>
In-Reply-To: <20241204162128.25617-1-dpenkler@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M6N_SC7GIc9oha2VwTcfGlfD27Q0IvHxOlwM3sGuR8s_1733508173
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Dave Penkler
> Sent: 04 December 2024 16:21
>=20
> These drivers cast resource_type_t to void * causing the build to fail.
>=20
> With CONFIG_X86_PAE enabled the resource_size_t type is a 64bit unsigned
> int which cannot be cast to a 32 bit pointer.
>=20
> Disable these drivers if X68_PAE is enabled

You missed the obvious typo :-)

There is also a proposal to just remove PAE support.
Mostly because it is likely to have bit-rotted and isn't really
needed now 64bit code is common.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

