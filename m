Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C0A36E460
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 08:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776415617; cv=none; b=m7ow2i/+ZPbz9i0QjIllsQJsYLwDB5ic7c3OOjgR2HI/sgxDNj2a8bAnmsD1Cx30iGbHu3qBRfm8BldDFoCf+AxXc6pJXZEuZYB591L8uk702xZ0CSzs4qjofo8yQcZxU5diiJw7PSjfDnV61pS1Gey4r155iV89nPhlxc+vplo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776415617; c=relaxed/simple;
	bh=iIvafjuXfztxFfgcKs7kT5RlkaNQ9IadaQjo27I+9nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFn0oa3o6Wc1vAZdo9FL6sN4kR38DWuztXhamVNmILg2xltcWdozas+jJFyWvcYYp+GqNiaU9i2ZoV1s5pwK0NV2nju5PxFX+CNSbg7E93rZbcfi4eT61KykMt7uIrJwEJ6wIRCk7wOVn7rcMIBpSQrUF6p7vgmXc+lMcqNwRn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+R+i3wa; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+R+i3wa"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d73352cf2so357026f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 01:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776415615; x=1777020415; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zBkw927Ld/haKLI1V+/hgl3xfnjSiKFGGzIAYEm2H3E=;
        b=Y+R+i3waxJ6ABuvcyqmn/RE7uZstRcVr35aBNzVqedj5XnFSpMKnkQKMoQ/Qu4Syaf
         c7JOM5QjbyBkqfODJhituyr6s0iBElFk1VHgfLstQ+H4u49neo9sQGJeA0P05P6Dv4jp
         t7fmvX1wwpNuU3iQ3M7LeM36WqX8AiT+ChTS/4ZV1/wGOjp6tkQW6w58gqJTBOMAQSPa
         HrUOA/uNjWpN1/clClWTn5243cj3M9oH/B0fQW/qZ4lZ+3t/4dTOK+9e3XVPJTf3eVHY
         5rEUINdCJSXRclkgTb+Ashlle+Gy14wW72FOkjy6zc7nu9I3/V6Zx9dD1I2WCnvPFlFR
         MX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776415615; x=1777020415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBkw927Ld/haKLI1V+/hgl3xfnjSiKFGGzIAYEm2H3E=;
        b=f4Ucm9hbxjiprCwFSQgVlHKicK616I5wvKvvZ2nCeT5XOis3MWET8bWH0pjLjpXQtg
         mJyoULahqTzKjx1fyEsj86rtvQEx0qD1l2GIVeoeWjSNJ3+RPK+9nAu8j2Z/Ctv94iZx
         B/VWJZgtrp0s21qlxm6J4xZjLJTIzjr4y+/7PF2lSuvrn3KZSnIAZilHYUAeFdqkptAK
         ekOrDFRjgWYl/JMpN4HhnmDhtKmcd3uXRFhHUH3m9Y4Erofp7JMhMC1kGkOAHZuc6AYz
         fkXs0YrNqoWBvOXw4J+/ZkzmE+Iv/Xo8dT9ESQj2JDyidiQMsalNUYlBWJNphcISfktJ
         INuQ==
X-Forwarded-Encrypted: i=1; AFNElJ991a+qzwRPAoe2uioeo5PCNEVtqT1UXnFk3te4ef9h5fKA6qZq0TIxdMfNfDtE0tcg8byjSCx4gM/ob8lw@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9N+Us1wQ34tl7LVSkP14ttO60s9uX+rLaHPIr+BkxwJ2EfiZA
	d4iBW58LIhl3kf2y+j/GvVqsOQOoFAcP2uR5+Nc9p6cBpV3TVaWbuYv8
X-Gm-Gg: AeBDietm9k5sAn7rh+oqcJ0ZAPeCrfIVUBx+uRai2HoJElih39m0CinzYPpNijt7vBn
	w33VjPIAvc051LHGYIFqHGaTvxxhcv2Uf2Fel5i22B9sozV8+5hL6e2W531hUCtBkpcaj7S/WJ/
	gSeKZbrh02+4VpMVqtj4o+wvahBfSpIBaBKYj+PoepoKapoNKo+nwRkU8TeLDNa1cTUbyJvpQfq
	j9MV+//GbJdxpdEXla0cSARxX6HTOdHakdxjRk34GE2ePpEr076KxKPYrsJXyDefMLvekvQ6h9c
	eNlkse0LVWZJ1/1RsWdS67rxrUyanHTtyVD0THvR8K+TMwGrK62Z+ZW5wUpXLkWAa9/XFlOB0aX
	37do7/IwkjaVChTlzTo3bq7xrOA5A3uaCAd8DCYSKA+KOdSOxakfaEEvkqx0Ll3oDtZr8UmjRJD
	x1BqP1l1YzIUNIcltYKmwI8qVN9GlYyg==
X-Received: by 2002:a05:6000:2888:b0:43d:7b23:bc99 with SMTP id ffacd0b85a97d-43fe3dc8152mr2704121f8f.15.1776415614610;
        Fri, 17 Apr 2026 01:46:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4ffa8sm2701731f8f.35.2026.04.17.01.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 01:46:53 -0700 (PDT)
Date: Fri, 17 Apr 2026 11:46:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Huihui Huang <hhhuang@smu.edu.sg>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: ipu7: fix boot_config leak on
 queue_mem failure
Message-ID: <aeHzeuVMpcaPx6_x@stanley.mountain>
References: <20260416074800.2493565-1-hhhuang@smu.edu.sg>
 <20260417073939.2686170-1-hhhuang@smu.edu.sg>
 <aeHo2WOF1Rcp9zwf@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeHo2WOF1Rcp9zwf@stanley.mountain>

On Fri, Apr 17, 2026 at 11:01:29AM +0300, Dan Carpenter wrote:
> I haven't looked at this but I bet there are bugs in the error handling
> since magical cleanup functions are always buggy.

The error handling in ipu7_fw_isys_init() is frustrating to review but
it works fine.

Imagine that someone were writing this error handling methodically, using
a normal unwind ladder.
https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

drivers/staging/media/ipu7/ipu7-fw-isys.c 
    81  int ipu7_fw_isys_init(struct ipu7_isys *isys)
    82  {
    83          struct syscom_queue_config *queue_configs;
    84          struct ipu7_bus_device *adev = isys->adev;
    85          struct device *dev = &adev->auxdev.dev;
    86          struct ipu7_insys_config *isys_config;
    87          struct ipu7_syscom_context *syscom;
    88          dma_addr_t isys_config_dma_addr;
    89          unsigned int i, num_queues;
    90          u32 freq;
    91          u8 major;
    92          int ret;
    93  
    94          /* Allocate and init syscom context. */
    95          syscom = devm_kzalloc(dev, sizeof(struct ipu7_syscom_context),
    96                                GFP_KERNEL);
    97          if (!syscom)
    98                  return -ENOMEM;

This is our first resource.  It's allocated with devm_ so we don't need
to free it.  Nothing to free.

    99  
   100          adev->syscom = syscom;
   101          syscom->num_input_queues = IPU_INSYS_MAX_INPUT_QUEUES;
   102          syscom->num_output_queues = IPU_INSYS_MAX_OUTPUT_QUEUES;
   103          num_queues = syscom->num_input_queues + syscom->num_output_queues;
   104          queue_configs = devm_kzalloc(dev, FW_QUEUE_CONFIG_SIZE(num_queues),
   105                                       GFP_KERNEL);

This is our second resource.  Still devm_.  Still nothing to free.

   106          if (!queue_configs) {
   107                  ipu7_fw_isys_release(isys);

And yet we call ipu7_fw_isys_release().  Fortunately it's a no-op.

   108                  return -ENOMEM;
   109          }
   110          syscom->queue_configs = queue_configs;
   111          queue_configs[IPU_INSYS_OUTPUT_MSG_QUEUE].max_capacity =
   112                  IPU_ISYS_SIZE_RECV_QUEUE;
   113          queue_configs[IPU_INSYS_OUTPUT_MSG_QUEUE].token_size_in_bytes =
   114                  sizeof(struct ipu7_insys_resp);
   115          queue_configs[IPU_INSYS_OUTPUT_LOG_QUEUE].max_capacity =
   116                  IPU_ISYS_SIZE_LOG_QUEUE;
   117          queue_configs[IPU_INSYS_OUTPUT_LOG_QUEUE].token_size_in_bytes =
   118                  sizeof(struct ipu7_insys_resp);
   119          queue_configs[IPU_INSYS_OUTPUT_RESERVED_QUEUE].max_capacity = 0;
   120          queue_configs[IPU_INSYS_OUTPUT_RESERVED_QUEUE].token_size_in_bytes = 0;
   121  
   122          queue_configs[IPU_INSYS_INPUT_DEV_QUEUE].max_capacity =
   123                  IPU_ISYS_MAX_STREAMS;
   124          queue_configs[IPU_INSYS_INPUT_DEV_QUEUE].token_size_in_bytes =
   125                  sizeof(struct ipu7_insys_send_queue_token);
   126  
   127          for (i = IPU_INSYS_INPUT_MSG_QUEUE; i < num_queues; i++) {
   128                  queue_configs[i].max_capacity = IPU_ISYS_SIZE_SEND_QUEUE;
   129                  queue_configs[i].token_size_in_bytes =
   130                          sizeof(struct ipu7_insys_send_queue_token);
   131          }
   132  
   133          /* Allocate ISYS subsys config. */
   134          isys_config = ipu7_dma_alloc(adev, sizeof(struct ipu7_insys_config),
   135                                       &isys_config_dma_addr, GFP_KERNEL, 0);
   136          if (!isys_config) {
   137                  dev_err(dev, "Failed to allocate isys subsys config.\n");
   138                  ipu7_fw_isys_release(isys);

Still nothing to free.  This is still a no-op.

   139                  return -ENOMEM;
   140          }
   141          isys->subsys_config = isys_config;

isys->subsys_config is our first resource that we have to free.

   142          isys->subsys_config_dma_addr = isys_config_dma_addr;
   143          memset(isys_config, 0, sizeof(struct ipu7_insys_config));
   144          isys_config->logger_config.use_source_severity = 0;
   145          isys_config->logger_config.use_channels_enable_bitmask = 1;
   146          isys_config->logger_config.channels_enable_bitmask =
   147                  LOGGER_CONFIG_CHANNEL_ENABLE_SYSCOM_BITMASK;
   148          isys_config->logger_config.hw_printf_buffer_base_addr = 0U;
   149          isys_config->logger_config.hw_printf_buffer_size_bytes = 0U;
   150          isys_config->wdt_config.wdt_timer1_us = 0;
   151          isys_config->wdt_config.wdt_timer2_us = 0;
   152          ret = ipu_buttress_get_isys_freq(adev->isp, &freq);

This doesn't allocate anything, but we would need to free
isys->subsys_config.  Ideally, we would have a goto free_subsys_config;
here.

   153          if (ret) {
   154                  dev_err(dev, "Failed to get ISYS frequency.\n");
   155                  ipu7_fw_isys_release(isys);

But this does free isys->subsys_config.  Good.

   156                  return ret;
   157          }
   158  
   159          ipu7_dma_sync_single(adev, isys_config_dma_addr,
   160                               sizeof(struct ipu7_insys_config));
   161  
   162          major = is_ipu8(adev->isp->hw_ver) ? 2U : 1U;
   163          ret = ipu7_boot_init_boot_config(adev, queue_configs, num_queues,
   164                                           freq, isys_config_dma_addr, major);

This allocates one or both of syscom->queue_mem and adev->boot_config.
Ideally it would clean up partial allocations and we would do the same
goto free_subsys_config; here.

   165          if (ret)
   166                  ipu7_fw_isys_release(isys);

But this does free them along with isys->subsys_config.  Everything
works.

   167  
   168          return ret;
   169  }

regards,
dan carpenter

