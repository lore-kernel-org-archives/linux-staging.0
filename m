Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30D242046D;
	Wed, 15 Jul 2026 13:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784120599; cv=none; b=Nq3Nn6Gpq018K1Gvox4X9GRFtGsSg8tv2u40cnxEsgN7pSb8f6svQXR6mc03AdJA/0/basLGYnELq3jlAn8Eg1PODz3QzANNWq20ulZWzdVTBiUkaSMZY8p11KQ1ZtnQ8bX9zTgkHIsBYiIE9FVRtZi/aRXoA1gUCI22mtO6tZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784120599; c=relaxed/simple;
	bh=MwloPwwe5mU2QGdOjBAJc2FapRP6pWx+LHznZ5VkZvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0A1vQx3hLKfmVJ5Ei7/rsuwu5VXlC7rMgSlv1YW/wTxQnY+BNYYiDjgBpe4X7iXs1hx6cARiBoRfdE6M99fyzcW44dI0ZoPwKxZPpCNeNQyu2fLb9DXzJmWnCyzlmSBbyb14KOxR3K09LgtbXCbo/Y9FjXUvPZtaKfZjxf9CAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QUEE1zOg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QUEE1zOg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D235D1F00A3A;
	Wed, 15 Jul 2026 13:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784120597;
	bh=6KoEq7we8D7MNjaWMlaa0tiRGQB+sGQz7vW0IkPGUwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QUEE1zOgGWj199mqoaWgV/lOrsPkRaC63K2KUvCg1cCCaOdqDFMM4aWw5Zl92uYtm
	 TsI0EDai/XRz8tje0GV0fRoaPulpoVKU3sILtIPonkoEws4cMYiL/a2IdYDDofXg5z
	 zfX3e4YIgkHhTaXiQXyL/F/5QvNz8k1AauBVaTGo=
Date: Wed, 15 Jul 2026 15:03:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arsenii Pashchenko <ulijg308@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/61] staging: rtl8723bs: monolithic HAL cleanup and tx
 power limit fix
Message-ID: <2026071541-spindle-voicing-fd97@gregkh>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>

On Wed, Jul 15, 2026 at 07:47:28PM +0700, Arsenii Pashchenko wrote:
> Hello,
> 
> This patch series performs a massive, systematic cleanup of the legacy 
> vendor HAL layer and redundant abstraction wrappers in the rtl8723bs 
> driver, concluding with a functional fix for the TX power limit lookup.
> 
> The primary goal of this refactoring is to drastically improve the 
> readability and maintainability of the codebase, transforming the 
> highly tangled, Windows-legacy Realtek abstractions into a cleaner, 
> more idiomatic Linux driver structure.
> 
> KEY CHANGES IN THIS SERIES:
> 
> 1. Dead Code & Stub Removal: Eliminated several unimplemented functions, 
>    empty stubs (like OnAtim, DoReserved), duplicate prototypes, and 
>    completely unused helpers (NULL_hdl, set_csa_hdl, tdls_hdl).
> 2. Wrapper Collapse & Inlining: Removed multiple layers of superficial 
>    wrappers around core operations (e.g., rtw_ap_set_group_key, 
>    issue_deauth, issue_probereq, rtw_free_mlme_priv, etc.). High-frequency 
>    or single-use HAL entry points (like SetHwReg8723BS, GetHwReg8723BS, 
>    and xmit helpers) have been carefully inlined directly into their 
>    respective dispatchers to enhance readability.
> 3. Scope & Warning Fixes: Restructured local functions (like 
>    lps_ctrl_wk_hdl) by marking them static and aligning headers, which 
>    resolves missing-prototypes compiler warnings.
> 4. Logical Fixes: In the final patch, a critical copy-paste bug in 
>    phy_get_tx_pwr_lmt() was resolved. The computed channel index from 
>    phy_GetChannelIndexOfTxPowerLimit() was mistakenly assigned back to 
>    the 'channel' parameter and discarded, leaving 'idx_channel' at -1. 
>    This caused the function to always fail validation and return 
>    MAX_POWER_INDEX. Correcting this restores the intended hardware tx 
>    power limit logic and resolves a compiler warning.
> 5. Refined Abstractions: In places where removing a wrapper would 
>    decrease overall elegance or require awkward type workarounds, the 
>    cleanest architectural approach was intentionally preserved.
> 
> TESTING & VERIFICATION:
> 
> - Hardware: I do not possess the physical rtl8723bs hardware, so 
>   real-world runtime wireless testing was not performed.
> - Compilation: The entire series compiles flawlessly against the 
>   latest tree.
> - Code Style: All 61 patches have been fully validated with 
>   `scripts/checkpatch.pl` and return 0 errors / 0 warnings per patch. 
>   (Note: A few pre-existing vendor style warnings remain in the modified 
>   files, but no new ones were introduced).
> 
> This cleanup significantly reduces the boilerplate footprint, making 
> future maintenance and eventual mac80211 migration tasks much more 
> approachable.

How did you do all of these?  Without testing I am loath to take such
large changes, right?  Did you use a llm?

thanks,

greg k-h
