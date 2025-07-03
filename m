Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A622D6AA7
	for <linux-staging@lists.linux.dev>; Thu,  3 Jul 2025 07:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.79.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751526241; cv=none; b=ROH2J+hf4AwjUNt4SzVtjIQZUrcFC0eKOIuWqVPDCyHVQD4I5palmZMLtg3MrH8RkmZrH4cyPdaSBniBExBm/M3PytYNedREBBoGmxJ3468aSnzKiIGZj6cXukfG3qcuQhBRwWAYt++Mf/FVEZrXAAhThs8WCSvL4QY6nmV1Df0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751526241; c=relaxed/simple;
	bh=DUdiaZ9whhqniFQVblr9wu/+lWFSE1XeD7IPimyEAR4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=CFFgf5Ik+FXiVtzyAzx/5FZiRGGzE+I9PNy0plwaQMIpOG+flURibg9ax4eOqLS2Y0JHQW1h3Oc/gHgfccNJzmPdTIOS/FWnJfoDRkTUB6YWo0EbaW54ZsFAxXGs8dVlcWMJ65GfNyu/2OPiEbLNiEx4+KtILDLIv9nGJsrEtjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=206.189.79.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [115.197.243.13])
	by mtasvr (Coremail) with SMTP id _____wA3iLtTK2ZoWejaAw--.10708S3;
	Thu, 03 Jul 2025 15:03:48 +0800 (CST)
Received: from linma$zju.edu.cn ( [115.197.243.13] ) by
 ajax-webmail-mail-app2 (Coremail) ; Thu, 3 Jul 2025 15:03:46 +0800
 (GMT+08:00)
Date: Thu, 3 Jul 2025 15:03:46 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Lin Ma" <linma@zju.edu.cn>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: wkang77@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v1 1/2] staging: gdm724x: fix type confusion in
 gdm_lte_event_rcv()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.3-cmXT6 build
 20250620(94335109) Copyright (c) 2002-2025 www.mailtech.cn zju.edu.cn
In-Reply-To: <2025070355-uncommon-handlebar-c6f3@gregkh>
References: <20250703052723.14616-1-linma@zju.edu.cn>
 <2025070343-halves-prison-c40f@gregkh>
 <97e5af3.9183.197cefa02cc.Coremail.linma@zju.edu.cn>
 <2025070355-uncommon-handlebar-c6f3@gregkh>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <7792df9a.9245.197cf193a6a.Coremail.linma@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:zC_KCgBnkIdSK2ZodB9aAA--.11595W
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwEQEmhlCw4MWwAAsf
X-CM-DELIVERINFO: =?B?twbGxgXKKxbFmtjJiESix3B1w3tPqcowV1L23Bze5QtIr9Db75bEBiiEybVhThS0pI
	APHlVyJpD759Nt3m89ewvKkHSI4jG4s/k4p76Wwm7QDmPoNjFoGBgDV3xhOiUlmDEcOhGd
	W0XeuqohAFAqSKl8EP1g9XiRQZ5m4zI7y8Q4UFTOOxy/CAt3qG6zaBeEcG0PLw==
X-Coremail-Antispam: 1Uk129KBj93XoWxJr43AF4DWFy7KF15uFykZwc_yoW8Wr4rpa
	4DK3WFkrWDWr1xXa1Iq3ySyFyYvr4xA3yFgF1rAayY9rs8AFyfArWfX3yUCF15uFWDKF1F
	ya4xtr9akaykArXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUmEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxM4xvF2IEb7IF0Fy264kE64k0F24lFcxC0VAYjxAxZF0Ex2IqxwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UMVCEFcxC0VAYjxAxZF
	UvcSsGvfC2KfnxnUUI43ZEXa7IU8CJm5UUUUU==

SGVsbG8gR3JlZywKCj4gPiBgYGAKPiA+IAo+ID4gLSBieSBgZGV2LT50eXBlYC4gU2VlIGF4MjVf
ZGV2aWNlX2V2ZW50KCkKPiA+IGBgYAo+ID4gc3RhdGljIGludCBheDI1X2RldmljZV9ldmVudChz
dHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKnRoaXMsIHVuc2lnbmVkIGxvbmcgZXZlbnQsCj4gPiAgICAg
ICAgICAgICAgICAgIHZvaWQgKnB0cikKPiA+IHsKPiA+ICAgICBzdHJ1Y3QgbmV0X2RldmljZSAq
ZGV2ID0gbmV0ZGV2X25vdGlmaWVyX2luZm9fdG9fZGV2KHB0cik7Cj4gPiAKPiA+ICAgICAuLi4u
Li4KPiA+IAo+ID4gICAgIC8qIFJlamVjdCBub24gQVguMjUgZGV2aWNlcyAqLwo+ID4gICAgIGlm
IChkZXYtPnR5cGUgIT0gQVJQSFJEX0FYMjUpCj4gPiAgICAgICAgIHJldHVybiBOT1RJRllfRE9O
RTsKPiA+IGBgYAo+IAo+IAo+IFRob3NlIGFyZSBjb3JlIGZ1bmN0aW9ucyB0aGF0IGFsbCBkcml2
ZXJzIGFyZSB1c2luZywgYW5kIHRoZSAidHlwZSIgb2YKPiBkZXZpY2UgaXMgYWxzbyBvayB0byBs
b29rIGF0LiAgWW91IGFyZSB0cnlpbmcgdG8gY29tcGFyZSBhIHNwZWNpZmljCj4gY2FsbGJhY2sg
aW4gdGhpcyBjaGFuZ2UsIHdoaWNoIGZlZWxzIHdyb25nIHRvIG1lLgoKR290IGl0LiBJIHdpbGwg
dHJ5IHRvIHByZXBhcmUgYW5vdGhlciB2ZXJzaW9uLgoKPiAKPiBXYWl0LCB3aGF0IHRyZWUgYXJl
IHlvdSBtYWtpbmcgdGhpcyBjaGFuZ2UgYWdhaW5zdD8gIEkgZG9uJ3QgZXZlbiBzZWUKPiB0aGUg
ZmlsZSB5b3UgYXJlIHRyeWluZyB0byBwYXRjaCBpbiB0aGUgbGF0ZXN0IHRyZWUsIGFyZSB5b3Ug
c3VyZSBpdCdzCj4gbm90IGp1c3QgZGVsZXRlZCBhbHJlYWR5Pwo+IAo+IC4uLgo+IAo+IEFnYWlu
LCBtYWtlIHN1cmUgdGhpcyBmaWxlIGlzIHN0aWxsIHByZXNlbnQgaW4gdGhlIHRyZWUgYmVmb3Jl
IGdvaW5nCj4gZnVydGhlciA6KQo+IAo+IHRoYW5rcywKPiAKPiBncmVnIGstaAoKWWVzLCB5b3Ug
YXJlIHJpZ2h0LCBqdXN0IGxpa2UgaG93IEkgcG9pbnRlZCBvdXQgaW4gdGhlIHBhdGNoOgoKIiIi
ClRoaXMgYnVnIHdhcyAiZml4ZWQiIGluIHVwc3RyZWFtIGtlcm5lbCBieSB0aGUgY29tbWl0IDFj
MmQzNjRlN2Y3ZgooInN0YWdpbmc6IGdkbTcyNHg6IFJlbW92ZSB1bnVzZWQgZHJpdmVyIikuIEhv
d2V2ZXIsIG90aGVyIHN0YWJsZQp2ZXJzaW9ucyBzdGlsbCBjb250YWluIGl0LiBGaXggdGhlIGNv
bmZ1c2lvbiBidWcgYnkgYWRkaW5nIGNoZWNrcy4KIiIiCgpUaGF0IGlzLCB0b2dldGhlciB3aXRo
IGFub3RoZXIgaWRlbnRpZmllZCBidWcsIGhhcyBhbHJlYWR5IGJlZW4gZGVsZXRlZCB0aGUKbGF0
ZXN0IHVwc3RyZWFtIGtlcm5lbC4gKHNlZSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIw
MjUwNzAzMDUyODM3LjE1NDU4LTEtbGlubWFAemp1LmVkdS5jbi9ULyN1KQoKSSBzZW50IHRoaXMg
cGF0Y2gganVzdCBiZWNhdXNlIHRoZSBzdGFibGUgdmVyc2lvbiwgbGlrZSA1LjE1LjE4Niwgc3Rp
bGwKY29udGFpbnMgaXQuIFQuVAoKVGhlcmVmb3JlLCBzaGFsbCBJIHByb2NlZWQgd2l0aCB0aGUg
cGF0Y2hlcz8gT3IgbWF5YmUgdGhlIHN0YWJsZSB0cmVlCmNvdWxkIGFsc28gZGVsZXRlIHRoYXQg
dnVsbmVyYWJsZSBjb2RlPwoKClRoYW5rcyBmb3IgdGhlIHJlcGx5IQoKClNpbmNlcmVseQpMaW4=

