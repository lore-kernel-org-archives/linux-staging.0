Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8311D6BB
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 17:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775928061; cv=none; b=GjIzEC6CcOSoVJShZOXHl1fsAVDgYJiJRrm9xpw2NK+AK7cfBKYbkmrQ1g3afIvVPbFF1Q/iU6dpOQU2HCTaTsAN5pWeGatDhuJrz5ZT4LWk2dNOMlL3emWJlMR/JxbAjAjp0XZ5L8W4NealuI4QMdTM5+FmVxKnSVJAjtwznR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775928061; c=relaxed/simple;
	bh=lSyFDjQGnx+xyreYmxiu23KDWP+2Z9BnU7TleRrS0m4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dza5AsoeWMpjMmv5YXYyYkLGi9sM+wKitx781fGxpFKWu7LXY1leyghG50y31ODqDuOkRVI98ky0OVach0P952UkmZ5qYTt2F/LL99dTEpSLzsgk7V84Yfcwryw4KpwToL3paEjPGzu2ZnU9jmhyj/FmC4TIaZKkf1ATRSifGJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ePiTfDNT; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ePiTfDNT"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775928057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4FjhrNq3N0SZOjQTZt9+jG6Fiv8GCSJmLUgzFmqlUT4=;
	b=ePiTfDNTSCaZzzLBL+z8YpU2daEYp19nVd0mB7k1phdDvhVtEWTGObQYmqHXCXhSIOM+tt
	rTW6aNARk2QZzeoU/ORopR/JR76+KGOsUNJh0NXZlCPE7HqshPmTeZMepTAWzPjm9xui15
	e3I0c+rQt7eX3wq4+4fw0VQj7pLw0OA=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 11 Apr 2026 19:20:50 +0200
Message-Id: <DHQHYBE1WRCM.3TBPBI4T5CFS4@linux.dev>
Cc: <gregkh@linuxfoundation.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <straube.linux@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: replace magic numbers with named
 constants
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Dan Carpenter" <error27@gmail.com>, "Adith-Joshua"
 <adithalex29@gmail.com>
References: <20260411052817.354594-1-adithalex29@gmail.com>
 <adoBQ8skQ7aRXKNr@stanley.mountain>
In-Reply-To: <adoBQ8skQ7aRXKNr@stanley.mountain>
X-Migadu-Flow: FLOW_OUT

On Sat Apr 11, 2026 at 10:07 AM CEST, Dan Carpenter wrote:
> On Sat, Apr 11, 2026 at 10:58:17AM +0530, Adith-Joshua wrote:
>> Replace hardcoded magic numbers in rtl8723b_InitBeaconParameters()
>> with descriptive macros to improve readability and maintainability.
>>=20
>> No functional changes.
>>=20
>> Signed-off-by: Adith-Joshua <adithalex29@gmail.com>
>> ---
>
> Where did you find these numbers?  Presumably there is a spec
> somewhere?  What does BCNTCFG_CW mean?  This really looks like an AI
> patch...
>
> regards,
> dan carpenter

Hi Dan,
I believe you are right about this patch being written by AI.=20
As I noted in my other reply, if you cross-reference these registers=20
with the primary upstream driver=20
(drivers/net/wireless/realtek/rtw88/reg.h), the field mappings=20
introduced in this patch are actually backwards. It looks like an AI saw
the 0x660F magic number and hallucinated that 0x66 was the aifs and 0x0F
was the cw, when in reality aifs occupies the lower 8 bits. It also=20
hallucinates an _MS suffix based on a loose code comment, completely=20
ignoring that 802.11 beacon offsets use time units (TU).
Best regards,
Luka Gejak
