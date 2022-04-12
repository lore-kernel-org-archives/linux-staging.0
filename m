Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9581FBA;
	Tue, 12 Apr 2022 13:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C33C385A5;
	Tue, 12 Apr 2022 13:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649770536;
	bh=vNQOBDQdMni8jds0z2+VqbUL+Zc+eovCppk8nBmVt/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQpdhQ9Jy//mWBYBcfXL7e6OY/PbhclRiMeYneJGshb8YN9EvilTqLP4M8mreulTh
	 kdEQyahAtqhEwKn6huAr4zO2m/ZLUgn3He9gwqlJm4HaFTqWcqzqTD2H6gYZ0vu+aC
	 pFyQgVhsLZTice6QbvAhv026stpiWUTmGiH2p0Tc=
Date: Tue, 12 Apr 2022 15:35:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bruno Moreira-Guedes <codeagain@codeagain.dev>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: Re: [PATCH v2 1/3] staging: vme: Adjusted VME_USER in Kconfig
Message-ID: <YlWAJfoRxWPjSEnz@kroah.com>
References: <cover.1649721450.git.codeagain@codeagain.dev>
 <cfd7014e7f70cb928aa957f56bb31d8f514c2446.1649721450.git.codeagain@codeagain.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfd7014e7f70cb928aa957f56bb31d8f514c2446.1649721450.git.codeagain@codeagain.dev>

On Tue, Apr 12, 2022 at 03:55:21AM -0300, Bruno Moreira-Guedes wrote:
> Currently, the VME_USER driver is in the staging tree Kconfig, unlike
> other VME drivers already moved to the main portions of the kernel tree.
> Its configuration is, however, nested into the VME_BUS config option,
> which might be misleading.
> 
> Since the staging tree "[...] is used to hold stand-alone[1] drivers and
> filesystem that are not ready to be merged into the main portion of the
> Linux kernel tree [...]"[1], IMHO all staging drivers should appear
> nested into the Main Menu -> Device Drivers -> Staging Drivers to make
> sure the user don't pick it without being fully aware of its staging
> status as it could be the case in Menu -> Device Drivers -> VME bridge
> support (the current location).
> 
> With this change menuconfig users will clearly know this is not a driver
> in the main portion of the kernel tree and decide whether to build it or
> not with that clearly in mind.
> 
> This change goes into the same direction of commit 4b4cdf3979c3
> ("STAGING: Move staging drivers back to staging-specific menu")
> 
> CHANGELOG
> v1:
>  - Sourced "drivers/staging/vme/devices/Kconfig" in
>    "drivers/staging/Kconfig" and unsourced in "drivers/vme/Kconfig".
> 
> v2:
> - Turned into a patchset to (1) fix missing "depends on" missing entry
>   in config VME_USER at "drivers/staging/vme/devices/Kconfig",
>   affecting the behavior of this patch, and (2) fix unnecessary
>   remaining files from the time the whole vme subtree was in staging.


Changelog goes below the --- line please.

> REFERENCES
> [1] https://lkml.org/lkml/2009/3/18/314

Never reference lkml.org, we have no control over it and it goes down a
lot.  Please use lore.kernel.org links, and put the link in the body of
the text, no need for footnotes.

thanks,

greg k-h
