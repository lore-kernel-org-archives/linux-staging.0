Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE733D4FB
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 15:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779464041; cv=none; b=TCs6iumQWnc6PxZW84GS42rDoOJDtiS3U1BcXjOI5uMMbJziHSqmVE2w2S10BN6dVj98X+ltMm46UlK4nW5FaK5wrqYqT81IXY5cxF9JW5ypRt0PaTR35ZzltCyQWzU6RUMcNpQXwiuYjWorK5myx27t3V3xWAM/8EhV0zMLbIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779464041; c=relaxed/simple;
	bh=tUKt1XkM3mGNT9e97Ue8Xy7b8B+ATkvrVxLgmhXWeQc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZCV1PPGD6/BpTBctGnMVUsIIvBiYYNlPfBndo6dlVeLiOvIBhnxCLT6EXaHCyWItAxAMS60THfa6lIPYEcmOwCcNDyvblGDNJOuiBTmv9sseYFmmj11oCNOPyB3tgIo0EzTZmi0/LUfP6pNiq5FlLjpn7K2Q+FLrORkas6LtSiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=s+IGVW07; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="s+IGVW07"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gMTpD3Br3z9v6h;
	Fri, 22 May 2026 17:33:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779464036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tUKt1XkM3mGNT9e97Ue8Xy7b8B+ATkvrVxLgmhXWeQc=;
	b=s+IGVW0718cAwzkDcw+vz8Piw/zzyikGaXCFtkDev+H0SyuIJSK9zlHk78+4/d+QONIhYr
	ZcHj78uhCcwvJJ5si5vsIOBd2f0XWq8jQPThP1epNnsLZOJ+DXDjvwCxTstBu7OYku+CL6
	BP66nDOePZVvtj5MkdKrwyYuWjjphCz8IQaY/CdSTQGZAgI1x3bNeGyKGTli1cOQ0J7VEM
	jruXjOkMaGqecIAevw8n234jPv5qXLZ8+/+hqMifjIl7f/TWpv58VBSq7Dbs7r1XhKev/d
	jOX1iJmOPm76F5Z/HyPhq7x0GnNoEav+gT3287c7PiAJMkslnc4vQJYh/4+V+Q==
Message-ID: <9eafd3db22791e0bdba31c866a802a31e6f1a012.camel@mailbox.org>
Subject: Re: [PATCH v2 0/3] staging: cleanup of sdio_intf.c
From: Manuel Ebner <manuelebner@mailbox.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Omer El Idrissi
	 <omer.e.idrissi@gmail.com>, "open list:STAGING SUBSYSTEM"
	 <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Date: Fri, 22 May 2026 17:33:53 +0200
In-Reply-To: <ahBT3r8ob5Zbq_Fc@stanley.mountain>
References: <20260522114317.189368-4-manuelebner@mailbox.org>
	 <ahBT3r8ob5Zbq_Fc@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MBO-RS-META: zsoq6itmodsym6z5iypwgufe7seh5d3f
X-MBO-RS-ID: 4a1af9ea596f17fa54b

On Fri, 2026-05-22 at 16:02 +0300, Dan Carpenter wrote:
> On Fri, May 22, 2026 at 01:43:20PM +0200, Manuel Ebner wrote:
> > did i overdo the split up?
> >=20
>=20
> The split is fine.=C2=A0 The subsystem prefix needs to be improved.

Is it wireless? If it isn't how can I find the subsystems for my patches.

> The
> capitalization and puncuation in the commit message could be improved
> as well.

I will do that.

Thanks
 Manuel Ebner
>=20
> regards,
> dan carpenter
