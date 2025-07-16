Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8692798E3
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 07:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752651187; cv=none; b=lMDGSOPyOPBkfPwQ0qBWyhn9k5nfcaiJHLska53YDeWtP/M1TShIIba+NgM6HfgI6hxKvCaN8T6gvLCUv3His+zbNfD6uq9EM+R7B7nWUaW7nxtsL+e4zMYhUjINXhJr0HIlGaKkBVwE7PdOGAvvdQgUc1KH6UosVnLYSqW2VNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752651187; c=relaxed/simple;
	bh=wSS+MxIy+JyaYWx3+wf/p7Zd06S5TWqVfO1PJxPUgZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o27aM0y/MpiUH/cyfLzI2YZ1/SOL2iG2U9uWhUEZAzlrmMkqaeH6VgFg6tPOqCHHaKVhr/tvI0K8EXFAo++zvI77o+cOBfhXROodTTNs5DzEx3Z+82dVKhS/kBuCRdhzUW/J7flf4xoAKMGkNWGc9P3Qy/CQ82lJLmd4jGvSEDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fddcbr6D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fddcbr6D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA951C4CEF0;
	Wed, 16 Jul 2025 07:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752651187;
	bh=wSS+MxIy+JyaYWx3+wf/p7Zd06S5TWqVfO1PJxPUgZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fddcbr6DEZO1a73wntEdYLzsy5sHn3xtD9CsDxtPCJGWF2xxowZUT6gckYLxfSVuS
	 oKLkNkqhahFO9O8+bPh2QT/WaslT1QmsRrVHQRVh0j4K2/Uk3xxv0fhwXzko38scVj
	 4ql2gdc4mlHVY0HsiNDvFJL9qGnB+kg1srEcBEPc=
Date: Wed, 16 Jul 2025 09:33:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH V2 0/3] staging: vchiq_arm: Fix regression & resource
 leaks
Message-ID: <2025071644-sulphate-outdoors-02ae@gregkh>
References: <20250715161108.3411-1-wahrenst@gmx.net>
 <2025071555-stubbed-hardiness-8306@gregkh>
 <5e9e606e-d227-4d87-a5b7-cb5a105dcd98@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e9e606e-d227-4d87-a5b7-cb5a105dcd98@gmx.net>

On Tue, Jul 15, 2025 at 09:59:45PM +0200, Stefan Wahren wrote:
> Am 15.07.25 um 19:44 schrieb Greg Kroah-Hartman:
> > On Tue, Jul 15, 2025 at 06:11:05PM +0200, Stefan Wahren wrote:
> > > This small series fixes a regression introduced by recent changes and
> > > possible resource leaks in the VCHIQ driver.
> > > 
> > > Changes in V2:
> > > - Add Maíra's Reviewed-bys
> > > - Fix Reported address in patch #2
> > > 
> > > Stefan Wahren (3):
> > >    Revert "staging: vchiq_arm: Improve initial VCHIQ connect"
> > >    Revert "staging: vchiq_arm: Create keep-alive thread during probe"
> > >    staging: vchiq_arm: Make vchiq_shutdown never fail
> > > 
> > >   .../interface/vchiq_arm/vchiq_arm.c           | 98 +++++++++++--------
> > >   .../interface/vchiq_arm/vchiq_core.c          |  1 -
> > >   .../interface/vchiq_arm/vchiq_core.h          |  2 -
> > >   3 files changed, 56 insertions(+), 45 deletions(-)
> > I already applied v1, is there any code changes that are different here?
> Strange, I didn't received a mail that the patches has been applied. No,
> there wasn't any code changes.

Ah, I hadn't pushed it publiclly yet, that's why!  I'll go drop my
internal tree and queue up this one now instead, thanks.

greg k-h
