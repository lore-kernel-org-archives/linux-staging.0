Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E287B
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 08:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1648715113;
	bh=nceLhDkAkHTU5q3WeklQ2Wp6S9Xv1lg5u4bYhFzSvZk=;
	h=Date:From:To:Cc:Subject:References;
	b=vUF04I9WJSRyJeLOo47J4N4OcJClh0ud4QBpN5UeIOg9AlMvfKj6U1MV6BL3GXJcv
	 F/dMzaxXsccFGu8pArKD6y4LDGSbP1Obe5yvsngFRvlkLvDuTniWLXbNQSRcXXEvEQ
	 Jq/nljZpHpSahbUCUXlpU/B8wYNxfkeer7TkD39U=
Received: from LAPTOP-4BSPBRI7 ([59.172.176.225])
	by newxmesmtplogicsvrszc10.qq.com (NewEsmtp) with SMTP
	id 56B8FE5B; Thu, 31 Mar 2022 16:21:43 +0800
X-QQ-mid: xmsmtpt1648714903tcjuu6ngg
Message-ID: <tencent_B595FD8B8004319BE5AE71A052A08683280A@qq.com>
X-QQ-XMAILINFO: MyIXMys/8kCt5il7mVOFmu6uKP0gJOVD+H6OBE2vAIcSax8KoLsAZy6M+2XJc2
	 8YbVwolNhtQz4HEuEt3HeggZpG9JqMXitXOs9lhORxwwIKew7tBD5KeekHTxlVsk1aGfQ58F6ySr
	 4DQKMqbZr3MQZ1PVSM15vfz2RTGxa3bb96AAAnCrpEbZ+hfsxcLHBtUAM52AZYTkx1sG31jcoClF
	 z4dgTkDzdEvFA6GqipNTfYJOLUA59NLPMYldgkS9BvAfZTUeOZdHWFyblgZkfzOGhC18v+uCUxzx
	 htyChPdQDoNxNS0wKVNEpVeAKKayDxvj1DSxVXo/2gQ1qGaCHuIUrE61pQfbFovZtCHFPeNgzb5d
	 r3r6lTe763HCgiP2XBKyU0XukJsZIb7k/fzVyOv3jIGEYJ/jqIS/MeSj/EZTsvE2wL7MNruWpwFV
	 SblFr4LeUKrm6/grr4Jj+pLz5e3BJxOrLzLyx3n2kr0Rm/GVO40NhqGTKxGZC2/dTzxhVo09p4bW
	 Ye8i8tkGYklVZ0d8JZ5La1ZQ2Muoo9z4+Zg8/kOtnQLtERb6EIDcwPjjE0FHLZ5Q7tBCpvYnIDHS
	 Y7RiXV5oi4djnIzkHDD2lYcLAroe7l8d4JPTLxCys+Z9lWRA02M3wQa3Sdvmzudsz46E3n7sbEcO
	 i5d025bUhUypPVhVJWCnrYXIdVIjbTVJv0yi3rFzYT26cSFNY2Ut6D313JQUyj6gOXInU+HKxsXk
	 Hp7L+5lio/OUR/my1ixbyo6VdzQ3Jy2gGrMv9xRB5YWFTQy/7SEckIvDIZZKfa6c7KiwNLH9oOFq
	 pAhZt+IDPtF9CYwgzhFiQe+GJxjydeWsKjufceIbX7UO9IBXFSksjeFQ/oIsKu6CS8ZorCE/Q7X4
	 CUPBLbJqjMivriJXYeCrMz6PZnSNiuEm/9GteQzfbu+m8iIbjbklKQSfBCiGHgJg==
Date: Thu, 31 Mar 2022 16:21:45 +0800
From: "Xiaoke Wang" <xkernel.wang@foxmail.com>
To: dan.carpenter <dan.carpenter@oracle.com>
Cc: Larry.Finger <Larry.Finger@lwfinger.net>, 
	phil <phil@philpotter.co.uk>, 
	gregkh <gregkh@linuxfoundation.org>, 
	linux-staging <linux-staging@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Re: [PATCH 2/2] staging: r8188eu: fix potential memory leak in _rtw_init_xmit_priv()
References: <tencent_12789CD2DEBF33C818B3542E170737854506@qq.com>, 
	<tencent_2F72CC5068850B2BEDFC2B8058303FE6520A@qq.com>, 
	<20220331073555.GK3293@kadam>
X-Priority: 3
X-GUID: A4338ACF-28A6-487F-88C9-F4715FF5544D
X-Has-Attach: no
X-Mailer: Foxmail 7.2.23.116[cn]
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-OQ-MSGID: <2022033116214474301568@foxmail.com>
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1IDMxIE1hciAyMDIyIDE1OjM2OjIxICswODAwLCBkYW4uY2FycGVudGVyQG9yYWNsZS5j
b20gd3JvdGU6Cj4+IEBAIC0xMzQsNyArMTM0LDEyIEBAIHMzMglfcnR3X2luaXRfeG1pdF9wcml2
KHN0cnVjdCB4bWl0X3ByaXYgKnB4bWl0cHJpdiwgc3RydWN0IGFkYXB0ZXIgKnBhZGFwdGVyKQo+
PsKgIAkJCW1zbGVlcCgxMCk7Cj4+wqAgCQkJcmVzID0gcnR3X29zX3htaXRfcmVzb3VyY2VfYWxs
b2MocGFkYXB0ZXIsIHB4bWl0YnVmLCAoTUFYX1hNSVRCVUZfU1ogKyBYTUlUQlVGX0FMSUdOX1Na
KSk7Cj4+wqAgCQkJaWYgKHJlcyA9PSBfRkFJTCkgewo+PiAtCQkJCWdvdG8gZXhpdDsKPj4gKwkJ
CQlweG1pdGJ1ZiA9IChzdHJ1Y3QgeG1pdF9idWYgKilweG1pdHByaXYtPnB4bWl0YnVmOwo+PiAr
CQkJCWZvciAoOyBpID49IDA7IGktLSkgewo+Cj4gVGhpcyBmcmVlcyBvbmUgbW9yZSBlbGVtZW50
IHRoYW4geW91IGludGVuZGVkLsKgIEl0IHNob3VsZCBiZToKPgo+CSB3aGlsZSAoLS1pID49IDAp
IHsKPgoKSW4gZmFjdCwgdGhpcyBpcyBjb25zaWRlcmluZyB0aGF0IHdlIGRvIG5vdCBrbm93IHdo
ZXJlIGlzIHRoZSBmYWlsdXJlCmZyb20uIEluIHJ0d19vc194bWl0X3Jlc291cmNlX2FsbG9jKCks
IHRoZSBmYWlsdXJlIGNhbiBmcm9tIAoKPiBweG1pdGJ1Zi0+cGFsbG9jYXRlZF9idWYgPSBremFs
bG9jKGFsbG9jX3N6LCBHRlBfS0VSTkVMKTsKCiwgYnV0IGFsc28gY2FuIGZyb20gCgo+IAkJcHht
aXRidWYtPnB4bWl0X3VyYltpXSA9IHVzYl9hbGxvY191cmIoMCwgR0ZQX0tFUk5FTCk7CgpTbyBp
ZiB3ZSBkbyBub3QgaGFuZGxlIHRoZSBjdXJyZW50IGZhaWxlZCBpdGVtIGFuZCBqdXN0IHNraXAg
aXQsIHRoZW4gc29tZQptZW1vcnkgbWF5IGJlIGlnbm9yZWQuCgoKPgo+IE5vIG5lZWQgdG8gbW9k
aWZ5IHJ0d19vc194bWl0X3Jlc291cmNlX2ZyZWUoKS7CoCBQYXNzaW5nIGEgTlVMTCB0bwo+IHVz
Yl9mcmVlX3VyYigpIG9yIGtmcmVlKCkgaXMgYSBubyBvcC4KPgoKClllcywgeW91IGFyZSByaWdo
dC4gSSBjaGFuZ2VkIGl0IGlzIGJlY2F1c2UgSSBjb25jZXJuZWQgdGhhdCBzb21lCnVuaW50ZW50
aW9uYWwgdmFsdWUgb2NjdXJzLiBCdXQgaXQgc2VlbXMgemVybyBmaWxsZWQuCgoKUmVnYXJkcywK
WGlhb2tlIFdhbmcKCg==

