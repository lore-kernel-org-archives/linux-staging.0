Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636EA53AB;
	Wed, 15 Mar 2023 16:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678896669; x=1710432669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jFuhWlXO/qjo6QWUILbvKSvhqgBdyjVOn4Kb+6B5HvQ=;
  b=ZpSJfmCWQMBo7pCYd28Ysay/hVJoE/TPVYiQpkuBMwfTbi3vyikRJmGw
   aTNmJmgQPP2aJt2YoiP0K4Ml1a4vTOnKBfWWQLaAgdpa69c0m8faybAS8
   zje8r7lhPsQ9+Jwd/i/e16Z0/vfN5w6sWaDAHT/0QK4C5SuIxSEgXO/g6
   AL6Rfq85QpRIkaS4ErtP+NGbZqFgl2/wGTfdagA+SVcK9HSR/MjT6KMeb
   BRrKsjpcBfg8hh2gxVqS6EDwfRqrn+zjwFoSJ2cqUiDPimDMEfP0KR6Kf
   t8HAy4Vqk21VXYICQtQnK8qlKYB9jkR7nNWTPdVeHm+lw4QmpXBEfX09t
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="337769867"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="337769867"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 09:09:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="711982160"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="711982160"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.209.59.168])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 09:09:17 -0700
Date: Wed, 15 Mar 2023 09:09:16 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] staging: axis-fifo: initialize timeouts in probe only
Message-ID: <ZBHtrGjgKOiVwjSF@aschofie-mobl2>
References: <ZA9mThZ7NyRrQAMX@khadija-virtual-machine>
 <ZBEJ+8DbhADSBTLr@aschofie-mobl2>
 <ZBG699SriXWy1I2K@khadija-virtual-machine>
 <16148020.1MiD057Pog@suse>
 <ZBHUr7bANuhnOnIV@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBHUr7bANuhnOnIV@khadija-virtual-machine>

On Wed, Mar 15, 2023 at 07:22:39PM +0500, Khadija Kamran wrote:
> On Wed, Mar 15, 2023 at 02:34:31PM +0100, Fabio M. De Francesco wrote:
> > Aside from what I said and asked for with the other message of this same 
> > thread, please take note that you can build a specific module if you prefer 
> > not to re-build the whole kernel and other modules at the same time. 
> > 
> > I'm pretty sure that the instructions to do so are in the OutreachyFirstPatch 
> > tutorial.
> > 
> > If they are not there, please let us know.
> > 
> > Fabio
> 
> Hey Fabio!
> 
> In the Outreachy FirstPatchTutorial under the 'Compiling only part of
> the kernel' section there are ways to compile only some part of the
> kernel.
> 
> I have tried using "make W=1 drivers/staging/axis-fifo/" and it says
> 'nothing to be done for'. 
> 
> Should I start with the steps to reproduce? :'(

Khadija,

I've applied your patch and it fails to compile with the warnings
that LKP reports.

If you are doing: $ make drivers/staging/axis-fifo/

and it is saying 'nothing to be done...'

You either have not changed anything since the last compile, or you
do not have the module configured.

I suspect it has never compiled for you and you need to look at
the direction in the tutorial for 'Recompiling the driver' section
and learn how to use make menuconfig.

This driver has a couple of dependencies described in the Kconfig
file. You will not even see the 'XIL_AXIS_FIFO' option until you
turn on 'OF' and HAS_'IOMEM'.

See the drivers/staging/axis-fifo/Kconfig

Please confirm that you have compiled the driver before chasing
after the build env that lkp reports.

Thanks,
Alison


> 
> Thank you!
> 
> Regards,
> Khadija
> 
> 
> > 
> > 
> > 
