Received: from mail11.tencent.com (mail11.tencent.com [14.18.178.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95635632
	for <linux-staging@lists.linux.dev>; Sun, 18 Sep 2022 02:51:07 +0000 (UTC)
Received: from EX-SZ018.tencent.com (unknown [10.28.6.39])
	by mail11.tencent.com (Postfix) with ESMTP id B6F51FC02C;
	Sun, 18 Sep 2022 10:43:20 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tencent.com;
	s=s202002; t=1663469000;
	bh=K6pID4dZZJcp8nhT47KB6CtpQMvP9l4TCxdXzK18jvc=;
	h=From:To:CC:Subject:Date;
	b=SQMn/SqGa+L5IzWNtHcN+Bx5vRzbhz9tbDukK8Ct6CwX3PuIN2D2+lhmBADm5RYk1
	 mJj7ys5ZGEq30oKdgzO7F422hRXzzhTKcBbKfslcy+LXbJHCL0vv3AhnaGDaY9BrPT
	 3cKS14aN35Zc1tpt8L4ubKZ+VgMNBLzm6xJvsTqE=
Received: from EX-SZ045.tencent.com (10.28.6.96) by EX-SZ018.tencent.com
 (10.28.6.39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Sun, 18 Sep
 2022 10:43:20 +0800
Received: from EX-SZ049.tencent.com (10.28.6.102) by EX-SZ045.tencent.com
 (10.28.6.96) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Sun, 18 Sep
 2022 10:43:20 +0800
Received: from EX-SZ049.tencent.com ([fe80::e0be:89c3:ec1:bef7]) by
 EX-SZ049.tencent.com ([fe80::e0be:89c3:ec1:bef7%8]) with mapi id
 15.01.2242.008; Sun, 18 Sep 2022 10:43:20 +0800
From: =?utf-8?B?Zmx5aW5ncGVuZyjlva3mtakp?= <flyingpeng@tencent.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: [PATCH]  clocking-wizard: fix a schedule during spin lock
  acquisition
Thread-Topic: [PATCH]  clocking-wizard: fix a schedule during spin lock
  acquisition
Thread-Index: AQHYywhpT9OYQLfgcE+29L8IzzqIbw==
Date: Sun, 18 Sep 2022 02:43:20 +0000
Message-ID: <B806E272-4615-4027-8CBE-82A651511964@tencent.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [9.19.161.123]
Content-Type: text/plain; charset="utf-8"
Content-ID: <027C9E6A5E47C04B8E1065A7A119CB0E@tencent.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

d2hlbiB0aGUgaW50ZXJydXB0IGlzIGRpc2FibGVkIGFuZCB0aGUgc3BpbiBsb2NrIGlzIGFjcXVp
cmVkLA0KY2FsbGluZyByZWFkX3BvbGxfdGltZW91dCB3aWxsIHRyaWdnZXIgdGhlIHNjaGVkdWxl
LCB3aGljaCBzaG91bGQNCmJlIHJlcGxhY2VkIGJ5IHJlYWRfcG9sbF90aW1lb3V0X2F0b21pYy4N
Cg0KU2lnbmVkLW9mZi1ieTogUGVuZyBIYW8gPGZseWluZ3BlbmdAdGVuY2VudC5jb20+DQotLS0N
CiBkcml2ZXJzL3N0YWdpbmcvY2xvY2tpbmctd2l6YXJkL2Nsay14bG54LWNsb2NrLXdpemFyZC5j
IHwgNCArKy0tDQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9jbG9ja2luZy13aXphcmQvY2xrLXhs
bngtY2xvY2std2l6YXJkLmMgYi9kcml2ZXJzL3N0YWdpbmcvY2xvY2tpbmctd2l6YXJkL2Nsay14
bG54LWNsb2NrLXdpemFyZC5jDQppbmRleCAzOTM2NzcxMmVmNTQuLjk4NmFmMDNiMzFjOSAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvc3RhZ2luZy9jbG9ja2luZy13aXphcmQvY2xrLXhsbngtY2xvY2st
d2l6YXJkLmMNCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9jbG9ja2luZy13aXphcmQvY2xrLXhsbngt
Y2xvY2std2l6YXJkLmMNCkBAIC0xNTcsNyArMTU3LDcgQEAgc3RhdGljIGludCBjbGtfd3pyZF9k
eW5hbWljX3JlY29uZmlnKHN0cnVjdCBjbGtfaHcgKmh3LCB1bnNpZ25lZCBsb25nIHJhdGUsDQog
ICAgICAgIHdyaXRlbCgweDAwLCBkaXZfYWRkciArIFdaUkRfRFJfRElWX1RPX1BIQVNFX09GRlNF
VCk7DQoNCiAgICAgICAgLyogQ2hlY2sgc3RhdHVzIHJlZ2lzdGVyICovDQotICAgICAgIGVyciA9
IHJlYWRsX3BvbGxfdGltZW91dChkaXZpZGVyLT5iYXNlICsgV1pSRF9EUl9TVEFUVVNfUkVHX09G
RlNFVCwNCisgICAgICAgZXJyID0gcmVhZGxfcG9sbF90aW1lb3V0X2F0b21pYyhkaXZpZGVyLT5i
YXNlICsgV1pSRF9EUl9TVEFUVVNfUkVHX09GRlNFVCwNCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHZhbHVlLCB2YWx1ZSAmIFdaUkRfRFJfTE9DS19CSVRfTUFTSywNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFdaUkRfVVNFQ19QT0xMLCBXWlJEX1RJTUVPVVRfUE9M
TCk7DQogICAgICAgIGlmIChlcnIpDQpAQCAtMTY4LDcgKzE2OCw3IEBAIHN0YXRpYyBpbnQgY2xr
X3d6cmRfZHluYW1pY19yZWNvbmZpZyhzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQgbG9uZyBy
YXRlLA0KICAgICAgICAgICAgICAgZGl2aWRlci0+YmFzZSArIFdaUkRfRFJfSU5JVF9SRUdfT0ZG
U0VUKTsNCg0KICAgICAgICAvKiBDaGVjayBzdGF0dXMgcmVnaXN0ZXIgKi8NCi0gICAgICAgZXJy
ID0gcmVhZGxfcG9sbF90aW1lb3V0KGRpdmlkZXItPmJhc2UgKyBXWlJEX0RSX1NUQVRVU19SRUdf
T0ZGU0VULA0KKyAgICAgICBlcnIgPSByZWFkbF9wb2xsX3RpbWVvdXRfYXRvbWljKGRpdmlkZXIt
PmJhc2UgKyBXWlJEX0RSX1NUQVRVU19SRUdfT0ZGU0VULA0KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdmFsdWUsIHZhbHVlICYgV1pSRF9EUl9MT0NLX0JJVF9NQVNLLA0KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgV1pSRF9VU0VDX1BPTEwsIFdaUkRfVElNRU9VVF9Q
T0xMKTsNCiBlcnJfcmVjb25maWc6DQotLQ0KMi4yNy4wDQoNCg==
