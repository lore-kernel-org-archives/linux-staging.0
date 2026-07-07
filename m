Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCF93D8900;
	Tue,  7 Jul 2026 11:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423368; cv=none; b=sgnXoqyk2wfDcDA6/q2Hn4XufFnQup9wn0CzFnOMxN3uJysJQcEBIgDjHF9ho52d/eDoB9BiZbn/04PkY1fHqwQ58YVzv1OYOSEbMsu65w5T+1QNO1QFsMMjZQeMhDZQpaCbB/XnhTmsKBsxG2adxybfkq3n09yJFK8F9z9JJqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423368; c=relaxed/simple;
	bh=+6G3cLCMnAJpCBYmX+biQ9jHdJLFhta9GcyZdnn5e/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gfzH0CKvBhDBsePXiAKdVYkuhOB+r1CCy7FycVjf89chm8+mvzSo++fb9an/kCNkm1lyrSKobTz7OTCfJiW6wR2TyXre32oEpFlA7L4QZyv9R8gOJfKiZVrQvCzozt424/HjAw0f3roFh3luwf0bVzTbg9MpPcb2Hj+wgQwEAXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F5fJIMTH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F5fJIMTH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635D71F000E9;
	Tue,  7 Jul 2026 11:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783423366;
	bh=hIKHkROCwqFa6pxoWNs5ZLvsz8R51QxoKs0rPPLGFL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F5fJIMTHz7Rxs4vCTPjdkSIWKaIarj1rTw1M/lGIOtx2wiV/kEcZtSOT4pRLvDKc5
	 TS3vI7UcMu4jlt1VArpKiVXuiuKKpQ2chyi+JcGPejiozgEeDCHodK0OH5sAvOArjF
	 aCUcLxNHw6fffkc2O9DDtap8gnOqqOlU1Rj4cWpg=
Date: Tue, 7 Jul 2026 13:22:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kai Cheng Jin <kj@kylejin.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: add spaces around operators
 in rtl8723b_cmd.c
Message-ID: <2026070718-roundish-cherisher-938c@gregkh>
References: <ajT4n4p7CKiApCPF@stanley.mountain>
 <20260619201600.973619-1-kj@kylejin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619201600.973619-1-kj@kylejin.com>

On Fri, Jun 19, 2026 at 01:15:58PM -0700, Kai Cheng Jin wrote:
> Add missing spaces around arithmetic and bitwise operators to
> follow kernel coding style, as reported by checkpatch.pl.
> 
> Signed-off-by: Kai Cheng Jin <kj@kylejin.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 88 ++++++++++----------
>  1 file changed, 44 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> index c35c7f1c38ef..d92dde57b720 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> @@ -70,23 +70,23 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
>  			goto exit;
>  
>  		if (CmdLen <= 3)
> -			memcpy((u8 *)(&h2c_cmd)+1, pCmdBuffer, CmdLen);
> +			memcpy((u8 *)(&h2c_cmd) + 1, pCmdBuffer, CmdLen);
>  		else {
> -			memcpy((u8 *)(&h2c_cmd)+1, pCmdBuffer, 3);
> -			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer+3, CmdLen-3);
> -/* 			*(u8 *)(&h2c_cmd) |= BIT(7); */
> +			memcpy((u8 *)(&h2c_cmd) + 1, pCmdBuffer, 3);
> +			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer + 3, CmdLen - 3);
> +/*			*(u8 *)(&h2c_cmd) |= BIT(7); */

What changed on this last line?  That shouldn't have happened :(
