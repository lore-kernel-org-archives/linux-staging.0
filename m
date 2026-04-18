Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB63293B5F
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 06:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776495488; cv=none; b=se11ovgFpKsj1znz+CFiDAfD+5PjWWE9p4Yw9HKqQ0/PYSxPP0tRjwTECxyxlhK5de0bseYFfWyK5OTcEGPpT96drxyJolDzTcZYy2QItIJ9uAKkIVd1mbaXdIVPt6tC252kVwoNKfpD326DzAkW8etSciQIUtzWj40iuF+WlDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776495488; c=relaxed/simple;
	bh=pntyVHqqZ/wQMop8qe4p4DEMCvzJjwD2nswfvKDLcIg=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=fZaTql2cYm6sBePqOdmd/L9ckdKQg45h6j1kMBrsz5ggueMgsVfeX0i+wPbmdKZKXAIrhiDDJFFCDzDDTZpNWCEv9WwrDMyw2ifUSOu92v/xUJZGVUvRTU1mLqgc50L+qRXQtOsSS/u7OuTWIvu9TI3YRz6qh6k9mtPWds9IR9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ieLZrIkg; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ieLZrIkg"
Date: Sat, 18 Apr 2026 08:57:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776495484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=pntyVHqqZ/wQMop8qe4p4DEMCvzJjwD2nswfvKDLcIg=;
	b=ieLZrIkgoFjXU2lpzY2YSTasTfQM9OSobv/7yqoChly0PCpHTXbZnj5/khR627QIX14+Uw
	mGGwBEbQpXkptiq/zmsoBt/cjPd1J/7nIjpgOMIPLCW8HPwJycIHMRvKpZ6wdpckNwMQCa
	doVvQarJ829f6Slzz3Uu4g6R3J+FGRE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: osdevhari@gmail.com
CC: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, luka.gejak@linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix alignment issue in rtw_xmit.c
In-Reply-To: <CA+TGEkGJ4HaZZOVSXhkb93y9gdBZZf3e0G=zajdx9sAo4iBU5w@mail.gmail.com>
Message-ID: <F7E0CC29-4E94-4759-9E3E-689AB61201F9@linux.dev>
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

Hi Osdevhari,
Let's start from the top of the email=2E Firstly attachments are not=20
allowed, only plaintext=2E Secondly Signed-off-by tag must use your real
name(Firstname Lastname <email>=2E Thirdly, you should setup git=20
send-email and use it to send patches=2E One more thing why did you=20
resend same email twice?
Best regards,
Luka Gejak
