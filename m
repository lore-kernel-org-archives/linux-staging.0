Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4C73C5DDA
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220440; cv=none; b=i+nMcQ2sWrjeHh3DWqmmX90IRPVrtdN+ypYfc3znxbUEFkLDG0CjkQS5yrhcDsnkr3XeW/c8vL9mSrEaywe3a1S4HZujq1+GREA9Ke9fTdDAA9Nr0lh8U8atJrZZgZ4fFBrq/B9zDR+3cAxLP5ftO8zzxy6faqEvMvIPoyFA1L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220440; c=relaxed/simple;
	bh=QqFMsoIAhsEpoNORK+4SlQnfQapVjOUkFGjglJ3+mmw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=e7cJw5PJ1suPRpL6JXZin+PPWm3PAws5srCUIjMfDocgamczcGaBW9mDroeHizuqRfKuv+BHN2rG5+Uxw58+eWjFuxWAQafSXBBULcWseN883+cOmcWGWSrTZXxeTK1ja/azitUMxchYGzd/FJfJSklr32IcR+l7uG/CZqqNU0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NKpaFeGi; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NKpaFeGi"
Date: Wed, 11 Mar 2026 10:13:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773220430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKBJLIT5Ui5Io3/mFwXWCpiS98U5shE/k7Te/nEZ+cI=;
	b=NKpaFeGiZ9RmCNgvflvwWgzTdDt34bycZq0lmQxwaPAZ/G+RXQpIvdn/RU4JG+WdNiPqlA
	Gy7Svwq2fWHX8vtXNgAJYhzdvaxHiFgiTER4Si1j9Fno43L/nanygYLRGSfwYrNrVVIZCX
	b3wn06M5YJiGRUegI5CImeJ0yOBGOLw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: I need piece of advice regarding rtl8723bs
In-Reply-To: <abEhz7LVGlwyTdir@stanley.mountain>
References: <270B444B-3171-4FEB-A43F-CD33DFFAB518@linux.dev> <abEhz7LVGlwyTdir@stanley.mountain>
Message-ID: <0A9F09AD-0082-489F-878A-0899CB6F7413@linux.dev>
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

On March 11, 2026 9:03:27 AM GMT+01:00, Dan Carpenter <dan=2Ecarpenter@lina=
ro=2Eorg> wrote:
>On Wed, Mar 11, 2026 at 08:21:47AM +0100, Luka Gejak wrote:
>> Hi Greg,=20
>> Sorry if I am taking a lot of your time or disrupting your workflow,
>> but I would like a piece of advice regarding staging/rtl8723bs=2E As
>> you may already know(or you may not), I am working on port of
>> rtl8723bs to mac80211 architecture=2E I am currently on stage on
>> getting wifi scans to work(I can bring up interface, and I believe
>> that I am close to getting scans working as well) so I want to ask
>> you if you recommend making patches for staging/rtl8723bs as once I
>> finish the driver and begin process of upstreaming it
>> staging/rtl8723bs will be irrelevant/deleted(or will it?)=2E
>> Thank you for your time, Luka Gejak
>
>I'm not 100% sure what you are asking=2E=2E=2E
>
>If you want to port rtl8723bs to mac80211, that's great=2E  We love
>that=2E  When it's ready we can review it=2E
>
>Until then people are free to change staging/rtl8723bs if they want to=2E
>Your work on the port is future work=2E  We can't really be confident of
>anything that will happen in the future so we just go on with what we
>have=2E
>
>When your driver is merged and it supports all the hardware that
>staging/rtl8723bs does then we'll drop the staging driver=2E  We never
>keep two drivers for the same code=2E
>
>regards,
>dan carpenter

Hi Dan,
Let me clarify, I am decently sure that I can make driver work and I want =
to ask if I should focus of development of that driver or if I should take =
time to contribute to staging/rtl8723bs as well=2E
Sincerely Luka Gejak
