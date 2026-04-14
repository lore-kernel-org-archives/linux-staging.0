Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18263195E4
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 18:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776191159; cv=none; b=UKnDgfAq1Ahc+Qb60UJJ/zwlCRHHcESWCHPABv4Z837SAyx1PLwN7murvP7W7viMJyG1Mfwa/1lL4Dc8l001kgkdFeGPAqik6j5OtL91OpQNu2Zb583Sq+BGzC0TNl+S9HphiQhUTEPqp8NUZ+S13sF5fCWqGygvu23ee3S87Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776191159; c=relaxed/simple;
	bh=qkwno9oZ5IjKwRfen0IHxF9GquAsKUSZ9xN90as+FqU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=aLU6uvqfoXgUHG61YPBzHXuodp4/9UyWNFZh6p/Dal9a/t+4uBcfvu1sHk+2KOwFNhrqaXZxY2cQWlTHtdnIjzS+hwN9wps/eZFJSt0P7p3+5OPsK+Evz9SfEXPIlmubm2aNSFbDhz+/5nJogyDyjP6MJwqBTmbpVcVPCwJFdzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nWewXWH1; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nWewXWH1"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776191155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XO5cFVkWr2ixhXIMehvpmm5AeimZ/rMG2w2mJSGWyUo=;
	b=nWewXWH1pprjTpTNJjzX9XdWwdyYP8B0RDNzoXE7rKRNBgTWI19iGWou+ab9JsQGa6XiYW
	I+ajy2eqbwzVYMUO6NSwZ/9sp9LnOOYJPEB2cij9KMPrpZ7oKld9mKoQ36WUU1OYOLPVfx
	hNniQg293wMymL/o2Z0DHO5qJX3yuRk=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 20:25:51 +0200
Message-Id: <DHT37Q73Q6XI.2OOT8UCWAD7TD@linux.dev>
Subject: Re: [PATCH 6/9] staging: rtl8723bs: fix Yoda conditions and ==
 false comparisons
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, "Marc Finkelbaum"
 <regpacy@gmail.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Michael Straube"
 <straube.linux@gmail.com>, "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Ethan Tidmore" <ethantidmore06@gmail.com>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20260414095833.76480-1-regpacy@gmail.com>
 <20260414095833.76480-7-regpacy@gmail.com>
 <ad4xYmCJGXuLVJWM@ashevche-desk.local>
In-Reply-To: <ad4xYmCJGXuLVJWM@ashevche-desk.local>
X-Migadu-Flow: FLOW_OUT

On Tue Apr 14, 2026 at 2:21 PM CEST, Andy Shevchenko wrote:
> On Tue, Apr 14, 2026 at 12:58:30PM +0300, Marc Finkelbaum wrote:
>> Replace reversed comparisons with natural-order equivalents:
>>   - '0xFF =3D=3D hw_channel_plan' -> 'hw_channel_plan =3D=3D 0xFF'
>>   - 'false =3D=3D pHalData->bDisableSWChannelPlan' -> '!pHalData->...'
>>   - 'is_supported_24g(...) =3D=3D false' -> '!is_supported_24g(...)'
>>=20
>> The multi-line if condition around bDisableSWChannelPlan is also
>> reformatted to standard kernel one-line style.
>>=20
>> No functional change.
>
> ...
>
>> -	if (
>> -		(false =3D=3D pHalData->bDisableSWChannelPlan) &&
>> -		rtw_is_channel_plan_valid(sw_channel_plan)
>> -	)
>> +	if ((!pHalData->bDisableSWChannelPlan) &&
>
> Too many parentheses.
Also does too many things at once(reversing yoda style, simplifying=20
boolean expresions) therefore should be splited to 2 patches addressing=20
2 different types of cleanups.
Best regards,
Luka Gejak
>
>> +	    rtw_is_channel_plan_valid(sw_channel_plan))
>>  		chnlPlan =3D sw_channel_plan;

