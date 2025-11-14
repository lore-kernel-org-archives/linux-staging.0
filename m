Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D7D1E1A3D;
	Fri, 14 Nov 2025 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763110148; cv=none; b=YgY/7ODjRjuQfltuCRB4JvjQdP0v1uA8jKTzhGTNPdptDZRSUFCYVLxszY96x7Py9eClLO9hMshIMdVgun8MGBEcr1fF3AEbVRZl8QBbRf7tBjYQJkZH07DBHkL0WMy6RDCDtSL/Z5POlf8KqdDGeOqKfIY8UYev/sQY0Xy4PGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763110148; c=relaxed/simple;
	bh=ITPelNQNiZ4o3E+qqegWmsikYZ13yQfLqLD9ScM52Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TX2GCloB9p72XAfLf6Y0UeBNnCXg/m4j2qTms60GukHwdwKiZbgPdXDbBG78Afy+4P0uEaBYk1fCK9paOkuXLImJl+PkP++NbTQDkFdQHSaptxmLlBIjG1OZZcMuFGMfiurwQHDo0iZqviUmaZcxaQU93n4znWDYcMq5ExvmifM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJFwwGMS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJFwwGMS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4579BC4CEF5;
	Fri, 14 Nov 2025 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763110145;
	bh=ITPelNQNiZ4o3E+qqegWmsikYZ13yQfLqLD9ScM52Zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gJFwwGMS7hdfAkros5S6eY1lBAjjCmzUVL0NqkAOXzOrRC97x8hjwHzoaV3qr9xLJ
	 KoudHj/8QvTir2+lS6CzSxOYZqdyDlqFi/HpkMl+m5zooJRoL3G80Yh86JVM7b6DVR
	 puq1S8G1dTLKtpdEeT/VhtXXKH2QhuyqN6mu2PJzommbDG+ZlitnqW9JXeLXFF+jpy
	 OeRfEh11TiEAIfUyHSy4cdVDbzVEtmb+a5WD1sOcUD++cqX4SmYT3z3TgN5FQ0XTeb
	 TJG588mOn/tpyRS3gqPxwNFIB+C8G3TRFfWWX8MSsUCIzfE5srF2U97caCmjBN99VK
	 6lnkZ7pE64ttw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vJpUN-000000003T9-0I0u;
	Fri, 14 Nov 2025 09:49:03 +0100
Date: Fri, 14 Nov 2025 09:49:03 +0100
From: Johan Hovold <johan@kernel.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 0/6] Destage gpib drivers
Message-ID: <aRbs_4yzncsoAkB2@hovoldconsulting.com>
References: <20251113104543.5875-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113104543.5875-1-dpenkler@gmail.com>

On Thu, Nov 13, 2025 at 11:45:37AM +0100, Dave Penkler wrote:
> This patch series is for moving the gpib drivers out of the staging area.
> 
> As many changes as possible (patches 1-5) are done in the staging area
> to prepare for the move. Patch 6 does the move and completes the destage.
> 
> Patch 1: Remove gpib from Kconfig and Makefile in staging
> Patch 2: Remove the gpib/uapi directory from include search path
> Patch 3: In the code change the uapi include file paths to <linux/xxx.h>
> Patch 4: Remove comment item in TODO file
> Patch 5: Add SPDX syscall note to uapi gpib headers
> Patch 6: Complete the destaging of gpib
>       - Move the common gpib/uapi headers to include/uapi/linux
>       - Move the gpib tree out of staging
>       - Delete the word Linux from gpib Kconfig option title
>       - Add gpib to Kconfig and Makefile in drivers
>       - Update MAINTAINERS
> 
> Dave Penkler (6):
>   staging: Remove gpib build from staging
>   staging: gpib: Remove gpib/uapi from search path
>   staging: gpib: Change file path for uapi headers

Sorry if it wasn't clear, but I meant that you should squash also these
three into the patch moving things out of staging.

>   staging: gpib: Update TODO file
>   staging: gpib: Fix SPDX license for gpib headers
>   gpib: Destage gpib

So in the end you'd only have these three patches.

Johan
