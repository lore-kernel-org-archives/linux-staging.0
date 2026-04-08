Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92B03BD642
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 16:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775666542; cv=none; b=EYZ4PYFOPagmTHAd/u27XfMTD3BGXQmZZG3RTmsAPW2FEutC/g954oeirqqoHKAx4KUzA31T8VkhySUVlVcBy0MmB8wrfoga4UK7QPKpSykEcX+eQCHSl2c4ErR1Ky3/a2+EU5ecpTzARGYGf3XDsDJNjUVTEGTlwXkGumNv4Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775666542; c=relaxed/simple;
	bh=DzgQ8G4MowqShZe3AgxFzyMKx4hV2Aa/LheTYF6UXaY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Aa0UA1Bk6gldQ3j5bI/8UdCXyp3v+HRGlrpJSo7J930dCKXjnH8PIOp7jK7Supg1+6mlMKZsRj9Ab+gy37AOJIOu15iT+NPuGt9vZngcT80PEB98wgqOS7ocbUC33ri9aJdf4uq+nf+Q5Uubxt00v2G4eSobTVwI5URaPFpAua0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mYwehpeD; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mYwehpeD"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775666539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KK8DsFUNkPPHWdlsgPuuXPoi6dNHwKzRNd10FJTC4JY=;
	b=mYwehpeD7HcfQinVv7DQkuWlCA9AAXRnfEwQb7SzfyMp2f5SnlJKDKJvYstmhso+YHLQ9r
	QdI/Y3cRJwowlpi7XDqo615vZRYtVb/nGmn2WAW6USIYurxmSEnyC3LHPPEDxpDAdxlDeA
	8h4tFbO4dLnWfXK4Q7hwqtm4NWXBqr0=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 18:42:15 +0200
Message-Id: <DHNX957AVX6Q.2WXSXDGJJSG57@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] staging: rtl8723bs: coding style cleanups for
 rtl8723b_phycfg.c
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: <osjin83@gmail.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
References: <20260408103208.7682-1-osjin83@gmail.com>
In-Reply-To: <20260408103208.7682-1-osjin83@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed Apr 8, 2026 at 12:32 PM CEST, osjin83 wrote:
> From: tas0dev <osjin83@gmail.com>
>
> This patch series fixes various coding style issues in rtl8723b_phycfg.c
> as reported by checkpatch.pl
>
> The changes include:
> - Fixing spacing around binary and bitwise operators.
> - Formatting type casts and aligning function parameters.
> - Removing unnecessary blank lines to improve code readability.
>
> These are purely cosmetic changes to bring the driver closer to the
> Linux kernel coding style.
>
> I wanted to contribute to Linux, but in the end, I could only make a smal=
l change. I'm sorry.

All contributions are welcome :)
My reviews will be sent shortly.

>
> tas0dev (3):
>   staging: rtl8723bs: fix spacing around operators in rtl8723b_phycfg.c
>   staging: rtl8723bs: fix casting and alignment spacing in
>     rtl8723b_phycfg.c
>   staging: rtl8723bs: remove unnecessary blank lines in
>     rtl8723b_phycfg.c
>
>  .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 65 ++++++++-----------
>  1 file changed, 26 insertions(+), 39 deletions(-)

