Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F6A2AD17
	for <linux-staging@lists.linux.dev>; Tue,  2 Jul 2024 10:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719916468; cv=none; b=L8Zs1gEfqPHNQGhwGyojg26mRbEyKBYeB5ErK/kLJPClUHteKWeXao91GD/yxq+7PVLmfTTCQZuimuJ0c2XVMKi8XBmq2x+ofGV160zzX8FILqxY8ttG5dPIptPSDhySX7H67qN6PNCnRNp9OSax7CxZz0VF4MXWKyO3t96qqbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719916468; c=relaxed/simple;
	bh=x2/Oyy5DPkl5NQW/LRGwjK6gfV4hKaQ5VLGj0MD35GQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VgR/wzpvDzBnYlj7dce3OLzajiTnwKvGLyWFrjBW+f74OZ++ni4F4iL1cRJM1bI2jsElzvgQvCy4JEJjPiPi+hyj+yo7pV9yXE3VzEyIUi//4JwXHOw0A0SolGerrMZEeHG9mYwDmBq7u0NT0ihdtCysEK0lkgXuRTjzhDnqWzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MOqoSV/X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MOqoSV/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719916465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rNsm3cCjXERmJcGp+XO8HnPAr7s9nThDQztD3pwHsbE=;
	b=MOqoSV/X6/lizf2ApRPClIG//FmqhWq+1/LBMZdmCthCKaG5onSn8L7HOb38rK9fMevbmS
	nZBVvIJaBQi0cPvn32Qs0P/6Vr6lcyr0hQjE/sq/K/zPsxyT/KN72yObcTdAyUAwXQdaLY
	HMM7uHaV/5svy+XUqyFB5oUirIk8Djc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-2263h2M0NYSWxc5IdWUBRQ-1; Tue, 02 Jul 2024 06:34:23 -0400
X-MC-Unique: 2263h2M0NYSWxc5IdWUBRQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a6f571c3eefso232030766b.2
        for <linux-staging@lists.linux.dev>; Tue, 02 Jul 2024 03:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719916462; x=1720521262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rNsm3cCjXERmJcGp+XO8HnPAr7s9nThDQztD3pwHsbE=;
        b=O6UUAkQZhclxOyfhgO0T6TvkVZiZkbuDFM/OleegyHv587EspZdr67AqcyVobUQmS2
         pFogXPaGmKb+fhhf3A5CRvI47t/VF3tayzOt2Rzx7BNq+zha8NwV7zwQ6Ru9+EKlKc1S
         Glkc841DR8pA2T6xTZdAG7K3DpCOhuVYCh+3K2K1jyWFHuFhycMrICDygDycmLZyac7J
         SkmoyT7ALO9yNOB9Qbug2H24w7EE6ogAxJM3VnTaKkKv+uU3qMcISYI7sL0TUph1087D
         bQRQjKFE2Rxj3lPTlkyn9slU2FGNpp4fCiR6N1C19uH/QkpQNe9kz88WY3YtKXRlU28p
         b9Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVK2eKYUgHhvtvM7ruHtdQrZ6TQMcUn8HjQapTqbR37A6BYWXjk9BcyoyxWH0mUD8xGowLD3UG65e9K/80c7qRlDN4uIG7SQNbrmILBGQ==
X-Gm-Message-State: AOJu0YxpwciXzLz745qFIH9IBVlivAKzqcRAPOSrFRS3PF4OSCE4MZsd
	rpXNRA53rbDWLoM9dtrZ0XS2NGFRKBpsdfK0CnXCXRpLHa/Rv6KUQCoyHASetUSgKArxHExbpeT
	rdWzZ3yfgsSCZDH6oJIZz5A0Cfe94st5I/5aIXESCh0U2jLBvUfWJVbYzcI1VKeI=
X-Received: by 2002:a17:906:594:b0:a72:40b4:c845 with SMTP id a640c23a62f3a-a75144badc1mr476046866b.51.1719916462666;
        Tue, 02 Jul 2024 03:34:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE02tMzwHkCasG8ml1t2odshm6nGKnezRzG5G+/ON+FwptvvDVPwLlQ1cIbeXnlAmgbhRORow==
X-Received: by 2002:a17:906:594:b0:a72:40b4:c845 with SMTP id a640c23a62f3a-a75144badc1mr476043966b.51.1719916461239;
        Tue, 02 Jul 2024 03:34:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab08cf7csm408654466b.155.2024.07.02.03.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 03:34:20 -0700 (PDT)
Message-ID: <bd635e11-53b5-4fde-9802-ee2481bfb777@redhat.com>
Date: Tue, 2 Jul 2024 12:34:20 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] media: atomisp: A couple of cleanups
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240424184421.1737776-1-andriy.shevchenko@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240424184421.1737776-1-andriy.shevchenko@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/24/24 8:43 PM, Andy Shevchenko wrote:
> 1/ Drop a lot of unused math related macros.
> 2/ Replace homegrown static_assert()

Thank you for your patches.

I have merged these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And these patches will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans



> 
> Andy Shevchenko (2):
>   media: atomisp: Clean up unused macros from math_support.h
>   media: atomisp: Replace COMPILATION_ERROR_IF() by static_assert()
> 
>  .../circbuf/interface/ia_css_circbuf_comm.h   |   6 +
>  .../pci/camera/util/interface/ia_css_util.h   |  11 --
>  .../media/atomisp/pci/camera/util/src/util.c  |  25 ++--
>  .../pci/hive_isp_css_include/assert_support.h |  23 ----
>  .../pci/hive_isp_css_include/math_support.h   | 110 +-----------------
>  .../pci/hive_isp_css_include/type_support.h   |   5 +-
>  drivers/staging/media/atomisp/pci/ia_css_3a.h |   5 +
>  .../staging/media/atomisp/pci/ia_css_dvs.h    |   4 +
>  .../media/atomisp/pci/ia_css_metadata.h       |   4 +
>  .../staging/media/atomisp/pci/ia_css_types.h  |   2 +
>  .../kernels/xnr/xnr_3.0/ia_css_xnr3.host.c    |   6 +-
>  .../atomisp/pci/runtime/binary/src/binary.c   |   2 -
>  .../spctrl/interface/ia_css_spctrl_comm.h     |   4 +
>  drivers/staging/media/atomisp/pci/sh_css.c    |  38 ------
>  .../staging/media/atomisp/pci/sh_css_frac.h   |   4 +-
>  .../media/atomisp/pci/sh_css_internal.h       |  15 ++-
>  16 files changed, 60 insertions(+), 204 deletions(-)
> 

