Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EF08F69;
	Tue, 14 Mar 2023 16:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678810234; x=1710346234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZZ1GkwZzOOfbuECIVG//M3pZbtjDLpfRYC2hiYAiNVI=;
  b=S/KrdScpBB3y9CzuS+n8frjLI9Ez670KZR3+Vk3hcVuBY09fpcimlhQa
   qo7tEEC2iusSimgygjGgMNrTP/xCi6B89RJmL1zr0Fu24iGqrtqqgamh1
   yUvZ1Gw04n/SIH4CWHmX/j6hug6M2ufrD9GjkInf7bVwgxtYU1aUnR4ct
   yW6pQJeC8hCn2D7nG+xbvRJSca49hAf8TpqQQlEYCGLgRlGvQPK8YN7Cj
   65mvkVEFdSH3uug93TgENmJl8qUldVI5pBQkcdYsVqCc7rXcWB95DYgQz
   IZagqT7EAGh61VCB4VFdC4G2P+BLiBEzymqLMXHb/anKeVPUjb7ClRxBw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="337496402"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="337496402"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 09:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="629085030"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="629085030"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.212.140.184])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 09:04:54 -0700
Date: Tue, 14 Mar 2023 09:04:53 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Kloudifold <cloudifold.3125@gmail.com>, teddy.wang@siliconmotion.com,
	sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750: Rename function to avoid CamelCase
Message-ID: <ZBCbJR2RVzc7Wr4g@aschofie-mobl2>
References: <ZA+K6OdPe21k8F2k@CloudiRingWorld>
 <64f9d3ca-268e-71ae-4a6d-b71315a8406e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64f9d3ca-268e-71ae-4a6d-b71315a8406e@gmail.com>

On Tue, Mar 14, 2023 at 01:07:59AM +0100, Philipp Hortmann wrote:
> On 3/13/23 21:43, Kloudifold wrote:
> > The sm750 driver had some functions named in CamelCase,
> > which violates the kernel's naming convention.
> > In this patch, I rename these functions to snake case,
> > which is the expected style.
> 
> Hi,
> please make the Subject more unique. Many patches could have this name.
> Look for examples in:
> https://lore.kernel.org/linux-staging/
> 
> Please use your full name consisting of a given name and a family name in
> front of your email. Or is this not possible and "Kloudifold" is both?

Kloudifold,

It'll probably take a bit for the change, allowing pseudonyms, to become
common knowledge. When the question comes up, you can just point to the
latest update to Documentation/process/submitting-patches.rst as I've
done below.

Phillip,
I commented similar to you, and then discovered this:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d4563201f33a022fc0353033d9dfeb1606a88330

Pseudonyms now allowed.

Alison

> > This v2 patch was prompted by an error reported by the
> > Linux test robot, which detected the compile error.
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202303110849.X24WnHnM-lkp@intel.com/
> > 
> > Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>
> 
> The explanation what has changed needs to be below the ---
> but your Signed-off-by: is not allowed to be below this ---
> Look for examples of v2 in:
> https://lore.kernel.org/linux-staging/
> 
> Thanks
> 
> Bye Philipp
> 
