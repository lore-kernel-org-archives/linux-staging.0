Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299D471
	for <linux-staging@lists.linux.dev>; Fri,  7 May 2021 06:13:33 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id v22so2914258oic.2
        for <linux-staging@lists.linux.dev>; Thu, 06 May 2021 23:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jssVR0Ke4gLMQ/8TddZ8ZY5oO2gPFQyrLTbIarga+9o=;
        b=hbTeQO65TovJ3XcoFIDfpyfG+aTqL2MFmbcAfnRM+lIuOuDHW6ZUDRi4c90QMRwROS
         cBbKBWLJTbsZnTrS2Qw4mn/5PONi1q1BLH/1oXyo4BvAcoJ4TF4v9bSWDsOQpo0PwMRA
         fgijnAyNMg3xBP+JnMglxxEz9p9Znvfggu0x2oduB01wVNGIQKYoZ9eVddFtcD0P4jQ1
         PtPh7yL1+O83VksUXCSP+u6Lq6Pf06KJa6Gj27SiHxbyMP+2MbRyK91e6c9wrqRl2cRO
         qmP9B6JCwKmMaH/q1sryxUHfgPOVArBZvfcfEqgzBqYPDkdhlWwNnsRMLRqacHxos3ci
         BnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jssVR0Ke4gLMQ/8TddZ8ZY5oO2gPFQyrLTbIarga+9o=;
        b=Y464cKos9JVxgo/1869p2GUE6x/8lCUoP2rBqnmIaw0Gv8+iCosrLtN3t2V486U23L
         wOvRzOMCgPe4LYcFoqahJY1crJz9An9pvw37SQRDwn7iAhc6W/bmCJlBjfcOHzgoDP46
         TXbYcYEwFGAjXQ9n5pee1259ZAddZb+ZqrTBljBsqD4t1FAqWBalJjGdNUG56+vDZP2K
         g200WjOkaMEZ010az/8axF8XND9tNAhe+BXP1LJC6sBV+dhxW2T1tvXpiT7TumbjqBbz
         cAkk54HMVwgC03CkPaXjOGxAmlv6Ys/gwNbsd2dnjPDmpsut4G/j/6ny862aDFcTAQI7
         CXUw==
X-Gm-Message-State: AOAM5318VGqnB9yHDWiatOxw1wl5342+ff3FGq+rXi8pOhZXjyghW34G
	8K/Clqg8eqvarceuqygJGTT0CPrT83Lxgx3FrPM=
X-Google-Smtp-Source: ABdhPJyoCPd33xMnPAYYHlpG8rCeh13HzqdvvU0flD8iFLlastr/nnkeqFI4ZxJsRbHXTOG6T9CIRSgCjWLQxzpQeXs=
X-Received: by 2002:aca:2813:: with SMTP id 19mr13972251oix.23.1620368012432;
 Thu, 06 May 2021 23:13:32 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210506111531.21978-5-sergio.paracuellos@gmail.com> <202105062302.YjXZOAuy-lkp@intel.com>
In-Reply-To: <202105062302.YjXZOAuy-lkp@intel.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 7 May 2021 08:13:21 +0200
Message-ID: <CAMhs-H9Y=Q7PVT0sS02LzwHSj2PbePF2_qgLM+U569PyFBmAEA@mail.gmail.com>
Subject: Re: [PATCH 4/5] phy: ralink: Kconfig: enable COMPILE_TEST on
 mt7621-pci-phy driver
To: kernel test robot <lkp@intel.com>
Cc: Vinod Koul <vkoul@kernel.org>, kbuild-all@lists.01.org, 
	linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, May 6, 2021 at 5:59 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Sergio,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on staging/staging-testing]
> [also build test WARNING on linus/master next-20210506]
> [cannot apply to robh/for-next v5.12]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Sergio-Paracuellos/phy-ralink-mt7621-pci-phy-some-improvements/20210506-191714
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git e120332923e13d8d9386594a83dc7cbf327e3edf
> config: sparc-allyesconfig (attached as .config)
> compiler: sparc64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/44e8bb824a0a4af6fc41d67b70ec3a678bd8125f
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Sergio-Paracuellos/phy-ralink-mt7621-pci-phy-some-improvements/20210506-191714
>         git checkout 44e8bb824a0a4af6fc41d67b70ec3a678bd8125f
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross W=1 ARCH=sparc
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    In file included from include/linux/device.h:15,
>                     from include/linux/node.h:18,
>                     from include/linux/cpu.h:17,
>                     from include/linux/of_device.h:5,
>                     from drivers/phy/ralink/phy-mt7621-pci.c:13:
>    drivers/phy/ralink/phy-mt7621-pci.c: In function 'mt7621_pcie_phy_of_xlate':
> >> drivers/phy/ralink/phy-mt7621-pci.c:277:4: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>      277 |    (unsigned int)mt7621_phy->port_base, mt7621_phy->has_dual_port);
>          |    ^
>    include/linux/dev_printk.h:118:33: note: in definition of macro 'dev_info'
>      118 |  _dev_info(dev, dev_fmt(fmt), ##__VA_ARGS__)
>          |                                 ^~~~~~~~~~~
>

Thanks!, COMPILE_TEST is doing a good job there :). Ok, so I have just
sent a patch for this:
See: https://lkml.org/lkml/2021/5/7/28

Best regards,
    Sergio Paracuellos

>
> vim +277 drivers/phy/ralink/phy-mt7621-pci.c
>
> d87da32372a03c Sergio Paracuellos 2020-11-21  265
> d87da32372a03c Sergio Paracuellos 2020-11-21  266  static struct phy *mt7621_pcie_phy_of_xlate(struct device *dev,
> d87da32372a03c Sergio Paracuellos 2020-11-21  267                                           struct of_phandle_args *args)
> d87da32372a03c Sergio Paracuellos 2020-11-21  268  {
> d87da32372a03c Sergio Paracuellos 2020-11-21  269       struct mt7621_pci_phy *mt7621_phy = dev_get_drvdata(dev);
> d87da32372a03c Sergio Paracuellos 2020-11-21  270
> d87da32372a03c Sergio Paracuellos 2020-11-21  271       if (WARN_ON(args->args[0] >= MAX_PHYS))
> d87da32372a03c Sergio Paracuellos 2020-11-21  272               return ERR_PTR(-ENODEV);
> d87da32372a03c Sergio Paracuellos 2020-11-21  273
> d87da32372a03c Sergio Paracuellos 2020-11-21  274       mt7621_phy->has_dual_port = args->args[0];
> d87da32372a03c Sergio Paracuellos 2020-11-21  275
> d87da32372a03c Sergio Paracuellos 2020-11-21  276       dev_info(dev, "PHY for 0x%08x (dual port = %d)\n",
> d87da32372a03c Sergio Paracuellos 2020-11-21 @277                (unsigned int)mt7621_phy->port_base, mt7621_phy->has_dual_port);
> d87da32372a03c Sergio Paracuellos 2020-11-21  278
> d87da32372a03c Sergio Paracuellos 2020-11-21  279       return mt7621_phy->phy;
> d87da32372a03c Sergio Paracuellos 2020-11-21  280  }
> d87da32372a03c Sergio Paracuellos 2020-11-21  281
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
