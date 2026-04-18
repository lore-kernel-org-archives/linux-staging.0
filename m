Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E4832A3F3
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 07:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776497870; cv=none; b=sFrJYCOWOPXLCTnnWrpumDcrpJyHcZj1b8N9f8HCqdH0iLLMrxTi9uiNWEa7HoOClL+7VsN6rvvF+hzBOpx0HFR+1mqOCUqLM1vPo2K/zPcVj6PET557GOLyWC05zc+d7ft3TesWcdnUy8jJQlNGY71m7TCx9ge06bnhUJQYLl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776497870; c=relaxed/simple;
	bh=kJjTS3FMiHrurln9q5cpki+7XrXJDeLlScpjLZDHf84=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=dont4QBxIT7cCN0UTqzMBFSCzY2U1jD+MHduPkC8PjoX/9ukJjhMp0elz6gwmCCsON3h+bmWS4b8h2eM0oT0hyOip3BOFc2q5VLYltUf1TIrz8fFguQvKMVNMVSfX1p6ilveMhhq8rBfsXIuQDkNIYHZ4sdOh5G/VD4iuiIVbqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gYVdr2mA; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gYVdr2mA"
Date: Sat, 18 Apr 2026 09:37:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776497866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PM5VCIdpX6F1T77av6TmQTqm61Pka1sz5xuO29CSvTw=;
	b=gYVdr2mAW8YEFf1kCX6JcFR/T85YRS3n98Yxa86CnZcKdvmWjl6CmiD1v3JomLehUTts8O
	Njrvr+7b35wPp7yKC0bM9n9XlRzaFyxz30yonjyAS4ZOUYGz+Shp4eKmzueqJy/3rpFGiK
	uc3+bFqpvCt/SobzBomj8nEGu1SHcs0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Greg KH <gregkh@linuxfoundation.org>
CC: osdevhari@gmail.com, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_staging=3A_rtl8723bs=3A_remo?=
 =?US-ASCII?Q?ve_trailing_whitespace_in_rtw=5Fxmit=2Ec?=
In-Reply-To: <2026041841-prowling-reflex-a7b5@gregkh>
References: <CA+TGEkHXoCfY0RhmKFnfLrnPO+dKwKXAnGu84RNsNcE0=MaGAQ@mail.gmail.com> <6C4D65F4-8955-4B96-87A3-3FB25F5743EE@linux.dev> <2026041841-prowling-reflex-a7b5@gregkh>
Message-ID: <B1014BF9-FA55-48C3-B6C1-A6FDF4E399BC@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On April 18, 2026 9:24:01 AM GMT+02:00, Greg KH <gregkh@linuxfoundation=2Eo=
rg> wrote:
>On Sat, Apr 18, 2026 at 09:10:47AM +0200, Luka Gejak wrote:
>> Hi Osdevhari,
>> Let's start from the top of the email=2E Firstly attachments are not=20
>> allowed, only plaintext=2E Secondly Signed-off-by tag must use your rea=
l
>> name(Firstname Lastname <email>=2E Thirdly, you should setup git=20
>> send-email and use it to send patches=2E Now let's take a look at actua=
l
>> code:
>
>Again, Luka, please take a break from reviews=2E  I would recommend
>getting some more experience in the developer workflow before doing
>this, as it can be a bit confusing for new developers coming in to see
>stuff like this=2E
>
>And again, please do not use AI for reviews, we have that already, and
>there is a big reason I do not let it loose on the staging list because
>it is not yet ready for it=2E
>
>thanks,
>
>greg k-h

Please check my response to your other email and feel free to plug my=20
responses into ai detector if that will prove it is not ai(I tested it
returned human)=2E
Best regards,
Luka Gejak
