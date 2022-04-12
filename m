Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7671FD1;
	Tue, 12 Apr 2022 17:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649783930; x=1681319930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gqO9kiFi9h/R4QIs0wdglXcXClDXZyXTWIjL3/zjRXw=;
  b=Mz/LieDQeXIk/xZBPv85SFJnRxrOMKbWgPB0E9ikPbFuMld/X0KKnUFv
   wDkXwKJBO/bmiyE+Jsie0ct0n/RlkKpnhu78u8QYBC0UgllRpu/o2zaWT
   0Qd58EjBazg8WAm7gXjESvAqWcnQf4B6KEE9nTQUJoqPlVOepm5ASyYKk
   WQlr6zk5Qw5HL8ZzJKPUj6NpXU1M32nnSTntHhemk8bE8qTiREkeothcu
   IWEClDO82EmuILO0vn2cMIsTOpSjjvTKRY913569Eo8j8a50lYDKdm7k4
   JYCjWV8q9MNYmsUO8sV77a+gyDYWkpJki98UBWTE1L4PTR2Pjk4kNItSY
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="262627140"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="262627140"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 10:16:53 -0700
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="724544681"
Received: from alison-desk.jf.intel.com (HELO alison-desk) ([10.54.74.41])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 10:16:52 -0700
Date: Tue, 12 Apr 2022 10:18:49 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Bruno Moreira-Guedes <codeagain@codeagain.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: Re: [PATCH v2 0/3] staging: vme: Restructuring menuconfig and tree
Message-ID: <20220412171849.GA1236580@alison-desk>
References: <cover.1649721450.git.codeagain@codeagain.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1649721450.git.codeagain@codeagain.dev>

On Tue, Apr 12, 2022 at 03:53:46AM -0300, Bruno Moreira-Guedes wrote:
> This patch series modify the vme_user driver's place in
> menuconfig (1/3), fixes a missing `depends on` line in a Kconfig file
> (2/3), and rearrages the directory tree for the driver allowing a more
> straightforward comprehension of its contents (3/3).

For a patchset it (typically) is OK to put the changelog in the
cover letter. See the first patch tutorial for how to format that.
That give you a little less editing to do for each individual patch.

I do see that you responded to this cover letter with clarifications.
That is fine. Just be aware that it will probably stop reviewers from
continuing their review, because you've already alerted them a v3 is
in the works. I'm going to go ahead and comment on a few format things
in this set, so maybe you can tidy them up in v3.

Alison

> 
> Signed-off-by: Bruno Moreira-Guedes <codeagain@codeagain.dev>
> 
> Bruno Moreira-Guedes (3):
>   staging: vme: Adjusted VME_USER in Kconfig
>   staging: vme: Fix missing `depends on` at KConfig
>   staging: vme: "drivers/staging/vme" tree cleanup
> 
>  MAINTAINERS                                          | 2 +-
>  drivers/staging/Kconfig                              | 2 ++
>  drivers/staging/Makefile                             | 2 +-
>  drivers/staging/vme/Makefile                         | 2 --
>  drivers/staging/{vme/devices => vme_user}/Kconfig    | 2 +-
>  drivers/staging/{vme/devices => vme_user}/Makefile   | 0
>  drivers/staging/{vme/devices => vme_user}/vme_user.c | 0
>  drivers/staging/{vme/devices => vme_user}/vme_user.h | 0
>  drivers/vme/Kconfig                                  | 2 --
>  9 files changed, 5 insertions(+), 7 deletions(-)
>  delete mode 100644 drivers/staging/vme/Makefile
>  rename drivers/staging/{vme/devices => vme_user}/Kconfig (93%)
>  rename drivers/staging/{vme/devices => vme_user}/Makefile (100%)
>  rename drivers/staging/{vme/devices => vme_user}/vme_user.c (100%)
>  rename drivers/staging/{vme/devices => vme_user}/vme_user.h (100%)
> 
> -- 
> 2.35.1
> 


