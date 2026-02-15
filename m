Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7507E279DCE;
	Sun, 15 Feb 2026 06:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771138345; cv=none; b=DnQVLhrEzmWmQ50chwFIaP3Y7pBwGfHYwCwDLIzbzwP1NIPHEpwh0v7odcmLiuSJgDwmF0ujTbRv7uG9nNrtvGkO51AP9IMHMQdaWlncGSvJPMBUN8/CmrUA0u/v7mUDkyjfcJgbL9rJlYjSiCqxE6n46M0gOWfTBhj8aQWkTzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771138345; c=relaxed/simple;
	bh=9AtvfRN3qFQ2UD2lJ1WlT987ahBaVTXGUHhqyMycZdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wl8zj40T4Dk3nVTS9d/Zulex6kd1WyYtapfmAsaFd5bK+ACprdzeKMf6NOVYlXlQmW+4gUqGZMZDMKd2iLdCnWn2v/A/Qe4+Pi7gIOAC4VExjoysEjhydXZKeVTPiFMPrwGXMk4mMlipEELRLRVS8sj95idNnPUsjTmPVQdaV8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=m7Xfo6If; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="m7Xfo6If"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C34C4CEF7;
	Sun, 15 Feb 2026 06:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771138344;
	bh=9AtvfRN3qFQ2UD2lJ1WlT987ahBaVTXGUHhqyMycZdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m7Xfo6IfPz8059k71946j0wpKAZWExxIoGER7x8XGJs4MnvP1tlpb7bGLsmAMjQdK
	 0R/+Ac2eThGflt6B2By9a/qkz2NUmtd+q/Qih0n/fkqWP7tm0jS71jzhhf0PLm4jdg
	 scdRh6JtyZJSMJXj+AZomcvNxyo0GpXhpLMuLcd8=
Date: Sun, 15 Feb 2026 07:52:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ofek Almog <ofekalm100@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	s9430939@naver.com, architanant5@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
Message-ID: <2026021552-animate-nest-26c6@gregkh>
References: <20260214173139.49094-1-ofekalm100@gmail.com>
 <DGEVYFG99X27.1U7FPTF3YE7V6@gmail.com>
 <aZC95PE36l0k5TOl@smile.fi.intel.com>
 <CAKXVhcLWrTq3vLyoyL7r_J-+3q1SZUtmaVYsC-ZHvYPUas36Lg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKXVhcLWrTq3vLyoyL7r_J-+3q1SZUtmaVYsC-ZHvYPUas36Lg@mail.gmail.com>

On Sat, Feb 14, 2026 at 09:23:45PM +0200, Ofek Almog wrote:
> (Resending as plain text, apologies if you received a previous HTML version)
> 
> Hi Andy, Ethan,
> 
> Thank you both for the review.
> 
> Regarding the fsleep() suggestion - understood, that clearly seems
> like the right helper to use here.
> 
> Regarding the completion mechanism logic - I completely agree that the
> current infinite loop polling is fragile. However, as this is my very
> first contribution and I do not have the hardware to verify logic
> changes, I am hesitant to refactor the synchronization mechanism
> blindly.
> 
> Would you prefer I send a v2 that strictly switches to fsleep() as an
> incremental improvement over msleep(), or should I drop this patch
> altogether until someone with the hardware can refactor the logic
> properly?

Please drop it, see the archives for why (you need someone with the
hardare and specs to figure out what needs to be done.)

thanks,

greg k-h
