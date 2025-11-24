Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7F2314B78;
	Mon, 24 Nov 2025 16:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003203; cv=none; b=C1Z2c20bjvJgRmbPCqgCndoLmJrfaFQoMVRtYuPm1Xzu6aUJgF9vvMwgJ+cMwKI0k96+SYwDol2OBEgLF3xcvk4BhGsAgQ08MtlJdROkKNeff6eLxetBjAr0PHMNBDf0cYnvwTDUYc3fNiaoDYC23bsmuEDOIBSRwR39JBW9HWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003203; c=relaxed/simple;
	bh=6QbOjw/mtwPnFVJTXcMEwEgcmzQjOyAJ4kQd8vI7dLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOozj7PtYLk0FGy3QuUlnKqxWvRFqT7FK5ypPQrogzHIyj6WF3qpKU2M6ZgXseiFA3T5UdmYYXHs5MVpaNOxxloCuT37bGJ01oLp8nWWkXod9SjoGkSIQ8WS0gr88csHRA/UDZr7vTHyRqwgO01kCZ6HvqmSrIS9/QaB4h1RHa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BlFEqcrP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BlFEqcrP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0BAC116C6;
	Mon, 24 Nov 2025 16:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764003201;
	bh=6QbOjw/mtwPnFVJTXcMEwEgcmzQjOyAJ4kQd8vI7dLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BlFEqcrPR3qs6WWzwQdbsFPwnzM3/cJiRcJqMyySxMzZGeickEngcADj3TnVNNO8K
	 zCLaCe6McZyosaH31h2GfljNwLRPn3ZUsWWRA2WR+VArTvyQeo2iN5DcPQhrXAahAp
	 nRaVmljZeUKMpwb489DJV3vcSq/Rk4aes3FBkbJo=
Date: Mon, 24 Nov 2025 17:53:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	johan@kernel.org
Subject: Re: [PATCH V4 0/4] Destage gpib drivers
Message-ID: <2025112409-laundry-strained-a24e@gregkh>
References: <20251117144021.23569-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117144021.23569-1-dpenkler@gmail.com>

On Mon, Nov 17, 2025 at 03:40:17PM +0100, Dave Penkler wrote:
> This patch series is for moving the gpib drivers out of the staging area.
> 
> Patches 1-3 make some preliminary changes in staging to prepare for the move.
> Patch 4 does the move and completes the destage.
> 
> Patch 1: Change // comments in uapi header file
> Patch 2: Remove comment item in TODO file
> Patch 3: Add SPDX syscall note to uapi gpib headers
> Patch 4: Complete the destaging of gpib
>       - Remove gpib from Kconfig and Makefile in staging
>       - Remove the gpib/uapi directory from include search path in Makefile
>       - In the code change the uapi include file paths to <linux/xxx.h>
>       - Move the common gpib/uapi headers to include/uapi/linux
>       - Move the gpib tree out of staging
>       - Delete the word Linux from gpib Kconfig file
>       - Add gpib to Kconfig and Makefile in drivers
>       - Update MAINTAINERS

Now queued up, nice work!

greg k-h
