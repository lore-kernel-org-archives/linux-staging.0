Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773B93FC2
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 08:14:13 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-110-mwGT8myTNcm83mBe4IfVKA-1; Fri, 27 Aug 2021 09:14:10 +0100
X-MC-Unique: mwGT8myTNcm83mBe4IfVKA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Fri, 27 Aug 2021 09:14:09 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Fri, 27 Aug 2021 09:14:08 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Dan Carpenter' <dan.carpenter@oracle.com>
CC: 'Pavel Skripkin' <paskripkin@gmail.com>, "Larry.Finger@lwfinger.net"
	<Larry.Finger@lwfinger.net>, "phil@philpotter.co.uk" <phil@philpotter.co.uk>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"straube.linux@gmail.com" <straube.linux@gmail.com>,
	"fmdefrancesco@gmail.com" <fmdefrancesco@gmail.com>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 3/6] staging: r8188eu: add error handling of rtw_read8
Thread-Topic: [PATCH v3 3/6] staging: r8188eu: add error handling of rtw_read8
Thread-Index: AQHXmLmGl/+E/B1vJUGWAidfG7snbKuFdLBA///xloCAAC/eAIAAAKqAgAFtSnA=
Date: Fri, 27 Aug 2021 08:14:08 +0000
Message-ID: <dc133b63e1f54f45a19e67d75a6fcb40@AcuMS.aculab.com>
References: <cover.1629789580.git.paskripkin@gmail.com>
 <c59d5d850bf9aab208704182c83086609289cb9c.1629789580.git.paskripkin@gmail.com>
 <f5c20e0f1b934e04ad11a3627d71f5db@AcuMS.aculab.com>
 <20210826112745.5e1421ed@gmail.com>
 <a251767ca181405b93b5ea55a26c3ff0@AcuMS.aculab.com>
 <20210826112127.GZ1931@kadam>
In-Reply-To: <20210826112127.GZ1931@kadam>
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

From: Dan Carpenter
> Sent: 26 August 2021 12:21
...
> > > > ...
> > > > > +=09=09len +=3D snprintf(page + len, count - len,
> > > > > "rtw_read8(0x%x)=3D0x%x\n",
> > > > > +=09=09=09=09proc_get_read_addr, (u8) tmp);
> > > >
> > > > That is broken.
> > > >
> > >
> > > Don't get it, sorry. Previous code did exactly the same thing, but
> > > didn't check if read() was successful.
> >
> > Look up the return value of snprintf().
> >
>=20
> It's hard to understand what you are saying.  I think you are confusing
> libc snprintf with the kernel snprintf?  In libc the snprintf function
> can return negatives but in the kernel it cannot.  This is not going
> to change.  Any code which checks for negative snprintf returns in the
> kernel is wrong and should be fixed.
>=20
> Anyway, the code works fine.  snprintf here is going to return a number
> between 18-32 range.  It's not going to overflow the PAGE_SIZE buffer.

IIRC it is also in a loop ...

Maybe, but the idiom is just broken.
Largely the result of snprintf() is never the value you are looking
for and should be ignored.

Userspace fprintf() is even worse.
If you care about the write failing you need to call fflush()
and then ferror() (typically before fclose()).

Fortunately I've never seen a 'must check' attribute on it.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

