Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14B216CD39
	for <linux-staging@lists.linux.dev>; Wed, 31 Jul 2024 06:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722408914; cv=none; b=ITBZ/BSLs4h5Es+bjuGCoGJANXZG1JJDQ3ITCRWi9TnDfCfXMMOD+Fdg1ytrUPiUPCFq7TeA4o06mk+FFhsm4cy4IF+QPHrtnyYX/uTpnbB09z6CDM+JMIheiJzjgxTi9SRFH1f19+cEQpEX3OiHhUGTq7oI2kzaUyh7hyw+Tag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722408914; c=relaxed/simple;
	bh=qxmU1WGLY6b38vGBzDaEjnf8WbHXhPt0+/bYn0a9ktw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=nFxqYh9ZE13nsqAUWUmJFg2nhSQbLaM+uVxtIPzK1AsQoOp8KZxcqNTI6JEpuKMX5m/sksCFQgrW0TdhFe5X03bkxcrPkCrN8da3ppHjcUYdyoxepH86UgzTOsDRosM9YUyzXlSXDDVhWUTvTsOW0dThwUm4Z0iSVgmxRRKYgCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gRkwYEGx; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gRkwYEGx"
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240731065509epoutp03f2c5056992431108f334994958a696ce~nOccRzCgt0342903429epoutp03X
	for <linux-staging@lists.linux.dev>; Wed, 31 Jul 2024 06:55:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240731065509epoutp03f2c5056992431108f334994958a696ce~nOccRzCgt0342903429epoutp03X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722408909;
	bh=M/BB5qGfT7e4XPQwtSp/MXdbEg9r9lfPuI+4LA+l1Hk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=gRkwYEGxrAVnrOBsqrn/ZtO+TcSckoGEFOpikwKt+D4QLeOPOaaQQeNUQm44HcqQN
	 E8oakjDK99aejEno68QjH4/M4pcnrtu/zOJ0uXqWFENmoV78Bm/uLGwHox6R6y2FUq
	 O4N+MS76xGTIGZg5zj4Vf0CipLF0Reu23bZCYvlw=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTP id
	20240731065509epcas1p3eacf1bce0827f692f1e5310af51bafa8~nOccHpneJ1603816038epcas1p3W;
	Wed, 31 Jul 2024 06:55:09 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.38.242]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WYjXD66Kbz4x9Pt; Wed, 31 Jul
	2024 06:55:08 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	DB.11.08992.ACFD9A66; Wed, 31 Jul 2024 15:55:06 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240731065505epcas1p2eb1dbe25deaa1bb507f1fe0fe302762c~nOcYf4Atf0131901319epcas1p2M;
	Wed, 31 Jul 2024 06:55:05 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240731065505epsmtrp2e1aaae3e5edbfd7be244a4e9a8353012~nOcYfOGL91304813048epsmtrp2-;
	Wed, 31 Jul 2024 06:55:05 +0000 (GMT)
X-AuditID: b6c32a33-70bff70000002320-1d-66a9dfcaab5d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7E.89.08456.9CFD9A66; Wed, 31 Jul 2024 15:55:05 +0900 (KST)
Received: from manjaecho04 (unknown [10.89.15.251]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240731065505epsmtip1e9541e7976d191f8476b363e863fe173~nOcYW-EPH1881718817epsmtip1t;
	Wed, 31 Jul 2024 06:55:05 +0000 (GMT)
From: "Manjae Cho" <manjae.cho@samsung.com>
To: "'Greg KH'" <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
In-Reply-To: <2024073109-abridge-yapping-3db3@gregkh>
Subject: RE: [PATCH] Improve MAR register definition and usage for rtl8723
Date: Wed, 31 Jul 2024 15:55:05 +0900
Message-ID: <000001dae316$92e619b0$b8b24d10$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIO4y/bC0DcafDS3Wluz7dnMpOAvgGFAy1LAsCGdEuxhjWw4A==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKKsWRmVeSWpSXmKPExsWy7bCmvu6p+yvTDN7dZ7ZoXryezeLyrjls
	Fkc+pzowe+yfu4bd48XmmYwenzfJBTBHZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoa
	WlqYKynkJeam2iq5+AToumXmAO1RUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSY
	FegVJ+YWl+al6+WlllgZGhgYmQIVJmRnHLizg73glUTF58NlDYxTRLoYOTkkBEwk/nx8x97F
	yMUhJLCDUeLmyQVQzidGiZOTZzFCON8YJZ5sbQXKcIC1HGnkhIjvZZTY9+QfVNELRomFK+Yx
	gcxlE9CW2L/tBTOILSKgI9Fx5gQLiM0s4CyxtmsxO4jNKWAq0brlIiuILSzgJTH50jI2kAUs
	AqoSHTdyQcK8ApYSV65+YIKwBSVOznwCNUZeYvvbOcwQLyhI/Hy6jBVilZNE15cfUDUiErM7
	25hBbpMQeMQusfz5DTaIBheJhRf/skPYwhKvjm+BsqUkPr/bC1VTLLH0zyYWCLtG4mnrDCjb
	WOLnuU/MIHcyC2hKrN+lD7GLT+Ld1x5WSPjwSnS0CUFUq0icX7WBCSIsJdFw0BAi7CFxovMf
	0wRGxVlIHpuF5LFZSB6YhbBrASPLKkax1ILi3PTUZMMCQ3hMJ+fnbmIEpz8t4x2Ml+f/0zvE
	yMTBeIhRgoNZSYRX6OTKNCHelMTKqtSi/Pii0pzU4kOMpsCQnsgsJZqcD0zAeSXxhiaWBiZm
	RiYWxpbGZkrivGeulKUKCaQnlqRmp6YWpBbB9DFxcEo1MOmr/FtU2HwnZyLPPhevxSlfbvQm
	PZvrsDOtQW+mywXhZPZLmfHTaqdeq1Oyn83pE1etlrFCZm2SX33fogTzhF3MDKnrH37MkLnS
	M+WizZ1vK9/+yL8Q82/LwrrW9jNRMufm3Nhp9LbYtnfVWa/ZharvrHIznoaeKfkhViurdPhd
	dV72ym3Wq2e9Z1q0InTaiaI9k496lTVW3Lm+MGwL+9Ff0w50Xlx1mPfhUj25Vbf8plSZLt73
	bcGfzjr+/bYKQe/3nXgfxz0x/vqmmEN/g6eXOzg+lThnpzSD+e1URQHG6t8ikdGFEqE9+6pN
	U3zEv19TdbGaFVL892bn7CRxZvZFF279kXn50XJmzmkuf34lluKMREMt5qLiRABDfyq6CAQA
	AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsWy7bCSnO7J+yvTDNZ+l7doXryezeLyrjls
	Fkc+pzowe+yfu4bd48XmmYwenzfJBTBHcdmkpOZklqUW6dslcGUcuLODveCVRMXnw2UNjFNE
	uhg5OCQETCSONHJ2MXJxCAnsZpSYNGkZcxcjJ1BcSuJ+WxMzRI2wxOHDxRA1zxglVs5pZgGp
	YRPQlti/7QVYvYiAjkTHmRNgcWYBV4nN01czQTRsZ5T4uWgBI0iCU8BUonXLRVYQW1jAS2Ly
	pWVsIAtYBFQlOm7kgoR5BSwlrlz9wARhC0qcnPmEBaSEWUBPom0jI8R4eYntb+dAnakg8fPp
	MlaIE5wkur78gDpBRGJ2ZxvzBEbhWUgmzUKYNAvJpFlIOhYwsqxilEwtKM5Nzy02LDDKSy3X
	K07MLS7NS9dLzs/dxAiOAy2tHYx7Vn3QO8TIxMF4iFGCg1lJhFfo5Mo0Id6UxMqq1KL8+KLS
	nNTiQ4zSHCxK4rzfXvemCAmkJ5akZqemFqQWwWSZODilGpgmuEadeB15IPdm15d/ju6lW+8u
	WZX1ZMah+1POGmoXWig6WN38HGp9zW6NUWh6yplNHncK8twVb+Rs0Tg04ZGB/eIwSwUzx7P+
	C3Zct3+fZnW22+R11+n2SeEqdoYioVOWRMSZxxdPWfNnR8qq/lDdKC3LF1NU4mcwz5jBevKV
	EVMEo4+LT7RprbTNIn1VDamoyUq90dLPFzlPW/JNhtE2VbJcdXZOD+uSzJgnZe8+Mk2UjUq4
	FOaoE/MpJnsCV33HbOaeLP2HnqKSDxa2LT1/1bbHZOXk+JJ4Zp0zVxqU2lnfNzjsU3ermOHJ
	1HcyzrA4yVF6wXzTEz7pJuEBFdv/9ecHbmia+/KIrvYKJZbijERDLeai4kQA6GtzGvICAAA=
X-CMS-MailID: 20240731065505epcas1p2eb1dbe25deaa1bb507f1fe0fe302762c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240730155255epcas1p4ab3b5e88d400e2221aa1cf5cf234ea19
References: <CGME20240730155255epcas1p4ab3b5e88d400e2221aa1cf5cf234ea19@epcas1p4.samsung.com>
	<20240730155054.411059-1-manjae.cho@samsung.com>
	<2024073109-abridge-yapping-3db3@gregkh>

> On Wed, Jul 31, 2024 at 12:50:54AM +0900, Manjae Cho wrote:
> > This patch improves the usage of the MAR register by updating the
> > relevant macro definitions and ensuring consistent usage across the
> > codebase.
> >
> > Signed-off-by: Manjae Cho <manjae.cho@samsung.com>
> >
> > ---
> >  drivers/staging/rtl8723bs/hal/sdio_halinit.c    | 4 ++--
> >  drivers/staging/rtl8723bs/include/hal_com_reg.h | 3 +++
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> > b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> > index c9cd6578f7f8..9493562c1619 100644
> > --- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> > +++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> > @@ -380,8 +380,8 @@ static void _InitWMACSetting(struct adapter
> *padapter)
> >  	rtw_write32(padapter, REG_RCR, pHalData->ReceiveConfig);
> >
> >  	/*  Accept all multicast address */
> > -	rtw_write32(padapter, REG_MAR, 0xFFFFFFFF);
> > -	rtw_write32(padapter, REG_MAR + 4, 0xFFFFFFFF);
> > +	rtw_write32(padapter, MAR0, 0xFFFFFFFF);
> > +	rtw_write32(padapter, MAR4, 0xFFFFFFFF);
> >
> >  	/*  Accept all data frames */
> >  	value16 = 0xFFFF;
> > diff --git a/drivers/staging/rtl8723bs/include/hal_com_reg.h
> > b/drivers/staging/rtl8723bs/include/hal_com_reg.h
> > index 9a02ae69d7a4..baf326d53a46 100644
> > --- a/drivers/staging/rtl8723bs/include/hal_com_reg.h
> > +++ b/drivers/staging/rtl8723bs/include/hal_com_reg.h
> > @@ -151,6 +151,9 @@
> >  #define REG_BSSID						0x0618
> >  #define REG_MAR
0x0620
> >
> > +#define MAR0						REG_MAR
> 	/* Multicast Address Register, Offset 0x0620-0x0623 */
> 
> Why redefine this value again?  What is wrong with using it as "REG_MAR"?
> Is this fixing anything or making anything more consistent somewhere?
> It's only used in one place that I can see.
> 
> thanks,
> 
> greg k-h

Dear Greg,

Thank you for your feedback. I appreciate your point about the current usage
of REG_MAR. While it's true that it's only used in one place currently, I
believe there's value in making this change for the following reasons:

 - Consistency: Other similar registers in the codebase use this pattern.
For example, we have IDR0 and IDR4 for MACID registers. Adding MAR0 and MAR4
brings consistency to our register naming convention.

 - Clarity: The +4 offset in "REG_MAR + 4" isn't immediately clear without
context. MAR4 makes it explicit that we're dealing with the next 4 bytes of
the Multicast Address Register.

 - If we need to use these registers elsewhere in the future, having clear,
specific names will make the code more readable.

However, I understand if you feel this change doesn't provide enough benefit
to justify inclusion. If you prefer, I could modify the patch to keep the
REG_MAR usage but add comments for clarity:

    /* Multicast Address Register */
    rtw_write32(padapter, REG_MAR, 0xFFFFFFFF);     /* Offset 0x0620-0x0623
*/
    rtw_write32(padapter, REG_MAR + 4, 0xFFFFFFFF); /* Offset 0x0624-0x0627
*/

I'm open to your guidance on which approach you think.

Thank you
Best Regards

