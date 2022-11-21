Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8761D3212
	for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 12:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669034466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LJyEJRBtiKyBUJ6EVQmAJebK9vowkgYAOTkDlg7N6hs=;
	b=OXYZM54IV0ExkQhwdo0H7FuXAWj5zm09SclhVhPy+iav57qxQ2XBqspv8pGpN8HOOZK59R
	g49l7vIfinz/bbN4MVVQgOKOPqchj4Kx0cYix3UnX3V53QjkItxRWPTpFtQo4AfX9MOXdM
	ijtghEQSOAh2o9rWcbFwknU0NrIJPzY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-36-MV36EIdgP0CQnnEfdzBhng-1; Mon, 21 Nov 2022 07:41:03 -0500
X-MC-Unique: MV36EIdgP0CQnnEfdzBhng-1
Received: by mail-ed1-f69.google.com with SMTP id b13-20020a056402350d00b00464175c3f1eso6706566edd.11
        for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 04:41:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LJyEJRBtiKyBUJ6EVQmAJebK9vowkgYAOTkDlg7N6hs=;
        b=q+4mYbDFhF34LS20GEuxej/4xt5hmx5fB0qO2kv69nn91sOcRWYoOahwBoG95luwKC
         P2rwHWTbJ7bpTZ7ytg6HWYdxxc7Z6J8PWLePj8z+eEoyoiTh9Zc94nSSNNvdCLiI/Xqn
         hclY/u23wwRVO7xVLnf7kBI+quyhdqQGwyhhAe8SfPYFy4ez9i+cLk+6JXwgcS56Ijow
         MhtCaxZw9/S11Dq3PY8grHzWc/BeWgY5tucoZdLmstvyRZ6hpMYaYzImfixYpjhgSbmX
         1vY0rPR885uHqlBHK+STjyN84u1QY9TP3A+iU39FROEdtt4F7eLKvpttKCIM3DpWvlNN
         7wOA==
X-Gm-Message-State: ANoB5pmRZ7iuIEPnTQQqxeFn5K5MYkiyhRShgRov6d6HMTwKXQ43UZgs
	ZVK6F30WuCM+k/zamx1ONWkpyWEg7LZa3eIo/7JSv4C4RhWIDZouDYozYYwRWPYasasx40kKjFV
	aZpGzBmW7hqeExZaZwWirYy9ZSw==
X-Received: by 2002:a17:906:298c:b0:7ad:eb7f:d082 with SMTP id x12-20020a170906298c00b007adeb7fd082mr14987123eje.356.1669034461775;
        Mon, 21 Nov 2022 04:41:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7wu6OOcMjB7Ldi3sOEB9wuX7BIUh3X1c4Ft7P7fyVwpl5jXt5Q1rRtezB8KMm56sRQ8vBhJQ==
X-Received: by 2002:a17:906:298c:b0:7ad:eb7f:d082 with SMTP id x12-20020a170906298c00b007adeb7fd082mr14987105eje.356.1669034461609;
        Mon, 21 Nov 2022 04:41:01 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id i7-20020a17090671c700b007aec1b39478sm4902063ejk.188.2022.11.21.04.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:41:00 -0800 (PST)
Message-ID: <28600040-cb30-b9f2-4863-c6f48c682e67@redhat.com>
Date: Mon, 21 Nov 2022 13:40:59 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 00/20] media: atomisp: Misc. cleanups / fixes
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20221120224101.746199-1-hdegoede@redhat.com>
 <Y3tC7Vme5dpGrO+A@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3tC7Vme5dpGrO+A@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/21/22 10:20, Andy Shevchenko wrote:
> On Sun, Nov 20, 2022 at 11:40:41PM +0100, Hans de Goede wrote:
>> Hi All,
>>
>> Here is another round of atomisp cleanups / fixes + preparation work
>> for getting rid of the ugly PCI power-management errors in dmesg
>> when doing (runtime)suspend/resume.
> 
> As usual, for non-commented (by me) patches:
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Thank you for all the reviews!

The patches with your suggested fixes + Reviewed-by have all
been updated in my media-atomisp branch.

Regards,

Hans

>> Hans de Goede (20):
>>   media: atomisp: Silence: 'atomisp_q_one_s3a_buffer: drop one s3a stat
>>     which has exp_id xx' log messages
>>   media: atomisp: Remove accelerator pipe creation code
>>   media: atomisp: Remove unused QOS defines / structure member
>>   media: atomisp: Flush queue on atomisp_css_start() error
>>   media: atomisp: Log an error on failing to alloc private-mem
>>   media: atomisp: Fix deadlock when the /dev/video# node is closed while
>>     still streaming
>>   media: atomisp: Remove 2 unused accelerator mode related functions
>>   media: atomisp: Remove atomisp_css_yuvpp_configure_viewfinder()
>>     function
>>   media: atomisp: Remove unused ia_css_frame_*() functions
>>   media: atomisp: Drop userptr support from hmm
>>   media: atomisp: Remove double atomisp_mrfld_power_down()/_up() calls
>>     from atomisp_reset()
>>   media: atomisp: Remove atomisp_mrfld_power_down()/_up()
>>   media: atomisp: Remove clearing of config from atomisp_css_uninit()
>>   media: atomisp: Remove atomisp_css_suspend()/_resume()
>>   media: atomisp: Remove sw_contex.power_state checks
>>   media: atomisp: Remove duplication between runtime-pm and normal-pm
>>     code
>>   media: atomisp: Move calling of css_[un]init() to power_on()/_off()
>>   media: atomisp: Remove atomisp_ospm_dphy_down() call from probe error
>>     path
>>   media: atomisp: Remove atomisp_ospm_dphy_up()/_down() functions
>>   media: atomisp_ov2680: Fix 1280x720 -> 1296x736 resolution
>>
>>  drivers/staging/media/atomisp/i2c/ov2680.h    |  46 +-
>>  .../staging/media/atomisp/include/hmm/hmm.h   |   1 -
>>  .../media/atomisp/include/hmm/hmm_bo.h        |   2 -
>>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  76 +--
>>  .../staging/media/atomisp/pci/atomisp_cmd.h   |   8 +-
>>  .../media/atomisp/pci/atomisp_compat.h        |  11 -
>>  .../media/atomisp/pci/atomisp_compat_css20.c  |  88 +--
>>  .../staging/media/atomisp/pci/atomisp_fops.c  |  34 +-
>>  .../media/atomisp/pci/atomisp_internal.h      |   1 -
>>  .../staging/media/atomisp/pci/atomisp_ioctl.c |  80 ++-
>>  .../staging/media/atomisp/pci/atomisp_v4l2.c  | 104 +--
>>  .../pipe/interface/ia_css_pipe_stagedesc.h    |   5 -
>>  .../pci/camera/pipe/src/pipe_stagedesc.c      |  21 -
>>  drivers/staging/media/atomisp/pci/hmm/hmm.c   |  19 +-
>>  .../staging/media/atomisp/pci/hmm/hmm_bo.c    |  54 +-
>>  .../media/atomisp/pci/ia_css_frame_public.h   |  74 ---
>>  .../staging/media/atomisp/pci/ia_css_pipe.h   |   3 +-
>>  .../media/atomisp/pci/ia_css_pipe_public.h    |  69 --
>>  .../pci/runtime/debug/src/ia_css_debug.c      |   7 -
>>  .../atomisp/pci/runtime/frame/src/frame.c     | 121 ----
>>  .../pipeline/interface/ia_css_pipeline.h      |   2 -
>>  .../pci/runtime/pipeline/src/pipeline.c       |   8 -
>>  drivers/staging/media/atomisp/pci/sh_css.c    | 608 +-----------------
>>  .../media/atomisp/pci/sh_css_internal.h       |  13 -
>>  .../staging/media/atomisp/pci/sh_css_legacy.h |   1 -
>>  drivers/staging/media/atomisp/pci/sh_css_sp.c |   2 +-
>>  26 files changed, 121 insertions(+), 1337 deletions(-)
>>
>> -- 
>> 2.38.1
>>
> 

