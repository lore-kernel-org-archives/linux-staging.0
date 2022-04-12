Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6081FD1;
	Tue, 12 Apr 2022 18:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649786708; x=1681322708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IeaSKSuXPhVpXFM/OGOekdHqEQjfF86SwDcNvu0ysGk=;
  b=NOFcBykT6xoDd/aOXzWBAgWCqGtLKfwvhd2FbT5F5ayBu4rW4zC8xBmK
   ++y30cUmyoiMi0mdusuIriCj97Fd5GY+e7ch2tixbThDQDv/lqyaAhX7g
   fFQetL6Ms1lq8X0QeFDKchILu47pA39kC5YcSVV6YoAZhsV9Rn53SSWbn
   CamGlABsxP+BR8J1HHscfdjnK43fWtP+XCHD5F6t4cHrzf+HpX2g258Jj
   UYmWsFhRz77TwlL9dEfkWkxAbQsBlWKtVmr74KHmGDchjr1m132veWo7r
   HNwPYM9qAzNysexxDs0d6Cc+bPRlDrQDFalmGwsVkj3dtDlk1hzqYswTz
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="249748666"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="249748666"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 10:57:25 -0700
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="724563522"
Received: from alison-desk.jf.intel.com (HELO alison-desk) ([10.54.74.41])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 10:57:23 -0700
Date: Tue, 12 Apr 2022 10:59:17 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Bruno Moreira-Guedes <codeagain@codeagain.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: Re: [PATCH v2 1/3] staging: vme: Adjusted VME_USER in Kconfig
Message-ID: <20220412175917.GA1236898@alison-desk>
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

'Adjusted' is unecessarily vague. In the commit msg try to say
exactly what the patch did. Write in the imperative tense, like
you are issuing commands.

Something like 'Move VME staging driver to staging Kconfig' , or
'Source vme driver from staging Kconfig'.  

> Currently, the VME_USER driver is in the staging tree Kconfig, unlike
> other VME drivers already moved to the main portions of the kernel tree.
> Its configuration is, however, nested into the VME_BUS config option,
> which might be misleading.
> 
> Since the staging tree "[...] is used to hold stand-alone[1] drivers and
> filesystem that are not ready to be merged into the main portion of the
> Linux kernel tree [...]"[1], IMHO all staging drivers should appear

Skip the 'IMHO'. It's all your HO and if you state anything incorrectly,
your reviewers should catch it. If you are truly making a wild guess
about something, either look into it further, or not it in a question
below the '---'.

This commit message is otherwise very well written. It explains the
why of this patch nicely. 

Again, for this set, perhaps the changelog in the cover letter only.

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
> 
> REFERENCES
> [1] https://lkml.org/lkml/2009/3/18/314
> 
> Signed-off-by: Bruno Moreira-Guedes <codeagain@codeagain.dev>
> ---
>  drivers/staging/Kconfig | 2 ++
>  drivers/vme/Kconfig     | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
> index 932acb4e8cbc..0545850eb2ff 100644
> --- a/drivers/staging/Kconfig
> +++ b/drivers/staging/Kconfig
> @@ -88,4 +88,6 @@ source "drivers/staging/qlge/Kconfig"
>  
>  source "drivers/staging/wfx/Kconfig"
>  
> +source "drivers/staging/vme/devices/Kconfig"
> +
>  endif # STAGING
> diff --git a/drivers/vme/Kconfig b/drivers/vme/Kconfig
> index 936392ca3c8c..c13dd9d2a604 100644
> --- a/drivers/vme/Kconfig
> +++ b/drivers/vme/Kconfig
> @@ -15,6 +15,4 @@ source "drivers/vme/bridges/Kconfig"
>  
>  source "drivers/vme/boards/Kconfig"
>  
> -source "drivers/staging/vme/devices/Kconfig"
> -
>  endif # VME
> -- 
> 2.35.1
> 


