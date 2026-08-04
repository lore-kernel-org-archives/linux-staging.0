Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581903947B5;
	Tue,  4 Aug 2026 12:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845437; cv=none; b=kjfb+7d3sB6rTFk1aOJsLQu/71TBkFcTK+qvTUMUrpjD78hPVfht9EEzF/7zldklzWyGsBtN425fBXLq78VIoO/i1iRsH4XTVYSltz4yb8NzuDQOiU7Xq+ylETEhMGfrqbGu8+s7qpJKBO+LsZJmUltXow4y5oNbUEGyFFKjp58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845437; c=relaxed/simple;
	bh=QJ2gwOm+QlAjXuGXhLMoIGUlo5JjhSy6dZaPden10vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W52sxIuiPZOa9WlHS86DcP4l/koBCmUT/8+DqxqFGI1e/AL7oh/TWqdtpw7F3FVQFjWA9btSTyzZLLaayyso+8oIH+g6aDcgcotjRa58M5hziLrzLbRuTuah2DZq3RuRD99i6nUezzTDUvAPhNrU8pRcAE1jFc8041/DTAJ25O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Gbwr7YlF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Gbwr7YlF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4931F000E9;
	Tue,  4 Aug 2026 12:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785845432;
	bh=sSlb/2JBkkpRT5iqw4SIbjm3QtwW1i6cUKIQZbgQHCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gbwr7YlFyUBRsElPOUQsWf6IGTXLp8qam5KkWNnp5h/gzIric4N4YWNRFkeNSZ1t2
	 ah+hKG1IIBO8BSBwuI2m7QzLuWyX0kPeq/Z1xyTlA5ZgRp22cqjk7Xvx0A/At/vFrC
	 UqZ5eBqcxfXuJVhiGhcnNjzwq7wLBmxUNBsrXy/8=
Date: Tue, 4 Aug 2026 14:09:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ashmit Kumar <work.ashmitkumar@gmail.com>
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: axis-fifo: align arguments to match open
 parenthesis
Message-ID: <2026080432-lining-humming-c9e1@gregkh>
References: <20260804111352.21257-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804111352.21257-1-work.ashmitkumar@gmail.com>

On Tue, Aug 04, 2026 at 11:13:52AM +0000, Ashmit Kumar wrote:
> Fixes a checkpatch warning for alignment matching open parenthesis.
> 
> Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
> ---
> Changes in v3:
> - Fixed DOS line endings.
> - Shortened the Subject line to comply with checkpatch.

Please slow down, don't send patches faster than 1 per day at most.

Also, what changed for v2?

And finally, look in the archives for this same patch and what has been
said about it.

thanks,

greg k-h
