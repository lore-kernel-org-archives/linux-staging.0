Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361841A9F88;
	Mon, 16 Feb 2026 08:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771231253; cv=none; b=EDHgMc/l25cS1kvEmPWIyb+xS9nr8CyR2qnxbBR9/y+OD5ZJkKLaztvM9z60Yq5yRGpmDEmzpmIuYST/Jz+UK8AwSEChqYPggzjBfofWdY7x0QOMFXzFqNApB+RwvKjAIkoopTkcHNY6NwWzQW+nLOK1nWEj9stI9lvo7v3EBXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771231253; c=relaxed/simple;
	bh=s/Fkh+AyEm5smm/iUaszdXBFjw7wM+I7+SNnUkcAA0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGImhYylEUnv2c1MqSUlIuPGJ6mrih2XxkxByiGHhnX4O8usQDwmg9AlykQYLp4F2ZM9GjInkgWjBfk18M/lxVkayexF1S623z244Z8nwWNPZeCXqCoEfxX1Zd2havj/Y+3loo/cbuPrCx6DVg1uPQNrf3OMxfhJQz+c0zusEY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dHHfu+HS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dHHfu+HS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B6DC116C6;
	Mon, 16 Feb 2026 08:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771231252;
	bh=s/Fkh+AyEm5smm/iUaszdXBFjw7wM+I7+SNnUkcAA0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dHHfu+HSv+Uh9qSCaGNz8nyFbdXpzNPAN6ndeh+12NZZrjCSVX46c/MYFLaZYMua7
	 sCUtqYtI5fL6PiyctCsmcHhoNDd1M80UizLDT6NDR4oyQQG4MVrxP0kvNj4IiQM78r
	 xqsTY7wj5u5wsM92xCeA6yx4IHZfUGOk17YBhmKs=
Date: Mon, 16 Feb 2026 09:40:49 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bryant Boatright <bryant.boatright@proton.me>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Checkpatch cleanup patches
Message-ID: <2026021638-upstroke-creole-52aa@gregkh>
References: <aTF0D_zaeNVIfP2E@ubuntu-desk>
 <2025121747-unluckily-filth-c167@gregkh>
 <aZLPXTng0Qg20N-W@ubuntu-desk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZLPXTng0Qg20N-W@ubuntu-desk>

On Mon, Feb 16, 2026 at 08:03:47AM +0000, Bryant Boatright wrote:
> On Wed, Dec 17, 2025 at 02:03:25PM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Dec 04, 2025 at 11:44:19AM +0000, Bryant Boatright wrote:
> > > Correct camel case names reported by checkpatch.
> > >
> > > These patches are not required to be applied in any order.
> > >
> > > Changes in v3:
> > >    1. Patch 1: Updated parse_res to parse_result for clearer purpose per
> > >       feedback from gregkh@linuxfoundation.org.
> > >    2. Patch 1: Change definition of parse_result to multi-line definition per
> > >       feed feedback from gregkh@linuxfoundation.org.
> > >    3. Patch 2: Fix typo in commit message introduced in v2 per feedback from
> > >       gregkh@linuxfoundation.org.
> > >    4. Remove patch 2 (from v2) as name change was not needed per feedback from
> > >       gregkh@linuxfoundation.org.
> > >    5. Add changelog for patchset to cover letter per feedback from
> > >       gregkh@linuxfoundation.org.
> > >
> > > Changes in v2:
> > >    1. Patch 1: Make enumeration constant names all upper case per feedback from
> > >    straube.linux@gmail.com.
> > >
> > > Bryant Boatright (2):
> > >   staging: rtl8723bs: Rename camel case enumeration
> > >   staging: rtl8723bs: Rename camel case variable
> > >
> > >  .../staging/rtl8723bs/core/rtw_ieee80211.c    | 26 +++++++++----------
> > >  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
> > >  drivers/staging/rtl8723bs/include/ieee80211.h | 12 ++++++---
> > >  3 files changed, 22 insertions(+), 18 deletions(-)
> > >
> > > --
> > > 2.43.0
> > >
> > >
> > >
> > 
> > These did not come through as properly linked together, how did you send
> > them?  Can you use something like 'b4' or 'git send-email' to send them
> > as a patch series, and not as unconnected emails?
> > 
> > thanks,
> > 
> > greg k-h
> > 
> 
> Sorry for the delayed response. Yes, I can do that - apologies for not catching
> that on this version.
> 
> Would you want that sent as a V4 patch, or just resend this series but correctly
> linked?

V4 series please.

thanks,

greg k-h
