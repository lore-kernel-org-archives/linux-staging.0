Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7D540DFC2;
	Mon, 30 Mar 2026 15:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886247; cv=none; b=nRWaLdUTZLsNIDGLBQXPUUUjisTa98qcnGqvTp/4fe/UB4amA+uIb/FHkfpUr1J0dPph2f6yh5Jkc5+hUT9fSIp/v19JwBUkkMDvecP1IsJdPVeH3scNxw/rJugDNjF8WiGJd70ShAYth8znleTrrFAsPuNWPoo99FqwURJh7DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886247; c=relaxed/simple;
	bh=vEOBXv4eygGEtxldDee4Idda3U8+p6KciXPp+aH8sbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqBIE9iDVv1gcuD8B8GQW/y5Xc7XUIgaalkzpbvGMYQfPtiRaMsZYY5ku+2HKksYso0mcMd6KSd0nBghqTn18Tp7tXHGnIxzKWsGPH3BzA+S4RgCWYdYUebaHRtMiv9EKdVv6rgJ/hjKV9HIWEX6l+qHvzHTIn8qIIQifTND390=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qXIOBfyK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qXIOBfyK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87696C19423;
	Mon, 30 Mar 2026 15:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774886247;
	bh=vEOBXv4eygGEtxldDee4Idda3U8+p6KciXPp+aH8sbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qXIOBfyKOiiWhlKL9T+Q5cyThLaq0tvt8GkNb/xWhfkEpqC1Nb4+i2mDFwGkb3vKj
	 swPgzWK/uPrlsHb0NqDBKqoJZSDXcNMQpkSgiICgJV6O1cu2gibemVttXZ9suX3MVI
	 1YrmlM/4kWvCuw5q91CNZKT33xo0iCvLY7QjHxgY=
Date: Mon, 30 Mar 2026 17:57:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gabriel Rondon <grondon@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: replace BUG_ON() with graceful
 error handling
Message-ID: <2026033011-limit-cherisher-06b1@gregkh>
References: <20260319115408.24215-1-grondon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319115408.24215-1-grondon@gmail.com>

On Thu, Mar 19, 2026 at 11:54:08AM +0000, Gabriel Rondon wrote:
> BUG_ON() is deprecated as it crashes the entire kernel on assertion
> failure (see Documentation/process/deprecated.rst). Replace all
> BUG_ON() calls in dim2.c with proper error handling that returns
> appropriate error codes instead of panicking.
> 
> In try_start_dim_transfer(), replace the BUG_ON for null/uninitialized
> channel with an early return of -EINVAL, and replace the BUG_ON for
> zero bus_address with an error return that properly releases the
> spinlock first.
> 
> In service_done_flag(), replace BUG_ON with an early return since the
> function returns void.
> 
> In configure_channel(), enqueue(), and poison_channel(), replace BUG_ON
> range checks on ch_idx with returns of -EINVAL.

This should be one patch per function, right?

thanks,

greg k-h
