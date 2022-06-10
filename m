Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6D5257D
	for <linux-staging@lists.linux.dev>; Fri, 10 Jun 2022 20:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654893954; x=1686429954;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/X8Jowue4dS3V4PnRhIOqkh+gcpMPb4kTivYj+0YL/s=;
  b=jKKfNH1CWfyyOV4wmMos+gdA9l9BxIUlqs6UC4u2AeL8BWlra6e18bta
   5FJW5qleqXtcabYD87RvOEYiHgUWFQ9gNE1ywR43aEXQVWVuD9qt9sRya
   wRI5+GC5P1KnEC9k6PVmGptqZnnqqmJOY1Gfrv7HpQRPygpddwVv3rRip
   SzQvQ5941bpt1scTKP2Y6oVabL3CSF1XgLHB9kJsgZW4hO50iUrD01jeI
   Ic1FQOqr/qSc91/5yVZPHX2HUdYxScQ321oEFMQjHJCtFd0Sg4SmPlqMR
   VTqds0OqrJzD2HumcjvXqxGBkHRLnndQ0Z+4R3UF1nrPiQq0391ZuPV/d
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="257576857"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="257576857"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 13:45:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="534224595"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Jun 2022 13:45:51 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nzlVv-000IG5-3L;
	Fri, 10 Jun 2022 20:45:51 +0000
Date: Sat, 11 Jun 2022 04:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-staging@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD REGRESSION
 6d0c806803170f120f8cb97b321de7bd89d3a791
Message-ID: <62a3ad70.TorcQosfTdYPgOzL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 6d0c806803170f120f8cb97b321de7bd89d3a791  Add linux-next specific files for 20220610

Error/Warning reports:

https://lore.kernel.org/llvm/202205220805.wrw5woEk-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/riscv/include/asm/pgtable-64.h:215:2: error: invalid input constraint '0' in asm
arch/riscv/include/asm/pgtable.h:257:2: error: invalid input constraint '0' in asm
drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:130:17: warning: 'DP_SINK_BRANCH_DEV_NAME_7580' defined but not used [-Wunused-const-variable=]
drivers/misc/cardreader/rts5261.c:406:13: warning: variable 'setting_reg2' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
drivers/staging/rtl8723bs/hal/hal_btcoex.c:1182:30: warning: variable 'pHalData' set but not used [-Wunused-but-set-variable]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- arc-allyesconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- arm-allmodconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- arm-allyesconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- arm64-allyesconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-include-ddc_service_types.h:warning:DP_SINK_BRANCH_DEV_NAME_7580-defined-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- ia64-allmodconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- m68k-allmodconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- m68k-allyesconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- mips-allmodconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- mips-allyesconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- nios2-allyesconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- parisc-allyesconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- powerpc-allmodconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- powerpc-allyesconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- riscv-allmodconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- riscv-allyesconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- sh-allmodconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- sparc-allyesconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-include-ddc_service_types.h:warning:DP_SINK_BRANCH_DEV_NAME_7580-defined-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
`-- xtensa-allyesconfig
    `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used

clang_recent_errors
|-- i386-randconfig-a013
|   `-- drivers-misc-cardreader-rts5261.c:warning:variable-setting_reg2-is-used-uninitialized-whenever-if-condition-is-false
`-- riscv-randconfig-r013-20220610
    |-- arch-riscv-include-asm-pgtable-.h:error:invalid-input-constraint-in-asm
    `-- arch-riscv-include-asm-pgtable.h:error:invalid-input-constraint-in-asm

elapsed time: 873m

configs tested: 61
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
parisc64                            defconfig
s390                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
