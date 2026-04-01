Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8371839A7EA;
	Wed,  1 Apr 2026 08:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032813; cv=none; b=trUcRubVToxA5bJgE74xD3V0syDPxw34xk/2EcFmu/PBNdq0E/lOtx82Dy1auYW8lVq+/Q7K6q7rky/nT7PreUC28ndV3OkuWMe6+UI/QdjgmjNCzz4aA6VZJ5DqDttK3KhJg14ktR3cAQni74rA8n5gGHV+YcnpbuTlXHvtE5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032813; c=relaxed/simple;
	bh=iFuKr5wu5ciVXzvjQUyHzVOi+ssIal7anbRoUurO/R4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PEq+S5h2dgVu5Sg/ixiKyLirKWm3hMbJCce61YgeZ+TGz5V3eLuP6LSWQ2ZqsEz4wQSvpPjJXCQ8azPhEFII8idPU6M1Da4TegagjnA4cDPoo0e9+rvpTmUnb8oxuUoHLGKfMJ5tZ7Qqhi8jB6xIGzdG+ogi3IkcyjaTD6Tf7Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZhltLHy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZhltLHy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18585C2BC9E;
	Wed,  1 Apr 2026 08:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775032812;
	bh=iFuKr5wu5ciVXzvjQUyHzVOi+ssIal7anbRoUurO/R4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LZhltLHyHLZ6iB9f5w0sQgUpIrmQ7IW/V3JlDtmVDNpjx2uIclQqACGD/5qFJG6QD
	 nlY5RjZ2ch4CMzJvczdn5LsPRNkK/2XTeCjJ8eRVpUm8i33yYOiLpF/mkCG6A8KiAU
	 +Jo8fqU8HFigwdW4KKr1CoHvXTIoBJxIt1v5srFxOSnVZ21JFNJ/zZd7bgSkhBfKeF
	 el+hbccM/FRYwGPh8rSJzjBvf80W2uIftQubbn6UN8+BzfTTms+LzgnLgL4u451Ftx
	 i1ZE5Ri8Vy/12JPkKzUuAR2w8Q3GPu8sCcfxBka8zgwiSj4jnlsO+Xs1Uz+Q6AzfjZ
	 jYfVz+SWW+XEg==
Message-ID: <9f64c551-87c8-40c3-970a-0706fae78475@kernel.org>
Date: Wed, 1 Apr 2026 10:40:09 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] rtw_sdio_if1_init cleanup and small logic tweak
To: Luka Gejak <luka.gejak@linux.dev>, omer.e.idrissi@gmail.com
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <B2394A3C-25FD-4CEA-8557-3E68F1F60357@linux.dev>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <B2394A3C-25FD-4CEA-8557-3E68F1F60357@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2026 22:25, Luka Gejak wrote:
> Hi Omer,
> Thank you for submitting this patch series. Efforts to clean up the 
> initialization paths in these legacy Realtek staging drivers are 
> always welcome, as they are a necessary step toward aligning the code 
> with upstream kernel standards and eventually moving the driver out of
> staging.
> I have performed a detailed technical audit of the series. While the 
> high-level goal of improving readability is correct, there are several
> critical regressions and architectural issues that prevent patch 
> series from being accepted in its current form. 
> Please see the detailed breakdown below:
> Patch 1/5: Use direct returns in rtw_sdio_if1_init
> While the move toward direct returns is visually cleaner, this patch 
> introduces a significant risk of a kernel panic. In the original code,
> the status variable guarded the cleanup labels. By removing it, you 
> have exposed an uninitialized variable bug:
> struct net_device *pnetdev; is declared on the stack but not 
> initialized to NULL. If the function fails early (e.g., if vzalloc for
> padapter fails or an early hardware check triggers a goto), the 
> execution jumps to the free_adapter label. The logic then evaluates 
> if (pnetdev). Since pnetdev contains uninitialized stack garbage, this
> check will likely evaluate to true, causing the kernel to attempt to 
> call rtw_free_netdev() on a random memory address.
> Requirement: For v2, you must initialize pnetdev = NULL; at the top of
> the function to ensure the cleanup path is safe. Check below for more 
> information about next steps for patch 2.
> Patch 2/5: Remove useless line in rtw_sdio_if1_init
> This patch is technically correct in its removal of the redundant 
> padapter assignment. However, the diff shows that it also performs 
> whitespace cleanup by removing an empty line (the "two minuses" in the
> diff). To maintain a clean git history, we follow the "one change per 
> patch" rule. Mixing dead code removal with whitespace adjustments 
> makes the history harder to parse. Please either keep the whitespace 
> as is or move all stylistic cleanups into a dedicated "Cleanup 
> whitespace" patch within the series. 
> Patch 3/5 & 4/5: Logic simplified for rtw_init_io_priv/rtw_init_drv_sw
> I have verified in drivers/staging/rtl8723bs/include/osdep_service.h 
> that this driver defines _SUCCESS as 1 and _FAIL as 0. This is the 
> inverse of the standard Linux kernel convention (where 0 is success 
> and -ERRNO is failure). By changing the check to if (func()), your new
> logic triggers the goto error path when the function returns 1 
> (Success). This would result in a driver that fails to probe entirely,
> as every successful initialization step would be treated as a failure.
> Requirement: We cannot simplify these call-site checks until the 
> underlying functions themselves are refactored to return standard 
> kernel error codes.
> Patch 5/5: Logic tweak for rtw_wdev_alloc
> Logic: This suffers from the same inversion issue mentioned above 
> regarding rtw_wdev_alloc return values. This patch also introduces a 
> trailing whitespace on the empty line added before the rtw_wdev_alloc 
> check. Please ensure you run scripts/checkpatch.pl --strict on your 
> patches before submission to catch these formatting errors.
> 
> I recommend the following path for v2:
> Step 1: Submit a patch that properly initializes pointers to NULL to 
> make the cleanup paths safe from crash. Although initializing pnetdev 
> to NULL prevents the immediate crash, the cleanup logic remains 
> fragile. In v2, please consider refactoring the error path to use a 
> proper LIFO (Last-In, First-Out) label stack. Each goto should jump 
> only to the cleanup steps for resources that have actually been 
> allocated up to that point. This avoids redundant checks and potential
> double-frees or leaks.
> Step 2: If you wish to proceed with the macro removal, provide a 
> preparatory series that refactors the internal return values of 
> rtw_init_io_priv, rtw_init_drv_sw, and rtw_hal_data_init to standard 0
> (Success) / -ERR (Failure) conventions.
> Step 3: Once the functions follow standard conventions, the cleanup in
> Patches 3-5 will be correct.


This is absolutely unreadable review. Please provide reviews inline, as
expected in Linux kernel review style.

It all looks like some output of microslop with:

"I have performed a detailed technical audit of the series. "
"Requirement: We cannot simplify these call-site checks until the "
"To maintain a clean git history, we follow the "one change per patch
rule. "

Only AI reasons that way uses such idealized teaching explanation.


Best regards,
Krzysztof
