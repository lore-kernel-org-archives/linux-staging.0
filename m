Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3A0413225
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 10:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041140; cv=none; b=Pa50KrUuczO9AWbqIY4BF+0qqtH+Cv5lUAidt3FtKTTP4GE7m0ilkGDEz/KTtCRs/8L1RicrdrmiUHMRFHgjd6waYdY3+RyIu6BnuyZlthvDpsoAZ6wwF+s2vPG9HYrXgmm8ugNwenQ3WoxayW9LuSaW6UmC8GKOUvOBa2jxeLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041140; c=relaxed/simple;
	bh=PAbqHRRkyI4QjfVNmyny2zplIrNWPTv+vfZH7Vd9FWw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=uzUdgRGeUnaFIM0hAA0rcp23xPnTDWeoMezxvtiK4bDsx/ytVJ8tz5QTvBlMfD6mgMPxOTYU8wmDex0tCr4ZeHX1VekCwas5xkKYMjybecePMdyMoWOLjxWXMrCGJdWZWq9nbdKa2rp8G6dMaNMUvQiOuJucLQbjlo9GSQL/fPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SuowLQZ/; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SuowLQZ/"
Date: Wed, 01 Apr 2026 12:58:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775041133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jow4yMfoGUPWYc5Gdosw2n50OZ+gqt+cg5IJoGmxfdo=;
	b=SuowLQZ/JcfJLrTIlXsnbje8JH9E6NBOw78w0pDpyANIKbRG3en1BUpkJSLvXZipVpa5RA
	/Km01dR1lNt9omUXHRIe9JVZcyWvARw8yyolRiq7DJSa6AR38UVN9A+7ncHfHlKqt068bA
	mfF4CFwL6mgOHyTuS/4wjmz6KUgMDUY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Greg KH <gregkh@linuxfoundation.org>
CC: omer.e.idrissi@gmail.com, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/5] rtw_sdio_if1_init cleanup and small logic tweak
In-Reply-To: <2026040140-september-numeral-0865@gregkh>
References: <272CEB11-DD9C-43BE-B47D-49F8BE1A0392@linux.dev> <2026040159-bamboo-ended-620b@gregkh> <2026040140-september-numeral-0865@gregkh>
Message-ID: <C907AF2B-4FE6-4DC5-938D-C6481E16CF42@linux.dev>
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

On April 1, 2026 12:50:17 PM GMT+02:00, Greg KH <gregkh@linuxfoundation=2Eo=
rg> wrote:
>On Wed, Apr 01, 2026 at 12:29:52PM +0200, Greg KH wrote:
>> On Wed, Apr 01, 2026 at 12:17:41PM +0200, Luka Gejak wrote:
>> > Hi Omer,
>> > Thank you for submitting this patch series=2E I like the idea, howeve=
r
>> > during my review I have found that there are several issues=2E
>>=20
>> <snip>
>>=20
>> Please review things "inline" like a human does=2E  With the code in
>> place, and the comments right below the code=2E
>>=20
>> As you are using AI for this, PLEASE use an AI tool that actually works=
=2E
>> Use the ones that we have public, which DOES get this right and puts th=
e
>> review comments in the correct places, and in the correct format=2E
>>=20
>> If I were confronted with a review like this on patch 0/X, it would be
>> very hard for me to actually digest and handle it, given that the
>> context is not there at all=2E
>>=20
>> I suggest you take some time off, work on your review workflow, and
>> then, if you still want to help out with reviews, do it in the proper
>> way that we all have been doing for decades=2E
>
>And your bot has exploded, sending it's response multiple times to the
>list for some reason=2E  I think I need to add your email address to the
>ignore list for now=2E
>
>greg k-h

Not a bot, but rather, I'm at my phone rn and thunderbird complained=20
about error while sending email so I resend it=2E
Best regards,
Luka Gejak
