Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C551470
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 21:48:17 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-171-pfXQx4cjNgmTKMZ5T25hhw-1; Thu, 03 Jun 2021 22:48:14 +0100
X-MC-Unique: pfXQx4cjNgmTKMZ5T25hhw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Thu, 3 Jun 2021 22:48:13 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Thu, 3 Jun 2021 22:48:13 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Alex Elder' <elder@linaro.org>, 'Manikishan Ghantasala'
	<manikishanghantasala@gmail.com>, Alex Elder <elder@ieee.org>
CC: Alex Elder <elder@kernel.org>, "greybus-dev@lists.linaro.org"
	<greybus-dev@lists.linaro.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>, Johan Hovold <johan@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [greybus-dev] [PATCH] staging: greybus: fixed the coding style,
 labels should not be indented.
Thread-Topic: [greybus-dev] [PATCH] staging: greybus: fixed the coding style,
 labels should not be indented.
Thread-Index: AQHXV7uPElUZ9thDckyuMtjnIAGFwKsCzNHA///2ooCAABDyEA==
Date: Thu, 3 Jun 2021 21:48:13 +0000
Message-ID: <e23879ae78404be2b707b550b3029e43@AcuMS.aculab.com>
References: <20210602133659.46158-1-manikishanghantasala@gmail.com>
 <9a3878fd-3b59-76f5-ddc7-625c66f9fee8@ieee.org>
 <CAKzJ-FNW8EPX2oQd1qr5NagnvjtWwvSeuAh8DNLetj11+BJ6RA@mail.gmail.com>
 <792dd57c0ef8454497e5ae4c4534dea2@AcuMS.aculab.com>
 <e1c36fb4-ab72-0cce-f6fe-3f04125dae28@linaro.org>
In-Reply-To: <e1c36fb4-ab72-0cce-f6fe-3f04125dae28@linaro.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
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
Content-Transfer-Encoding: base64

RnJvbTogQWxleCBFbGRlcg0KPiBTZW50OiAwMyBKdW5lIDIwMjEgMjI6NDYNCj4gDQo+IE9uIDYv
My8yMSA0OjIyIFBNLCBEYXZpZCBMYWlnaHQgd3JvdGU6DQouLi4NCj4gPj4+PiAtLS0gYS9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ncGlvLmMNCj4gPj4+PiArKysgYi9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9ncGlvLmMNCj4gPj4+PiBAQCAtMjAsOSArMjAsOSBAQA0KPiA+Pj4+ICAgIHN0cnVj
dCBnYl9ncGlvX2xpbmUgew0KPiA+Pj4+ICAgICAgICAvKiBUaGUgZm9sbG93aW5nIGhhcyB0byBi
ZSBhbiBhcnJheSBvZiBsaW5lX21heCBlbnRyaWVzICovDQo+ID4+Pj4gICAgICAgIC8qIC0tPiBt
YWtlIHRoZW0ganVzdCBhIGZsYWdzIGZpZWxkICovDQo+ID4+Pj4gLSAgICAgdTggICAgICAgICAg
ICAgICAgICAgICAgYWN0aXZlOiAgICAxLA0KPiA+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGRpcmVjdGlvbjogMSwgICAvKiAwID0gb3V0cHV0LCAxID0gaW5wdXQgKi8NCj4gPj4+
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2YWx1ZTogICAgIDE7ICAgLyogMCA9IGxv
dywgMSA9IGhpZ2ggKi8NCj4gPj4+PiArICAgICB1OCAgICAgICAgICAgICAgICAgICAgICBhY3Rp
dmU6MSwNCj4gPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkaXJlY3Rpb246MSwg
ICAgLyogMCA9IG91dHB1dCwgMSA9IGlucHV0ICovDQo+ID4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdmFsdWU6MTsgICAgICAgIC8qIDAgPSBsb3csIDEgPSBoaWdoICovDQo+ID4N
Cj4gPiBXaHkgYXJlIHlvdSBldmVuIHVzaW5nIGJpdGZpZWxkcyBhdCBhbGw/DQo+ID4gSWYgeW91
IGNhcmVkIGFib3V0IHRoZSBzdHJ1Y3R1cmUgc2l6ZSB5b3UnZCBub3QgaGF2ZSBhIGJ5dGUtc2l6
ZSBwYWQgaGVyZS4NCj4gDQo+IEFwcGFyZW50bHkgSSBjb21taXR0ZWQgdGhpcywgYW5kIGl0IHdh
cyBwYXJ0IG9mIHRoZSB2ZXJ5IGZpcnN0DQo+IEdyZXlidXMgZHJpdmVycy4uLg0KPiANCj4gVGhl
c2Ugd291bGQgYmUgYmV0dGVyIGRlZmluZWQgYXMgQm9vbGVhbnM7IHRoZXJlIGFyZSBvdGhlcnMg
aW4NCj4gdGhlIHNhbWUgc3RydWN0dXJlIGFmdGVyIGFsbC4gIFRoYXQgd291bGQgaGF2ZSBhdm9p
ZGVkIHRoZQ0KPiBjaGVja3BhdGNoIHByb2JsZW0gaW4gdGhlIGZpcnN0IHBsYWNlLg0KDQpVc2lu
ZyAndTgnIGNhbiBiZSBzZW5zaWJsZS4NCkJvb2xlYW4gd2lsbCBiZSAzMmJpdC4NCg0KCURhdmlk
DQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBG
YXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2
IChXYWxlcykNCg==

