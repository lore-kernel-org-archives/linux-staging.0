Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE851A6815
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 06:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775801786; cv=none; b=OidrMLb0TrRLhUxYAGLWn3RQUMOG+aM+r1Tb67SG8gDk3SqM9K6sQHMqAnIhHMqyk0afxB9MUUmGXSMrW0RLBiKLKQ6pyfiNvd73g9unOYnaVQQRpFYteHkqQEd3/cHLbipKoTRrqSdIEuVFGEzkMwxlconimna9zL465GUDAgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775801786; c=relaxed/simple;
	bh=s5Mutb8zmdDBoGFionzUfj/ychyrF0YhHJkOA83UhZk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=J1Pa3SZEtLsR9b5taqDlnOFBGlqcF9jk4THHSmJnIGZPxEioVCofIsCHzPxSDCVefe4W96bRsVNpP2jllc+Fxm/gV6jZknQL9tuc1RLtNSatxjxPCUuXIhYiN9byUOmqKaB04v/qWWp0bxhazJdM6MMsH/9E2oOoHeq/fuDry1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cmzbDzMG; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cmzbDzMG"
Date: Fri, 10 Apr 2026 08:16:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775801782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s5Mutb8zmdDBoGFionzUfj/ychyrF0YhHJkOA83UhZk=;
	b=cmzbDzMGt4T7KgwgkBjWgWLGkD7X3o/udPN6DKWVZgL1wEcBtCwgi8K2KdoWT2tlOKsnkp
	K1f0y25ML2LrNXLio1Y9T2TuqRIUOcfYyHd8lKTsB9eBa52riw55YdiCvhmWLthTIE+PJU
	Z8Ptg133LNMsUZ7mW+wT+cU1v9Oer/c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Akhil <boyakhil978@gmail.com>
CC: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, luka.gejak@linux.dev
Subject: Re: [PATCH RESEND] staging: rtl8723bs: fix comparison to false
In-Reply-To: <adgYE4va2Eg3V4HG@Akhil>
References: <20260408174011.115915-2-boyakhil978@gmail.com> <DHOO0ZO6AXHN.31AC1MJ5PUKES@linux.dev> <adgYE4va2Eg3V4HG@Akhil>
Message-ID: <4E4059A8-7327-4901-AA08-D318BE40BC5B@linux.dev>
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

On April 9, 2026 11:20:19 PM GMT+02:00, Akhil <boyakhil978@gmail=2Ecom> wro=
te:
>On Thu, Apr 09, 2026 at 03:41:06PM +0200, Luka Gejak wrote:
>> Hi Akhil,
>> I am also wondering why did you decide to resend the patch as it=20
>> impplies it was sent somewhere else, but I don't see it anywhere on=20
>> mailing list=2E Did you send it only to Greg?
>Yes, I accidentally only sent it to Greg, I realised this and resent it
>before I could get the response from Greg's bot=2E The content of the
>patch is exactly the same=2E
>
>It took me some time for this reply as I was understanding the correct me=
thod to reply, let me know if anything can be improved=2E

This should be resent as v2, because I'm sure you didn't include=20
"RESEND adding cc to linux-staging@lists=2Elinux=2Edev" in original email=
=2E
You should only use RESEND if you don't edit context of email at all=2E=20
Also such messages for changes (as "RESEND adding cc to=20
linux-staging@lists=2Elinux=2Edev") should go under --- as everything=20
above is part of the commit message=2E
