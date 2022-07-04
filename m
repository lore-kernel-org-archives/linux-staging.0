Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA3015A2
	for <linux-staging@lists.linux.dev>; Mon,  4 Jul 2022 02:45:55 +0000 (UTC)
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LbqsS3vNkz9ssg;
	Mon,  4 Jul 2022 10:45:00 +0800 (CST)
Received: from dggpeml100017.china.huawei.com (7.185.36.161) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 4 Jul 2022 10:45:46 +0800
Received: from dggpeml500019.china.huawei.com (7.185.36.137) by
 dggpeml100017.china.huawei.com (7.185.36.161) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 4 Jul 2022 10:45:45 +0800
Received: from dggpeml500019.china.huawei.com ([7.185.36.137]) by
 dggpeml500019.china.huawei.com ([7.185.36.137]) with mapi id 15.01.2375.024;
 Mon, 4 Jul 2022 10:45:45 +0800
From: huangzetao <huangzetao1@huawei.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>,
	"phil@philpotter.co.uk" <phil@philpotter.co.uk>, "paskripkin@gmail.com"
	<paskripkin@gmail.com>, "straube.linux@gmail.com" <straube.linux@gmail.com>,
	"martin@kaiser.cx" <martin@kaiser.cx>, "abdun.nihaal@gmail.com"
	<abdun.nihaal@gmail.com>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>, "inux-kernel@vger.kernel.org"
	<inux-kernel@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIC1uZXh0IHYyXSBzdGFnaW5nOiByODE4OGV1OiBVc2Ug?=
 =?gb2312?B?ZXRoX2Jyb2FkY2FzdF9hZGRyKCkgdG8gYXNzaWduIGJyb2FkY2FzdCBhZGRy?=
 =?gb2312?Q?ess?=
Thread-Topic: [PATCH -next v2] staging: r8188eu: Use eth_broadcast_addr() to
 assign broadcast address
Thread-Index: AQHYjS7WvowIbvZZvUO2T6gOAFRqya1ov1gAgATBQQA=
Date: Mon, 4 Jul 2022 02:45:45 +0000
Message-ID: <c4a1182373524b398889b3e1da078127@huawei.com>
References: <20220701094011.81163-1-huangzetao1@huawei.com>
 <Yr7DQJTPrSWTOa0c@kroah.com>
In-Reply-To: <Yr7DQJTPrSWTOa0c@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.174.176.91]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-CFilter-Loop: Reflected

UGxlYXNlIGRpc3JlZ2FyZCBpdC4NCg0KLS0tLS3Tyrz+1K28/i0tLS0tDQq3orz+yMs6IEdyZWcg
S0ggPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiANCreiy83KsbzkOiAyMDIyxOo31MIxyNUg
MTc6NTANCsrVvP7IyzogaHVhbmd6ZXRhbyA8aHVhbmd6ZXRhbzFAaHVhd2VpLmNvbT4NCrOty806
IExhcnJ5LkZpbmdlckBsd2Zpbmdlci5uZXQ7IHBoaWxAcGhpbHBvdHRlci5jby51azsgcGFza3Jp
cGtpbkBnbWFpbC5jb207IHN0cmF1YmUubGludXhAZ21haWwuY29tOyBtYXJ0aW5Aa2Fpc2VyLmN4
OyBhYmR1bi5uaWhhYWxAZ21haWwuY29tOyBsaW51eC1zdGFnaW5nQGxpc3RzLmxpbnV4LmRldjsg
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQrW98ziOiBSZTogW1BBVENIIC1uZXh0IHYyXSBz
dGFnaW5nOiByODE4OGV1OiBVc2UgZXRoX2Jyb2FkY2FzdF9hZGRyKCkgdG8gYXNzaWduIGJyb2Fk
Y2FzdCBhZGRyZXNzDQoNCk9uIEZyaSwgSnVsIDAxLCAyMDIyIGF0IDA5OjQwOjExQU0gKzAwMDAs
IEh1YW5nIFpldGFvIHdyb3RlOg0KPiBVc2luZyBldGhfYnJvYWRjYXN0X2FkZHIoKSB0byBhc3Np
Z24gYnJvYWRjYXN0IGFkZHJlc3MgaW5zdGVhZCBvZiBtZW1zZXQoKS4NCj4gDQo+IFJlcG9ydGVk
LWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4NCg0KUGxlYXNlIGZvbGxvdyB0aGUg
cnVsZXMgb3V0bGluZWQgaW4NCkRvY3VtZW50YXRpb24vcHJvY2Vzcy9yZXNlYXJjaGVyLWd1aWRl
bGluZXMucnN0IHdoZW4gc3VibWl0dGluZyBwYXRjaGVzIGZvdW5kIGJ5IGEgcmFuZG9tLCBwcml2
YXRlLCB1bmtub3duIHRvb2wuDQoNCnRoYW5rcywNCg0KZ3JlZyBrLWgNCg==
