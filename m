Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E6D204F8B;
	Thu, 21 May 2026 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352573; cv=none; b=jhdItchYVkSChdrZu+ijr8wBUxaJnKRgVYftuJauB+TrwT2SzaX9G69opyZ48BG1aTmtKniZ7cbfE1SfOjguT9tocnjpq8gVcewaH5vDni7c6MYsk9HE5PjNDEC4sOHgN6RzFn/tZj+yyoJ9kX2ZQeIWURM8SukXw88NKv2xfkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352573; c=relaxed/simple;
	bh=VDvB1cwQGfTfpOxc0mm3b1nzCWD2YyMqMviSlHROqu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTEL3OMxJJaynqWlGF1SjJvsG6JkKTpPGSCrrXyGGA+mnxTE+VOiQuEY0hY7aCZaTRp30BKdC/hnGl6Zm0RN4xq9rUsjqiK4ifZ6rJ5Ffs5bzkyeKlzRrpBdRniK5tkUN6dImtELaWuIgcYExHDAscfhQyPz8U9/nfkhk93faOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OSG4TFco; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OSG4TFco"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87DDC1F000E9;
	Thu, 21 May 2026 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779352572;
	bh=kyFOxB/PUgZI2mGGymBrQrbLVPuUHF2pMd8Hxj16hDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OSG4TFcoEEWYUEoub50rcXLo2NjymfGLXACyGBrVN0gAXAa/PbwNEFovjC+YJwRvO
	 lT8KtigEmL/JGPMx023MXuYqyNTOViBl0huKg1rkPZgT0M7Scwsl7KVdCiGsmhKmFg
	 A8fwPL3x++zyjOM+d0xF6jdK3tuBP/EuSSaahTkM=
Date: Thu, 21 May 2026 10:36:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Artur Ugnivenko <artur.ugnivenko@gmx.de>
Cc: error27@gmail.com, ahmet@sezginduran.net, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 0/4] staging: rtl8723bs: fix several style issues in
 hal/sdio_halinit.c
Message-ID: <2026052136-quench-crawfish-3c74@gregkh>
References: <agr09UHduXJKU_bB@stanley.mountain>
 <20260518122543.15266-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518122543.15266-1-artur.ugnivenko@gmx.de>

On Mon, May 18, 2026 at 02:25:39PM +0200, Artur Ugnivenko wrote:
> Fix the following checkpatch warnings in hal/sdio_halinit.c:
> - lines longer than 100 chars
> - inconsistent brackets around else statements
> - excessive empty lines
> - lines ending in parentheses
> 
> Changes in v4: Fixed the long line checkpatch warning in patch 2.

You have to show ALL of the version information, from v1 -> v4.

Also, patch 4/4 was sent in an odd way.  Please always start a new
thread for when you have a new version of the series, otherwise things
get very confusing, don't you agree?

thanks,

greg k-h
