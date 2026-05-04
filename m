Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E253D6481
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898934; cv=pass; b=EfmYyFkup/J635nLBMr2+Eur+I448RbpydtkzEYicOT1G9WbKqVYb1+ReoFPVcl1Zpz/a0RbUDJnkeDvrX+LURoxo1ZsFpYdHxe3grQ4uP7YftBTxbex7oRt2x+cOnfZb2Vq/s3Exp7wNe451Zw9AxT4086FvOs0hGcs5vs687c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898934; c=relaxed/simple;
	bh=2kY5BIuB+ufB2Pehc7AcK+zOLtv4KIKzsUJRFie7MG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sECX5RUFlpMHkkeHXov+63oLqR5mBK4AeRylgpNDu8+z8W5a/D4/ei9Be8Jo/kbSVFOrdqPDjIi68Y8iXqr4MgIfmh9RfN7YPCK+nRmPgK1iBjWRa2w1xeqq4cwCHsoc1brx4ZRyZpwBV/xBXa1Urir47xwfnz8A7HhvYd9LX+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f28+mNKo; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f28+mNKo"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64eb84d1e37so2982152d50.2
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 05:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777898930; cv=none;
        d=google.com; s=arc-20240605;
        b=KE672UAWl3THwjVavWvQI2D85wj0SCxUclgSIHpEU+lIFjbRVkkYhUliUv3v7H4nIR
         KFPPib8GN2trw+4G8ncI8TKgvcETeE3axQtHUVKLcdSMFPYgPNSsvwG/oebVABqxX1PH
         sknN9W+f2mK5VzieMGnE279GQAPqU4z6inRLyIflJPRhyvLZ7uHIWf9f3+bLlelLg7zZ
         iRQ5bzC6GfiP6K8QW/N07YMOd2xk2ZlPpyTF90e/bVR08iRi5jpIQnYAZsbAhNpQiMV9
         On8X06FVDP/NFCRYnlbAU3zWADygaDT89WYZRCQPBPI3PId7u4VbaIQIp1CQVEIuOnMc
         3utQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AwgutxwEVlGDgPMcTWx07aMbhOve2XFxqkKRegLCJPo=;
        fh=546BJwixN83Fe190DqpqhAvh5YZJHUZAwpW2XdyThjI=;
        b=Ec+ZFRrw74EEs2A1qPTwXolStYv1OKsts07ZFIGe6OL/IB9bUIclBhCD7C+2ExlIRS
         bp8/PaS0tndFYTjvQvq8ub3HIcr/vAEaPr/QUQ34IbuJP4+OWBaeHZuOgGg9C7S/SSvy
         xqk+DpnoGKcFTHMvGTf0OOByvh/bO1DMi+gPTPFU4S3I75T1oApCKm3GNwyoUwnUNt2a
         ok2r+dudCPWZTijdU7CI/NJ3cNDTK+xngzD0JVdBYAKYA8RkfV8UuJ7qHfgIT/0f7hmM
         vACSz8mRAuiHQKeQlmvaT9FAgiw+uSWpbLOwHkE7azN8a53XthBvepn5+ETA2z5pXSba
         xl0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777898930; x=1778503730; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AwgutxwEVlGDgPMcTWx07aMbhOve2XFxqkKRegLCJPo=;
        b=f28+mNKo/bDFWBrDnCgz4NDgW3Re280uzFjCYGW3tZKBWV7Vi2RmagVLCITtAw8qMm
         ZJQ4ZdjWma8XKzNlqiKGNoRoEWrd1uD5ZRu0a0DPDf+Sfj/mzCOf9jY7AMa/g78P6ii0
         XEaTH2ng3rJ2KbT26lRgJQ4fCzd/Fv6o7V8yId1yg+Cp2UEzmiDoLdcINg7zoPDRTt2K
         bGBEXEzQoqLeUbk/HxkqLiUkI1h+EKIQZF91Hy63+8CTn+irxxe/yNNuIhZoWcqJ1KPJ
         nl1wir+G2zko35xkWKBJcYkb2d9rjMkEMc2pPY7udlFavzLCLlkv0BnNm4pvDAP6yDKa
         fkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777898930; x=1778503730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwgutxwEVlGDgPMcTWx07aMbhOve2XFxqkKRegLCJPo=;
        b=KXcTfKYcCpb1ialeZEYp9uNpQhfsFLd0MxX1J6GCosxtZHrT4ZvvY2NiELlACxdvUn
         7bz6fzmNyh+e6Jpoj2C2wrJtdbz1JYJFI7aw1+nLt9kKKnrQdgR47yjUEDvHpgCvZvxX
         381TNyuPJuvNN20RuaqT+7CCWKkT6N76XTHrQQbFZIg3QXy04Ib7gbopZFkLzxTJoROG
         xwbD99+u3MdbyqInEZ66RAz7QDzN/rVjovg4VteXKK3lcz6ott79oNJFyyaHsWTClYcx
         /jqNIpxqw7ulRXorxcaZR4wK+0s9ImkkO4CK9hQbAMDQa2UhqD+ULKTAftgVixyxNFgj
         AESw==
X-Forwarded-Encrypted: i=1; AFNElJ/t0LGIzIUMdJJiU0YutKPB/s29VgH2TS8D7QFI4lisRnyI/7Up2sL3SYSkC59YLxy22VCbA43HsYwZ+l5T@lists.linux.dev
X-Gm-Message-State: AOJu0YwaAP1wwgruiNlzKatFnN9NMLg0zlHTRcnHd/lCe9chagH2Ce72
	0m+D4I30p7BJm30+ZnAOm8qkTjWQWW6JvAn0GINysv+ZYV+xOUPqVxVIQHYjjug8LKPkx6e36Kr
	u43owTl9RaQkFeQf8VstkgEkRZWPYres=
X-Gm-Gg: AeBDieuNZcsNXuu4s13rUmD6uaVh8GnfxkpL0SGi5a09DwigLDd1L3noC/J42pt1K83
	7/t91aIfrII+j/e2nwWfNN+Py1FKt1At/jSRxgo0z05jMtb5IqzitK+hFjFrSPkoqnOrPa0Rlkn
	ug7INItiE0JOnAmNCJ/08/3Rx0WuPReRRWEiQXsqLBqxq+TLRjvWCit0xiRTFLBQUw30SKjYktE
	Hpu7MNr8tJEb6dCvaKt861nthaJLy9vFmU0yO6994PolwGclm0WtuexmBP4D+uWtFCY8FiMH4TY
	CLHB9J0YPMHIwhuC/Q==
X-Received: by 2002:a05:690e:168c:b0:651:d0a5:ce2 with SMTP id
 956f58d0204a3-65c3dbd0c18mr9274835d50.60.1777898929910; Mon, 04 May 2026
 05:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260430053820.446080-1-lgs201920130244@gmail.com> <202605032224.WHCEx7uc-lkp@intel.com>
In-Reply-To: <202605032224.WHCEx7uc-lkp@intel.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 4 May 2026 20:48:40 +0800
X-Gm-Features: AVHnY4KjNnZnjqUSHDRUd793YOF0624mKw7IO-xD2BfGfwjxsYdj1bk1K-D3VyQ
Message-ID: <CANUHTR_UeQq5hLtLFMqeEORbGuWTJBZdpmi+0AqzzO42y-S3ow@mail.gmail.com>
Subject: Re: [PATCH] media: staging/ipu7: Fix pdata double free in init error paths
To: kernel test robot <lkp@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil@kernel.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi kernel test robot,

Thanks for the report.

On Sun, 3 May 2026 at 22:52, kernel test robot <lkp@intel.com> wrote:
>
> Hi Guangshuo,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on staging/staging-testing]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/media-staging-ipu7-Fix-pdata-double-free-in-init-error-paths/20260501-032323
> base:   staging/staging-testing
> patch link:    https://lore.kernel.org/r/20260430053820.446080-1-lgs201920130244%40gmail.com
> patch subject: [PATCH] media: staging/ipu7: Fix pdata double free in init error paths
> config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260503/202605032224.WHCEx7uc-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605032224.WHCEx7uc-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605032224.WHCEx7uc-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/staging/media/ipu7/ipu7.c: In function 'ipu7_isys_init':
> >> drivers/staging/media/ipu7/ipu7.c:2176:33: error: passing argument 1 of 'ERR_CAST' makes pointer from integer without a cast [-Wint-conversion]
>     2176 |                 return ERR_CAST(ret);
>          |                                 ^~~
>          |                                 |
>          |                                 int
>    In file included from include/linux/cleanup.h:6,
>                     from include/linux/acpi.h:11,
>                     from drivers/staging/media/ipu7/ipu7.c:6:
>    include/linux/err.h:102:64: note: expected 'const void *' but argument is of type 'int'
>      102 | static inline void * __must_check ERR_CAST(__force const void *ptr)
>          |                                                    ~~~~~~~~~~~~^~~
>    drivers/staging/media/ipu7/ipu7.c: In function 'ipu7_psys_init':
>    drivers/staging/media/ipu7/ipu7.c:2221:33: error: passing argument 1 of 'ERR_CAST' makes pointer from integer without a cast [-Wint-conversion]
>     2221 |                 return ERR_CAST(ret);
>          |                                 ^~~
>          |                                 |
>          |                                 int
>    include/linux/err.h:102:64: note: expected 'const void *' but argument is of type 'int'
>      102 | static inline void * __must_check ERR_CAST(__force const void *ptr)
>          |                                                    ~~~~~~~~~~~~^~~
>
>
> vim +/ERR_CAST +2176 drivers/staging/media/ipu7/ipu7.c
>
>   2125
>   2126  static struct ipu7_bus_device *
>   2127  ipu7_isys_init(struct pci_dev *pdev, struct device *parent,
>   2128                 const struct ipu_buttress_ctrl *ctrl, void __iomem *base,
>   2129                 const struct ipu_isys_internal_pdata *ipdata,
>   2130                 unsigned int nr)
>   2131  {
>   2132          struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
>   2133          struct ipu7_bus_device *isys_adev;
>   2134          struct device *dev = &pdev->dev;
>   2135          struct ipu7_isys_pdata *pdata;
>   2136          int ret;
>   2137
>   2138          ret = ipu7_isys_check_fwnode_graph(fwnode);
>   2139          if (ret) {
>   2140                  if (fwnode && !IS_ERR_OR_NULL(fwnode->secondary)) {
>   2141                          dev_err(dev,
>   2142                                  "fwnode graph has no endpoints connection\n");
>   2143                          return ERR_PTR(-EINVAL);
>   2144                  }
>   2145
>   2146                  ret = ipu_bridge_init(dev, ipu_bridge_parse_ssdb);
>   2147                  if (ret) {
>   2148                          dev_err_probe(dev, ret, "IPU bridge init failed\n");
>   2149                          return ERR_PTR(ret);
>   2150                  }
>   2151          }
>   2152
>   2153          pdata = kzalloc_obj(*pdata);
>   2154          if (!pdata)
>   2155                  return ERR_PTR(-ENOMEM);
>   2156
>   2157          pdata->base = base;
>   2158          pdata->ipdata = ipdata;
>   2159
>   2160          isys_adev = ipu7_bus_initialize_device(pdev, parent, pdata, ctrl,
>   2161                                                 IPU_ISYS_NAME);
>   2162          if (IS_ERR(isys_adev)) {
>   2163                  dev_err_probe(dev, PTR_ERR(isys_adev),
>   2164                                "ipu7_bus_initialize_device isys failed\n");
>   2165                  kfree(pdata);
>   2166                  return ERR_CAST(isys_adev);
>   2167          }
>   2168
>   2169          isys_adev->mmu = ipu7_mmu_init(dev, base, ISYS_MMID,
>   2170                                         &ipdata->hw_variant);
>   2171          if (IS_ERR(isys_adev->mmu)) {
>   2172                  ret = PTR_ERR(isys_adev->mmu);
>   2173                  dev_err_probe(dev, ret,
>   2174                                "ipu7_mmu_init(isys_adev->mmu) failed\n");
>   2175                  put_device(&isys_adev->auxdev.dev);
> > 2176                  return ERR_CAST(ret);
>   2177          }
>   2178
>   2179          isys_adev->mmu->dev = &isys_adev->auxdev.dev;
>   2180          isys_adev->subsys = IPU_IS;
>   2181
>   2182          ret = ipu7_bus_add_device(isys_adev);
>   2183          if (ret)
>   2184                  return ERR_PTR(ret);
>   2185
>   2186          return isys_adev;
>   2187  }
>   2188
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

The build failure is caused by my use of ERR_CAST(ret) after caching
PTR_ERR(isys_adev->mmu) / PTR_ERR(psys_adev->mmu) into the integer variable
ret. ERR_CAST() expects an error pointer, not an integer error code.

I will fix this in v2 by returning ERR_PTR(ret) instead.

Thanks,
Guangshuo
