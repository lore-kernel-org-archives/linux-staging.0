Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252A134B40F
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775746674; cv=none; b=Y/afhFvM8se+evCzYG/AiiYoBbAIKR9G5JNYmxJ0VgLwcIqnEpZu1bieQTgDsRGxkR1XyBht7SKYknKhiQD13x7fgUc5TDAP3oCJP1pEolQMhbtJh/eXN1hs50TBhnUu3WeowKrEes9Mk1yLhs1nfRdy7X9mgkCGiWLcxqPRiWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775746674; c=relaxed/simple;
	bh=SKD2+tHFAHxpNYLOT1Jd1cUxPK+waeacqj1X0qNJxIQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=nWF6Q/ccIaZ04YdQADhPazDe5LmQBSkGq1hR9p0gaqB2rwzIjScUEWw3etTHno2502QE4OLC5BvHZ+0gR9S0PQi/kaCWEFK9TyQUGvYviF8IAC8Zgq3Vu+DwZ+hR+B29lpm4ml90Ax6wcgqfzbv7GPARKDhkr6tfgK2XEUegXqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hEUxaVCE; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hEUxaVCE"
Date: Thu, 09 Apr 2026 16:57:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775746660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SKD2+tHFAHxpNYLOT1Jd1cUxPK+waeacqj1X0qNJxIQ=;
	b=hEUxaVCEVug8jvBEfH4ceZ9zxti8+Xd/HVj80bORYvnk5MR/Gq8LtFYwDm+rIlWbuQpaFx
	/lLmeCO6v0XUw5MdP5pkI4oX/2YuiOhLoZEBBWNzGxr8RW6dG4ZALWBLnswrYwtovrSb43
	WqC/65F55Pcpoc4DHEaIgW1y8S5XlG4=
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
In-Reply-To: <20260409145045.44r4f5bleklkk4ha@inspiron>
References: <20260409135026.137904-1-activprithvi@gmail.com> <DHOOTLM62TV2.2JOOAA5UQG410@linux.dev> <20260409145045.44r4f5bleklkk4ha@inspiron>
Message-ID: <2AEE6A74-3C08-45A6-BA28-55BDE5072EC5@linux.dev>
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

On April 9, 2026 4:50:45 PM GMT+02:00, Prithvi <activprithvi@gmail=2Ecom> w=
rote:
>On Thu, Apr 09, 2026 at 04:18:28PM +0200, Luka Gejak wrote:
>> On Thu Apr 9, 2026 at 3:50 PM CEST, Prithvi Tambewagh wrote:
>> > This patch series focuses on code cleanup in drivers/staging/rtl8723b=
s,
>> > majorly focusing on fixing checkpatch warnings of constant being on r=
ight
>> > side of test in comparisons, deletion of empty if block ,use of
>> > read_poll_timeout_atomic(), and other code simplifications=2E
>> >
>> > Changes since v3:
>> > - Rebased the patches on top of staging-next
>> > - Remove compilation output from cover letter
>> > - Add changes in each patch version in cover letter
>> >
>> > v3 link: https://lore=2Ekernel=2Eorg/linux-staging/1D11A73B-4869-47DB=
-B8F5-FB3F0D7FF932@linux=2Edev/T/#m3190af744bc1e1f151e9e8503c7d20951fe27534
>>=20
>> =2E=2E=2E
>>=20
>> Hi Prithvi,
>> this seems better, but I have one question=2E Did patch series appear o=
n=20
>> mailing list to you, because I cant find it and my emails sent today=20
>> don't appear either=2E Not to be misunderstood I don't believe this is=
=20
>> your fault but I would like to know if you are experiencing the same=20
>> problem=2E
>> Best regards,
>> Luka Gejak
>
>Hi Luka,
>
>I just observed I am also facing the same issue - I am not able to see th=
e=20
>patch series on the mailing list, no idea why :( However I received the=
=20
>sent patches as well as your reviewed by tags on mail but I am not sure w=
hy=20
>the patch series is not visible on the mailing list=2E
>
>Shall I resend the patch series?
>
>Best Reagrds,
>Prithvi

Not necessarily, that is probably caused by mailing list lagging=20
behind, so let's just wait and see(it should stop lagging in some=20
time)=2E Patches as well as reviews should appear then=2E Also, did you=20
receive two emails per patch from me or one because my email client is
saying two=2E
Best regards,
Luka Gejak
