Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633C772
	for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 12:06:21 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id c5so833590pfv.8
        for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 05:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Dhey6DNL2ogOKRIaHxi5hPlcQvIhtGNJ9mhZh8P/uYk=;
        b=ULxBuc2F6IPVX+cShFxvY1JhiCxC+L0UzFLuU+mVY/5lcpXxMsnlp+60FyM17ISCBV
         QWv6JHa9i11Lrn+BLzEtjCQeteNQ6Ej1j3OKpQmTZSRgz9E/pOLzXwupmTSgOQhmf3Dm
         cCIZNKHbLKlbd8LqjEs5KFQ1RLIe7eL5ARaFmW1vyzQ3cLw/rzMqdmtS5zY4qNbuA7Vi
         vpNCCR3iMiuNjkIGc+5iG8Q2zI7GdJVj8xR9FYj8cehFWoFKD1DxhXm44TYtyfXkQsst
         fUXDbuw400IFWVVTKmDbS0ND37jKTQyiFbrUEWzkLMQosDqgdYSwtK79XgoEi2jHiuxd
         Bd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dhey6DNL2ogOKRIaHxi5hPlcQvIhtGNJ9mhZh8P/uYk=;
        b=Pg4Vu4VcZQsAZNjeJB/KjpSM9SSvpncszudrghuvK8hQEvxNymGPSQIHiXLQwQI9S4
         ebDnnuQNKF24R/DRl0P4AbumW2kjkw857jsJep7f6Q1qQPDJdToJaA4YDxIa5RDKw534
         D3qOlFtxuGyeqBJW1TtNWHBecLp9ikfk95dP6usmw/VpiPwJPoVSBKrRRUMI+BIceEul
         TuiZRS9ouvAc4qiapG0Dca0/29rrvUiNfE9LP4EVKvCq5VNI9H1vzMRz9j+bzxy+g4yJ
         sdTxhIF7PzFZLoHddOfWdS9cyXOvZcBAICn8I4JFcKnqa7gjzHG+4uZg4P6Exm7c7731
         6WuA==
X-Gm-Message-State: AOAM530dMc7KfUKZaC+pbejBV2S6Tq4ktFldMAPa+ZM5edQR3OrFXMsm
	XJRCl/AZVQIrv/5+NvYiYI6Zpbm1FU4+afdn
X-Google-Smtp-Source: ABdhPJy84cCGRZRvi+wLEb1t6F6ufWp1R7DByF9uonyAIuiEd0htSIni+2U/w3M5ujFeBBFO3FOkzg==
X-Received: by 2002:a65:4109:: with SMTP id w9mr23161356pgp.24.1624277180341;
        Mon, 21 Jun 2021 05:06:20 -0700 (PDT)
Received: from gmail.com (36-229-229-123.dynamic-ip.hinet.net. [36.229.229.123])
        by smtp.gmail.com with ESMTPSA id nv1sm15363076pjb.43.2021.06.21.05.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 05:06:19 -0700 (PDT)
Date: Mon, 21 Jun 2021 20:06:16 +0800
From: Jhih-Ming Huang <fbihjmeric@gmail.com>
To: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: make[2]: *** No rule to make target
 '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/970a74bfa214d0d2e888d70974dd570293811429/lib/modules/5.13.0-rc6+/kernel/crypto/cmac.ko',
 needed by '__modinst'.
Message-ID: <20210621120616.vp4foapbgexf3nsn@gmail.com>
References: <202106211900.eGQt5TX8-lkp@intel.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202106211900.eGQt5TX8-lkp@intel.com>

On Mon, Jun 21, 2021 at 07:47:07PM +0800, kernel test robot wrote:
> Hi Jhih-Ming,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://github.com/0day-ci/linux/commits/UPDATE-20210621-162141/Jhih-Ming-Huang/rtw_security-fix-cast-to-restricted-__le32/20210616-131056
> head:   970a74bfa214d0d2e888d70974dd570293811429
> commit: 970a74bfa214d0d2e888d70974dd570293811429 rtw_security: fix cast to restricted __le32
> date:   3 hours ago
> config: x86_64-randconfig-a012-20210621 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project e1adf90826a57b674eee79b071fb46c1f5683cd0)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/970a74bfa214d0d2e888d70974dd570293811429
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review UPDATE-20210621-162141/Jhih-Ming-Huang/rtw_security-fix-cast-to-restricted-__le32/20210616-131056
>         git checkout 970a74bfa214d0d2e888d70974dd570293811429
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    arch/x86/Makefile:148: CONFIG_X86_X32 enabled but no binutils support
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/970a74bfa214d0d2e888d70974dd570293811429/lib/modules/5.13.0-rc6+/kernel/crypto/cmac.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/970a74bfa214d0d2e888d70974dd570293811429/lib/modules/5.13.0-rc6+/kernel/crypto/md5.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/970a74bfa214d0d2e888d70974dd570293811429/lib/modules/5.13.0-rc6+/kernel/crypto/sha512_generic.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/970a74bfa214d0d2e888d70974dd570293811429/lib/modules/5.13.0-rc6+/kernel/drivers/net/net_failover.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/970a74bfa214d0d2e888d70974dd570293811429/lib/modules/5.13.0-rc6+/kernel/drivers/net/virtio_net.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/970a74bfa214d0d2e888d70974dd570293811429/lib/modules/5.13.0-rc6+/kernel/fs/cifs/cifs.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/970a74bfa214d0d2e888d70974dd570293811429/lib/modules/5.13.0-rc6+/kernel/fs/nfs/nfsv4.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/970a74bfa214d0d2e888d70974dd570293811429/lib/modules/5.13.0-rc6+/kernel/lib/crypto/libarc4.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/970a74bfa214d0d2e888d70974dd570293811429/lib/modules/5.13.0-rc6+/kernel/net/core/failover.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/970a74bfa214d0d2e888d70974dd570293811429/lib/modules/5.13.0-rc6+/kernel/net/dns_resolver/dns_resolver.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/970a74bfa214d0d2e888d70974dd570293811429/lib/modules/5.13.0-rc6+/kernel/net/sunrpc/auth_gss/auth_rpcgss.ko', needed by '__modinst'.
>    make[2]: Target '__modinst' not remade because of errors.
>    make[1]: *** [Makefile:1770: modules_install] Error 2
>    make: *** [Makefile:215: __sub-make] Error 2
>    make: Target 'modules_install' not remade because of errors.
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

I got this failed build message, and I think it might not be due to my patch.

But I am not sure. If I am wrong, please correct me.
or someone could hint me that it's due to which patch.

thanks.

jmhuang
