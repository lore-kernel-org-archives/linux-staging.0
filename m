Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BDA2DCF74
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 06:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777186144; cv=none; b=OZiPjcIhzzO1A2YnKQcHe/ejEkNVDTOmwy2dszSlzoHqkzbw/3aKkmwNVqiK+Lg7i6dFjf9etpinqgKOegssoOFfMLcVen9rRgdKtRFMKow3raPPCMY5/QJtCOaR3bQz8cNQ1etry/z4xOqPlH8NLcV0RQZkawoJV7lumKpP1tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777186144; c=relaxed/simple;
	bh=WKy1xRunOEqIHiKITorSqWqLtOaDxxHgi6PV1u1gbvU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=JuDi9cNiANYmnXFPybmTcheY/VTFI1J1xGv0eArTwpE5OnHbzoyR5SEWzJkGrJWLYPIBugVW7llZLzAoJ6tAltDA97R9YKUpRzR5820RTi+jxGtAd9Fr3EGq0LpRjfXD51bv+LJJ5Zt2opT3OvU9C4bqYZNeT+ROiBldBev9VKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EWd4QlRf; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EWd4QlRf"
Date: Sun, 26 Apr 2026 08:48:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777186131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WKy1xRunOEqIHiKITorSqWqLtOaDxxHgi6PV1u1gbvU=;
	b=EWd4QlRf80czRACjuk5N8uazDVEbd8zU0UqcSHPFtCERdp40eDyMXQqw71w7jepzWOT+Fy
	7K+zu65aIlrMwP+BlTAZcfDDSgqMPYgqdhpo/ouJT+5n8OnGjHL2rhUJTo9GqCpGWHf3yA
	99Zgkeg6Mb36VqbskFLSU+XZ4goXY14=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Salman Alghamdi <me@cipherat.com>
CC: gregkh@linuxfoundation.org, straube.linux@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 luka.gejak@linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: rtw_mlme: fix line length warnings
In-Reply-To: <74615568-5FCA-4674-BE30-EEB48165E662@linux.dev>
References: <20260425165733.289919-1-me@cipherat.com> <DI2H39EAAFBZ.3KI5NWN02AQ2S@linux.dev> <87fr4itpqk.fsf@cipherat.com> <74615568-5FCA-4674-BE30-EEB48165E662@linux.dev>
Message-ID: <8A10E55D-24E2-4569-96E9-2F18C115779D@linux.dev>
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

On April 26, 2026 8:37:28 AM GMT+02:00, Luka Gejak <luka=2Egejak@linux=2Ede=
v> wrote:
>On April 26, 2026 4:33:23 AM GMT+02:00, Salman Alghamdi <me@cipherat=2Eco=
m> wrote:

=2E=2E=2E

>>>
>>> Put u8 *ie =2E=2E=2E here, under update_network=2E
>>>
>>
>>Should variables always be declared at the nearest enclosing scope
>>where they're used, or at the top of the function?
>
>Generally nearest scope, but in this case you should declare u8 *ie=20
>inside the block and after update_network(), because by doing that you
>ensure the pointer is initialized with the freshest data=2E It also=20
>prevents the variable from being used elsewhere in the function where=20
>it might be invalid=2E
>

Forgot to mention one thing, if your variable is used in both block
(e=2Eg=2E both inside if and else blocks), then it should be declared in=
=20
the outher scope=2E

=2E=2E=2E

Best regards,
Luka Gejak
