Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E98F346798
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 05:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776230591; cv=none; b=qi5rXt5cA1JjpKaKXhP3vRoBI1zXCkQ53o5ayK80L6xWL71+iiYxuIwdu82mmaeUyAh8WDU1PvUY0ZRLKdyzUlw3FZeyPnGE5bDR7GfDFneEZJ9jvGwRdIDj7gDpjxUwFG3SVj8CWv5lMt+CYEP1gkqTQgdTkHwgev1AAznGGZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776230591; c=relaxed/simple;
	bh=/efp6yRw/jDQ6sXHjhW+nvuV4O/U6xG7TmI78pQuTOM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ej/0bhiqe8WEn8KJtUVkqFqmGxWICffLyHsO67BZrMoIfa83vuF3PHo1Pfm2VyvXUeE6aML4pIO8EvgpWU13DcyzgCqJUqHQL8r41AIKEQQNAHnpQw31Wtc8Xq3utwNokT5jQVOkl1Fm+zeyaULUmh0opDkeKyfTva7BmJyPNUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mgBfTpis; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mgBfTpis"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776230577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/efp6yRw/jDQ6sXHjhW+nvuV4O/U6xG7TmI78pQuTOM=;
	b=mgBfTpisD+KZxsj7EdmMsUp9r7OSo5eUVvJfRMuuzxRhNUUHhshTBqIuXrPU0H8K9dq8lW
	qdzzgjYnnaGPsF4WL9O2hJf1FIUu6NW1Rh/NeBI6FlrKKWGlCXIIzSZinyE/or8cW99EdB
	iK6nnSu9fY1Afq8FddFwkMucqg9ihGY=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 07:22:53 +0200
Message-Id: <DHTH6SPDQ037.2W1FBRA030J1V@linux.dev>
Cc: <error27@gmail.com>, <hossu.alexandru@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2] staging: rtl8723bs: fix missing frame length checks
 in OnAuthClient
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Luka Gejak" <luka.gejak@linux.dev>, <gregkh@linuxfoundation.org>
References: <2026041526-resonate-overpower-e45f@gregkh>
 <DHTH3PLMFNK6.24NLM1U01XPKJ@linux.dev>
In-Reply-To: <DHTH3PLMFNK6.24NLM1U01XPKJ@linux.dev>
X-Migadu-Flow: FLOW_OUT

On Wed Apr 15, 2026 at 7:18 AM CEST, Luka Gejak wrote:
>

Ignore this email, aerc(my email client) is having quirks.
Best regards,
Luka Gejak
