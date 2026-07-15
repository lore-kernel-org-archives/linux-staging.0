Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0767236F433;
	Wed, 15 Jul 2026 14:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124633; cv=none; b=GLHsuI1g4S3WKpJihinY/QHJUehPZoBaAC6u1u6kLRYDiVZPT8HOZXHx5VXFGHG46OhdOfhVvs05ZyeMFCwCoN4hMxxX71juGV2n9pEbD+Gc8HCLOe7SdQgqeaKXTMZpdEGcnEWUrZRLEiikF5x/Mv6AxHV4cb4k6egOvbqEFo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124633; c=relaxed/simple;
	bh=hYqiQ7DksK6ezNKHiyodFw/MgiNhOBp1BrxxZizEvpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbiqS7ifogmL0uefVlT0YZoR1K1ny5BYzlD+4jNsJ44gI8k+tnf0d/v/UExL+ARl+bbPjF8xjF9jTXA2IhrLBVm/LZ6NCtjLgp2iOrgGQxg+npNyDnzxsrM6Apc4Dr2B2S7X4lYzGFkzhxQ4cS98jGKR+zfdR2Thu488qHu15P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CHfe/2Pk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CHfe/2Pk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B1C1F000E9;
	Wed, 15 Jul 2026 14:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784124631;
	bh=nL080WGjtY3OZ/UkiV80q/GidqYYHcqJZxT/Agi8/as=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CHfe/2Pk8N7T3Tup1yijMmmFa84A6+5PJHMrmp2/Qwd3g5s7nq0o7fZ6mngqVdZXb
	 Pe4ai8XVUwm6zvEzxnA+BhzfJD/hGMWyTvIZfPvIhwBzXsPKshAft6HAApSo3VXp1f
	 myZzsGznhQ+j4rxQQ4gC5QuZwCnFhgnhkinsfm0s=
Date: Wed, 15 Jul 2026 16:10:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anantha Krishnan <ananthanr.off@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: replace magic number in
 InitBeaconParameters
Message-ID: <2026071512-engorge-exact-7e22@gregkh>
References: <2026071157-ovary-property-4427@gregkh>
 <20260711063901.30828-2-ananthanr.off@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711063901.30828-2-ananthanr.off@gmail.com>

On Sat, Jul 11, 2026 at 12:09:02PM +0530, Anantha Krishnan wrote:
> Per the bitfield comment in hal_com_reg.h, REG_TBTT_PROHIBIT packs
> a "setup" time in bits 3:0 and a "hold" time in bits 19:8. The
> rtw_write16() call here only writes the low 16 bits of that
> register, covering the full setup field and the low byte of the
> hold field.
> 
> Replace the magic number 0x6404 with two named constants
> representing these fields.
> 
> No functional change.
> 
> Bit-field positions are documented in the comment above
> REG_TBTT_PROHIBIT in drivers/staging/rtl8723bs/include/hal_com_reg.h.
> 
> Signed-off-by: Anantha Krishnan <ananthanr.off@gmail.com>
> ---
> v2: Use full name in Signed-off-by and document the source of the
>     bitfield values (comment above REG_TBTT_PROHIBIT in hal_com_reg.h)
>     per Greg's review.
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

This should be v3, as you already sent a v2 :(
