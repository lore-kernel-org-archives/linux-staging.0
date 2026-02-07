Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F139C31195B;
	Sat,  7 Feb 2026 13:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770470716; cv=none; b=XjRsCYE+oOD+hqd02ATl2AZT8qnzrkK2qTZk3LFSouEDG05U4ZukUW/ptawvAHs0Hrzf/TY+nRWUhaQHSImIsWp9kTFj5XH7hYGjL+z7hdcZZ/phDegwkiDxm7zhVmC0xUayV1Nh5KYC00jzVkoAnM9JlGqfFxSjLFbJ574CeSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770470716; c=relaxed/simple;
	bh=nzn9JLqkfi0sBZzIFBoz7NzfrbKMdAqV834+wchEiKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcosVuyXTqpl85OEbnQJv4eMNW+Pfn5B4yQ2ydwvS3UepExWmgN0CXUl9C3NqNs4OypsgjsN020bBlZ/AQjUkhiVvc/otJTo4d3TLjhmQ0xzHiR24VhO6waW8nFyht/A46L8ZvmZLnBbNa7Jk3BA06lcEckKPmXppCaOqTtPvlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1FYLyJkV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1FYLyJkV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BB6C116D0;
	Sat,  7 Feb 2026 13:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770470715;
	bh=nzn9JLqkfi0sBZzIFBoz7NzfrbKMdAqV834+wchEiKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1FYLyJkVsKTXZCr3ENDCrd03pMDTMwIlwJGeUMWR75pQVgcutEZK2fHK6VaSQh0uv
	 Q9BOKOZWnvYZsRVba7DoiPjPvhBdpxmBadqv1tgKjuy4IV5vxNsxQ4at+QaNNKbzA+
	 17kngmTeLet3HTscZ6HZG3Hz9SVqNI5qkE+wMrsc=
Date: Sat, 7 Feb 2026 14:25:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neel Bullywon <neelb2403@gmail.com>
Cc: David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: uart: migrated from IDR to XArray API
Message-ID: <2026020735-thumping-chemicals-c76e@gregkh>
References: <20260204043802.65430-1-neelb2403@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204043802.65430-1-neelb2403@gmail.com>

On Tue, Feb 03, 2026 at 11:38:02PM -0500, Neel Bullywon wrote:
> Replaced the IDR API with the XArray API for managing TTY minor numbers.
> This addresses the checkpatch warning about DEFINE_IDR being deprecated.

While I understand that some people might feel that xarrays are the
bees-knees, for something "simple" like an idr, it's overkill, right?

This is "just" a unique integer that is used for a device name, leaving
it as an idr should be just fine as there is no performance or storage
issues with it as-is.

So while I'm all for using new apis for new code, unless all usages of
idr is going to be replaced in the kernel with xarray, I don't really
feel that this is needed to be done here, sorry.

thanks,

greg k-h
