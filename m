Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B223D812C;
	Tue,  7 Jul 2026 11:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422162; cv=none; b=KYVsVLrSqn865hP/fYfn00S5Vorpeh7VAJbC6epzv6f0b8uWaX70i2cNxAGfAxY4CTu4zXRu/ezkaO7yi5D4UTvJ1dfnPn+/+aHcA5ZqrZtI+2e66BR49tqwkEa8CwmuqotfIAtURIvzJ5hBOpIxeWGmuAXhalcaNCeVaS3wMWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422162; c=relaxed/simple;
	bh=1FlDDdhQoz+yLA8ZmHL8hbTeVAJh15nXAHFglMHFtlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RT071cGg1Tn9fCwc+6i8IbTM5jx7WfpjoZw3xkzKy0zeIKcX16ORfR9LGYlhgxf6+0NNgZfeRK9pGMJ/MPK5d9jBbJZ0VdJQqSTybaWT+bEO9XkwLfNUTp/z0NUZtHvvvSWgd4sBqs5aBUE/M1IreFm4Nj6vEigZjbrkz5rOTFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Xoi8JvfU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Xoi8JvfU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5411F000E9;
	Tue,  7 Jul 2026 11:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783422160;
	bh=kBDpSaG9jgBk31GQHWox+SP192ghFhT+QoVCiMmgUUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xoi8JvfUTCOFQ+p4yDevImDszX+UB15/ZafGwJj1CNDbGc0ylohx1o0+wtDH+8YKn
	 NG+OO1Fy7UQNPj5ZXED4Bfbex59zv7LHSpg9JMBtzW8HXDsgVmM6twyYwRjQTu/XhW
	 Bz3FLjC/PJS+sfChZl7eFtPb3NvcBxJ1L2YzjF8g=
Date: Tue, 7 Jul 2026 13:02:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: fliegbert2@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] staging: rtl8723bs: Rename camelcase variable
 dot11AuthAlgrthm_8021X
Message-ID: <2026070726-exploit-reversion-238f@gregkh>
References: <cover.1780343502.git.fliegbert2@gmail.com>
 <a3add17a969772a1ea6f9c2dc00cc2591fa152d9.1780343502.git.fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3add17a969772a1ea6f9c2dc00cc2591fa152d9.1780343502.git.fliegbert2@gmail.com>

On Mon, Jun 01, 2026 at 08:39:53PM +0000, fliegbert2@gmail.com wrote:
> From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
> 
> Rename value dot11AuthAlgrthm_8021X to dot11_auth_algrthm_8021x in
> enum to resolve checkpatch.pl CamelCase finding.
> 
> Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c           |  8 ++++----
>  drivers/staging/rtl8723bs/core/rtw_ioctl_set.c    |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme.c         |  8 ++++----
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c      |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_xmit.c         |  2 +-
>  drivers/staging/rtl8723bs/hal/hal_com.c           |  2 +-
>  drivers/staging/rtl8723bs/include/rtw_mlme.h      |  2 +-
>  drivers/staging/rtl8723bs/include/rtw_security.h  |  2 +-
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 14 +++++++-------
>  10 files changed, 22 insertions(+), 22 deletions(-)

Does not apply to the current staging-testing branch :(
