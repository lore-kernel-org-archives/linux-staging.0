Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE941FF1B5
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 20:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776026675; cv=none; b=mpvs1topytRPWW2DNgczRSkMk34+ij3E84ysr9GIrLJHC/JZ/NrTRD32/xQaTzxs+4NNSPzF5WstoxwCAWkAGqyd92hTrFCxoTTVLI3mcmNIFkQkNemQq4zZZvKek+pmlFyUx93asRNUzboNZskyNv5GbCk6+ovLM5MdEGjVY/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776026675; c=relaxed/simple;
	bh=f9IRs8RtSXABhpCm882NPAQbuubGqcxdlieN+yS3Wi4=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=ArOJDBq3xr22YwV50Cd94A3A6xVGndH7SdUMxXRNBIDoKMBGPI8RCfLeF5RexsxSW9wNxQNtr7+ANVM8uoKOJ8Q1DmLHlSIRL2YSy5ypsOA4zCvq8c2Vn9ucPmp6wxGosmGo2wP1eaNDmxbmJaWfi7vjVgGPUhJKKxZqIC8gIyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bTxjEQR2; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bTxjEQR2"
Date: Sun, 12 Apr 2026 22:43:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776026669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=5yKdeX1ItKmjCjzsQUVhkS/mCXANOgGTuBQwE/wcnyg=;
	b=bTxjEQR2601EYsKJStcMjvDoe9w1Mok4RxXVDZ/HSjtNg7juCxaEHYMvBfEuPtMXjn8DEH
	PV+JQ9ROd8pWafIhbbcE059bo+QdhqQewO6GjyVlJwGfVVKmWvAe+67ZDTKHiGVs+t9arg
	WWata0pU6EzBDFNwhKUsgC2ndnGgOag=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: gregkh@linuxfoundation.org
CC: ducthinh100812@gmail.com, grondon@gmail.com, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, luka.gejak@linux.dev
Subject: Re: [PATCH v3 1/2] staging: most: dim2: replace BUG_ON() in enqueue()
In-Reply-To: <2026041232-kitchen-quill-add6@gregkh>
Message-ID: <03DAC8BC-B29E-4128-BBBB-D6CF541B53B6@linux.dev>
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

>>On Sun, Apr 12, 2026 at 08:00:10PM +0700, Nguyen Duc Thinh wrote:
>> From: Gabriel Rondon <grondon@gmail=2Ecom>
>>=20
>> Replace BUG_ON() range check on ch_idx with a return of -EINVAL=2E
>>=20
>> BUG_ON() is deprecated as it crashes the entire kernel on assertion
>> failure (see Documentation/process/deprecated=2Erst)=2E
>>=20
>> Signed-off-by: Gabriel Rondon <grondon@gmail=2Ecom>
>> Link: https://patch=2Emsgid=2Elink/20260330182255=2E75241-5-grondon@gma=
il=2Ecom
>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation=2Eorg>
>On Sun, Apr 12, 2026 at 20:52:48 +0200, greg-hk wrote:
>You did not sign off on this, and did I?  >Where did this come from?
>
>confused,
>
>greg k-h

Hi Greg,
It appears that Nguyen has sent last 2 merges patches from the=20
staging-next,which were there at the time of writing his commit=2E
Best regards,
Luka Gejak
