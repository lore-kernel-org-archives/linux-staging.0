Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9940C2BD5A7
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 07:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774769503; cv=none; b=uX0KMbnlbmMEdyHibACjdjFrRRFW4ObqBB919i9to1Z5RxtyoXmQi4/h98yoPYTPaOTNp8bAGuQj33RdsxkabEyTSwibnmI/5pDWTnMXH+vFh+bj5JqzgTWOYjRvtAFZ32q6j5a7IqN1H3LQQ02O+rjY2YRgwOWdSjLXwAIN0Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774769503; c=relaxed/simple;
	bh=UiV/buO8vCNeyTvNwe8eA3IvOUI1WBRLsEeSA1p47tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDIZjIqEUabjNlo/n4Y22/LgnPBlqAKa0YbIhXIlIklSvedGN5WwnrzExYJveGkpAG8fgQfyxF2K3rvwzXJaUeDjGGWjDL/qJZO6uOB0f27fbHIwc6AC8YS96LAQqvaedQAxHVgtKHDx6acaeeZNunkEO9JAEDcCz99GLlzcysA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ae7XGLLY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ae7XGLLY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3624C116C6;
	Sun, 29 Mar 2026 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774769503;
	bh=UiV/buO8vCNeyTvNwe8eA3IvOUI1WBRLsEeSA1p47tA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ae7XGLLYnPFwd4iMlYFvEHm2Rnon/85QpCt25XpgVzfQv4RnpGsuK/kmGnA5UCqiR
	 +w0OeBUyZwXPTxeBpwsyBJBakEN8Cw35U3bwnxzdbw4jppgQZk7qWKwEwNjEka4WKC
	 PSxXaaSY25tITHRdtgjxd6Cq2KbuGgGCr9gwfkpg=
Date: Sun, 29 Mar 2026 09:31:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Sebasti=E1n?= Alba <sebasjosue84@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH 1/2] staging: vc04_services: vc-sm-cma: fix integer
 overflow in vc_sm_cma_clean_invalid2()
Message-ID: <2026032923-judiciary-mayflower-4452@gregkh>
References: <20260329062004.492812-1-sebasjosue84@gmail.com>
 <20260329062004.492812-2-sebasjosue84@gmail.com>
 <2026032956-railroad-renewable-3328@gregkh>
 <CAJD=UNdEqLW_CGpq0=p+DwJraiHTus+t-bPRW9wi2wh8B8C-rw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJD=UNdEqLW_CGpq0=p+DwJraiHTus+t-bPRW9wi2wh8B8C-rw@mail.gmail.com>

On Sun, Mar 29, 2026 at 01:04:54AM -0600, Sebastián Alba wrote:
> Hi Greg, Thanks for the quick review.
> 
> Regarding kmalloc_array(): the patch does replace kmalloc() with
> kmalloc_array() - perhaps the question is about the remaining
> ioparam.op_count * sizeof(*block) in the copy_from_user() call below?
> That multiplication is now safe because kmalloc_array() already
> verified that op_count * sizeof(*block) does not overflow(if it did,
> kmalloc_array would have returned NULL and we'd have exited). Happy to
> add a comment clarifying this if you prefer.


Sorry, my fault, I meant alloc_objs(), coffee hadn't kicked in yet.

And please do not top-post:

	A: http://en.wikipedia.org/wiki/Top_post
	Q: Were do I find info about this thing called top-posting?
	A: Because it messes up the order in which people normally read text.
	Q: Why is top-posting such a bad thing?
	A: Top-posting.
	Q: What is the most annoying thing in e-mail?

	A: No.
	Q: Should I include quotations after my reply?

	http://daringfireball.net/2007/07/on_top

> Regarding the Fixes tag: the commit dfdc7a773374 is from the
> raspberrypi/linux tree (branch rpi-6.6.y). This driver (vc-sm-cma)
> appears to only exist in the Raspberry Pi kernel fork and has not been
> merged into mainline staging.

Then we can't do anything with it here :(

> I apologize for sending this to the wrong tree. Should these patches
> go directly to the Raspberry Pi kernel maintainers
> (kernel-list@raspberrypi.com) instead?

No idea how that out-of-tree driver is managed, sorry.

good luck,

greg k-h
