Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8CB3A6B64
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 07:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773213727; cv=none; b=EIP8tzr09yhOKpvVSYLXfXU8AbYUeUsWb6iXIygTXCJlkNt1k2fUZs2I3GojXHELl1I3U8OwLytspz2bBl72uBQcTWplYC05f8aqNvHKqxlR0tzlZV0Lu7YMDzmPqefxd2XJu3p8wl7HoLMSeNOFLiSN9TzHcKaMsEv1ZjONLLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773213727; c=relaxed/simple;
	bh=KtOcMV4QsgkhOgZLaLwJQnfNFIrAHyhABsCjDyIMvBk=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type; b=iiAHeTI3Jz0cYPws9923YbyXIv1Xnbc7HuRMhTJlCKNs9zijCaORFFzfwzdYDtUEbffbLPQ4nLubDOrAyXkZ2sb8dGGDnXMa/jTrD7CLa9t338D0i3yEQuqF+WmvM6hgei1puzWrox21Bv7pWhXPs+TJgyeR48yvvJhasPRy28s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xdlx0GFH; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xdlx0GFH"
Date: Wed, 11 Mar 2026 08:21:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773213714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KtOcMV4QsgkhOgZLaLwJQnfNFIrAHyhABsCjDyIMvBk=;
	b=xdlx0GFHSTdbdWSSOMHOU06aK1NxEpV4M/GbnSnESwqd2X9KrGSEX9IfTf9DYDoXUV0AUu
	6er2fLkxsesOWmfuv9ZLlDs5po1zssYnFp2K92cIdW4xeT3kaN7fIQa2W8f8VPK7cre2HM
	PEOLQ+EyRlHzO5LcyhWsmNcyE+QVVE4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 luka.gejak@linux.dev
Subject: I need piece of advice regarding rtl8723bs
Message-ID: <270B444B-3171-4FEB-A43F-CD33DFFAB518@linux.dev>
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

Hi Greg,=20
Sorry if I am taking a lot of your time or disrupting your workflow, but I=
 would like a piece of advice regarding staging/rtl8723bs=2E As you may alr=
eady know(or you may not), I am working on port of rtl8723bs to mac80211 ar=
chitecture=2E I am currently on stage on getting wifi scans to work(I can b=
ring up interface, and I believe that I am close to getting scans working a=
s well) so I want to ask you if you recommend making patches for staging/rt=
l8723bs as once I finish the driver and begin process of upstreaming it sta=
ging/rtl8723bs will be irrelevant/deleted(or will it?)=2E
Thank you for your time, Luka Gejak
