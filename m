Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE5738AC65;
	Tue, 25 Aug 2026 15:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672129; cv=none; b=U4cV1sdT0jxhaabAc65zmURifHrb69vNjx4mTW6GF4F/DAcnbZV+ywc2gi4qBKrpYVGsDF76/vo2ixwmkHi0tii7gN8zS6FiI8Q+yObvuoI0THsRdg1KbCJM4PpehFqWKCXl7XQ20Y3aLmSd6pyj4Ay664HjvH6CNnqWWsHALbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672129; c=relaxed/simple;
	bh=DKKbX/qNr1WD3qskIVjg1Fy0dC4yiauq7wZfeLfGBN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfTm9TXIWVIuH6/yvsOpT5MLzLm+Prp1naB8wLyz+1SfswH4LhToDq+HA8NdN1g+KwFt0+l/qI5wTzl0OV6Iv23mAu4IFmOvMaGE+wugFgMIJXdnFqU5m6FQ151J5GpTMRZFURKPQNU+D3KIqVPZiwqfiNkMjeDTGwPsejgIMPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mfwdxg2W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mfwdxg2W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EB91F000E9;
	Tue, 25 Aug 2026 15:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787672127;
	bh=nINyEaRzVMQLg4QQTlj+ZxE9vdTCTmZrHBtSnOqquwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mfwdxg2WUDHSqH6srZ7FTCXb2nvhJEQ5GEnNxEx4FkpU90CsKrSF664QzMfN/GCml
	 UzTysF5k3UBetDcskj2osbC1KK0sZpowat98/aTVrs2oYtMamUWMaobywCovZCdeHg
	 82m+o9zE+n9ay/67QFydlZrYw41oaw6+CUenAQ3M=
Date: Tue, 25 Aug 2026 17:35:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Priz <dimahtms@gmail.com>
Cc: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: uart: convert from IDR to XArray
Message-ID: <2026082527-garland-buffer-306a@gregkh>
References: <20260810141043.76948-1-dimahtms@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810141043.76948-1-dimahtms@gmail.com>

On Mon, Aug 10, 2026 at 05:10:43PM +0300, Dmitry Priz wrote:
> IDR is deprecated in favor of XArray, which manages its own
> internal locking and provides a more consistent allocation API.

Which is fine, but:

> Convert tty_minors from an IDR to an allocating XArray. Update
> the error check in gb_uart_probe() from -ENOSPC to -EBUSY, since
> that is the error xa_alloc() returns when the allocation range
> is exhausted, unlike idr_alloc() which returned -ENOSPC.

This isn't needed at all.  idr is just fine for a minor number
allocation, an xarray is total overkill.

Sorry, but this keeps coming up on the list, what tool made you want to
do this conversion?

> Build-tested and verified via boot in QEMU: the module loads,
> registers with the greybus core, and unloads cleanly.

But you don't actually test it such that this codepath gets used, right?

thanks,

greg k-h
