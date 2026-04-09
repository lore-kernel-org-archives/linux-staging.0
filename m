Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19463DE44D
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775749367; cv=none; b=UUe23T8XvpXxq3ItaU2s3ni+W0p7Q9JggV7KekOY2vI+PqbsFZuhwsaeN8uqbG2dGi8Qo1QKWju19V67NZmxqFDnWAAgeBH+iQ35UaQZDLPAlzbRSEDbhKLCeCKUQFvGDYK7kXyJKEWRyeaL1ECAJPKAnlXBwNyMZAc13oDF098=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775749367; c=relaxed/simple;
	bh=zlfYdqWvF9wKFfZB9ec1KsgAvxKEz7Tf82bbjQjk/6Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=csZcfLL962eeANEZc2Nazh5dpR2KmW873aFd/OnShQ59LWnMiHF27l5YdhRZR3uR4alNWue/LDVzezgTFZjHBtAmEZMenM19elXb7dWa8TiUMGzosCceABKEfX7EJ465+8FGIF3Q8NFLWjSdgqpzGWxmcbzaKIvlx/rwm1Khcgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mcIwQm3s; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mcIwQm3s"
Date: Thu, 09 Apr 2026 17:42:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775749362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zlfYdqWvF9wKFfZB9ec1KsgAvxKEz7Tf82bbjQjk/6Y=;
	b=mcIwQm3sO8sYm0FEeb96nBg2NjPPnBhdo9xqms1LcoKARAeAhZ+UZya6sb/SPRNemwFBZw
	SjIWJqIV1pcgOA8zbSmSfQM0KK6fTCC9psEHvi4sBfLmQnYq1V2g9kCXbIUq4EHQp7E+tT
	8Ps0e+4lmi7n8U8oNYwq52mvoZGUFYk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Prithvi <activprithvi@gmail.com>
CC: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com, b9788213@gmail.com,
 straube.linux@gmail.com, tmimiharoen@gmail.com, filippo.muschera@gmail.com,
 ethantidmore06@gmail.com, andriy.shevchenko@linux.intel.com,
 rayfraytech@gmail.com, david@cardinalsystem.net, weibu@redadmin.org,
 dharanitharan725@gmail.com, ignacio.pena87@gmail.com,
 dan.carpenter@linaro.org, karanja99erick@gmail.com,
 khushalchitturi@gmail.com, suunj1331@gmail.com, s9430939@naver.com,
 nikolayof23@gmail.com, bryant.boatright@proton.me, ysinghcin@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_0/5=5D_staging=3A_rtl8723bs=3A_C?=
 =?US-ASCII?Q?ode_cleanup_in_drivers/staging/rtl8723bs?=
In-Reply-To: <1A1640BF-F825-4CEC-B03A-40D0A2EBB3C2@linux.dev>
References: <20260409135026.137904-1-activprithvi@gmail.com> <DHOOTLM62TV2.2JOOAA5UQG410@linux.dev> <20260409145045.44r4f5bleklkk4ha@inspiron> <2AEE6A74-3C08-45A6-BA28-55BDE5072EC5@linux.dev> <20260409153010.loz3kreihhr44mip@inspiron> <1A1640BF-F825-4CEC-B03A-40D0A2EBB3C2@linux.dev>
Message-ID: <7AF29D64-24E7-4689-98AC-0AAA51CEDAA6@linux.dev>
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

On April 9, 2026 5:32:33 PM GMT+02:00, Luka Gejak <luka=2Egejak@linux=2Edev=
> wrote:
>On April 9, 2026 5:30:10 PM GMT+02:00, Prithvi <activprithvi@gmail=2Ecom>=
 wrote:
>>On Thu, Apr 09, 2026 at 04:57:20PM +0200, Luka Gejak wrote:
>>> On April 9, 2026 4:50:45 PM GMT+02:00, Prithvi <activprithvi@gmail=2Ec=
om> wrote:
>>> >On Thu, Apr 09, 2026 at 04:18:28PM +0200, Luka Gejak wrote:
>>> >> On Thu Apr 9, 2026 at 3:50 PM CEST, Prithvi Tambewagh wrote:
>>> >> > This patch series focuses on code cleanup in drivers/staging/rtl8=
723bs,
>>> >> > majorly focusing on fixing checkpatch warnings of constant being =
on right
>>> >> > side of test in comparisons, deletion of empty if block ,use of
>>> >> > read_poll_timeout_atomic(), and other code simplifications=2E
>>> >> >
>>> >> > Changes since v3:
>>> >> > - Rebased the patches on top of staging-next
>>> >> > - Remove compilation output from cover letter
>>> >> > - Add changes in each patch version in cover letter
>>> >> >
>>> >> > v3 link: https://lore=2Ekernel=2Eorg/linux-staging/1D11A73B-4869-=
47DB-B8F5-FB3F0D7FF932@linux=2Edev/T/#m3190af744bc1e1f151e9e8503c7d20951fe2=
7534
>>> >>=20
>>> >> =2E=2E=2E
>>> >>=20
>>> >> Hi Prithvi,
>>> >> this seems better, but I have one question=2E Did patch series appe=
ar on=20
>>> >> mailing list to you, because I cant find it and my emails sent toda=
y=20
>>> >> don't appear either=2E Not to be misunderstood I don't believe this=
 is=20
>>> >> your fault but I would like to know if you are experiencing the sam=
e=20
>>> >> problem=2E
>>> >> Best regards,
>>> >> Luka Gejak
>>> >
>>> >Hi Luka,
>>> >
>>> >I just observed I am also facing the same issue - I am not able to se=
e the=20
>>> >patch series on the mailing list, no idea why :( However I received t=
he=20
>>> >sent patches as well as your reviewed by tags on mail but I am not su=
re why=20
>>> >the patch series is not visible on the mailing list=2E
>>> >
>>> >Shall I resend the patch series?
>>> >
>>> >Best Reagrds,
>>> >Prithvi
>>>=20
>>> Not necessarily, that is probably caused by mailing list lagging=20
>>> behind, so let's just wait and see(it should stop lagging in some=20
>>> time)=2E Patches as well as reviews should appear then=2E Also, did yo=
u=20
>>
>>Okay=2E=2E=2Ethanks
>>
>You are always welcome=2E
>>> receive two emails per patch from me or one because my email client is
>>> saying two=2E
>>
>>I received just one email per patch from you
>>
>Thanks for the info, I guess my email client is messing with me for=20
>this patch series(idk why)=2E
>>> Best regards,
>>> Luka Gejak
>>
>>Best Reagrds,
>>Prithvi
>

I want to add that as the mailing list is slowly getting uncluttered,=20
the patch series appeared, and it applies cleanly on top of the=20
staging-next=2E
Best regards,
Luka Gejak
