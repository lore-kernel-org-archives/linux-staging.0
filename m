Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3547C7C;
	Wed,  2 Nov 2022 07:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6586C433D6;
	Wed,  2 Nov 2022 07:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667374007;
	bh=ea3xm0W6JUBu3sbnx+UELIxce5vh5PHS2fnCsdepCRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wSaCsQMOWWAD+7aar1WiLQWiPNtjleWhEB6afOO/TQeLvahTf1wwBzH4oZSZPgTiK
	 FwKvynul45f66iisV/ZcFqzyjQM0qjraxoENOIYyxgzstnNe4e2A/3uJyU7zIm3QlR
	 yXuLYT/YebmxF4EvCBiT00VijsfAdMXc9sGiBKNs=
Date: Wed, 2 Nov 2022 08:27:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] staging: rtl8192u: unused code cleanup
Message-ID: <Y2Ib7FjwfqbcZ77h@kroah.com>
References: <cover.1667237959.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1667237959.git.drv@mailo.com>

On Mon, Oct 31, 2022 at 11:25:14PM +0530, Deepak R Varma wrote:
> Remove unnecessary or unused code.
> 
> Changes in v2:
>    Patch1:
>       1. Revise patch log to explain impact of the patch
>          Suggested by gregkh@linuxfoundation.org
>    Patch2:
>       1. Review other similar macro defines and clean those up as well.
>          Suggested by gregkh@linuxfoundation.org
>       2. Revise patch log to explain impact of the patch
>          Suggested by julia.lawall@inria.fr
> 
> Deepak R Varma (2):
>   staging: rtl8192u: remove unnecessary function implementation
>   staging: rtl8192u: remove redundant macro definition
> 
>  .../staging/rtl8192u/ieee80211/ieee80211.h    | 67 -------------------
>  .../rtl8192u/ieee80211/ieee80211_crypt_tkip.c |  6 --
>  .../rtl8192u/ieee80211/ieee80211_module.c     |  3 -
>  3 files changed, 76 deletions(-)

This series causes a build breakage:

  MODPOST Module.symvers
../ERROR: modpost: net/mac80211/mac80211: 'ieee80211_wake_queue' exported twice. Previous export was in drivers/staging/rtl8192u/r8192u_usb.ko
ERROR: modpost: net/mac80211/mac80211: 'ieee80211_stop_queue' exported twice. Previous export was in drivers/staging/rtl8192u/r8192u_usb.ko
make[1]: *** [scripts/Makefile.modpost:126: Module.symvers] Error 1
make: *** [Makefile:1944: modpost] Error 2

Always test build your changes.

greg k-h
