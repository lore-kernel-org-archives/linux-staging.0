Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7178F69;
	Tue, 14 Mar 2023 15:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678807790; x=1710343790;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QvJzZ3242dMhNPCkEyzhBjsZMjFhooKtyCNrrCWyChc=;
  b=I7QpI6qDA1+Qra+BJVsVpE1cwQBjVgAR1gvvjlc7C6LHRs92kjN2YQP5
   iryW9kyEpDQRn4DMOj/KQkpewIVExnL1zTV96hwLQ5Lb9N34I6w+Pcdl4
   byosMvFx1DYlonrLyN/7gTc7vadSDndTWZw3hmF/34AS64JZ+uFEr541M
   KBv8LRmgRDIHW4GdenPpmfv68VxsP1xlcrpJvSA0PKmGVTadVHUlJCPZD
   8ZvcQD4Tif0oVQLMHnEomZeDAZc4G34jQvSFMHeGIW0xlIuBx3xHWTmGT
   xdAnCA0QuHCMTqvCHKf/697WZ3ijSmoox3AceoCK8pFDjhIG3qznAEgbO
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="336150513"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="336150513"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 08:29:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="853240212"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="853240212"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.212.140.184])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 08:29:49 -0700
Date: Tue, 14 Mar 2023 08:29:48 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Kloudifold <cloudifold.3125@gmail.com>, teddy.wang@siliconmotion.com,
	sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750: Rename function to avoid CamelCase
Message-ID: <ZBCS7DR9dZH1yds8@aschofie-mobl2>
References: <ZA+K6OdPe21k8F2k@CloudiRingWorld>
 <ZA/+JlgWfdg2wH8B@debian.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZA/+JlgWfdg2wH8B@debian.me>

On Tue, Mar 14, 2023 at 11:55:02AM +0700, Bagas Sanjaya wrote:
> On Tue, Mar 14, 2023 at 04:43:20AM +0800, Kloudifold wrote:
> > The sm750 driver had some functions named in CamelCase,
> > which violates the kernel's naming convention.
> > In this patch, I rename these functions to snake case,
> > which is the expected style.
> > 
> > This v2 patch was prompted by an error reported by the
> > Linux test robot, which detected the compile error.
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202303110849.X24WnHnM-lkp@intel.com/
> 
> Hi,
> 
> I'd like to write the patch description as (ignore markdown):
> 
> ```
> sm750 driver has sm750_hw_cursor_* functions, which are named in
> camelcase. Rename them to snake case to follow the function naming
> convention.
> 
> Fixes: <commit that introduces these camelcase function>
> ```

Why are you asking for a Fixes tag on this? 
Seems unusual for a staging driver cleanup.

Alison


> 
> Thanks.
> 
> -- 
> An old man doll... just what I always wanted! - Clara


