Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D2F2857F6
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 17:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752601457; cv=none; b=XMhlD3irzo0nOb+39lqAj7xnfKLdUn1oJbUSe0141o7XoWYW7ulW9KufoKgt1za+U200Gkw0pIqR+0bgiC20IoeETFSnGcqYIFsO1Uwj1KWfvUdnKLMDNKJJPSFUkyXurN/Re8dOSa1xOzazXehkrv8hgkFlSqBz0s7FVAQdYrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752601457; c=relaxed/simple;
	bh=0GJDFMtsSqrzL3Epz+awKDltn2gCgf+SZWRb+hz1UgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyAQchyIU5MiEEVIsjsPtDGkWSOtS5Fo3NTgDHCZ264ICpA/M/Hhe6Q/ctlfUlbiprvtV7f5fsBcOWrE2O83/mDCXvSMFm8bUvL1/L9/RPALxIADgz/cfEAczbpN7rO7gCumg71twhctmGgVs9w9qqtbTI7eklu1X+mDdXnOAp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tzwx4wfx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tzwx4wfx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEF3C4CEE3;
	Tue, 15 Jul 2025 17:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752601457;
	bh=0GJDFMtsSqrzL3Epz+awKDltn2gCgf+SZWRb+hz1UgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tzwx4wfx/Buc5zcel76rU8dNYHj/zBJYLoXH3ZrTznW5i/Hn/SfwAf3w7oAZky8xm
	 DG0eNzTGfXdnE4F+cwV1beHn5m4zVdVpK6ViDlQIc+GY+k0nN5T0rjOwkqTudF4T/P
	 5GDW2h4v15ocDIolG3L4WOgSiJ2iRv9PnaZDFG04=
Date: Tue, 15 Jul 2025 19:44:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH V2 0/3] staging: vchiq_arm: Fix regression & resource
 leaks
Message-ID: <2025071555-stubbed-hardiness-8306@gregkh>
References: <20250715161108.3411-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250715161108.3411-1-wahrenst@gmx.net>

On Tue, Jul 15, 2025 at 06:11:05PM +0200, Stefan Wahren wrote:
> This small series fixes a regression introduced by recent changes and
> possible resource leaks in the VCHIQ driver.
> 
> Changes in V2:
> - Add Maíra's Reviewed-bys
> - Fix Reported address in patch #2
> 
> Stefan Wahren (3):
>   Revert "staging: vchiq_arm: Improve initial VCHIQ connect"
>   Revert "staging: vchiq_arm: Create keep-alive thread during probe"
>   staging: vchiq_arm: Make vchiq_shutdown never fail
> 
>  .../interface/vchiq_arm/vchiq_arm.c           | 98 +++++++++++--------
>  .../interface/vchiq_arm/vchiq_core.c          |  1 -
>  .../interface/vchiq_arm/vchiq_core.h          |  2 -
>  3 files changed, 56 insertions(+), 45 deletions(-)

I already applied v1, is there any code changes that are different here?

thanks,

greg k-h
