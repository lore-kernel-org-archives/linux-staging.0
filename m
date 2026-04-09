Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AF02C08C8
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 15:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775748776; cv=none; b=cNxbbE7vGoIaMkDLEJR/TMerSoRrFxLKvYYinWN/Bg+n8GRuLmgWieBip3cgnxRDoRkhBZIzZ6IHU+XlRAQoOwFj/Co53qfTVbKdCPyMcgXYW2UmkyYoucKqPqJ6siMNAryRZ/RYUJjIMuXbCxvSlg/GAphQHj45mOJXwXgtZxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775748776; c=relaxed/simple;
	bh=AAQQ8+M+0PAfKmoHFStPlQxBCFzxXjoiAkD0yRNu0G4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=DijqAoJQKHpLuxbr0HDk/XFTRfnq7DmVsp7Le5eA9wks0Fc2WQTWQ2lqRTpE57HKUaeaXdQahMn2twr9rUSHIIOYr5uwb//EgoWY6NmBkR7SY3NbgvNJTLvUh+aEZVVu4yOL3TKAiQEK+eaKmwTxbOPKuCa/WW2fp0+ObHOUJZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=v++8higk; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="v++8higk"
Date: Thu, 09 Apr 2026 17:32:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775748763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AAQQ8+M+0PAfKmoHFStPlQxBCFzxXjoiAkD0yRNu0G4=;
	b=v++8higktVjCAzT6mClMMydPl4M+zEw1+UugFSr+gREOuVSJVFZoh9twIWCdaq+i5jWl7A
	L3hyPpZ8GdmqUbbefBSU5kj+24cr6tQih3VXUQQDihB3yKVgrYGm9uwfHsVEfFeLy8hVjt
	a24hHSvjMiNkYrgGDVpTZ9zCGM8W3oE=
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
In-Reply-To: <20260409153010.loz3kreihhr44mip@inspiron>
References: <20260409135026.137904-1-activprithvi@gmail.com> <DHOOTLM62TV2.2JOOAA5UQG410@linux.dev> <20260409145045.44r4f5bleklkk4ha@inspiron> <2AEE6A74-3C08-45A6-BA28-55BDE5072EC5@linux.dev> <20260409153010.loz3kreihhr44mip@inspiron>
Message-ID: <1A1640BF-F825-4CEC-B03A-40D0A2EBB3C2@linux.dev>
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

On April 9, 2026 5:30:10 PM GMT+02:00, Prithvi <activprithvi@gmail=2Ecom> w=
rote:
>On Thu, Apr 09, 2026 at 04:57:20PM +0200, Luka Gejak wrote:
>> On April 9, 2026 4:50:45 PM GMT+02:00, Prithvi <activprithvi@gmail=2Eco=
m> wrote:
>> >On Thu, Apr 09, 2026 at 04:18:28PM +0200, Luka Gejak wrote:
>> >> On Thu Apr 9, 2026 at 3:50 PM CEST, Prithvi Tambewagh wrote:
>> >> > This patch series focuses on code cleanup in drivers/staging/rtl87=
23bs,
>> >> > majorly focusing on fixing checkpatch warnings of constant being o=
n right
>> >> > side of test in comparisons, deletion of empty if block ,use of
>> >> > read_poll_timeout_atomic(), and other code simplifications=2E
>> >> >
>> >> > Changes since v3:
>> >> > - Rebased the patches on top of staging-next
>> >> > - Remove compilation output from cover letter
>> >> > - Add changes in each patch version in cover letter
>> >> >
>> >> > v3 link: https://lore=2Ekernel=2Eorg/linux-staging/1D11A73B-4869-4=
7DB-B8F5-FB3F0D7FF932@linux=2Edev/T/#m3190af744bc1e1f151e9e8503c7d20951fe27=
534
>> >>=20
>> >> =2E=2E=2E
>> >>=20
>> >> Hi Prithvi,
>> >> this seems better, but I have one question=2E Did patch series appea=
r on=20
>> >> mailing list to you, because I cant find it and my emails sent today=
=20
>> >> don't appear either=2E Not to be misunderstood I don't believe this =
is=20
>> >> your fault but I would like to know if you are experiencing the same=
=20
>> >> problem=2E
>> >> Best regards,
>> >> Luka Gejak
>> >
>> >Hi Luka,
>> >
>> >I just observed I am also facing the same issue - I am not able to see=
 the=20
>> >patch series on the mailing list, no idea why :( However I received th=
e=20
>> >sent patches as well as your reviewed by tags on mail but I am not sur=
e why=20
>> >the patch series is not visible on the mailing list=2E
>> >
>> >Shall I resend the patch series?
>> >
>> >Best Reagrds,
>> >Prithvi
>>=20
>> Not necessarily, that is probably caused by mailing list lagging=20
>> behind, so let's just wait and see(it should stop lagging in some=20
>> time)=2E Patches as well as reviews should appear then=2E Also, did you=
=20
>
>Okay=2E=2E=2Ethanks
>
You are always welcome=2E
>> receive two emails per patch from me or one because my email client is
>> saying two=2E
>
>I received just one email per patch from you
>
Thanks for the info, I guess my email client is messing with me for=20
this patch series(idk why)=2E
>> Best regards,
>> Luka Gejak
>
>Best Reagrds,
>Prithvi

