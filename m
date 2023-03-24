Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207276FA1;
	Fri, 24 Mar 2023 15:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679671733; x=1711207733;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QnXO9tD65xE00C1x+fbsAJ7iDcx8NXcgRbEs/4X1O58=;
  b=RJZZF8yufV4N+lrIKnFh706yLv52sM9eYfPA/jsVgAnwsA3M9Vf28d9o
   kF//3QI3v1rh4UsfSqoUuSim9wSUvBh3W9GuiXfMvAI3D9+1W/mIJrPL2
   l9zArQ6BVQhXYVwcEE23jBmCQYRwES0WYn/BzFbMqzqLUxJgdXjFfSXe6
   E/4wcBXxfn7MKttHa3uRQzVdBNT5q8R8rdMytlD+IiS0LK+uQFjc8b1ah
   UUi9mw5azJxEj2xfeQYILSa0xZs7i3BMLZZRu7LFlF3BAiJQCxD3bsDLk
   /Nd2YdRGEmE7Qc3K3AYe0enMwq8kQmwSSGRul66Y4wwt0qAHngD9b1K9l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="319453366"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="319453366"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 08:28:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="928687439"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="928687439"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.209.62.66])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 08:28:51 -0700
Date: Fri, 24 Mar 2023 08:28:50 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Cc: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Staging: greybus: Use inline functions
Message-ID: <ZB3BshO6Yen25LvB@aschofie-mobl2>
References: <cover.1679642024.git.sumitraartsy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679642024.git.sumitraartsy@gmail.com>

On Fri, Mar 24, 2023 at 12:20:30AM -0700, Sumitra Sharma wrote:
> Convert macros to a static inline function, to make the relevant 
> types apparent in the definition and to benefit from the type 
> checking performed by the compiler at call sites.
> 
> CHanges in v2: Change patch subjects, noted by Alison Schofield 


Please review: https://kernelnewbies.org/Outreachyfirstpatch
Section on 'Following the driver commit style'.

To follow the commit style of the greybus driver, update these
commit messages to be under 80 chars, and use "staging", not
"Staging"

Like this:
drivers/staging/greybus$ git log --oneline | head -3
1498054921e2 staging: greybus: Inline pwm_chip_to_gb_pwm_chip()
a7d2a41b7453 staging: greybus: Inline gb_audio_manager_module()
f7d3ece211be staging: greybus: Inline macro gpio_chip_to_gb_gpio_controller()

BTW - I wasn't instantly sure about using 'Inline' as a verb in this
case, so I did this (git log --oneline | grep inline) and found it's
a common use. 

We're building a habit here for when you submit across subsystems
in the future. 

Alison

> 
> Sumitra Sharma (3):
>   Staging: greybus: Use inline function for macro
>     gpio_chip_to_gb_gpio_controller
>   Staging: greybus: Use inline function for gb_audio_manager_module
>   Staging: greybus: Use inline function for pwm_chip_to_gb_pwm_chip
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
