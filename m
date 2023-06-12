Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3C81381;
	Mon, 12 Jun 2023 01:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686534777; x=1718070777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m46vQZk4pefLmm8P5SfQHMea4c/QsvdPEaoeo/+mU18=;
  b=QBouW2elYAC4ApHcAJpBuAAGQ13RJVvkFhdVdxV9Cp5MABXdYTQprQ9r
   SVqzfOSYvQreuCjms/blhWyXwvhwznAf6Ev476pF/BrrznuxDlY0e6iII
   NSIIF3LlYakGWaDNarEv4ThSjg/6RbKjmgMhIeRhmcyayPdvVWr0euccS
   vcp09acI51hQsn+y/dUEMDD9k7GaI4XgCA740y1WZIoxxUjWUSaeGZJBE
   Z8ViT8X2baHuNxGBESTUJeERULatJFwxkdto8hWb+SgFxzBUs0dhaRRMd
   GGp3sIKPcQDmHl9KhjzeozwQGbQwUs8Qx35v4ubl14Hs5HrdXCLrpGbT+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="338286805"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; 
   d="scan'208";a="338286805"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 18:52:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="1041156934"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; 
   d="scan'208";a="1041156934"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Jun 2023 18:52:55 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8Wjm-00001A-14;
	Mon, 12 Jun 2023 01:52:54 +0000
Date: Mon, 12 Jun 2023 09:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Yogesh Hegde <yogi.kernel@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/5] staging: rtl8192e: Remove variable SetWirelessMode
Message-ID: <202306120923.uMeOfojk-lkp@intel.com>
References: <fba56522e419351b05e33df8cd0ac31806534d8c.1686149467.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fba56522e419351b05e33df8cd0ac31806534d8c.1686149467.git.yogi.kernel@gmail.com>

Hi Yogesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on staging/staging-next staging/staging-linus linus/master v6.4-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yogesh-Hegde/staging-rtl8192e-Remove-variable-SetWirelessMode/20230607-230636
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/fba56522e419351b05e33df8cd0ac31806534d8c.1686149467.git.yogi.kernel%40gmail.com
patch subject: [PATCH v2 1/5] staging: rtl8192e: Remove variable SetWirelessMode
config: x86_64-randconfig-s053-20230611 (https://download.01.org/0day-ci/archive/20230612/202306120923.uMeOfojk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/823187b988791852e562dba90e5eb7c7e7df8eca
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yogesh-Hegde/staging-rtl8192e-Remove-variable-SetWirelessMode/20230607-230636
        git checkout 823187b988791852e562dba90e5eb7c7e7df8eca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306120923.uMeOfojk-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "rtl92e_set_wireless_mode" [drivers/staging/rtl8192e/rtllib.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
