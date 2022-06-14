Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08CC46AE
	for <linux-staging@lists.linux.dev>; Tue, 14 Jun 2022 09:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655200472; x=1686736472;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=dS+2jaJBpQpxZZ8F96PPS6rHxQgLpZk+UB9Ba9ktUtA=;
  b=Hs8RNEKD45bNAXaB7k8pWwGJJLegCfQzxkyqp8JB3zyupFXd/Bm980Sk
   iClhqkKbBsT5kVzqhAcYbmq/dl4c2KC98UeOVgO5avzUPuagfyWh4v1e+
   tKCklGES7NgCrjJLbrj+OHWArtotAtLjp/Mobv6L/1T+LBykVc1XOaO8N
   0U6VZ3Ewt/zVNcw3Ru9CJGubAViU1YtZ7hlssOVggqfIsaNXqvvuWsIf0
   BMlBdhd0WbwO6E7oUqRqsuttUTyLF8paVL1879sz0GCcwNkIUbauKxK0M
   XCrtjx6URVmiyuar9u0DtHscvA5/c3AyCCYQ6lGuA3NArsqfrn76teSwh
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="261600358"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="261600358"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 02:54:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="830323142"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.255.28.34]) ([10.255.28.34])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 02:54:28 -0700
Subject: Re: [linux-next:master] BUILD REGRESSION
 6d0c806803170f120f8cb97b321de7bd89d3a791
To: Souptick Joarder <jrdr.linux@gmail.com>, kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-staging@lists.linux.dev,
 amd-gfx@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>
References: <62a3ad70.TorcQosfTdYPgOzL%lkp@intel.com>
 <CAFqt6zaL=QBkS5PJNKV9D81uGmwGwjjsa0w90ohGjJkB2qEu4g@mail.gmail.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <0880e58d-b48e-fc6e-d270-b2225f49c913@intel.com>
Date: Tue, 14 Jun 2022 17:54:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAFqt6zaL=QBkS5PJNKV9D81uGmwGwjjsa0w90ohGjJkB2qEu4g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/13/2022 10:05 AM, Souptick Joarder wrote:
> On Sat, Jun 11, 2022 at 2:16 AM kernel test robot <lkp@intel.com> wrote:
>>
>> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> branch HEAD: 6d0c806803170f120f8cb97b321de7bd89d3a791  Add linux-next specific files for 20220610
>>
>> Error/Warning reports:
>>
>> https://lore.kernel.org/llvm/202205220805.wrw5woEk-lkp@intel.com
>>
>> Error/Warning: (recently discovered and may have been fixed)
>>
>> arch/riscv/include/asm/pgtable-64.h:215:2: error: invalid input constraint '0' in asm
>> arch/riscv/include/asm/pgtable.h:257:2: error: invalid input constraint '0' in asm
>> drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:130:17: warning: 'DP_SINK_BRANCH_DEV_NAME_7580' defined but not used [-Wunused-const-variable=]
> 
> This is a False warning.
> 0 ddc_service_types.h <global>                    130 static const u8
> DP_SINK_BRANCH_DEV_NAME_7580[] = "7580\x80u";
> 1 dc_link.c           detect_link_and_local_sink 1106
> memcmp(&link->dpcd_caps.branch_dev_name, DP_SINK_BRANCH_DEV_NAME_7580,

Hi Souptick,

Thanks for the reply, we'll add the warning to ignore list.

Best Regards,
Rong Chen

> 
> 
>> drivers/misc/cardreader/rts5261.c:406:13: warning: variable 'setting_reg2' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
> I think, code wise this looks correct and can be excluded.
> 
>> drivers/staging/rtl8723bs/hal/hal_btcoex.c:1182:30: warning: variable 'pHalData' set but not used [-Wunused-but-set-variable]
>>
>> Error/Warning ids grouped by kconfigs:
>>
>> gcc_recent_errors
>> |-- alpha-allyesconfig
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> |-- arc-allyesconfig
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> |-- arm-allmodconfig
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> |-- arm-allyesconfig
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> |-- arm64-allyesconfig
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> |-- i386-allyesconfig
>> |   |-- drivers-gpu-drm-amd-amdgpu-..-display-include-ddc_service_types.h:warning:DP_SINK_BRANCH_DEV_NAME_7580-defined-but-not-used
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> |-- ia64-allmodconfig
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> |-- m68k-allmodconfig
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> |-- m68k-allyesconfig
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> |-- mips-allmodconfig
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> |-- mips-allyesconfig
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> |-- nios2-allyesconfig
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> |-- parisc-allyesconfig
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> |-- powerpc-allmodconfig
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> |-- powerpc-allyesconfig
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> |-- riscv-allmodconfig
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> |-- riscv-allyesconfig
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> |-- sh-allmodconfig
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> |-- sparc-allyesconfig
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> |-- x86_64-allyesconfig
>> |   |-- drivers-gpu-drm-amd-amdgpu-..-display-include-ddc_service_types.h:warning:DP_SINK_BRANCH_DEV_NAME_7580-defined-but-not-used
>> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>> `-- xtensa-allyesconfig
>>      `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>>
>> clang_recent_errors
>> |-- i386-randconfig-a013
>> |   `-- drivers-misc-cardreader-rts5261.c:warning:variable-setting_reg2-is-used-uninitialized-whenever-if-condition-is-false
>> `-- riscv-randconfig-r013-20220610
>>      |-- arch-riscv-include-asm-pgtable-.h:error:invalid-input-constraint-in-asm
>>      `-- arch-riscv-include-asm-pgtable.h:error:invalid-input-constraint-in-asm
>>
>> elapsed time: 873m
>>
>> configs tested: 61
>> configs skipped: 3
>>
>> gcc tested configs:
>> arm                                 defconfig
>> arm                              allmodconfig
>> arm                              allyesconfig
>> arm64                               defconfig
>> arm64                            allyesconfig
>> um                             i386_defconfig
>> um                           x86_64_defconfig
>> ia64                                defconfig
>> ia64                             allmodconfig
>> ia64                             allyesconfig
>> m68k                                defconfig
>> m68k                             allyesconfig
>> m68k                             allmodconfig
>> nios2                               defconfig
>> arc                              allyesconfig
>> alpha                               defconfig
>> csky                                defconfig
>> nios2                            allyesconfig
>> alpha                            allyesconfig
>> h8300                            allyesconfig
>> arc                                 defconfig
>> sh                               allmodconfig
>> xtensa                           allyesconfig
>> parisc                              defconfig
>> s390                             allmodconfig
>> parisc                           allyesconfig
>> s390                             allyesconfig
>> parisc64                            defconfig
>> s390                                defconfig
>> i386                   debian-10.3-kselftests
>> i386                              debian-10.3
>> i386                                defconfig
>> i386                             allyesconfig
>> sparc                               defconfig
>> sparc                            allyesconfig
>> mips                             allyesconfig
>> mips                             allmodconfig
>> powerpc                           allnoconfig
>> powerpc                          allmodconfig
>> powerpc                          allyesconfig
>> i386                          randconfig-a014
>> i386                          randconfig-a012
>> i386                          randconfig-a016
>> riscv                             allnoconfig
>> riscv                            allyesconfig
>> riscv                            allmodconfig
>> riscv                    nommu_k210_defconfig
>> riscv                          rv32_defconfig
>> riscv                    nommu_virt_defconfig
>> riscv                               defconfig
>> x86_64                              defconfig
>> x86_64                           allyesconfig
>> x86_64                                  kexec
>> x86_64                               rhel-8.3
>> x86_64                         rhel-8.3-kunit
>> x86_64                           rhel-8.3-syz
>> x86_64                          rhel-8.3-func
>> x86_64                    rhel-8.3-kselftests
>>
>> clang tested configs:
>> i386                          randconfig-a013
>> i386                          randconfig-a011
>> i386                          randconfig-a015
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://01.org/lkp
>>
> 
