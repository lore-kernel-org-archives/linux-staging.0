Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB26A950;
	Thu, 23 Mar 2023 17:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679593009; x=1711129009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+oRZBGlRDE2mN2HqkB0otRZAMosS9UyIjnPhkCjAn4k=;
  b=aji+3SwV1kjXCw4WTvJrLTHnmwjQh86TyAuk3hHN0I7V/9JNyO741RKm
   mWa357oz4HTKW3eJaTi8gXPX22nDBbG7ILkRb4DyXwMFoQJjN0Nj5WsMC
   s80kPsRMCMi8WxNbHp7rteUmSqPSaGrca1AJ/V7vdP9PraQfoLFlY53LL
   X1jpcZFNOgtc5RH48LbJf0DQmXktvX74NJmkxUkifdIZIGqJKj65eN1Kx
   joRHLvvS+A6LK26dCwQnCEviZis1GT5rUT5s1vtvZErMlAYLne9W3pXaH
   5fDZuOx6G5zdjo8B4IoE4qOJGqfp2Ae0+mqGsW90hcM3LtBEy9NIANTdh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="319228540"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="319228540"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 10:36:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="806351892"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="806351892"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.252.131.62])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 10:36:47 -0700
Date: Thu, 23 Mar 2023 10:36:46 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Cc: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Staging: greybus: Convert macro definitions to
Message-ID: <ZByOLjobQ2TrdFXQ@aschofie-mobl2>
References: <cover.1679558269.git.sumitraartsy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679558269.git.sumitraartsy@gmail.com>

On Thu, Mar 23, 2023 at 02:01:04AM -0700, Sumitra Sharma wrote:
> Convert macros to a static inline function, to make the relevant 
> types apparent in the definition and to benefit from the type 
> checking performed by the compiler at call sites.
> 
> Sumitra Sharma (3):
>   Staging: greybus: Convert macro gpio_chip_to_gb_gpio_controller to an
>     inline function
>   Staging: greybus: Convert macro struct gb_audio_manager_module to an
>     inline function
>   Staging: greybus: Convert macro struct pwm_chip_to_gb_pwm_chip to an
>     inline function

Hi Sumitra,

Please review:

https://kernelnewbies.org/Outreachyfirstpatch#:~:text=Following%20the%20Driver%20commit%20style

That is the section on 'Following the driver commit style'.

Cover letter Subject seems to be needlessly truncated.

Alison

> 
>  drivers/staging/greybus/audio_manager_module.c | 7 +++++--
>  drivers/staging/greybus/gpio.c                 | 7 +++++--
>  drivers/staging/greybus/pwm.c                  | 6 ++++--
>  3 files changed, 14 insertions(+), 6 deletions(-)
> 
> -- 
> 2.25.1
> 
> 
