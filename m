Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B100372EF3
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 12:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777465158; cv=none; b=fzSGAV9SI+uIQQu8Jhu4MiBeNyyf8pUeFuqasUrp1hf0ZDODs/q7QX51++szqjdpTypnrjy9Xy/2IjC/XX5vyLAmSV19Jm4VAC5vkcspWY9KcytQgr/T9jFFlb+M9Ez4BZcK6fE9Wjjh/lO1AE6RH5TDj7EOGjaiOZzHpNkgCe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777465158; c=relaxed/simple;
	bh=45Rc7YucCVseBW9mD77/J6Ks9emScWJGkPVvcnLByEM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=GoHqD8cQUyTUH/2TLeDTrcHDEgio9Fp4i8WEcyD904oqILQp98bIvZRajwKxcCQmiBPCE9VyKqCElZ+I8YkMec75jujQ8vPujNCKvMXrPwljHFK4FPHO8WShKq+9AmIU5b/y2QYZZ43v4mV64l2dGjFup44ankjsKe4FCkxX/so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XCkLc6ym; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XCkLc6ym"
Date: Wed, 29 Apr 2026 14:18:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777465152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4AtO44FUUMAw9WtUaqRhueALNI/nDbWz57GT/q6WJzA=;
	b=XCkLc6ym2ZgDDOzxVJhqm2l0dOjAZe979rpnD1mkW/Qhbb6bkJI+WVB61IJs4z8NM4NFBf
	OvvGhXIb6eSDdB4V9p11MhjVTkT78wadmF6Pf0fap3HSTaExnQoTer1h7YaRpvfDgnbNHC
	DuZuL/Fl1GSm50vdMHOXV27/4YTFiIE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Dan Carpenter <error27@gmail.com>
CC: Linus Probert <linus.probert@gmail.com>, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 luka.gejak@linux.dev
Subject: Re: [PATCH 0/8] staging: rtl8723bs: remove warnings in rtw_btcoex.h
In-Reply-To: <afH0RlRIDQdC08dV@stanley.mountain>
References: <12186A7D-522A-4900-9E4A-E2B575930A72@linux.dev> <2097F9CE-F003-4BE1-AEF5-0B30294973FB@linux.dev> <177745958799.1254637.4289009650997698120.b4-reply@b4> <FD718F1D-8156-4E27-BEE7-23E66D045A2E@linux.dev> <afH0RlRIDQdC08dV@stanley.mountain>
Message-ID: <5103B748-E9AE-4164-B81F-CB24326F3F7D@linux.dev>
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

On April 29, 2026 2:06:30 PM GMT+02:00, Dan Carpenter <error27@gmail=2Ecom>=
 wrote:
>On Wed, Apr 29, 2026 at 01:34:41PM +0200, Luka Gejak wrote:
>> On April 29, 2026 12:46:27 PM GMT+02:00, Linus Probert <linus=2Eprobert=
@gmail=2Ecom> wrote:
>> >On 2026-04-29 12:24:53+02:00, Luka Gejak wrote:
>> >> On April 29, 2026 12:18:12 PM GMT+02:00, Luka Gejak <luka=2Egejak@li=
nux=2Edev> wrote:
>> >>=20
>> >> >> This series eliminates all remaining checkpatch warnings in
>> >> >
>> >> >LGTM, so for the patch series:
>> >> >
>> >> >Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>
>> >> >
>> >> >Best regards,
>> >> >Luka Gejak
>> >>=20
>> >> One note:
>> >> For the future cleanup series, feel free to squash identical logical=
=20
>> >> changes into a single patch to keep the commit history concise=2E It=
's=20
>> >> up to Greg if he wants v2 but logic is sound as is=2E
>> >> Best regards,
>> >> Luka Gejak
>> >
>> >I will make a note of that=2E In this case what do you consider an
>> >identical logical change? What would you suggest that I squash?
>> >
>> >Br,
>> >Linus
>> >
>>=20
>> A logical change refers to the type of cleanup being done=2E In your=20
>> series, patches 3-8 all do the exact same thing: fix CamelCase names=20
>> for functions defined in rtw_btcoex=2Eh=2E Instead of 6 separate commit=
s,=20
>> those could be squashed into a single patch=2E But as I already said it=
=20
>> is up to Greg if he wants v2 or if he wants to keep v1 as is=2E Either=
=20
>> way code itself is good=2E
>
>Greg has said in the past he prefers them all as separate changes the
>way this patchset does it=2E  He recently asked somone to split up a
>typedef patch into one typedef per patch=2E
>
>regards,
>dan carpenter
>

Thanks for that information Dan, I wasn't awear of that=2E
Best regards,
Luka Gejak
