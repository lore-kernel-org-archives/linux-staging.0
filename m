Received: from mail.meizu.com (edge05.meizu.com [157.122.146.251])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E7C7E
	for <linux-staging@lists.linux.dev>; Fri, 11 Mar 2022 08:50:52 +0000 (UTC)
Received: from IT-EXMB-1-123.meizu.com (172.16.1.123) by mz-mail12.meizu.com
 (172.16.1.108) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 11 Mar
 2022 16:50:52 +0800
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by
 IT-EXMB-1-123.meizu.com (172.16.1.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 11 Mar 2022 16:50:49 +0800
Received: from IT-EXMB-1-125.meizu.com ([fe80::7481:7d92:3801:4575]) by
 IT-EXMB-1-125.meizu.com ([fe80::7481:7d92:3801:4575%3]) with mapi id
 15.01.2308.014; Fri, 11 Mar 2022 16:50:49 +0800
From: =?gb2312?B?sNe6xs7E?= <baihaowen@meizu.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: "vireshk@kernel.org" <vireshk@kernel.org>, "johan@kernel.org"
	<johan@kernel.org>, "elder@kernel.org" <elder@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBzdGFnaW5nOiBncmV5YnVzOiBGaXggcG90ZW50aWFs?=
 =?gb2312?Q?_NULL_dereference?=
Thread-Topic: [PATCH] staging: greybus: Fix potential NULL dereference
Thread-Index: AQHYNSL4iVqrOrm/80ClDX0ZeDDii6y5VuSAgACIFEY=
Date: Fri, 11 Mar 2022 08:50:49 +0000
Message-ID: <0a6d02d1b6374cf0bddd0f4e7fbc475a@meizu.com>
References: <1646987730-7597-1-git-send-email-baihaowen@meizu.com>,<20220311084019.w45kfluiamgosivu@vireshk-i7>
In-Reply-To: <20220311084019.w45kfluiamgosivu@vireshk-i7>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.16.137.70]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

T2gsIG15IGNhcmVsZXNzIHRvIGNoZWNrIGNvZGUuIFRoYW5rIHlvdSBmb3IgeW91ciBraW5kbHkg
cmVtaW5kZXIuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+
yMs6IFZpcmVzaCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+DQq3osvNyrG85DogMjAy
MsTqM9TCMTHI1SAxNjo0MDoxOQ0KytW8/sjLOiCw17rGzsQNCrOty806IHZpcmVzaGtAa2VybmVs
Lm9yZzsgam9oYW5Aa2VybmVsLm9yZzsgZWxkZXJAa2VybmVsLm9yZzsgZ3JlZ2toQGxpbnV4Zm91
bmRhdGlvbi5vcmc7IGxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2OyBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnDQrW98ziOiBSZTogW1BBVENIXSBzdGFnaW5nOiBncmV5YnVzOiBGaXgg
cG90ZW50aWFsIE5VTEwgZGVyZWZlcmVuY2UNCg0KT24gMTEtMDMtMjIsIDE2OjM1LCBIYW93ZW4g
QmFpIHdyb3RlOg0KPiBGaXggZm9sbG93aW5nIGNvY2NpY2hlY2sgd2FybmluZzoNCj4gZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvYm9vdHJvbS5jOjMwMTozNS0zOTogRVJST1I6IGZ3IGlzIE5VTEwg
YnV0IGRlcmVmZXJlbmNlZC4NCj4NCj4gV2hlbiBnb3RvIHF1ZXVlX3dvcmsgYnV0IGRlcmVmZXJl
bmNlIFVuaW5pdGlhbGl6ZWQgZncgd2lsbCB0cmlnZ2VyIGEgTlVMTA0KPiBkZXJlZmVyZW5jZS4N
Cg0KUGxlYXNlIGhhdmUgYSBsb29rIGF0IGVhcmxpZXIgYXR0ZW1wdHMgbGlrZSB0aGlzOg0KDQpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAxNTA5OS54VnY0OFZ6Tml0QGxpbnV4LmxvY2Fs
Lw0KDQotLQ0KdmlyZXNoDQo=
