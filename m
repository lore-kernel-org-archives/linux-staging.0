Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C57C26A0D5
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 15:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836478; cv=none; b=orCjmR/LSh8eZa6UHfqrJ1ScBoKBLgqzDVlMfSBRDSxGaUDs8qZdhKLeu57GQUz667fKcG+wvymS/Mgzv3esQdbSqNKjI0rVY5EYCVeAm5/SxODFJ/YhdaMc4a5qQuIDSqIrWCItqEOx7zcjMuU4gbMImeLWoeegouCgpDlRGgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836478; c=relaxed/simple;
	bh=WHgo4Pohd2+xcuyvxJVXIyjmpQKQZ4ezLbsUiI7M+sE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=P+J0Q912VlJgeg5Td4PwouPm4AQGE8GhwlMOJcM/A4ksJ+h3Prcyrj1yYGtK7Npotpt5qIaP6k791hMLp1Xc/yFA5x2vMvk7cw9E4cdeaovLhGAP8ewZsBF/C5HLRq4rQJPkpxYOsK0Q0bkSMbJGKWiukywZ1KwlDaDgqZgEkU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oHvDfuEO; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oHvDfuEO"
Date: Fri, 10 Apr 2026 17:54:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775836474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WHgo4Pohd2+xcuyvxJVXIyjmpQKQZ4ezLbsUiI7M+sE=;
	b=oHvDfuEO+QtztwtgDhxz4jo2VNajHUQ8JWug0/5mFW0CDzGZmmNzDBvmX1NcVPFVPlcE1p
	s8tV7V/Ad39ce2IiZyB21AUJc5VseP8TfpXFgYvuavM/RA1BEBlMMpL53DnRcutMPDdBnC
	UBQRDUMbnIiRFZt81BsRcdpKnyHTt5s=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Akhil <boyakhil978@gmail.com>
CC: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, luka.gejak@linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: fix comparison to false
In-Reply-To: <adkUAetL-26WVQGg@Akhil>
References: <20260409221122.77303-2-boyakhil978@gmail.com> <58EA874E-2ADC-4920-8ED0-802F3CF1DF7F@linux.dev> <adkUAetL-26WVQGg@Akhil>
Message-ID: <1A2F9EA9-5025-4CEC-B623-2E71BCBE8BEF@linux.dev>
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

On April 10, 2026 5:15:13 PM GMT+02:00, Akhil <boyakhil978@gmail=2Ecom> wro=
te:
>On Fri, Apr 10, 2026 at 08:45:13AM +0200, Luka Gejak wrote:
>> Hi Akhil,
>> I am sorry to inform you, but upon checking, I have discovered that=20
>> your change was introduced in one patch in the past=2E You have probabl=
y
>> been working on master branch(one from Linus) and not staging-next=2E=
=20
>> Therefore, since patch wasn't merged to mainline yet, you didn't see=20
>> that your change is already present=2E
>> Best regards,
>> Luka Gejak
>Hello Luka,
>Thanks for letting me know, I really appreciate it=2E I just switched to
>the staging-next branch=2E
>Best Regards,
>Akhil

No problem, if you need anything else let me know and feel free to cc=20
me for any further patches=2E
Best regards,
Luka Gejak
