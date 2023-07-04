Received: from wxsgout04.xfusion.com (wxsgout04.xfusion.com [36.139.87.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FD0468C;
	Tue,  4 Jul 2023 12:36:13 +0000 (UTC)
Received: from wuxshcsitd00602.xfusion.com (unknown [10.32.132.250])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4QwMF80sf5z9xk0G;
	Tue,  4 Jul 2023 20:15:24 +0800 (CST)
Received: from wuxshcsitd00600.xfusion.com (10.32.133.213) by
 wuxshcsitd00602.xfusion.com (10.32.132.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 4 Jul 2023 20:15:57 +0800
Received: from wuxshcsitd00600.xfusion.com ([fe80::6811:d152:496c:4db9]) by
 wuxshcsitd00600.xfusion.com ([fe80::6811:d152:496c:4db9%6]) with mapi id
 15.01.2507.023; Tue, 4 Jul 2023 20:15:57 +0800
From: wangjinchao <wangjinchao@xfusion.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"outreachy@lists.linux.dev" <outreachy@lists.linux.dev>
CC: xulei <stone.xulei@xfusion.com>
Subject: [PATCH] staging: rtl8192u: Fix assignment in if condition
Thread-Topic: [PATCH] staging: rtl8192u: Fix assignment in if condition
Thread-Index: AQHZrmkySezXLmADBkO4wJdvqf1PeQ==
Date: Tue, 4 Jul 2023 12:15:57 +0000
Message-ID: <ZKP/01ECsgmdBFf2@fedora>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: wuxshcsitd00600.xfusion.com (15.01.2507.023)
x-originating-ip: [10.81.18.204]
Content-Type: text/plain; charset="gb2312"
Content-ID: <CCA9E587FFE6854982C83B7CB9B21800@xfusion.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

SSBqdXN0IHBhcnRpY2lwYXRlZCBpbiBPdXRyZWFjaHkgb2YgS2VybmVsTmV3YmllcyBhbmQgZml4
ZWQgb25lIA0KJ0VSUk9SOiBkbyBub3QgdXNlIGFzc2lnbm1lbnQgaW4gaWYgY29uZGl0aW9uJyBp
c3N1ZSByZXBvcnRlZCBieSANCmNoZWNrcGF0Y2gucGwgb24gZHJpdmVycy9zdGFnaW5nL3J0bDgx
OTJ1L2llZWU4MDIxMS9pZWVlODAyMTFfcnguYy4NCg0KU2lnbmVkLW9mZi1ieTogV2FuZyBKaW5j
aGFvIDx3YW5namluY2hhb0B4ZnVzaW9uLmNvbT4NCi0tLQ0KIGRyaXZlcnMvc3RhZ2luZy9ydGw4
MTkydS9pZWVlODAyMTEvaWVlZTgwMjExX3J4LmMgfCAzICsrLQ0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Rh
Z2luZy9ydGw4MTkydS9pZWVlODAyMTEvaWVlZTgwMjExX3J4LmMgYi9kcml2ZXJzL3N0YWdpbmcv
cnRsODE5MnUvaWVlZTgwMjExL2llZWU4MDIxMV9yeC5jDQppbmRleCBjYTA5MzY3MDA1ZTEuLjUy
ZmY5ZTYyZWMwOCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ydGw4MTkydS9pZWVlODAy
MTEvaWVlZTgwMjExX3J4LmMNCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ydGw4MTkydS9pZWVlODAy
MTEvaWVlZTgwMjExX3J4LmMNCkBAIC0xMTIxLDggKzExMjEsOSBAQCBpbnQgaWVlZTgwMjExX3J4
KHN0cnVjdCBpZWVlODAyMTFfZGV2aWNlICppZWVlLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiLA0KIA0K
IAkvKiBza2I6IGhkciArIChwb3NzaWJseSBmcmFnbWVudGVkLCBwb3NzaWJseSBlbmNyeXB0ZWQp
IHBheWxvYWQgKi8NCiANCisJa2V5aWR4ID0gaWVlZTgwMjExX3J4X2ZyYW1lX2RlY3J5cHQoaWVl
ZSwgc2tiLCBjcnlwdCk7DQogCWlmIChpZWVlLT5ob3N0X2RlY3J5cHQgJiYgKGZjICYgSUVFRTgw
MjExX0ZDVExfV0VQKSAmJg0KLQkgICAgKGtleWlkeCA9IGllZWU4MDIxMV9yeF9mcmFtZV9kZWNy
eXB0KGllZWUsIHNrYiwgY3J5cHQpKSA8IDApIHsNCisJICAgIGtleWlkeCA8IDApIHsNCiAJCW5l
dGRldl9kYmcoaWVlZS0+ZGV2LCAiZGVjcnlwdCBmcmFtZSBlcnJvclxuIik7DQogCQlnb3RvIHJ4
X2Ryb3BwZWQ7DQogCX0NCi0tIA0KMi40MC4wDQoNCg==
