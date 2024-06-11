Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D776101E2
	for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 21:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718140996; cv=none; b=PK9sW5HAnIgpcCEkjX/3KzxczS/QogLVYALqvtYZANLMzCq0v/fBmeQJEDh/Z8BSiS0VtRZVuDQ8q73jRcpSRms/pCj5QIWFL/NrzahjUtxKJqUwFpZNDPmSr6I+6Bt7DUK6cFuy/cbzD+DBEcto9DRx5dHY8O5qns9qzpeabR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718140996; c=relaxed/simple;
	bh=e83GC/a2Xg/kbv5xMigo8i1S1a4boPruaYPqagwhBNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duyP8XDNH6ahSaG6bM0vIGvLpDBCpY61+Vp5UdLll6rxNvRAtS6sKbnghHC2hSgjpi9mwCvOQoXv6aoVb5UoZWMedd/955nY/0xSN9dOXfh2FsyzwUyXRUjkYf2hmoy2LYBNSlOLB2Pgk8lAPQUO5IA36b1A+DoYS5c+MLNuO2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=de4Iqufy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="de4Iqufy"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5657A512;
	Tue, 11 Jun 2024 23:23:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718140980;
	bh=e83GC/a2Xg/kbv5xMigo8i1S1a4boPruaYPqagwhBNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=de4IqufyUOtpKTx177g5clRXPPZDNt5MXWcV4TSZvReAM38dGg/htSJVtlK7/Afxv
	 EXKqsQVcxsups0qxCEc3kbxRjG79daXSNDa5AwwtvECdYcDDKg8+9hQuHLv5DIf8w2
	 Vo2BmUzjJQUiVzoDpGqz7WYzdzsaUuFe2my9JNb4=
Date: Wed, 12 Jun 2024 00:22:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/11] staging: vchiq_arm: Get the rid off struct
 vchiq_2835_state
Message-ID: <20240611212253.GF10397@pendragon.ideasonboard.com>
References: <20240604172904.61613-1-wahrenst@gmx.net>
 <20240604172904.61613-6-wahrenst@gmx.net>
 <20240605071109.GG879@pendragon.ideasonboard.com>
 <f01308d9-505b-4c57-af6b-b3febfd98112@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f01308d9-505b-4c57-af6b-b3febfd98112@gmx.net>

Hi Stefan,

On Wed, Jun 05, 2024 at 12:11:41PM +0200, Stefan Wahren wrote:
> Am 05.06.24 um 09:11 schrieb Laurent Pinchart:
> > On Tue, Jun 04, 2024 at 07:28:58PM +0200, Stefan Wahren wrote:
> >> The whole benefit of this encapsulating struct is questionable.
> >> It just stores a flag to signalize the init state of vchiq_arm_state.
> >> Beside the fact this flag is set too soon, the access to uninitialized
> >> members should be avoided per design.
> >
> > Do you have plans to address the design ?
>
> by using kzalloc and assigning platform_state at the end of
> vchiq_platform_init_state, i would consider this as fulfilled. Or do you
> care about the possible platform_state NULL pointer?

Reading the commit message, I thought you meant further changes were
need to fix the design. A clarification in the commit message could be
useful.

> >> So initialize vchiq_arm_state
> >> properly before assign it directly to vchiq_state.
> >>
> >> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> >> ---
> >>   .../interface/vchiq_arm/vchiq_arm.c           | 25 +++++--------------
> >>   1 file changed, 6 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> >> index 515cdcba043d..98a0b2d52af5 100644
> >> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> >> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> >> @@ -109,11 +109,6 @@ struct vchiq_arm_state {
> >>   	int first_connect;
> >>   };
> >>
> >> -struct vchiq_2835_state {
> >> -	int inited;
> >> -	struct vchiq_arm_state arm_state;
> >> -};
> >> -
> >>   struct vchiq_pagelist_info {
> >>   	struct pagelist *pagelist;
> >>   	size_t pagelist_buffer_size;
> >> @@ -613,29 +608,21 @@ vchiq_arm_init_state(struct vchiq_state *state,
> >>   int
> >>   vchiq_platform_init_state(struct vchiq_state *state)
> >>   {
> >> -	struct vchiq_2835_state *platform_state;
> >> +	struct vchiq_arm_state *platform_state;
> >>
> >> -	state->platform_state = kzalloc(sizeof(*platform_state), GFP_KERNEL);
> >> -	if (!state->platform_state)
> >> +	platform_state = kzalloc(sizeof(*platform_state), GFP_KERNEL);
> >> +	if (!platform_state)
> >>   		return -ENOMEM;
> >>
> >> -	platform_state = (struct vchiq_2835_state *)state->platform_state;
> >> -
> >> -	platform_state->inited = 1;
> >> -	vchiq_arm_init_state(state, &platform_state->arm_state);
> >> +	vchiq_arm_init_state(state, platform_state);
> >> +	state->platform_state = (struct opaque_platform_state *)platform_state;
> >>
> >>   	return 0;
> >>   }
> >>
> >>   static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vchiq_state *state)
> >>   {
> >> -	struct vchiq_2835_state *platform_state;
> >> -
> >> -	platform_state   = (struct vchiq_2835_state *)state->platform_state;
> >> -
> >> -	WARN_ON_ONCE(!platform_state->inited);
> >> -
> >> -	return &platform_state->arm_state;
> >> +	return (struct vchiq_arm_state *)state->platform_state;
> >>   }
> >>
> >>   void

-- 
Regards,

Laurent Pinchart
