Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0388A39B97F;
	Mon,  4 May 2026 16:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777910585; cv=none; b=SVvOFI5wdb+qfxVKm9NZtgE9f1lC/1sQIivdoodsMMqpkfqNLB5KxVHwzS5VIp9uZhebPllFNeLZ6EsMASbEiex+cX/alPYVxY0y8W5vQdgq65cs1EGav3uOwIOtmtVjkzdT4fz7oSigpe1LjCgoJeMgVJtELrbYp+IsUERMAvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777910585; c=relaxed/simple;
	bh=MquTlFp80T6ZCdO4Poniu3OoOL4Jn+PRvnOMfdB6ngc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVk23P4hJFvNRcQ30qSiQhCugpcBnAIu8/S+0ASSd126obQQHw11ZIbN197YUqld39ygYiA1SvaRAu72D24VrPQnMXkyD5mnq4x5RwCLfae+2IgfciATOQfmH09HI9F9xE6uGYQZmljMkPCI9+yy4/FH/bsyMk7vkKBGbO6iU1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e2SciqKd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e2SciqKd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3438AC2BCB8;
	Mon,  4 May 2026 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777910584;
	bh=MquTlFp80T6ZCdO4Poniu3OoOL4Jn+PRvnOMfdB6ngc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e2SciqKdaX8KOm507QbAl8NxRfNTVYnWNQUK+iTFAXJgD1zkZS1yKsOPW9eTHIpAS
	 TCkSSCKTA1yjOwddwXRK6lJ9J9hL9oAFazrSmcqgCTNXbHfgiEFHh0dfVJpBUi+G1p
	 XewYSTwmYhmGZhfkK1ea4U+mRUGkb3DM1hPboJ/M=
Date: Mon, 4 May 2026 18:03:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Feng Ning <feng@innora.ai>
Cc: linux-staging@lists.linux.dev, Luka Gejak <luka.gejak@linux.dev>,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v6] staging: rtl8723bs: fix heap buffer overflow in
 cfg80211_rtw_add_key()
Message-ID: <2026050458-numbness-haven-1ae4@gregkh>
References: <20260413113224.5201-1-feng@innora.ai>
 <2026042626-tabloid-suitor-33c5@gregkh>
 <20260427111738.33069-1-feng@innora.ai>
 <2026050417-monkhood-backless-4c3e@gregkh>
 <20260504154823.52057-1-feng@innora.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504154823.52057-1-feng@innora.ai>

On Mon, May 04, 2026 at 03:48:30PM +0000, Feng Ning wrote:
> On Mon, May 04, 2026 at 04:12:44PM +0200, Greg KH wrote:
> > What about these review comments:
> >         https://sashiko.dev/#/patchset/20260427111738.33069-1-feng@innora.ai
> >
> > Are they incorrect?
> >
> > And was this tested on real hardware?
> 
> Hi Greg,
> 
> Thank you for the pointer to the Sashiko review.
> 
> Regarding the review comment (Medium): Sashiko suggests returning -EINVAL
> when params->seq_len exceeds sizeof(param->u.crypt.seq), rather than
> silently truncating with min_t().
> 
> The comment raises a valid point.  I chose min_t() for two reasons:
> 
>   1. The upstream cfg80211 framework does not enforce an upper bound on
>      seq_len before reaching the driver, so a strict -EINVAL could
>      break any existing userspace that happens to pass seq_len > 8
>      (even if no standard cipher requires more than 6 bytes).
> 
>   2. Staging drivers historically favour silent clamping over hard
>      rejections for parameters that are out of the ordinary but
>      otherwise harmless -- the primary goal was to close the overflow,
>      not to police the caller.

Let's fix this in a way that the code can be moved out of staging
someday please.

> That said, I can see the argument for -EINVAL: it makes the contract
> explicit and avoids installing a key with a truncated sequence counter
> that could produce unexpected crypto behaviour.

Yes, that is better.

> Regarding hardware testing: I do not currently have a physical
> rtl8723bs device.  My verification was based on code review of the
> cfg80211 key installation path and static analysis confirming that
> ieee_param.crypt.seq is an 8-byte fixed buffer while params->seq_len
> is fully userspace-controlled via NL80211_CMD_NEW_KEY.
> 
> I understand this is a limitation.  If hardware testing is required
> before merge I can source a RTL8723BU/BS USB dongle (approximately
> 1-2 weeks), or alternatively a community member with the hardware
> could confirm the fix.  Please advise on your preference.

Ideally someone can test this on the real hardware.  I'm loath to take
real patches for this driver without that happening.

thanks,

greg k-h
