Received: from m1374.mail.163.com (m1374.mail.163.com [220.181.13.74])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB394185F
	for <linux-staging@lists.linux.dev>; Mon, 10 Oct 2022 02:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=fqc7P
	OfcW+wefL87nJX++WuyipQJOgC3GBIb6bkLx0U=; b=R63w0yfmyEWgbFGAVFNB1
	aRuI+WhhMRv06EVBqwmilbBz724b8i2vB8P8/rZTCaHElRHYi/N2IC6ozBzH8UEW
	DHo3j8ta1N26pfShiHis2X61eyvLFhTMHFSa54cPXdlXfu0KeWZctnhVOLv7x/7n
	2VaOWbFK3dI+BDceGZXRaM=
Received: from 13667453960$163.com ( [111.48.58.12] ) by
 ajax-webmail-wmsvr74 (Coremail) ; Mon, 10 Oct 2022 10:35:01 +0800 (CST)
X-Originating-IP: [111.48.58.12]
Date: Mon, 10 Oct 2022 10:35:01 +0800 (CST)
From: "Yi Jiangshan" <13667453960@163.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"Jiangshan Yi" <yijiangshan@kylinos.cn>, 
	k2ci <kernel-bot@kylinos.cn>
Subject: Re:Re: [PATCH] staging: rtl8192u: fix spelling typo in comment
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
In-Reply-To: <Y0MRTlpjuG3rJX9o@kroah.com>
References: <20221009085746.3149599-1-13667453960@163.com>
 <Y0MRTlpjuG3rJX9o@kroah.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <36da6995.16ee.183bfbee245.Coremail.13667453960@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:SsGowAC3QmzVhENj5Y1MAA--.52454W
X-CM-SenderInfo: bprtllyxuvjmiwq6il2tof0z/1tbivhaW+1Zce8k6SQABsP
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjItMTAtMTAgMDI6MjI6MDYsICJHcmVnIEtIIiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlv
bi5vcmc+IHdyb3RlOgo+T24gU3VuLCBPY3QgMDksIDIwMjIgYXQgMDQ6NTc6NDZQTSArMDgwMCwg
SmlhbmdzaGFuIFlpIHdyb3RlOgo+PiBGcm9tOiBKaWFuZ3NoYW4gWWkgPHlpamlhbmdzaGFuQGt5
bGlub3MuY24+Cj4KPkFnYWluLCB3aHkgYSAxNjMuY29tIGFkZHJlc3M/Cj4KClRoZXJlIGlzIGEg
cHJvYmxlbSB3aXRoIHRoZSBjb21wYW55J3MgbWFpbGJveCwgYW5kIHNvbWV0aW1lcyBJIGNhbid0
IHJlY2VpdmUgZW1haWxzLiBTbyBJIHRlbXBvcmFyaWx5IHVzZSBteSBwZXJzb25hbCBtYWlsYm94
IHRvIHNlbmQgcGF0Y2hlcywgc28gdGhhdCBJIGNhbiByZWNlaXZlIGZlZWRiYWNrIGZyb20gdGhl
IGNvbW11bml0eSBpbiBhIHRpbWVseSBtYW5uZXIuCgp0aGFua3OjrAoKSmlhbmdzaGFuIFlp
