Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65424420475
	for <linux-staging@lists.linux.dev>; Wed,  5 Aug 2026 11:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785929030; cv=none; b=PoDCRMQktFeM0exyVzr04piKW54P7p/nAf/KYMYDMuP2SG8FGQTmT/k8XZqTVLTxYipzdWPcu26fVTvPVZ2vo9UtmX68L4bFtZRQGpCdfWh9lOCT3prA6a3F2bK7CuZdexXskC9LKi9CRiZqOlL5UUi7/j3GFwNB2+d7EhSLTd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785929030; c=relaxed/simple;
	bh=3hA1DkEEeAEqrNi0qbIgNd7TZtbdLAG9LK3yM/FWVUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoS/bxNtCUYuCYUcWNErUn9WZmu5DyIhVsRnsHTtevh4GqHbK/wmfdItX+txmxzpJCARRuUeQXZQIt5Aoq0VffzvQCijnXOOz6u8ZPekV6kPP1U0pxEI/u+FmgPsGPAvzuSoUvSQU8RmbuGErqU5zTe0NKGNlHjvCZCBZK3x+m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HduCrYYA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HduCrYYA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890E11F000E9;
	Wed,  5 Aug 2026 11:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785929029;
	bh=VV+l15sV4yT6bfNTPM+bue5xuJaG+BEKKYskEu4Xq/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HduCrYYArF2dbeBwCey6Q3P2ivc6sYUUumiGL2d5HjITYsbkVqk8PMj1+cGdGAcfp
	 o+2NAKxvwTaqowHe1kyECQAk38RSJmLuwqzRDN+6O/iURZJfDqyGZ22TYf2li97+6R
	 E9egEAoT+ezy7dTDDWCzWuXcNOegyJ9hSc1/V+d8=
Date: Wed, 5 Aug 2026 13:23:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?44Kk44Og44OG44Kj44Ok44K6?= <reza1234khan1234@gmail.com>
Cc: linux-staging@lists.linux.dev, stable@kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix OOB read in rtw_restruct_wmm_ie()
Message-ID: <2026080505-saturday-driven-b0d8@gregkh>
References: <20260805103344.172115-1-reza1234khan1234@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260805103344.172115-1-reza1234khan1234@gmail.com>

On Wed, Aug 05, 2026 at 04:33:44PM +0600, イムティヤズ wrote:
> The IE parsing loop in rtw_restruct_wmm_ie() reads in_ie[i + 1] (the
> length byte) and, when a vendor specific WMM IE is found, copies 9
> bytes starting from in_ie[i], while only guarding the reads with
> i + 5 < in_len. When the IE section of a beacon ends with a single
> byte remaining, in_ie[i + 1] is read one byte past the end of the
> buffer. A crafted IE with a short length field can likewise make the
> 9-byte copy read past the end of the buffer.
> 
> Validate that the 2-byte IE header and the declared payload length
> are fully in bounds, and require the WMM IE to be at least 9 bytes
> long so that the copy stays within the buffer.
> 
> Cc: stable@kernel.org
> Signed-off-by: イムティヤズ <reza1234khan1234@gmail.com>
> Assisted-by: opencode:auto/best-free
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

As per the recent announcement, you need to prove how you tested this on
real hardware and all still works properly.

thanks,

greg k-h
