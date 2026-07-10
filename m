Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C96282F1E
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783695130; cv=none; b=ftna7AtNU/kX1GvLe9yWpH0V8mrKxP0z2EVpDL5DcFGpRpbDcU3eY4rlFlEurHd2v8oqTtniIjGl1XKtncXrzG7CkRgn89Ri51HOfxRqSe7LtRvoUYtGrZpH8FsHomLviagE8nXhgAYQawhy464Ft1Xk6iXw6fLWldpHAhozhhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783695130; c=relaxed/simple;
	bh=cAcABT07CU/kb4qyTjwtF0SWyego1opjmh38WrK9ym8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQ3cnbK5T/yjn50Fw4S0EY98IOF2VcxwS55P8o+u+3wnnt3BUyNAXZE1+G5h1qlkGu/nPfltO4u4cn99vzDIwhal5yTOu2nJfqqCDd55vAMF7ZKrFsDkYrWZOMWyy8651SvRqvuFmbHn3H/HffR4KbcsXpJ9bl3faMhLmuzuO5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hVQ5yV4e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hVQ5yV4e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982E81F000E9;
	Fri, 10 Jul 2026 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783695129;
	bh=ztIetxy++QtQtfY9ZE3bOkr53nlGeFFYbZyzKydlwIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hVQ5yV4ez1LkJjC3hWITYGnqn6NwICaD3F7L7oW+yEmMlXhiaL/mBXTZpre36JQkx
	 kJFlOnSUUZhQOf2G2TkLoSqC3ilMaSneM6QtbjMv9yTey+itOFcqTzL18iQuWEOQ8U
	 edG26xdJgstJTLT8vqxBf9v2RKbY9w0PZRw0ETD8=
Date: Fri, 10 Jul 2026 16:52:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Freeman Yuan <freemanyuan15@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: rename camelcase struct member
 dot11PrivacyAlgrthm
Message-ID: <2026071050-illusion-unstuffed-cc3b@gregkh>
References: <20260710053347.46649-1-freemanyuan15@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710053347.46649-1-freemanyuan15@gmail.com>

On Fri, Jul 10, 2026 at 01:33:47AM -0400, Freeman Yuan wrote:
> This refactor replaces the non-compliant CamelCase member variable
> dot11PrivacyAlgrthm with the standard snake_case dot11_privacy_algrthm
> across the entire driver payload. Long conditional boundaries are
> broken into clean rows to comply with style guidelines.
> 
> Signed-off-by: Freeman Yuan <freemanyuan15@gmail.com>
> ---

Does not apply to my tree, are you sure someone else didn't do this
first?

thanks,

greg k-h
