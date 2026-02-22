Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F7A31578E;
	Sun, 22 Feb 2026 16:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771778531; cv=none; b=QkIeYRWFQYIxqB0EFW15UOeeK8DH9iBeGPnZx0dmcOL1aUxlezN1QegvzlhXrCUFOVwDBu4fYf5QTwuS2R99ZSDy3dIUAjP7QqcqdMZarMtaj4x4lvqdDJias903giC6HFpxsFk2yN19zr3qjEDd3hcpnnlQrEUUZZ+T4PdLoTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771778531; c=relaxed/simple;
	bh=Mtox7ukA6ATAqgAbFHhVAdnolnWJIxo++ZS1leFFDnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2zY6jo/fnw3z1DpY1O/2ZsVluWiIC0VSTcxoOBoMH5m8DPUShsrAYYk8alGy/ZVi23j/P/Yc8vA8fKkh46knLMPzIijnfNB5DhdyUolCTth1abv4oBjayEut+S/b+b75XyY1dQ/KA/PhA2X3QSyBBme/m3hRFY6FISCHGMt40k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nFuxx6+g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nFuxx6+g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D59C116D0;
	Sun, 22 Feb 2026 16:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771778530;
	bh=Mtox7ukA6ATAqgAbFHhVAdnolnWJIxo++ZS1leFFDnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nFuxx6+gZVFNdE13jLjgnRPmwUZIkuT0fOY1DM5EP+XoWTK9WX/bhNh5ePzfhRWzP
	 uxszWC9cwxLSTZel1fIn7stWxdsrkVoQo7qBg2fcZWgnDZ1rYOANgBRJsWGiRrvLBl
	 x4+vWUzG71Htk/9Vd7/Ac5P1QVyV9XbD7BakBvHc=
Date: Sun, 22 Feb 2026 17:42:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mariyam Shahid <mariyam.shahid135@gmail.com>
Cc: straube.linux@gmail.com, dan.carpenter@linaro.org,
	ethantidmore06@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: Replace kzalloc with kzalloc_obj
Message-ID: <2026022249-gloating-bubbling-e7ac@gregkh>
References: <20260221111003.11339-1-mariyam.shahid135@gmail.com>
 <20260222162018.4744-1-mariyam.shahid135@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260222162018.4744-1-mariyam.shahid135@gmail.com>

On Sun, Feb 22, 2026 at 09:20:18PM +0500, Mariyam Shahid wrote:
> Replace kzalloc() using sizeof(*ptr) with kzalloc_obj()
> to fix respective checkpatch warnings.
> 
> Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>
> Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> ---
> 
> v4: added changelog
> v3: rebased on staging-next, kzalloc_obj now available in this tree
> v2: switched to kzalloc_obj as suggested by Dan Carpenter
> v1: initial submission

This is not how the _obj() calls are changing to work, please wait for
-rc1 to be out before doing stuff like this (see the changes that _just_
landed in Linus's tree for this.)

thanks,

greg k-h
