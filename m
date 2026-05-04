Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E743DF019;
	Mon,  4 May 2026 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906571; cv=none; b=I5G6HwIEHjrDQzUgllMwHaCAQ+Gi7amiHc1psUtaQjL6ZDzUB39yrxqyajF04xzXeI3wVValVBLuKZ7jsyyM42mfisN79ErumAdgF5XClFAL6fUf1Ds0vc44hOsJlmQruC5oLaW+rYJ4pLopuWcvDDWSikZwpvqkDifSaWcaXzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906571; c=relaxed/simple;
	bh=zDIvw6x9x6u/p7PQE6bfrqYdeD08Vsum5DAVfBfqZSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PEzWBGnsRiL+Fg0R/aPPCmQpp5Hqjw2+tKA4uACr+CGdOKnbjp21nWlmq/+76YF8PzdU96zCKLNvMgcKmNVZV7vfwJThm51ki6ng9oeNB5t8NsvecphOaOTCZETTXwr2qrykPIVACxPLbfykJQ/GAZATRw+Mi/y/9lw4bxSkR/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=14rWP7Lq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="14rWP7Lq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0190C2BCB8;
	Mon,  4 May 2026 14:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777906570;
	bh=zDIvw6x9x6u/p7PQE6bfrqYdeD08Vsum5DAVfBfqZSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=14rWP7LqDrFC/ilD6UB6X5WiJrb5WCXpekIrlfwrtN5MFYDQbcJ75ASN6rVJzlQnB
	 y/ehJj+l3q/atLFbepZRiYtrVhMfQwrxvEdzeCHN8xX58ewczQCVBLZMIIrTjM/XPk
	 gLmYyFiTUyKFGmL34io70wV8k4dACti22nheo7IE=
Date: Mon, 4 May 2026 16:11:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	error27@gmail.com, luka.gejak@linux.dev
Subject: Re: [PATCH v3 0/3] staging: rtl8723bs: fix OOB reads and heap
 overflow in IE parsing
Message-ID: <2026050436-italics-clumsy-e83c@gregkh>
References: <20260427081626.3393697-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427081626.3393697-1-hossu.alexandru@gmail.com>

On Mon, Apr 27, 2026 at 10:16:23AM +0200, Alexandru Hossu wrote:
> v3, addressing Luka's review. No code changes.
> 
>  - Added Fixes: and Cc: stable@vger.kernel.org to all three patches
>  - Moved Reviewed-by above Signed-off-by on all three patches

Please address the review comments found here:
	https://sashiko.dev/#/patchset/20260427081626.3393697-1-hossu.alexandru@gmail.com

when you resubmit.  And have you tested this on real hardware?

thanks,

greg k-h
