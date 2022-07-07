Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F5628ED
	for <linux-staging@lists.linux.dev>; Thu,  7 Jul 2022 21:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657229409; x=1688765409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RR8nKcKkeUV/WR33JNvmdjCBx/wyCPnlG8A7Ckb1Pgs=;
  b=UiKfkSafzuNQ2nfq8vWKebj2r42KnJ9O4umt5nj7RowEs6qEB9ivG8m3
   qPpB+tzZ6L1x1VLmorWFS2xQVxzHNc0QLx3Jj1oGuf5KGQBmnf95HVFUp
   IUicZsJEghvSji7D6B+rC7x6v1CNPzXyQjBOaV/k/CZrd/ujdyLMlmffn
   yjw4YxFgHQGlyiaq+szA49RnnYLW2a387uCg9o/+e8FzGcGTBF4Qscfv3
   l+rb2Wy6BFOut/4MH2VDJ5zs6vLu1Ky29FwQVyFM8nomtzpCtTDim2MxI
   E7FnvnrGAViO5B/bMRY10ByP2XNC00U3lkpDy8q2wBa/A45PA5ZOa5Ukc
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="285254348"
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; 
   d="scan'208";a="285254348"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 14:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; 
   d="scan'208";a="736115138"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2022 14:30:05 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9Z4X-000MVK-6m;
	Thu, 07 Jul 2022 21:30:05 +0000
Date: Fri, 8 Jul 2022 05:29:35 +0800
From: kernel test robot <lkp@intel.com>
To: Karthik Alapati <mail@karthek.com>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kbuild-all@lists.01.org, Shuah Khan <skhan@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: don't use index pointer after iter
Message-ID: <202207080535.tr2i6TxR-lkp@intel.com>
References: <Ysa1oopf0ELw+OfB@karthik-strix-linux.karthek.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ysa1oopf0ELw+OfB@karthik-strix-linux.karthek.com>

Hi Karthik,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.19-rc5]
[also build test ERROR on linus/master]
[cannot apply to staging/staging-testing next-20220707]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karthik-Alapati/staging-greybus-don-t-use-index-pointer-after-iter/20220707-183311
base:    88084a3df1672e131ddc1b4e39eeacfd39864acf
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220708/202207080535.tr2i6TxR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/bc295082ef055003c6018b57d3c56c5aefcb65c5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Karthik-Alapati/staging-greybus-don-t-use-index-pointer-after-iter/20220707-183311
        git checkout bc295082ef055003c6018b57d3c56c5aefcb65c5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/staging/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/staging/greybus/audio_helper.c: In function 'gbaudio_dapm_free_controls':
>> drivers/staging/greybus/audio_helper.c:128:32: error: expected ';' before 'for'
     128 |                 w_found = false
         |                                ^
         |                                ;
   drivers/staging/greybus/audio_helper.c:119:14: warning: variable 'w_found' set but not used [-Wunused-but-set-variable]
     119 |         bool w_found = false;
         |              ^~~~~~~
   drivers/staging/greybus/audio_helper.c:118:41: warning: unused variable 'next_w' [-Wunused-variable]
     118 |         struct snd_soc_dapm_widget *w, *next_w;
         |                                         ^~~~~~


vim +128 drivers/staging/greybus/audio_helper.c

   124	
   125		mutex_lock(&dapm->card->dapm_mutex);
   126		for (i = 0; i < num; i++) {
   127			/* below logic can be optimized to identify widget pointer */
 > 128			w_found = false
   129			list_for_each_entry_safe(w, next_w, &dapm->card->widgets,
   130						 list) {
   131				if (w->dapm != dapm)
   132					continue;
   133				if (!strcmp(w->name, widget->name)) {
   134					w_found = true;
   135					break;
   136				}
   137				w = NULL;
   138			}
   139			if (!w_found) {
   140				dev_err(dapm->dev, "%s: widget not found\n",
   141					widget->name);
   142				widget++;
   143				continue;
   144			}
   145			widget++;
   146	#ifdef CONFIG_DEBUG_FS
   147			if (!parent)
   148				debugfs_w = debugfs_lookup(w->name, parent);
   149			debugfs_remove(debugfs_w);
   150			debugfs_w = NULL;
   151	#endif
   152			gbaudio_dapm_free_widget(w);
   153		}
   154		mutex_unlock(&dapm->card->dapm_mutex);
   155		return 0;
   156	}
   157	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
