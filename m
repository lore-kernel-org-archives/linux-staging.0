Received: from out203-205-251-80.mail.qq.com (out203-205-251-80.mail.qq.com [203.205.251.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F13836C
	for <linux-staging@lists.linux.dev>; Wed, 30 Mar 2022 07:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1648625669;
	bh=u9DOwmiLqvVY2c2l9fva7rkwmGz9kPnFqwiAHjDu7zM=;
	h=Date:From:To:Cc:Subject:References;
	b=c8ZPDo5E30x8XwlvdeKNuRm8plmEbj1Qds+pXIEb4ob3q7HQfLplCgJnAcftgN2x9
	 QqvAeF6EuvKCrHiYoYnCawzHTb2hjBpFyJYxiae3MHrsI56DeV4hGdrRimfGm7Hk9A
	 jNXMsSNQuqf+S5c3ek0DbaYyJLBvaSjESAjFfHJg=
Received: from LAPTOP-4BSPBRI7 ([59.172.176.225])
	by newxmesmtplogicsvrszb6.qq.com (NewEsmtp) with SMTP
	id 896B721B; Wed, 30 Mar 2022 15:34:22 +0800
X-QQ-mid: xmsmtpt1648625662tsfzi8hd0
Message-ID: <tencent_4E078E318ADFF03325CAFF5D9043E6A15C07@qq.com>
X-QQ-XMAILINFO: OKkKo7I1HxIe2bDOLGX75ovihCLf5qNbe1XJO5Ki/PgLzidhfcZ5Lf3pMqr5hd
	 5YP9emgJ5epy6ogzTKFJf0pN5OmLG0jgLhvSYRvjhA5riKrSZaJqYDw9xcC6ZmeCZCaZqgXDmFYQ
	 IWpb56FuD8OfhUHipPs8dZguHrTr+CGsno1aWuHhSRoCm8pRHzeVIBRvuAcHtdVsxPcILTxyRxZB
	 vyM6g+A72ZOJVWcmXOfSbJxtFJcvKOLYZ2FtRPgTfGm44Y8hh23kCiVUMmugtGOXkBnZJaF7l5KS
	 QLPJ+mMQTvwxmZkHxSBEEeue3D7/KNyWz6gnmdnHtYUFkKw1dUutufktTnEW7F93DqhH/Aeu6Tmv
	 5Y7rMjfUyau9DRCQ2q0/5rmmWoPJMTlWBowynpGCRnB9nzBYwTUMMkqcY3dgmfZy1dY73+RViF/v
	 JvHNdJAmhZGiT0rt9u7bqK1plOVFPcCSTLmGQzChcwJfBfLZbKsGXjnZBgnydsoZL9SxfX+skrX8
	 MsWudn5ca+F89UeR+uAAMgmvKi9un7Ak7B/czae24Si/NgmtKRXOp49FNEGIe8IzKXH3Kw0LZNVL
	 yUew8StuiQHfm1yUClbSt6RSNQ0iZvncVG9fnXc3zNcqmE/UYL4eNXqQY8XaamDl52WqgIONdqSx
	 HRvG2cVvNntyDZNet2lWAzydl+0Bb/I5no1YMSCgktRdFRv6XCeWd+0HodDfXBS7pkXz4CSyx7Zv
	 f4a4jiiM7bExXCCRBsFSpOQGK148nB5kgfcyOHyGPTRV8/f74weQ+piZfR3fsgJc2h54J9DVHKo8
	 MQZy8OElnZhRYjOYhU9uOGWnvYR+yCF1GfFIiecafHVtuoFNGV+YWm7YnInQZTYmF3Xnqcl9TLYd
	 0JcVt81eToe1dRop/iCkwSJZJMlOXsuC6oFjcTDBHRFDZtaMyGgguh0M1dLdKCINKVwqc7TDA/
Date: Wed, 30 Mar 2022 15:34:24 +0800
From: "Xiaoke Wang" <xkernel.wang@foxmail.com>
To: gregkh <gregkh@linuxfoundation.org>
Cc: larry.finger <larry.finger@lwfinger.net>, 
	phil <phil@philpotter.co.uk>, 
	linux-staging <linux-staging@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Re: [PATCH] staging: r8188eu: check the return value of kzalloc()
References: <tencent_B489FA9F0FC49CF92A77916394E225DC4705@qq.com>, 
	<YkMsTz/iJdgmUxtS@kroah.com>
X-Priority: 3
X-GUID: E7637EAC-5FDE-40AF-8EF8-294C839259CC
X-Has-Attach: no
X-Mailer: Foxmail 7.2.23.116[cn]
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-OQ-MSGID: <2022033015342338674844@foxmail.com>
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyOSBNYXIgMjAyMiAyMzo1NzoxMCArMDgwMCwgZ3JlZ2toQGxpbnV4Zm91bmRhdGlv
bi5vcmcgd3JvdGU6Cj4+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9yODE4OGV1L2NvcmUvcnR3X3ht
aXQuYwo+PiArKysgYi9kcml2ZXJzL3N0YWdpbmcvcjgxODhldS9jb3JlL3J0d194bWl0LmMKPj4g
QEAgLTE4MCw2ICsxODAsMTAgQEAgczMyCV9ydHdfaW5pdF94bWl0X3ByaXYoc3RydWN0IHhtaXRf
cHJpdiAqcHhtaXRwcml2LCBzdHJ1Y3QgYWRhcHRlciAqcGFkYXB0ZXIpCj4+wqAgCXB4bWl0cHJp
di0+ZnJlZV94bWl0X2V4dGJ1Zl9jbnQgPSBudW1feG1pdF9leHRidWY7Cj4+wqAgCj4+wqAgCXJ0
d19hbGxvY19od3htaXRzKHBhZGFwdGVyKTsKPj4gKwlpZiAoIXB4bWl0cHJpdi0+aHd4bWl0cykg
ewo+PiArCQlyZXMgPSBfRkFJTDsKPj4gKwkJZ290byBleGl0Owo+PiArCX0KPgo+IFlvdSBqdXN0
IGxlYWtlZCBtZW1vcnkgcmVzb3VyY2VzIDooCj4KClNvcnJ5LCB5b3UgYXJlIHJpZ2h0LiBJIHRy
YWNrZWQgdGhlIGNhbGxlcnMgb2YgX3J0d19pbml0X3htaXRfcHJpdigpIGFuZApmb3VuZCB0aGF0
IHRoZXkgZG8gbm90IHByb3Blcmx5IHJlbGVhc2UgdGhlIHJlc291cmNlcyBhbGxvY2F0ZWQgYnkg
dGhpcwpmdW5jaXRvbi4gVGhpcyBtZWFucyB0aGF0IHRoZSBvdGhlciBlcnJvciBwYXRocyBjYW4g
YWxzbyBicmluZyBtZW1vcnkKbGVha3MsIGFzIHdlbGwgYXMgdGhlIHNhbWUgZnVuY3Rpb24gaW4K
ZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9jb3JlL3J0d194bWl0LmMuClRoZXJlIGFyZSBhbHNv
IHNldmVyYWwgc2ltaWxhciBpc3N1c2VzIG9mIGFsbG9jX2h3eG1pdHMoKSBhbmQgCl9yODcxMl9p
bml0X3htaXRfcHJpdigpIGluIGRyaXZlcnMvc3RhZ2luZy9ydGw4NzEyL3J0bDg3MXhfeG1pdC5j
LgpJIHdpbGwgdHJ5IHRvIGNhcmVmdWxseSBmaXggdGhlbS4KClJlZ2FyZHMsClhpYW9rZSBXYW5n
Cgo=

