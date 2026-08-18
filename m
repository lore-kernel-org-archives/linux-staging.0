Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A263BE644
	for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 09:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043993; cv=none; b=l/6+RNUrhmVMGRn54rWSL34YwSmhgB7IFcYorqy6FB53tAfPGgstug1IGvi8jlRCHFEc7+2nDyki4KYdINKNJOAQzCT9abkgjZpDWHfsKeK5hGgQF9BpJ09RvPnNiyOt/HKZG853oWPf+WodaE0mBIK9eF1CJWxtJGKXXXrJnmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043993; c=relaxed/simple;
	bh=jw81VDThxX+SrgP9VRsZN83GJHGUG7SJ7cz98dplupU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAaxW3KyWq1A4rgn+Q5qSdhBIgyuATQteaEGEu9zQfsKzbZUoath3rW6gXge7KQSaCGC5GljAkdL/57KkULtFGFEZ4842VZ0O45SPmNYNNCNg1OFGrRTXPp0Ynj1WUXFnmrQNKM/TehP6C50CSxa1q0rpQdERiLaoXoJ73js4bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=eH4hBiMy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HDbRREX/; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="eH4hBiMy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HDbRREX/"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 26FFCEC00D2;
	Tue, 18 Aug 2026 05:06:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Tue, 18 Aug 2026 05:06:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1787043991; x=1787130391; bh=Fo0jq9k8y+
	8fLZVYzmfHE2hpYhUxIRqxjSyWCj0ZP7A=; b=eH4hBiMy8IGgTf/IOrQ8HeziOf
	mZA9GhRhfuKi6yyrficPbokEB5N1nMjvLcD/g4WpBfcpPW4xQdtHFpccZVFnF7xG
	jgKCKC0Ctm94I5PY6D/jBYC48Ng6GLczX26D+2IY03felhkV2wqfXE2Som5O0k80
	uwMD2x1WYDQzgNLdopUGvGUFjcWfakNyu4AA1unyk/kK/jy8qd9yqjNwi+9E40bu
	hf0If0cEsjGNrLkv5uRBqkD0hPWqc5zMvvoDlS+t95K+XglpnnQ3ECOUDSvVu9MI
	V4+e3/1buMNT8uTxu5CLrZnvy1Y7nDlfgJ4pY6jbIzAc+h9PuVaM1sgo1cgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1787043991; x=1787130391; bh=Fo0jq9k8y+8fLZVYzmfHE2hpYhUxIRqxjSy
	WCj0ZP7A=; b=HDbRREX/lqJxVMMhOfZDxfUO8c1cP9DHgq7TgTVgiIvCb1iCj8P
	3d6Ene+FIdsQiz2/mb4Sv3aSPMfP0kcn+Rv6Xg47T7fo508QxfTZwL3va1h+R2/m
	Fom8krKZxWtCg72U/OiRFRWJUZ24LFvqQ7aWulIOMv+SpNumEhhsN1VDHg9Zay3d
	gRdIS2F6hzw3K7CJB+XyCN/WjBfzJjJzmQXxsrxHrx5yBEkjA78NIkBMtazVL55o
	c46CnIR8lE0S5uyQzBp6Z9RRXUrn9Nb67nCGBbt0y4hYuJjqmzHPVtDla+5Fg+tr
	cynwsdR5jubTfxHnV+274J0HDFOZsLW8x0g==
X-ME-Sender: <xms:lyCEak2bNN0mO5XFRdpJ_c0dx-wFMqYlWSo16Q2ytFL-nFR81oxjkQ>
    <xme:lyCEanReWybFcSiDkddtfmZtXVOL5-AzdPWvDfZE3_HzL8td0Mn3KeWdTW2Wir232
    APBkSWASQGsqK2WkwWND4baPulNLUsq9GKpxByzwkaCL7mUHfs>
X-ME-Received: <xmr:lyCEaocxLqDIxMMe7JlpvHLusQFLviupVoX1P0V14FRDeFJq9ca_F7gIgCBbfdNmSDg1ua48VT1sQrlcQK949pwT5rCM0mLkL6AWV3k7zzE>
X-ME-Proxy-Cause: dmFkZTFq6w9nPw3Q1kQ+E39VRqajdFljngqf/D8FTrQ+efI/MKuVLMhyGN90FqEYRGnrKq
    fLbqi03RUy9Uhvs8U9XnlFIzxqEDPau62CpXVPXwiUTZinebpoVI/ENTzFBHl2iQYUXw/0
    6Sc4M3VGW1Utv/v4ARi/ImMmHU0n6PJGE366HLL1TLpw8DPLHIAGLMjJf0EQZaFQG+dwKu
    syyI6fNwWRAvpRlvlQhHPQdjTTHJn0up1xRdXfIQNhGmgELSIeCNS0xtaIkRGAlZXdBSrE
    dXQYFiLXlSaUsoPM1EkKCaKGu257hDhp0I1SztMpURbNckdRaERG/Fr4OFM3nivaVQvjdO
    d5mdC+c3niDH+Jr6+eMvEqTBlqimqXJbFCIKZ/BM48OBumGt4eDpPRnOQ2jbd+uGZqE88n
    1j2XCuZpyaUtmXqS/DyXaCe9+uCfdjQx8zpHTQ2lFiFqVuUvmiNAUIF8Apm4e+7s/mhKKL
    SpN/acuLl5Td/DLCwmjhXY/vBti3tYFAFYLa6rB2S3ZOdcRJE9J0Ue4jitvMgf5jlIR/N8
    6VkjT2hAKm8pl0V2J3+T5LJHEYUR6slePQP6lRqvtAqA/w8OZ4ACAIOvaBfDJBN0HtMr21
    lzdcoWrIjGiwuRu5TcHGAAj7U/Ms96qFBGkT17KNERb7zX0MLwqRxiCORc3g
X-ME-Proxy: <xmx:lyCEaofmFtGKpiIiDrdenlXwUNCOd7ldgxto4c0XG9S4QP3LYZdbsg>
    <xmx:lyCEai21nyeLOB6YJBEuStMHk0X_HYV5euSbYlRBJJLVU9n4WielIA>
    <xmx:lyCEag9lJ15PvNILd3vsUtlMrPrfni0Fyn5fOyupIMoRekRRRRkKfg>
    <xmx:lyCEan6cMHfLvFfa6SVVSWKSqgxOqZtQYF0upDpofQg80WvGceBuQg>
    <xmx:lyCEagB0ZNCvJ680sw5oA95mnyXHbD-FKYBG-QvbZVzfXlVs0E8pZXME>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Aug 2026 05:06:30 -0400 (EDT)
Date: Tue, 18 Aug 2026 11:04:54 +0200
From: Greg KH <greg@kroah.com>
To: "Rork A." <qvkapp@gmail.com>
Cc: Parthiban Veerasooran <parthiban.veerasoorian@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: most: fix typos in driver_usage.txt
Message-ID: <2026081853-anyplace-hypnosis-96c0@gregkh>
References: <20260818082122.30038-1-qvkapp@gmail.com>
 <6a841eae.13e8e617.1ee83b.3070@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a841eae.13e8e617.1ee83b.3070@mx.google.com>

On Tue, Aug 18, 2026 at 01:58:22AM -0700, Rork A. wrote:
> >From 7b57ab25225268fce971508eb9055e61cd3f8c92 Mon Sep 17 00:00:00 2001
> From: "Rork A." <qvkapp@gmail.com>
> Date: Tue, 18 Aug 2026 11:57:43 +0300
> Subject: [PATCH] staging: most: fix typos in driver_usage.txt

Why is this here?

> Fix two typos in drivers/staging/most/Documentation/driver_usage.txt:
> 
> - "post-poned" should be "postponed" (appears twice)
> - "access a MOST network" should be "access to a MOST network"

Why is this last change needed?  What grammer rule is wrong?

> Signed-off-by: Rork A. <qvkapp@gmail.com>

As my bot said, full name please.

> ---
>  drivers/staging/most/Documentation/driver_usage.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

No version info?

Please slow down, there's no rush here.  Read the documentation and wait
a few days before resending a new version.

thanks,

greg k-h
