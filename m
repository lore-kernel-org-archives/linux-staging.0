Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5A03D4107
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 15:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775749485; cv=none; b=AJTCzmZh+hU5h/MyOGnhjY8NOXlJZ/nOCUyxhWjrzNJlTjG0MpF/tfjA5vM7voBxMje238uNss6hCLxbfN4FiEf9Atio6YZvl0+CkUvsJ1RC+JTjwAcCntH3qONEJnwXADLYCj3MXr0Jw1yLAjTUZIaG0EJZVfc2m3dUTXc4qJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775749485; c=relaxed/simple;
	bh=TIZFOyEYyWssZ5uOMnpk9bf955sI3WL1yuQBa0I+Qpc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=rxPLWLyOpuXYozDcJIYGXkUO2PITgtCRrlavq5B2a3KVFgBJ8KiMQzAH6bQERrBMzX8HBzluxjb3ko6XASC/zxW1vRZK0TDqte9UpLrOrCBfRDx5pS9Lt+4dONRbhy8Da+/zC1pqeLGVVPh+ZNAFwO4kNdoDF1AG+6LRL3X4ZzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fpVgXOMd; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fpVgXOMd"
Date: Thu, 09 Apr 2026 17:44:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775749479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TIZFOyEYyWssZ5uOMnpk9bf955sI3WL1yuQBa0I+Qpc=;
	b=fpVgXOMdQfuAsKNMhENjv9B0QfajcTqeynaUdRr1IcAmaIVvKUi33Qk8hO6h5a1KUUPX7k
	0VBJ7YV1Cdo0QBwqTFwyauviJu8wuo+5F8B0Hj+sdTTffFDMvxzmbo5+JnxaKHaAaFfDkN
	y37KtRGdJwXeOfB8IJn+8rwPJaiMs5Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Prithvi <activprithvi@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
CC: abrahamadekunle50@gmail.com, b9788213@gmail.com, straube.linux@gmail.com,
 tmimiharoen@gmail.com, filippo.muschera@gmail.com, ethantidmore06@gmail.com,
 andriy.shevchenko@linux.intel.com, rayfraytech@gmail.com,
 david@cardinalsystem.net, weibu@redadmin.org, dharanitharan725@gmail.com,
 ignacio.pena87@gmail.com, dan.carpenter@linaro.org, karanja99erick@gmail.com,
 khushalchitturi@gmail.com, suunj1331@gmail.com, s9430939@naver.com,
 nikolayof23@gmail.com, bryant.boatright@proton.me, ysinghcin@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_0/5=5D_staging=3A_rtl8723bs=3A_C?=
 =?US-ASCII?Q?ode_cleanup_in_drivers/staging/rtl8723bs?=
In-Reply-To: <20260409153958.6wmjiu4jcghtyeom@inspiron>
References: <20260409135026.137904-1-activprithvi@gmail.com> <DHOOTLM62TV2.2JOOAA5UQG410@linux.dev> <20260409145045.44r4f5bleklkk4ha@inspiron> <2026040942-slicer-rake-4056@gregkh> <20260409153958.6wmjiu4jcghtyeom@inspiron>
Message-ID: <D767F902-D249-4F93-A230-D432DB0423F9@linux.dev>
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

On April 9, 2026 5:39:58 PM GMT+02:00, Prithvi <activprithvi@gmail=2Ecom> w=
rote:
>On Thu, Apr 09, 2026 at 05:02:16PM +0200, Greg KH wrote:
>> On Thu, Apr 09, 2026 at 08:20:45PM +0530, Prithvi wrote:
>> > On Thu, Apr 09, 2026 at 04:18:28PM +0200, Luka Gejak wrote:
>> > > On Thu Apr 9, 2026 at 3:50 PM CEST, Prithvi Tambewagh wrote:
>> > > > This patch series focuses on code cleanup in drivers/staging/rtl8=
723bs,
>> > > > majorly focusing on fixing checkpatch warnings of constant being =
on right
>> > > > side of test in comparisons, deletion of empty if block ,use of
>> > > > read_poll_timeout_atomic(), and other code simplifications=2E
>> > > >
>> > > > Changes since v3:
>> > > > - Rebased the patches on top of staging-next
>> > > > - Remove compilation output from cover letter
>> > > > - Add changes in each patch version in cover letter
>> > > >
>> > > > v3 link: https://lore=2Ekernel=2Eorg/linux-staging/1D11A73B-4869-=
47DB-B8F5-FB3F0D7FF932@linux=2Edev/T/#m3190af744bc1e1f151e9e8503c7d20951fe2=
7534
>> > >=20
>> > > =2E=2E=2E
>> > >=20
>> > > Hi Prithvi,
>> > > this seems better, but I have one question=2E Did patch series appe=
ar on=20
>> > > mailing list to you, because I cant find it and my emails sent toda=
y=20
>> > > don't appear either=2E Not to be misunderstood I don't believe this=
 is=20
>> > > your fault but I would like to know if you are experiencing the sam=
e=20
>> > > problem=2E
>> > > Best regards,
>> > > Luka Gejak
>> >=20
>> > Hi Luka,
>> >=20
>> > I just observed I am also facing the same issue - I am not able to se=
e the=20
>> > patch series on the mailing list, no idea why :( However I received t=
he=20
>> > sent patches as well as your reviewed by tags on mail but I am not su=
re why=20
>> > the patch series is not visible on the mailing list=2E
>> >=20
>> > Shall I resend the patch series?
>>=20
>> No, please wait, lore=2Ekernel=2Eorg is currently having some problems=
=2E
>>=20
>> But next time, trim your "who do I cc:" list, as it is _way_ too big,
>> how did you generate it?
>>=20
>> thanks,
>>=20
>> greg k-h
>
>Understood=2E=2E=2Ehere I used all the email addresses generated from the=
=20
>get_maintainer=2Epl script=2E Next time, I'll be sure to trim it down jus=
t to=20
>maintainers and reviewers=2E
>
>Thanks,
>Prithvi

Upon testing myself, get_maintainer=2Epl doesn't list all of those=20
people when ran on a directory or a file in staging=2E
Best regards,
Luka Gejak
