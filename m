Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D113F2101;
	Fri, 10 Jul 2026 14:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783695173; cv=none; b=RNPHo3bQun4Gc+e7Vn93McFybTgI06U8jR/YIzcs2O7ZxjUrvbti0hY/iyeQ5PicmhQBXXHDC04IbIDZpFTk70GnwEGwcEa23KU1t6tv88N/PdUu1ZWW4iwqrSo/ODvvjSO5TvCqrFmPUdPQbMOz2HItWP4oENzgtIeUOMTafd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783695173; c=relaxed/simple;
	bh=Z4gQDayfu4HLPa1jT5HfNfpDAXTW1z/Pk97FCZFXNzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Agr+fU12YrgULzm3XKO+UPW0Z8/hCA73lSMPn7igkaeEPFdwCaaqn8AZyBifknBD7Qz89qAiLV2zTOxr9HYHm9of14hBYzZxvYQ96bn2dwABr57E0uUXaFKNotCTJdCEVoPlSeUOtuP3mXvwcezb/4inN8nm1nvqzekq/ZeRi6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JYDW66N0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JYDW66N0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967431F00A3A;
	Fri, 10 Jul 2026 14:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783695171;
	bh=NNrN7/GwqMZh+qc1wtzavs2/RSgdIScZ/rIaToc6eDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JYDW66N0KRIoQtYOowy/6OJuD21neY5P7LjNGcWCuWnr6BeUNe25uxeOEd0hpW4U/
	 EXdU2+kZiTTzNjcOxtqh8+yW34128bw7GVy8MdxMGJqMjqCCX1BEGNtm5EsYqf739A
	 00o5qLxHjCc+tM8QqNj8X9USOHjCcGrvmSIr1qQo=
Date: Fri, 10 Jul 2026 16:52:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: fliegbert2@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 0/5] Rename camelcase enum values dot11AuthAlgrthm_
Message-ID: <2026071029-headed-circle-507d@gregkh>
References: <cover.1780343502.git.fliegbert2@gmail.com>
 <20260710104529.5366-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710104529.5366-1-fliegbert2@gmail.com>

On Fri, Jul 10, 2026 at 10:45:24AM +0000, fliegbert2@gmail.com wrote:
> From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
> 
> This patch series renames camelcase enum values in the rtl8723bs driver
> to address checkpatch.pl CamelCase warnings. It also replaces spaces
> with tabs where required by the kernel coding style.
> 
> Changes in v3:
> - Dropped v2 2/6 as changes are already in staging tree
>   after rebase or unnecessary
> 
> Dalvin-Ehinoma Noah Aiguobas (5):
>   staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_8021X
>   staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_Open
>   staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_Auto
>   staging: rtl8723bs: Rename camelcase enum value
>     dot11AuthAlgrthm_Shared
>   staging: rtl8723bs: Rename camelcase enum values dot11AuthAlgrthm_WAPI
>     and dot11AuthAlgrthm_MaxNum
> 
>  drivers/staging/rtl8723bs/core/rtw_ap.c       |  8 ++---
>  .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme.c     | 10 +++---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 18 +++++------
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     |  8 ++---
>  drivers/staging/rtl8723bs/hal/hal_com.c       |  2 +-
>  drivers/staging/rtl8723bs/include/rtw_mlme.h  | 12 +++----
>  .../staging/rtl8723bs/include/rtw_security.h  | 10 +++---
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 32 +++++++++----------
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
>  11 files changed, 53 insertions(+), 53 deletions(-)
> 
> -- 
> 2.54.0
> 
> 

Can you rebase this against my staging-testing branch and resend?  It
currently does not apply cleanly.

thanks,

gre gk-h
