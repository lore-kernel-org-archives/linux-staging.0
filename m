Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B532838B7B3
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 09:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036830; cv=none; b=LuTr5/viHi9gReNJ9fb/H1rKuebMBHi2fMZ3UVlnkPOd2IEPkjzgD9ddc4WitmEcdvq3BAQBmYfDg6vJ57akpQiZcI7iL9yk6an6XrwG3IqyiKFPSVZp3IB9T83/5RNxHXDJRFaP6/w6zTtYVz0/0RKsRWz83stQUICet/eBbOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036830; c=relaxed/simple;
	bh=gV29aA0F49WvizgdXTFBJ39BqQKP3arJO+tBvQ/foMI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=UXUKSkl2OMaF3lpDXZukJbnm5jtas0k+89T8ZDJElfak4Erlwd+M6i6fV+pzo3lrAGkoMSOVVVh6NUBLqS5iPWfsEOgifgolERmY8qVFX0JnfbPvG40rd42388H6b4GUjC+iOKkZN/7GbSl0TlUGYNBqU0n5WIU8UcXjFj3mdfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sM0e9nzC; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sM0e9nzC"
Date: Wed, 01 Apr 2026 11:46:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775036827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XuZVRNkcYSjuy9wpL5Z6iKgYbguwWgjBv7neU//wlIo=;
	b=sM0e9nzCzwhi7IEkbz4JXxcQwUS+Z7+BVfJ2yAMap9DMySss8V5tsj+BePP5ZjC5vf2sNH
	+Y5fPuL0IlyfaSFJX7fof/cTgz+kcGwHKnr36/PtBlwQoOVgagL2InUgOD40xG/T/fzbdp
	xEveBFfI3xb8XzET0BHBYLrR66haxwQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Greg KH <gregkh@linuxfoundation.org>
CC: omer.e.idrissi@gmail.com, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/5] rtw_sdio_if1_init cleanup and small logic tweak
In-Reply-To: <2026040119-smasher-oozy-8d41@gregkh>
References: <B2394A3C-25FD-4CEA-8557-3E68F1F60357@linux.dev> <2026040119-smasher-oozy-8d41@gregkh>
Message-ID: <5252F4DA-4FB2-4217-B13E-4B6AF912220B@linux.dev>
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

On April 1, 2026 10:29:37 AM GMT+02:00, Greg KH <gregkh@linuxfoundation=2Eo=
rg> wrote:
>On Tue, Mar 31, 2026 at 10:25:22PM +0200, Luka Gejak wrote:
>> Hi Omer,
>> Thank you for submitting this patch series=2E Efforts to clean up the=
=20
>> initialization paths in these legacy Realtek staging drivers are=20
>> always welcome, as they are a necessary step toward aligning the code=
=20
>> with upstream kernel standards and eventually moving the driver out of
>> staging=2E
>> I have performed a detailed technical audit of the series=2E While the=
=20
>
><snip>
>
>Luka, this review REALLY looks like it was AI generated, and then
>cut-pasted into here=2E  Please do not do that=2E
>
>If you wish to use AI to generate reviews, great, then use some of the
>tools we already have, and notify the submitter that this is an AI
>report and that it should be treated as such=2E  Don't try to pass it off
>as a human review that must actually be trusted=2E
>
>thanks,
>
>greg k-h

Hi Greg,
You're right, I used a tool to help format the response because=20
English is not my native language and I wanted the review to be clear=2E
I see now that it made the response look like a bot report and I=20
apologize for that=2E I'll stick to writing reviews manually going=20
forward=2E However the technical issues I pointed out (like the inverted
_SUCCESS/_FAIL logic in the staging headers and the uninitialized=20
pnetdev pointer) are real regressions I found while auditing the code=20
on my local tree=2E I'll make sure future feedback is direct and clearly
identified if I use any tooling=2E
Thanks for the correction=2E
Best regards,
Luka Gejak
