Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC887347520
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 07:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776498270; cv=none; b=sKoszXLLxs2cS8+Z1TrlacyZSmax58d/lmdBTfNjTgRA8L5FyI7fSc4ZuUr3Q87ix82PKBv046StuvYO26ZNAZIO3onEFOVIHfUF0FO+xZ2YyZYcyvFp2HwzVmR8EPmAH4o0Y2hJMuHGTAxOnhka0McKRYzOPum0y/TH5Amfrmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776498270; c=relaxed/simple;
	bh=cIzZ03P2zGZwZ7FyJ5XtuX3HZKsBflIUv4manGucLo0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Oc3xLeUFaVzeaumJ9seslSNCPJKT2eppiHwPnXGXc8X9g0veveWBLtAbjE7G1M6gC0cDLSoDQ8ldTC19SL74sGTSA+WdTZ6+4/XXjPrub7xHz4MqrYco7t62CQBZSql/+MuBxtvBUvKlAStWM6C/wpS1XTxwrVjXkLjDiB6qK1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U4gEZTF4; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U4gEZTF4"
Date: Sat, 18 Apr 2026 09:44:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776498266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RfyLHR1b6P3dpqeR5uX5nq9PtcjEJLaScYL6Vcg6P1Y=;
	b=U4gEZTF4d7ZGWQDJ1XAdWSx4mN05qsttPfX8mvop5B86FLZGROibZ2Tn8KLDCe4QAqJkbZ
	GHPoFrgMl0IClQWYKqFeyONjFiZfEerePAXsvS+bBVDPoS3FQWhK2CnWhPzjmmM3iC9316
	zWRUyedHI/qqAyFLkkacx11XPcZGfn0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Greg KH <gregkh@linuxfoundation.org>
CC: osdevhari@gmail.com, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix alignment issue in rtw_xmit.c
In-Reply-To: <2026041857-overpass-deepness-5a29@gregkh>
References: <CA+TGEkGJ4HaZZOVSXhkb93y9gdBZZf3e0G=zajdx9sAo4iBU5w@mail.gmail.com> <F7E0CC29-4E94-4759-9E3E-689AB61201F9@linux.dev> <2026041859-excretion-septic-b5a5@gregkh> <5182B112-74AC-4A7F-9D2D-79EA61B1983A@linux.dev> <2026041857-overpass-deepness-5a29@gregkh>
Message-ID: <FDF5583E-F2E0-4932-9243-526758230803@linux.dev>
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

On April 18, 2026 9:37:32 AM GMT+02:00, Greg KH <gregkh@linuxfoundation=2Eo=
rg> wrote:
>On Sat, Apr 18, 2026 at 09:29:40AM +0200, Luka Gejak wrote:
>> On April 18, 2026 9:11:40 AM GMT+02:00, Greg KH <gregkh@linuxfoundation=
=2Eorg> wrote:
>> >On Sat, Apr 18, 2026 at 08:57:08AM +0200, Luka Gejak wrote:
>> >> Hi Osdevhari,
>> >> Let's start from the top of the email=2E Firstly attachments are not=
=20
>> >> allowed, only plaintext=2E Secondly Signed-off-by tag must use your =
real
>> >> name(Firstname Lastname <email>=2E Thirdly, you should setup git=20
>> >> send-email and use it to send patches=2E One more thing why did you=
=20
>> >> resend same email twice?
>> >> Best regards,
>> >> Luka Gejak
>> >
>> >Luka, please do not review patches like this, it is not the correct wa=
y=2E
>> >Please do so, by not using AI results, and doing so in the in-line
>> >fashion, like the style of what we do=2E
>> >
>> >And there is no requirement to use git send-email=2E
>> >
>> >Your email here alone has no context at all, making it impossible to
>> >properly quote or respond to=2E  Please don't do that=2E
>> >
>> >thanks,
>> >
>> >greg k-h
>>=20
>> Hi Greg,
>> First of all it is not an ai response, and I didn't see need for=20
>> quotes because I didn't actually talk about code but if prefer quotes=
=20
>> at all times just let me know=2E And I suggested git send-email because=
=20
>> it is easier for sending patches without worrying about plaintext or=20
>> attachments=2E Also do you know how to get quotas from mailing list to=
=20
>> my phone without manually copy pasting and adding >, since I am not by
>> my laptop right now and I don't know about something like lei for=20
>> mobile=2E Also to clarify I used such tone becouse he is a begginer if=
=20
>> that is what made you think this is ai review=2E
>
>Please do not us a phone email client that can not properly handle email
>quoting for reviewing new developer's patch submissions=2E  There is no
>rush here, nor need to confuse them with a style that is not the normal
>way of development we use at all=2E
>
It can do proper quoting but it takes a lot of time to copy it=2E If I=20
was cced I would have no problem using quotes on my phone either=2E I=20
use an app called acode in which I write emails(because of formating=20
and line length) and then send it=2E
>
>And yes, the "tone" sounds like AI, please don't do that=2E
>
I understand and I won't do that anymore=2E I thought since he was a=20
begginer it would be better use such tone instead of being bold for=20
example as he would probably take it in differently=2E
Best regards,
Luka Gejak
>thanks,
>
>greg k-h

