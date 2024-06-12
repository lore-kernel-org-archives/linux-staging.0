Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7299933FE
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 05:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718169386; cv=none; b=pUyGn/PKZAxZMCImLxqBSVQ0rIVVL0fNEYu9aZ5o17kk5cnfOUEken1QCgMTuswCQMv2X28YTvYVIofj6bGyLzMiR+r3W8zdPWS5A79To9nMfZxjC6Y16ujFCXHU18Ow7xh244RSPxrFcl7GNDoyZGEBMufYTzNyWyHHxZpO5Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718169386; c=relaxed/simple;
	bh=PBf0KAybPfLyDnYoXoraZ4lElNIz9Iuwr81R49ijdaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RF1xGfcoY5Z880VAIDwZ3jqhI9SQKZtF9FyBNNl+CK1wgLQhCeVpLCMkb0IShgLosryQzYfcNhzI8Q+5lUtnm14qfhE8z1ncOW7JnIIygHU9TtfgKsg6WEpULNB18lFyi6mx++C92vbUnxEfA64XjvsvA7sKJBdRKY8Zno6JSqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=HfInmwar; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="HfInmwar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718169377; x=1718774177; i=wahrenst@gmx.net;
	bh=JewhlvjW0n+mhwRmJq2Gb9g5vdkIgvekjqQ0bR6SFok=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HfInmwarExiPOjXuBzNEQvrJFLJMpNwgE6k6/ZpRdcUPIzekTCsxHOvEdDGaiRvi
	 tfmuy9CMO+ib+S97MAHXbOT99PK1E77AgLtJMfgfwi5Sau5d55HaJEoSrZbmC9KPR
	 v31QJFt9uQlGPPJZonez6jO+bby9oPKdXPU2HMhpSZ+KjUl5pgVxYI0qY4H3Ndcy/
	 a4fQXk8k8u+PPhX+wQL9izHf860FmJ+qRiBWWrTEQgxheujFcOR5TcqVZKItBBiEH
	 Ib2k2NQ3IHQxMfQTrrJTLTjy1d2WqiFNKwC0FR5ELSQI7hUZ2ZHDgjethMJlAAkvn
	 N1wRDS7PVoxRuooXJA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mt75H-1sWaGu17yj-0154rg; Wed, 12
 Jun 2024 07:16:17 +0200
Message-ID: <eaeb19b0-beff-4931-a6c1-102341ca3999@gmx.net>
Date: Wed, 12 Jun 2024 07:16:16 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 07/10] staging: vchiq_arm: Reduce indentation of
 service_callback
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20240610210220.95524-1-wahrenst@gmx.net>
 <20240610210220.95524-8-wahrenst@gmx.net>
 <01190bf2-c698-423a-b587-c80ce5d92bb8@moroto.mountain>
 <20240611212347.GG10397@pendragon.ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240611212347.GG10397@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hFZozqts5tJACvR49E62qIG3Zo25XuaVN+5HPZxPbt17nWuyx5S
 yC0lWU42jU7uxZuFgtTeVMAUB6fkj2c12mnaHlWlnn2h86N0WSZEppZeEGpUvETwhEWC+JU
 PCiVx8rV6qY8Y6nVwHeVXPQfX3L/M+FAD6GgMtlGh/vOS8vG94klpKvtU6jHpv4TRAvw1Dv
 0fVlZAq40M42/aTCNIJtQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7YQeRvAJwjQ=;gYvH8x6wmqdLXRPnef6xF07d78m
 7SaFNmsyzqsLF663VemsRQ6IFIHWDIQxU8I71Bc/nYknubdBekzPR1E9GV5Sw+jVp2z5n1e/4
 /9ACNr0lLMTOyHIuSjHl3Hvd5hcqkRdsBJWejZkDQEAXjzW4cnPWryEqbpYMjTrLc8kj3dECp
 ppbdH83A4bON+VhRj/NK4Yw5kcGaX0Wg5GDPA46008rlN0E7PSUXteYA5WbRHFWEb20n4gnSR
 DbmbCo7tnM0yFY9dt7R5bCFa0FwYSrLmqvRtw4WDby3C6fdac6ZDntW9zm0Aw6M/ukLNJZHra
 EqwMZqti46SJO+F3S9EgfCg/oG0ml7F+1ms2N4Dpv2xUYu1J2YV+GBeAu6EP2B6kQswYq2v9v
 RKtjrk7+AXi0guW08K7dkoVovOx+StvLHxHFI1xvxnXrERWots7yppu+fFFrYEjfzzkgU2mZ5
 fRMxS54kSJbrh1TCrfeLkqEh41BOnDkEnp02zkkzB3QqtaeBCdT8XghrKCzIfLG1rui/pe6Xl
 udgUNhzDK2mNYTjeShL5HtugWT3mTIlVmF6ElMGd6/+7HANhICE9NnjJo1vnnYiddaL+xRPny
 JxJSEMUm7eUD/v4X1ArLI8ICpfHTGGaJeoyO56hRnC7g3UQ7/3Q6rpYJfIaf91iQApDXfCigg
 8+S9B8svRMZ1uDchr5AQVLrInAU3al8HTyemU9EPj/mh2/QM9Z2yYposnGG5JeuIRyLmGn7Z2
 pa0oOSVzx6qWhfQDxY1oJ9fUpfemogg16ufkbglXKbKp9vBuVkW3u37ZqAqmJxd4Ipba559iI
 5Z/9TIxyhzEPff5Pzj5WrWwvU+lo7kihf3SCfU0vM9gjo=

Hi,

Am 11.06.24 um 23:23 schrieb Laurent Pinchart:
> On Tue, Jun 11, 2024 at 09:04:28AM +0300, Dan Carpenter wrote:
>> On Mon, Jun 10, 2024 at 11:02:17PM +0200, Stefan Wahren wrote:
>>> The service_callback has 5 levels of indentation, which makes it
>>> hard to read. Reduce this by splitting the code in a new function
>>> service_single_message() as suggested by Laurent Pinchart.
>>>
>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> To be honest, I liked the version of this patch which Laurent didn't
>> like.  Even after pulling this code into a separate function, I'd still
>> support flipping the conditions around and adding the goto...
>>
>> Laurent, you really didn't like the goto?
> I won't nack it, but I really think gotos seriously hinder readability,
> with the exception of error paths.
>
so at least you both are fine with the split approach here (assuming the
Dan's comment will be fixed in V3)?
