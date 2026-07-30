Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C78A3845BD;
	Thu, 30 Jul 2026 07:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785397247; cv=none; b=ZSy9k4j1iw6lV0Wf6bTNEyYcHxqkYj+jbkvrba383OCSRYe+2pIMLnfIuFOK/5dLiCTAjP/CBLbfQPl8OFlg8EEXBT4yjQHUzlQHbq6jtcGbHh6nH8TZqDauPHPLjPPXsGb12YpNyTsQw46fbEGLdytRy9FgZAPYM3SMLbHFZlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785397247; c=relaxed/simple;
	bh=cSKErnOVzFtBRSSbmNvi4tRDcTD/PvhHg6IxevUaeDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bumK/OuYT4D5d27s+fqDuMzUinAQbRg2RiWl+1kcmQQU9njHriFddKUZFUfvSvmki9k7IWqXTx+lVcDXZT6mPYoxANmC4GlhD9oDkornDbCtQBeDPvU4alxao7On4GObXP8Wak2FC4yw4BBZresZozzFWIqOhNpm1iZCQ2Wv0a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=C4PGcKEW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="C4PGcKEW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC411F000E9;
	Thu, 30 Jul 2026 07:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785397246;
	bh=KBNFcSQ98FctZJTgETXE83AS9M/d5JqiR/+CNQUCdP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C4PGcKEWYt/93HuyFRfUBhIrnzORtnXm6Z1p+2+qOzbYrUNr+UPwaoFCWJ9r1uodL
	 II+z3+8lIgjWNTRUN61rtES6vLTSrFBsvbgZn5b9ckj09WYBuocaFCg8E1b82EIR3H
	 JwjDyBWYB4tzOoSYA1YfCvnP9PnF1Kz9Af0QZnAY=
Date: Thu, 30 Jul 2026 09:39:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mohit Mishra <mishraloopmohit@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix underflow logic in swing index
 calculations
Message-ID: <2026073034-pebbly-ladder-c95e@gregkh>
References: <20260729172707.13333-1-mishraloopmohit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729172707.13333-1-mishraloopmohit@gmail.com>

On Wed, Jul 29, 2026 at 10:57:07PM +0530, Mohit Mishra wrote:
> In ODM_TxPwrTrackSetPwr_8723B(), the baseband swing index variables
> Final_OFDM_Swing_Index and Final_CCK_Swing_Index are declared as u8.
> However, their calculation adds Absolute_OFDMSwingIdx, which is a signed
> 8-bit integer (s8) and can be negative:
> 
>     Final_OFDM_Swing_Index = pDM_Odm->DefaultOfdmIndex +
>                              pDM_Odm->Absolute_OFDMSwingIdx[RFPath];
> 
> If the resulting sum is negative, it underflows under u8 rules (e.g. -5
> becomes 251). This causes the lower-limit checks (e.g. <= 0) to fail,
> and in MIX_MODE causes the logic to execute the "BBSwing higher than limit"
> branch instead of capping to 0.
> 
> Additionally, in BBSWING mode, the check for CCK underflow mistakenly
> examines the static struct member pDM_Odm->BbSwingIdxCck instead of the
> newly calculated Final_CCK_Swing_Index:
> 
>     else if (pDM_Odm->BbSwingIdxCck <= 0)
> 
> Fix this by changing both swing index variable types to int to enable
> signed math and correct branch selection (aligning with the TODO item to
> convert remaining unusual variable types). Update the CCK check in
> BBSWING mode to examine Final_CCK_Swing_Index.
> 
> Note: The fix is scoped to the calculation and branching logic. When
> passed downstream to setIqkMatrix_8723B() and setCCKFilterCoefficient(),
> the values are already clamped within [0, 42], fitting safely in u8.
> 
> Compile-tested only; no hardware available for testing.

How was this issue found?

thanks,

greg k-h
