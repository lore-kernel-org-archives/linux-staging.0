Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D0C350286;
	Wed, 17 Dec 2025 13:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976609; cv=none; b=kTjvo4OW0NmKdui76iB7gJ2OlIQ3/WRSG703IY5VR0GUnS4b/NUrqY6XQ7zHvgG69p9KDyL4mbxNI6JsmsgMyc+yRmqVHZWdDNGQKBiRB0P3Sj3x2fu7Odxv3BTh61ck88EjidmtJqbP6yf3Y4gHGLB9Eu39XKBFO0qrPX6SiVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976609; c=relaxed/simple;
	bh=KCF+vNxwae5U8YvbGsMDmus4ettFdz1WWFNTy9p9Q4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFeu12Cp7ZDb3wsLHFCEAy+w7NZSrFPNf+RSw+fcTO7vzP0jJRHcPGWx2lHYIpIFbq5/LgdNfpwF6zi9x0nhcpZA8cgHegVLYuuy/TNCz+3Wj+LTHIjznNK/Xz7EVVji8c/kQLzzCHHo67+vmzpo8y0DIw2eIwQ3w0ycihCAX7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IFSrB/qS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IFSrB/qS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC7EC4CEF5;
	Wed, 17 Dec 2025 13:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765976608;
	bh=KCF+vNxwae5U8YvbGsMDmus4ettFdz1WWFNTy9p9Q4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IFSrB/qSvvau32DkQT6DaCeW6q5GgcARcPCEa2paUrC4z1CUuYV9jCuDuvzi991Nq
	 naffuXEEIzOsyuTcO4pQjaKM5VnMxQyPSdpfyF4mUkcF2mw/ju9ct+xibvjBcLpMv6
	 Wo0CYjirO9NDeplRiSYRVf1XZ0Ehg8FjPiVRUR4g=
Date: Wed, 17 Dec 2025 14:03:25 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bryant Boatright <bryant.boatright@proton.me>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Checkpatch cleanup patches
Message-ID: <2025121747-unluckily-filth-c167@gregkh>
References: <aTF0D_zaeNVIfP2E@ubuntu-desk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTF0D_zaeNVIfP2E@ubuntu-desk>

On Thu, Dec 04, 2025 at 11:44:19AM +0000, Bryant Boatright wrote:
> Correct camel case names reported by checkpatch.
> 
> These patches are not required to be applied in any order.
> 
> Changes in v3:
>    1. Patch 1: Updated parse_res to parse_result for clearer purpose per
>       feedback from gregkh@linuxfoundation.org.
>    2. Patch 1: Change definition of parse_result to multi-line definition per
>       feed feedback from gregkh@linuxfoundation.org.
>    3. Patch 2: Fix typo in commit message introduced in v2 per feedback from
>       gregkh@linuxfoundation.org.
>    4. Remove patch 2 (from v2) as name change was not needed per feedback from
>       gregkh@linuxfoundation.org.
>    5. Add changelog for patchset to cover letter per feedback from
>       gregkh@linuxfoundation.org.
> 
> Changes in v2:
>    1. Patch 1: Make enumeration constant names all upper case per feedback from
>    straube.linux@gmail.com.
> 
> Bryant Boatright (2):
>   staging: rtl8723bs: Rename camel case enumeration
>   staging: rtl8723bs: Rename camel case variable
> 
>  .../staging/rtl8723bs/core/rtw_ieee80211.c    | 26 +++++++++----------
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
>  drivers/staging/rtl8723bs/include/ieee80211.h | 12 ++++++---
>  3 files changed, 22 insertions(+), 18 deletions(-)
> 
> -- 
> 2.43.0
> 
> 
> 

These did not come through as properly linked together, how did you send
them?  Can you use something like 'b4' or 'git send-email' to send them
as a patch series, and not as unconnected emails?

thanks,

greg k-h
