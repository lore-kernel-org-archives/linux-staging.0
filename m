Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F18370830
	for <linux-staging@lists.linux.dev>; Sun,  2 Aug 2026 07:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785654522; cv=none; b=iWKdWZaVfAAsM5Lx2/1NtLAsu8huNNSxqoOMDyylhe83jSp6V7dZiVT3J74Lx8HLuUwNqfrkmdPNQGMLZsTbtuaR91Y4l4/r7NQtpg9+VdkCu2WKxFqd1vABGTZPU27ROWh+GOQW1azVq9jLncrmsOoDXMr4R1LuJgYWZBabrPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785654522; c=relaxed/simple;
	bh=F3CtLfXHnq0XNUBbPys42tyS8KFWzg+20/SC5Cosmbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0tSRYgb/lbhpm5464ZR/YSVGt0oNi0UyVoEGhya5PQgWdCeK1NRHu3MFGFGUoS9gck+naGfqKiX+4rxmXyYJnQKbKjZDVLrCs0WuPxQ183hXDYb1j7myDA9oBeYqVUeq3O1GRETt9p5sE415RS+/z2/FhD/qXhZmHz6e2F6dCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MNKOlsyA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MNKOlsyA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60BE61F00AC4;
	Sun,  2 Aug 2026 07:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785654521;
	bh=ht1aj994ohhVx+qNHYWmMgeq4PcBq9gs+822rTmMZfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MNKOlsyAMlZqmvlRH1nQlVeYleIy7Jerazv0zEJQdgDpOuKjlcymen6Dkhvuv1nEN
	 wPZSwJ0YCrCMKUSfBOmUjBVdvub/lRzL4hAJFJl82Q6q5Tn50z0L5EK9L6eW/GEPpc
	 QcbH9mv4C6ZDCw47NhEFIiwkj1Y+Zo9xf199HExw=
Date: Sun, 2 Aug 2026 09:07:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mirza Ishan Beg <seedandsyntax@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: audio_manager_module: add missing
 newlines to sysfs_emit
Message-ID: <2026080248-attention-decal-0c51@gregkh>
References: <20260801202435.5131-1-seedandsyntax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801202435.5131-1-seedandsyntax@gmail.com>

On Sun, Aug 02, 2026 at 01:54:34AM +0530, Mirza Ishan Beg wrote:
> Fixes checkpatch warnings: "return sysfs_emit(...) formats should include
> a terminating newline"
> 
> Add trailing newline characters to several sysfs_emit() calls to comply
> with the requirement that sysfs output buffers should be terminated by a
> newline.
> 
> Signed-off-by: Mirza Ishan Beg <seedandsyntax@gmail.com>
> ---
>  drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Please see the mailing list archives for the many times this same patch
has been rejected, sorry.

greg k-h
