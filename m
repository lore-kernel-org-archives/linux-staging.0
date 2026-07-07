Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84AE3F4DEF
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 11:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422673; cv=none; b=oNIi5CRxrXRQCf4nTkPF9CEZTy6lIkXvnRlGo6HNHA2UeSnV2Zh0Csbk29bCzfTJsx4X0tIhkHqOcpOXUJhoBG47lPk/zrqSfZd+E/prfA6fpuhTgbu8nv0sdlcm0ldO8gTj2s6Hmj3MlPkVHJcT3j/RTGg5ryJXOv1gEv5IoOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422673; c=relaxed/simple;
	bh=x+duL7XA/dpa2hjuzPp8JrtPakqvJqCwXgAE70OScBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7WT7tAo+GilwYhCaNpzBlqWtuju5JiEtphFz9UPgMXZwpydyx57tJ17vODDC7P1Jd0Ajlw+NXXrbjMuJVp0zkjqeGh/Wf7syGicXaNxsLNHIg8T989p3Qm7HyKVvGqy7XvGKdDMIOiz440iFEu2SjRZtRGPd8TFOQZ1rYwHIgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FVppjyZS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FVppjyZS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32861F00A3A;
	Tue,  7 Jul 2026 11:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783422671;
	bh=97NP5PtVhSLaqSHw5iJPxyz4YPnSNCWoV7pGT064lak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FVppjyZS0eDvBm4DPKNbTY2ymoyTbg0PKkLLJqHFNeYJYRvb2PlmIxmqdDDWCE55N
	 SpyaOIWZaOsSL+LUNzl4TFBTZKsy6LVYjOlGsk/vYAojHg3lHWuamhalVtOs5melGh
	 pizrWshYqjUJ1fUIWWcIxAp5h/nKASQU9jQo5luo=
Date: Tue, 7 Jul 2026 13:11:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jad Keskes <inasj268@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: replace beacon timing magic numbers
Message-ID: <2026070743-visa-triceps-9330@gregkh>
References: <20260616193134.1759947-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616193134.1759947-1-inasj268@gmail.com>

On Tue, Jun 16, 2026 at 08:31:34PM +0100, Jad Keskes wrote:
> Break down the 0x6404 and 0x660F in
> rtl8723b_InitBeaconParameters() so people don't need the out-of-tree
> driver open to know what these do.
> 
> REG_TBTT_PROHIBIT (0x0540): 0x6404 = hold (0x64) and setup (0x04), both
> in 32us ticks.  Same layout as rtw88.
> 
> REG_BCNTCFG (0x0510): 0x660F is an EDCA-like register.  Lower byte is
> AIFS (0x0F = no contention before beacon), next nibble is CWmin (0x06),
> top nibble is CWmax (0x06).  Matches rtl8192cu which writes 0x66FF
> (test chips) and 0x660F (production).
> 
> Drop the TODO since this was the last thing it referenced.
> 
> Signed-off-by: Jad Keskes <inasj268@gmail.com>
> 
> Link: https://lore.kernel.org/all/aiGMXBNQ0TbIGbpP@stanley.mountain/

This is v2, right?  Please always document this properly.

thanks,

greg k-h
