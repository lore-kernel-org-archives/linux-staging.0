Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE30273803;
	Sat, 14 Feb 2026 16:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771084977; cv=none; b=gVsR/8GxvxTZfPjs0Pqv5XMPHlB+mzSeRYH3/UVK2ZBzDpeM3Gh1/Gs9dedP5tVYV5wWX/YPnbJpV4PucxgWz7XS1q33x7AcDWc/pBdkraePUI4KkLUyLViMAIcmd0qj9ZbYZ+vhEGS4CyqZHHqAyzEJdKC+QGMLkdInilL0Zhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771084977; c=relaxed/simple;
	bh=REzRIu7mpxJeXKjc70b5iSHR/sc318e4QjxdpQ8dG9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqoebsziYcIffO7LbyZro0dx5AKmIIib3IUW9cudYMjRE61f9uWGpzzLTw96g2mMw4hhc5sjSHQFbppvD+q7RTNNuREWsOWqWLYg/w5ySTLkxjCZ+m7cLPordEvqIOR74CYVfb8oSsPCswlB6fSNRL5Xel6FCDf0TSC+kOFWspU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dCD/VeqI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dCD/VeqI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760B7C16AAE;
	Sat, 14 Feb 2026 16:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771084976;
	bh=REzRIu7mpxJeXKjc70b5iSHR/sc318e4QjxdpQ8dG9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dCD/VeqIj+xScqZSJaFXa0ZJfKUj52k9nZ892YPoALbKUZ5m5Ruw/9NrIlrelPBut
	 hLglw224nbAVwGvzbtnU95IwhwoBj1zhGZ4qMqE6GQVI1lnGXtkDqJfEPM6Ml7w2HS
	 QIh2rXv8IxcXcB+/BMH5IVCQJINDIPsQBLvVEkCM=
Date: Sat, 14 Feb 2026 17:02:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Samyak <samyak.bambole07@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: use kmalloc_obj instead of kmalloc
Message-ID: <2026021417-coconut-liking-b9db@gregkh>
References: <20260214155157.663800-1-samyak.bambole07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214155157.663800-1-samyak.bambole07@gmail.com>

On Sat, Feb 14, 2026 at 09:21:57PM +0530, Samyak wrote:
> From: Samyak Bambole <samyak.bambole07@gmail.com>
> 
> Replace kmalloc(sizeof(*ptr), GFP_KERNEL) calls with kmalloc_obj(*ptr,
> GFP_KERNEL)
> 
> This addresses scripts/checkpatch.pl warnings and follows the preffered
> allocation pattern.

This is a new thing, right?  Are we going to be doing this for all
staging drivers going forward?

> Changes:
> - vme.c: 12 replacements
> - vme_fake.c: 3 replacements
> - vme_tsi148.c: 7 replacements

There's no need for these lines in the changelog text, sorry.  Can you
fix that up and resend a v2?

thanks,

greg k-h
