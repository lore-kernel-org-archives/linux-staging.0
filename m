Received: from out203-205-251-84.mail.qq.com (unknown [203.205.251.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F7A7C
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1648729067;
	bh=7dPkUFxQF7MLl0QeP2bU2b1g3DJxkteqxbd0DoLfUEU=;
	h=Date:From:To:Cc:Subject:References;
	b=XV7tEynkbpsZVmfrOWQv110UvkhGH1Orrox2vbVXVCRQVYbyscnQNMYe4FGtlHltk
	 tb3FixpuxkvzluMHdlpysNKYh7+4RZUwW2yzNodKrzliG+vCxDNv2OQDtGpgKUdYLA
	 Tu4iyciUWIZeyheL6k+gedRC+JW0PSFhUs70AlDc=
Received: from LAPTOP-4BSPBRI7 ([59.172.176.225])
	by newxmesmtplogicsvrsza8.qq.com (NewEsmtp) with SMTP
	id 39B37C6E; Thu, 31 Mar 2022 20:14:27 +0800
X-QQ-mid: xmsmtpt1648728867t9yjxyj3j
Message-ID: <tencent_F67F09C488F93BD79AE384E22D3C4CE9F905@qq.com>
X-QQ-XMAILINFO: NwU0tZNR0OQKXMMvgMZ3LgX8Xun946i2wfv3BfiCGk67PVUWTHuS7fv1aj2w9U
	 uduKcJHlQY7yFtZeYZlaendtkYCLUapYHcB4CorHkBgaO/ACr6VR/ZoQij01DVkYaqxehZNgTbHv
	 K7bLcu26UahfABL6z9seGenBHOju0svcwlVQB++aUTsqeLVllHHK05tB7jyP1GzhJDfWSmsH/HW/
	 z+8eGxkq+8la69ykXjNsqqqDJorNmPUTLeQ+Tqexcg2+CZ1IuYcAzxuvketyF3orZAK/ghbCqVMc
	 cqL7TS2tVoOa+sTzh/irPrywMisdx0JdkGj4paKpAKONd8+m/pUUD4D8qaM5ovzQxipO/F+yNlZ9
	 ctrkC6Bo5xhuaugjDMLsRkPAlk303B25gmHTy5QzBgIr3Z8gU2P3SGF0fxhBOe65KhKfqsw7z0WS
	 shIt615eFdrhx0jVEmgWGJEGGE8Qm/2HVA6CggBuDchXuCFyb0WStINuJVwLMxRae3HWdLKsSjp+
	 JK8m7KMpMSj9yDuRn8NuXLwIlSHA0nJSequvHx5LodIon4Q6FRDSSY84cT/lpUJQG0Wk9PW+qG4P
	 qfPtL2iF3SwqHnt2ry8DwcbpPgvlpnaPeg6KktEsimzqusR4LgJB5U/ds9HyQuClgUYZMSubshLJ
	 NmS1lqwPEFVMM4VXc+G6lDfBqWVdLjZxj2RG1Rf4x/b6V+9e9g1BEZN6v5gkvfREz/1p67YjLLqT
	 m/GxywbUNIiUDKDl5kcqo8HdkW3WYGcYPa52LBRBH4O9yTWMSyGhPNho+iFEq5AuCOV/VpE+990t
	 Hstq8zfK32SQaIT3jUYUtKY2MebgDxfPKwVYARQvvVRq3ZMnhpbpIyqg82CLZYrguBUt94kLvJyc
	 nNGHuJeb5piwmrmTilkmwG8UgU9Iyrw8jDZ8uhGkz6IN5BQavW7MHHkdbhE7v5QWutTNYajtEZ
Date: Thu, 31 Mar 2022 20:14:27 +0800
From: "Xiaoke Wang" <xkernel.wang@foxmail.com>
To: dan.carpenter <dan.carpenter@oracle.com>
Cc: gregkh <gregkh@linuxfoundation.org>, 
	Larry.Finger <Larry.Finger@lwfinger.net>, 
	phil <phil@philpotter.co.uk>, 
	linux-staging <linux-staging@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Re: [PATCH v2 2/2] staging: r8188eu: fix potential memory leak in _rtw_init_xmit_priv()
References: <tencent_254AD0FF06201BCCF5B9911C6E142CE1F208@qq.com>, 
	<tencent_A5280DFCCB827030EBE73673F0510084970A@qq.com>, 
	<20220331112312.GO3293@kadam>
X-Priority: 3
X-GUID: F36358DD-13BB-43FD-A6EF-B1E3C25D3D96
X-Has-Attach: no
X-Mailer: Foxmail 7.2.23.116[cn]
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-OQ-MSGID: <2022033120142712861498@foxmail.com>
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

VGh1LCAzMSBNYXIgMjAyMiAxOToyMzozNCArMDgwMCwgZGFuLmNhcnBlbnRlckBvcmFjbGUuY29t
IHdyb3RlOgo+VGhpcyB3b3Jrcy4uLsKgIFByZXN1bWFibHksIGl0IGFwcGxpZXMgdG8gc3RhZ2lu
Zy1uZXh0IGV2ZW4gdGhvdWdoIGl0Cj5kb2Vzbid0IGFwcGx5IHRvIGxpbnV4LW5leHQuwqAgU286
Cj4KPlJldmlld2VkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+
Cj4KPkluIGFuIGlkZWFsIHdvcmxkLCBweG1pdHByaXYtPnB4bWl0YnVmIHdvdWxkIGJlIGRlY2xh
cmVkIGFzIGFuIGFycmF5IG9mCj5zdHJ1Y3QgaW5zdGVhZCBvZiBhbiBhcnJheSBvZiB1OC7CoCBU
aGF0IHdvdWxkIG1ha2UgaXQgbXVjaCBzaW1wbGVyCj5iZWNhdXNlIHdlIGNvdWxkIGRvCj4KPmZy
ZWVfeG1pdF9leHRidWY6Cj4Jd2hpbGUgKC0taSA+PSAwKQo+CQlydHdfb3NfeG1pdF9yZXNvdXJj
ZV9mcmVlKHB4bWl0cHJpdi0+cHhtaXRfZXh0YnVmW2ldKTsKPgl2ZnJlZShweG1pdHByaXYtPnB4
bWl0X2V4dGJ1Zik7Cj4JaSA9IE5SX1hNSVRCVUZGOwo+ZnJlZV94bWl0YnVmOgo+CXdoaWxlICgt
LWkgPj0gMCkKPgkJcnR3X29zX3htaXRfcmVzb3VyY2VfZnJlZShweG1pdHByaXYtPnB4bWl0YnVm
W2ldKTsKPgoKCgpUaGlzIGlzIGdyZWF0ISBTb3JyeSBJIGRpZCBub3Qgbm90aWNlIHlvdXIgbGFz
dCBlbWFpbC4KCk15IG1haW4gam9iIGlzIHRvIGZpbmQsIHJlcG9ydCBidWdzIGFuZCBwcm92aWRl
IHBhdGNoZXMuCkluIGZhY3QsIHRoZXJlIGFyZSBzbyBtYW55IHNpbWlsYXIgYnVncyBuZWVkIHRv
IGJlIGhhbmRsZWQgaW4gaXRzCmZhbWlseS4KU3VjaCBhcyBfcjg3MTJfaW5pdF94bWl0X3ByaXYo
MCBpbiAvZHJpdmVycy9zdGFnaW5nL3J0bDg3MTIvcnRsODcxeF94bWl0LmMKYW5kIF9ydHdfaW5p
dF94bWl0X3ByaXYoKSBpbiBkcml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2NvcmVccnR3X3htaXQu
Yy4uLgoKU28gSSB3aWxsIHRyeSB0byBmaXggdGhlIGJ1Z3MgYXQgZmlyc3QuIEFjdHVhbGx5LCB0
aGUgcHJvYmxlbXMgeW91IG1lbnRpb25lZAphbHNvIHdpZGVseSBleGlzdCBpbiBpdHMgZmFtaWx5
IGNvZGUuCkkgc3VwcG9zZSB0aG9zZSBhcmUgdGhlIHN0eWxlIG9mIHRoZSBjb2RlICg6CkkgYW0g
aGFwcHkgdG8gaW1wcm92ZSB0aGUgY29kZSBxdWFsaXR5IGl0c2VsZiB3aGVuIEkgZmluaXNoCm15
IG93biB3b3JrIGF0IGhhbmQuCgpSZWdhcmRzLApYaWFva2UgV2FuZw==

