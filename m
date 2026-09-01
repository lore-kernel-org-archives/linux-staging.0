Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19BA386578
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256264; cv=none; b=hFq8UrKJYSLViOI12IB50uybAg8WwL/Y6lxTDG1hKSeR5rze1PyhMxuyGgTiLgnZba4Ys4w7r91eCwFjAlO1+kY9xS98qsgxbKLSolpvW/mr8TyHcTQZW2s6L78oMwF7WgNeQay3gNBwCMZgjRTHHiICsCr2SAMWVj1dDKzT4LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256264; c=relaxed/simple;
	bh=7zXnKlMDeSmPmfLpPMmMYU53dSuYAuTuVuShm5FvXcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLo59rlesLlyngSw1TNHDwSHNLSD/nhi4rMR2CZLd9stjZOztyaDBu/+XTIOfffET8Kj8mRhmDSpNBLPWNEn8GrhqCjsWRBS/Rq1qGlh+Nx5/eKC+ReiZ3O2w2vKGnSvRcQ2IiZEu7oSujff7fTxtwJE7ThbpSUAHO1ZV6H53BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PSiWvgLz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PSiWvgLz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C501F000E9;
	Tue,  1 Sep 2026 09:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788256261;
	bh=xVyrdIxOrdDxDQ4oMSyCwACRAsmslU5/nYqBlOLY36s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PSiWvgLzWpF1Og3h6s02BnKkjmUQ0q8nJEewchU0/b62y20gkhzus0VQ90FyuECJ2
	 ax7zlje78EnmWh/MNyRakpPtKuZE81fUFigXJ7DJkx20w3r4et5dEz/yaH0NybSrE2
	 9nPtv+8rCh+N7fZL+gtUB3qv7+Tn28f90t4c7+mk=
Date: Tue, 1 Sep 2026 11:50:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Andr=E9?= Moreira <andrem.33333@gmail.com>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: remove unused loopback macro
Message-ID: <2026090140-gumball-fritter-6a08@gregkh>
References: <20260812183833.39666-1-andrem.33333@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812183833.39666-1-andrem.33333@gmail.com>

On Wed, Aug 12, 2026 at 03:38:32PM -0300, André Moreira wrote:
> The gb_loopback_attr macro is no longer used in the Greybus
> loopback driver. Remove the unused macro to avoid keeping dead
> code in the driver.
> 
> Signed-off-by: André Moreira <andrem.33333@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 26 --------------------------
>  1 file changed, 26 deletions(-)

Please see the mailing list archives for why this same patch has been
rejected in the past.

thanks,

greg k-h
