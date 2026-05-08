Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FC8336896;
	Fri,  8 May 2026 05:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778216414; cv=none; b=NqRF35d4SbPYXC/r9mwhJ55qvgjl83WkpXS7lxaWSHWlr0foK1GKryz+rgKzMgbL6Jjd3/CGNnkQ5IMBkNMGu6aG6goAjd5pDeLjO1hLeufvVZVU76+EaCbvyn5ex6H79YoHNO6RYNK5rN7FRIyKBGOBBDSJR+mgNcHVO3+Rxvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778216414; c=relaxed/simple;
	bh=ZhM/xLOMtdFvz9oROaLThjf426l02NlqEWHWB1iIG8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIYqXlFMLy9JT9FSxZcYI5QI9JFdxuD+U0eRUJv3mTEpYe3G082mLtF39mKBWQ+OH32cR5h1bsgpJnHlylBAGoRn6NaL3FUpbn+KbAHqBN2t1EsY9b73f6fxLyBUWvquCssBlKE2YJfJOAQkOD6iviDEvofIXUI8lRIBxe8vRiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ce237xU7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ce237xU7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F0FC2BCB0;
	Fri,  8 May 2026 05:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778216413;
	bh=ZhM/xLOMtdFvz9oROaLThjf426l02NlqEWHWB1iIG8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ce237xU7StpzSMGiAKoVNHPQPMNPS7Jd2MMCMhEUPf2BZyGTDuVl+U4whhI9kKQza
	 ryGLutsjRqcBKEwZMph+FkAidHMzgTswQvU+XyZpwd63QKQYmTJOGsUm9wOW/SQQWZ
	 XI1sAcwLlJbYaZ6vNgdguKnKEFnGPXouwi3EM55M=
Date: Fri, 8 May 2026 07:00:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Salman Alghamdi <me@cipherat.com>
Cc: luka.gejak@linux.dev, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v6 1/8] staging: rtl8723bs: fix buffer over-read in
 rtw_update_protection
Message-ID: <2026050839-remover-barrack-8511@gregkh>
References: <20260428164513.763471-1-me@cipherat.com>
 <20260428164513.763471-2-me@cipherat.com>
 <2026050434-construct-starter-5468@gregkh>
 <eb3759ee-ecfb-f707-4105-6029d236ce3a@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb3759ee-ecfb-f707-4105-6029d236ce3a@cipherat.com>

On Fri, May 08, 2026 at 12:56:09AM +0300, Salman Alghamdi wrote:
> On May 04, 2026 12:35 +03, Greg KH <gregkh@linuxfoundation.org> wrote:
> > >  drivers/staging/rtl8723bs/core/rtw_mlme.c | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > You should not mix patches for the current release (i.e. this one), with
> > patches for the next release (i.e. the rest of the patches in this
> > series), as that means I can't take the full series for either :(
> > 
> > Please break this up into two different sets of patches and resend them
> > that way.
> 
> Hi Greg,
> Thank you for the review.
> 
> Two questions before I resend:
> 1. How do I tell which release a patch targets? Is it purely based on whether it's a bug fix (current release) vs. a new change (next release), or is there a more specific rule I should follow?

That is exactly what it is based on.

> 2. For versioning the split series, should the bug fix patch restart at v1, and the rest of the series continue at v7? Or should I keep them sequential (bug fix as v7, next-release patches as v8)?

two separate series, so yes, split it that way should be fine.

thanks,

greg k-h
