Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F4A2CA5
	for <linux-staging@lists.linux.dev>; Mon, 31 Jan 2022 13:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08E4C340E8;
	Mon, 31 Jan 2022 13:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1643634425;
	bh=1wmFtXZO4CqFtCd7+S+KYp7Ke3fu6dCt4v93kjNLb5w=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=q+c+qw8v8acp2dFk7dmiu5Y0jvKJxoMvdkjMlBbqanXiJtwukiaiVMfVW9I+NafXS
	 3V1yIKJkY7uiFIkN7JVzDWdlDzWQ8hIe+bKPfZrd0rmEYSS9Geney4rgA3W7ysC/Ai
	 hgH2UsqbgVIuN+E0qh76iKcHJaf+mUraMX5Niolg=
Date: Mon, 31 Jan 2022 14:07:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>,
	Nguyen Dinh Phi <phind.uet@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>, kbuild-all@lists.01.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vc04_services: make a couple of functions static
Message-ID: <Yffe9tO6rRyzod2F@kroah.com>
References: <20220131071006.1764343-1-phind.uet@gmail.com>
 <202201311901.HT4PtVja-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202201311901.HT4PtVja-lkp@intel.com>

On Mon, Jan 31, 2022 at 07:16:01PM +0800, kernel test robot wrote:
> Hi Nguyen,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on staging/staging-testing]
> 
> url:    https://github.com/0day-ci/linux/commits/Nguyen-Dinh-Phi/staging-vc04_services-make-a-couple-of-functions-static/20220131-151209
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git 64b2d6ffff862c0e7278198b4229e42e1abb3bb1
> config: arm-randconfig-r002-20220130 (https://download.01.org/0day-ci/archive/20220131/202201311901.HT4PtVja-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/1b64825a2b5b3312ae309c1714239df049b018ac
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Nguyen-Dinh-Phi/staging-vc04_services-make-a-couple-of-functions-static/20220131-151209
>         git checkout 1b64825a2b5b3312ae309c1714239df049b018ac
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm SHELL=/bin/bash drivers/staging/vc04_services/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c: In function 'free_pagelist':
> >> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:434:25: warning: argument 2 null where non-null expected [-Wnonnull]
>      434 |                         memcpy((char *)kmap(pages[0]) +
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      435 |                                 pagelist->offset,
>          |                                 ~~~~~~~~~~~~~~~~~
>      436 |                                 fragments,
>          |                                 ~~~~~~~~~~
>      437 |                                 head_bytes);
>          |                                 ~~~~~~~~~~~
>    In file included from include/linux/string.h:20,
>                     from include/linux/bitmap.h:11,
>                     from include/linux/cpumask.h:12,
>                     from include/linux/mm_types_task.h:14,
>                     from include/linux/mm_types.h:5,
>                     from include/linux/buildid.h:5,
>                     from include/linux/module.h:14,
>                     from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:8:
>    arch/arm/include/asm/string.h:20:15: note: in a call to function 'memcpy' declared 'nonnull'
>       20 | extern void * memcpy(void *, const void *, __kernel_size_t);
>          |               ^~~~~~
> 

Oddly, your patch caused these build errors to happen, which implies
that you did not test-build your patch?

I remember seeing this before and being confused as to why this type of
change would cause this error, but it must be for some reason, which
means we can't take this patch.

Always test-build your changes before sending them out.

thanks,

greg k-h
