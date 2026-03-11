Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AE43CF02A
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 10:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773225487; cv=none; b=E7vlvq8A9eLFPLrKqkEoel/iro/tEqmSl5m97h/gz8RmD+/t2jzvLgLYIZd8VgF300Tohxr2JH43hnH3b3mH7ubgeUFA8CmKmT5B3nniU4pnV9k1zor9VWFz8nfzua0K0RSTYPHAQZQcS9zBmxEMP8Xl5FnIRDfVB1lnA0AyOoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773225487; c=relaxed/simple;
	bh=Cz2zf/7mSrAz9uGg+Xwel5rg3kNtX9WGE5IjyLQW2KQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=jrQYfzQ/KCrjCDfB8prhCo9E9MIHEp2gPLJIAbg3ApuHfWRzJHqo+O/VrGh76vaJIf6vQsvVdwZhpF0oN/Y5i1fjM3DLK+zdH2U8TeSFH2f15NvcZcCkLZr72rrRlZ9lEXjsPKQgNHYe5mpDG7pi9oya2OGPfOOEJwJqM+fEmf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GGYoZ+W5; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GGYoZ+W5"
Date: Wed, 11 Mar 2026 11:37:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773225483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oYzUq896wnSFOa4XFKKdbo/+qjGbApN5p3m+u5hX1Gc=;
	b=GGYoZ+W52R3t89J8BEd9IZR91X3t/7dIpk6Bc4zl7HyUNH2BCEo82664udzz0gRck1NoTV
	xzZ8mdodqeni7U+aq1m7T+V12lzfsEP2LKaNhUN14caVaH37/hbN3ihNG8ibHOi3X7moVV
	FXfjPvRjmhrp88ECrJ2A3w2h0lV8BZQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Dan Carpenter <dan.carpenter@linaro.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: I need piece of advice regarding rtl8723bs
In-Reply-To: <2026031119-retract-obnoxious-0306@gregkh>
References: <270B444B-3171-4FEB-A43F-CD33DFFAB518@linux.dev> <abEhz7LVGlwyTdir@stanley.mountain> <0A9F09AD-0082-489F-878A-0899CB6F7413@linux.dev> <2026031119-retract-obnoxious-0306@gregkh>
Message-ID: <7EDA54AE-0AC0-43D5-8817-396C35C17266@linux.dev>
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

On March 11, 2026 10:27:29 AM GMT+01:00, Greg Kroah-Hartman <gregkh@linuxfo=
undation=2Eorg> wrote:
>On Wed, Mar 11, 2026 at 10:13:41AM +0100, Luka Gejak wrote:
>> On March 11, 2026 9:03:27 AM GMT+01:00, Dan Carpenter <dan=2Ecarpenter@=
linaro=2Eorg> wrote:
>> >On Wed, Mar 11, 2026 at 08:21:47AM +0100, Luka Gejak wrote:
>> >> Hi Greg,=20
>> >> Sorry if I am taking a lot of your time or disrupting your workflow,
>> >> but I would like a piece of advice regarding staging/rtl8723bs=2E As
>> >> you may already know(or you may not), I am working on port of
>> >> rtl8723bs to mac80211 architecture=2E I am currently on stage on
>> >> getting wifi scans to work(I can bring up interface, and I believe
>> >> that I am close to getting scans working as well) so I want to ask
>> >> you if you recommend making patches for staging/rtl8723bs as once I
>> >> finish the driver and begin process of upstreaming it
>> >> staging/rtl8723bs will be irrelevant/deleted(or will it?)=2E
>> >> Thank you for your time, Luka Gejak
>> >
>> >I'm not 100% sure what you are asking=2E=2E=2E
>> >
>> >If you want to port rtl8723bs to mac80211, that's great=2E  We love
>> >that=2E  When it's ready we can review it=2E
>> >
>> >Until then people are free to change staging/rtl8723bs if they want to=
=2E
>> >Your work on the port is future work=2E  We can't really be confident =
of
>> >anything that will happen in the future so we just go on with what we
>> >have=2E
>> >
>> >When your driver is merged and it supports all the hardware that
>> >staging/rtl8723bs does then we'll drop the staging driver=2E  We never
>> >keep two drivers for the same code=2E
>> >
>> >regards,
>> >dan carpenter
>>=20
>> Hi Dan,
>> Let me clarify, I am decently sure that I can make driver work and I
>> want to ask if I should focus of development of that driver or if I
>> should take time to contribute to staging/rtl8723bs as well=2E
>
>That's your decision to make, we can't tell anyone what to spend their
>time on :)
>
>That being said, converting the existing driver, in-place, is probably a
>harder task than doing a new one "from scratch", if previous attempts
>are any indication=2E  But that all depends on the developer involved=2E
>So, it's your call=2E
>
>thanks,
>
>greg k-h

Hi Greg,
Thank you for responding, I am actually writing it from scratch, and I bel=
ieve I am going to spend my time working on the driver as I believe it will=
 bring more good in the long run and because I believe I will get it workin=
g in near future=2E
Sincerely, Luka Gejak
