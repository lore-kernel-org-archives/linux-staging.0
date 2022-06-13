Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BB97C
	for <linux-staging@lists.linux.dev>; Mon, 13 Jun 2022 02:05:40 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-fe15832ce5so6698039fac.8
        for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 19:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e46J6YpvZlo2yGMzk6PY6sq3v309vZF6FtZnu8zauLo=;
        b=iJBQxF2Wl8xxK/rALoNpaCDWo3V4BFLqvJPHSBKd+7wAbQVgGZOGN6oaw8AoVgfAO2
         kacOO+OTX7lzg2LAvn+n1wMfeLtg5vtSuRqsFvoUqtsD/E+8Zfj+PWUSnp1gQRFX55+V
         ugDYSdtx/pX5N0b3Rzk2R1X0n1Q7bLh/QNEhIbXz8h11K6c2UvpOub/rddfitIN6XLGF
         fn7YG6cUzDDw+wgoIJJQLCWkyBC6H8cJqbdj4G1DjgcouBGe+iBpQMQ+Hun8+wevETDi
         suvR2BriwLgGym/UvWSy+NCXBqma/WYQxesdN/8RF7M1YfiX4TSaitFsHIQcPGwz4PBy
         ZzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e46J6YpvZlo2yGMzk6PY6sq3v309vZF6FtZnu8zauLo=;
        b=cNRXhvR63xa/Dugu5dnFnNBVluIhr+++m4gNMJO53ldo61rwJmOYjkKGvZp/pA70yr
         pZ4hUHOxYw1IiUtBNVDARLFJoQXcbdZF/c7qMSLNLBhi7suM2MeLOaMtNdlW92gSWz1K
         7CpwcaeS8G6zvbGr6ekER8vmJjF08sUCSV6/a/WlhDAqyw+vV9KbMyikymzKsFTYyZmH
         eNu0cnA6vl2uwXRSoSh59gajfF8Gl56xcw9WwX5SUCS1wuuYypJPDqnIL8I9g1DzBmIS
         ZPrvkZCNNkk0r+2EIiAivhh5ifx6vIxEhT66CezEvDPdUAYWJ7I1Xw16KaiQZ2xw5WHE
         DABw==
X-Gm-Message-State: AOAM532OFd6rFn6duNloLD/SVMyij+J3iU0bQaDuH+gfR3PVzzTYBKJA
	uZQkMtN8STz2vfCHSCaYIcILrBSUA+fReU9hqyk=
X-Google-Smtp-Source: ABdhPJwz5UGAyOrgXcceDNDm0wdsu410WRWWGrrkAgaIqwJLEpLVqHsAtKdij4lra+lyQ0P01s8Oj7xw9CpeCe+QygU=
X-Received: by 2002:a05:6870:d582:b0:fe:4131:6dbb with SMTP id
 u2-20020a056870d58200b000fe41316dbbmr6421526oao.76.1655085939878; Sun, 12 Jun
 2022 19:05:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <62a3ad70.TorcQosfTdYPgOzL%lkp@intel.com>
In-Reply-To: <62a3ad70.TorcQosfTdYPgOzL%lkp@intel.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Mon, 13 Jun 2022 07:35:27 +0530
Message-ID: <CAFqt6zaL=QBkS5PJNKV9D81uGmwGwjjsa0w90ohGjJkB2qEu4g@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION 6d0c806803170f120f8cb97b321de7bd89d3a791
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-staging@lists.linux.dev, 
	amd-gfx@lists.freedesktop.org, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 11, 2022 at 2:16 AM kernel test robot <lkp@intel.com> wrote:
>
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: 6d0c806803170f120f8cb97b321de7bd89d3a791  Add linux-next specific files for 20220610
>
> Error/Warning reports:
>
> https://lore.kernel.org/llvm/202205220805.wrw5woEk-lkp@intel.com
>
> Error/Warning: (recently discovered and may have been fixed)
>
> arch/riscv/include/asm/pgtable-64.h:215:2: error: invalid input constraint '0' in asm
> arch/riscv/include/asm/pgtable.h:257:2: error: invalid input constraint '0' in asm
> drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:130:17: warning: 'DP_SINK_BRANCH_DEV_NAME_7580' defined but not used [-Wunused-const-variable=]

This is a False warning.
0 ddc_service_types.h <global>                    130 static const u8
DP_SINK_BRANCH_DEV_NAME_7580[] = "7580\x80u";
1 dc_link.c           detect_link_and_local_sink 1106
memcmp(&link->dpcd_caps.branch_dev_name, DP_SINK_BRANCH_DEV_NAME_7580,


> drivers/misc/cardreader/rts5261.c:406:13: warning: variable 'setting_reg2' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
I think, code wise this looks correct and can be excluded.

> drivers/staging/rtl8723bs/hal/hal_btcoex.c:1182:30: warning: variable 'pHalData' set but not used [-Wunused-but-set-variable]
>
> Error/Warning ids grouped by kconfigs:
>
> gcc_recent_errors
> |-- alpha-allyesconfig
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> |-- arc-allyesconfig
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> |-- arm-allmodconfig
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> |-- arm-allyesconfig
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> |-- arm64-allyesconfig
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> |-- i386-allyesconfig
> |   |-- drivers-gpu-drm-amd-amdgpu-..-display-include-ddc_service_types.h:warning:DP_SINK_BRANCH_DEV_NAME_7580-defined-but-not-used
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> |-- ia64-allmodconfig
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> |-- m68k-allmodconfig
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> |-- m68k-allyesconfig
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> |-- mips-allmodconfig
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> |-- mips-allyesconfig
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> |-- nios2-allyesconfig
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> |-- parisc-allyesconfig
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> |-- powerpc-allmodconfig
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> |-- powerpc-allyesconfig
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> |-- riscv-allmodconfig
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> |-- riscv-allyesconfig
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> |-- sh-allmodconfig
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> |-- sparc-allyesconfig
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> |-- x86_64-allyesconfig
> |   |-- drivers-gpu-drm-amd-amdgpu-..-display-include-ddc_service_types.h:warning:DP_SINK_BRANCH_DEV_NAME_7580-defined-but-not-used
> |   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
> `-- xtensa-allyesconfig
>     `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
>
> clang_recent_errors
> |-- i386-randconfig-a013
> |   `-- drivers-misc-cardreader-rts5261.c:warning:variable-setting_reg2-is-used-uninitialized-whenever-if-condition-is-false
> `-- riscv-randconfig-r013-20220610
>     |-- arch-riscv-include-asm-pgtable-.h:error:invalid-input-constraint-in-asm
>     `-- arch-riscv-include-asm-pgtable.h:error:invalid-input-constraint-in-asm
>
> elapsed time: 873m
>
> configs tested: 61
> configs skipped: 3
>
> gcc tested configs:
> arm                                 defconfig
> arm                              allmodconfig
> arm                              allyesconfig
> arm64                               defconfig
> arm64                            allyesconfig
> um                             i386_defconfig
> um                           x86_64_defconfig
> ia64                                defconfig
> ia64                             allmodconfig
> ia64                             allyesconfig
> m68k                                defconfig
> m68k                             allyesconfig
> m68k                             allmodconfig
> nios2                               defconfig
> arc                              allyesconfig
> alpha                               defconfig
> csky                                defconfig
> nios2                            allyesconfig
> alpha                            allyesconfig
> h8300                            allyesconfig
> arc                                 defconfig
> sh                               allmodconfig
> xtensa                           allyesconfig
> parisc                              defconfig
> s390                             allmodconfig
> parisc                           allyesconfig
> s390                             allyesconfig
> parisc64                            defconfig
> s390                                defconfig
> i386                   debian-10.3-kselftests
> i386                              debian-10.3
> i386                                defconfig
> i386                             allyesconfig
> sparc                               defconfig
> sparc                            allyesconfig
> mips                             allyesconfig
> mips                             allmodconfig
> powerpc                           allnoconfig
> powerpc                          allmodconfig
> powerpc                          allyesconfig
> i386                          randconfig-a014
> i386                          randconfig-a012
> i386                          randconfig-a016
> riscv                             allnoconfig
> riscv                            allyesconfig
> riscv                            allmodconfig
> riscv                    nommu_k210_defconfig
> riscv                          rv32_defconfig
> riscv                    nommu_virt_defconfig
> riscv                               defconfig
> x86_64                              defconfig
> x86_64                           allyesconfig
> x86_64                                  kexec
> x86_64                               rhel-8.3
> x86_64                         rhel-8.3-kunit
> x86_64                           rhel-8.3-syz
> x86_64                          rhel-8.3-func
> x86_64                    rhel-8.3-kselftests
>
> clang tested configs:
> i386                          randconfig-a013
> i386                          randconfig-a011
> i386                          randconfig-a015
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
>
