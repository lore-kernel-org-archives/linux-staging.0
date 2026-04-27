Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36E034A78E
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 06:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777270294; cv=none; b=H3GiJxpt5CqdOxyyGFLedj2sr6FUufYkWiwRefn0Nhz1L5W850uwxkThRdkbSVgfa2mvEvrl+Td/tq2heUc9JPbg0mXUaxrRrm8AYCzxeb4AugGhexAwqVEixU4nBoGUn2X317cUi5512nB3GTE6NTfNqxUWG605w6VJv3Y7AHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777270294; c=relaxed/simple;
	bh=u+EWgXFyR61e0W15mLKDc3EL4Yy+lpoj8JRoHBys1tM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fUpsyx6yxlwxiqsVhBvmrFIKFvOBf7UFrkkOEj+yFl4ilY2HR8x6yzAHzSFh/LcpZzjR/8jA2EK1Bs1ad11FLek4XnPC3irP9wuGaX+aeNYRm3hFk1ziqAoq6LwiCbTDVZx/Q7qAZgMeD3woru+sZEa4cjvbGdEP1/sSKwo8Ynk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VR88GpMp; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VR88GpMp"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777270291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JHE62PPw+4A8IpGbXM8OjqnBEv9IlS2HiGJrReVUEP0=;
	b=VR88GpMpkCE5vyuw2rClwQbRggmSmJq3rOl9rssqNJd9ii41lFNA3muiVim6VQbJErgDm3
	xr+BqoGd5X+XMqw85R6XY3BVOp63QGWaO9tzOC0vgVaB5dAGHFUvrn+At6hjnvoRqKhafS
	GELdhbM77f7YgnNGYeCmCgY/7wqPCvw=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 08:11:27 +0200
Message-Id: <DI3PQIL60XS9.3S9DP1GE4I8P2@linux.dev>
Cc: <gregkh@linuxfoundation.org>, <straube.linux@gmail.com>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/5] staging: rtl8723bs: rtw_mlme: fix long lines and
 related issues
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Salman Alghamdi" <me@cipherat.com>, <luka.gejak@linux.dev>
References: <20260426225552.87114-1-me@cipherat.com>
 <87lde9pb8p.fsf@cipherat.com>
In-Reply-To: <87lde9pb8p.fsf@cipherat.com>
X-Migadu-Flow: FLOW_OUT

On Mon Apr 27, 2026 at 1:12 AM CEST, Salman Alghamdi wrote:
> I noticed the function signature continuation lines appear misaligned
> in the mailing list archive. I've verified the alignment in the file
> using cat -A which shows correct tabs+spaces:
>
>   ^I^I^I^I^I    struct wlan_network *network)
>
> The misalignment appears to be a rendering artifact in the email
> client or archive. If you can verify by applying the patch locally
> I'd appreciate confirmation, or if there's a known fix I'm happy
> to address it.
>
> Regards,
> Salman Alghamdi.

I am confused in email it's misaligned but when I apply and check file=20
it's looking good. Anyone knows why?
Best regards,
Luka Gejak
