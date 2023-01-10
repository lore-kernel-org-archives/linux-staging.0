Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4D517C7
	for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 11:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673348560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lTWV3iMaD81pwfEJZyicf42Tlx7DhOJiIaHvcmnaLWs=;
	b=YKvAp6dAtp+wGprWsgX3XDeW9NXOu++ZIYXsF7qSz04CfjmUQ08i13Ram7OAIsIyRHA7DD
	ZW0EVqd81cbdf0bIYhUzUyA1A2ClZeU6ho6Rwc4a3vk0ZiBvEmi2nPiyB986HeVJ9xmbFB
	dBePuteX8dqSN5cT6ErkWYQ9hzJDhqc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-20-naZ_G-AEMCK76kUiv7rJeQ-1; Tue, 10 Jan 2023 06:02:39 -0500
X-MC-Unique: naZ_G-AEMCK76kUiv7rJeQ-1
Received: by mail-ed1-f71.google.com with SMTP id z20-20020a05640240d400b0047028edd264so7433461edb.20
        for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 03:02:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lTWV3iMaD81pwfEJZyicf42Tlx7DhOJiIaHvcmnaLWs=;
        b=hHSXwDICm7ujmSxd07AMjhUTtKK4djizpBVfzBeE5NnBL/3BqUB3xUXHW/tMyHDAVa
         J8XCTy3Gp2kO7w+FKYTLO6j2CiHvm2+RpfzU7lt20iLo5AZ4/AZB8p8CPA8FWq4gNEdp
         M7hFTGq5VC0inx6KRBSXnrjOS3frY4bBONjObESphv3jwVGTzgrACEnjRxnl2j49Qolx
         CYR9hT15LAH6ja55+FCCUtxmu9G4DbQvZ71YJPPJ38gBgRcLwMkkhMXaAO+5HPfHOPa2
         +yLwA0U9+RyZOQGoAkMnDMNjvaaiFps/ePBFU+m2Wlkxcm546TExyMRwDb6TECgXa9bg
         bfFg==
X-Gm-Message-State: AFqh2krnHU5b09Yk2nTe+2COIsvaabuHEwdprUd0CI2iA3mUMOLQfOq9
	aYKl1hI9BUmQq9d1EBqmbVXBnP9JEH5u/aSaTvRNlfEW2cWSzkPrnDPM24nV8r/Am9hCOPV9AKA
	5vNgNJgItOjDM+cMdSg3zMrc5+w==
X-Received: by 2002:a17:906:1410:b0:7bb:7d69:da90 with SMTP id p16-20020a170906141000b007bb7d69da90mr54055971ejc.31.1673348558233;
        Tue, 10 Jan 2023 03:02:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvzRd5VbzqlkNxSrrkP817SlZx0vErAVSGXRAmaSrLX9FRNypwoAhZuApyAsPCWEz5B2tK2Cw==
X-Received: by 2002:a17:906:1410:b0:7bb:7d69:da90 with SMTP id p16-20020a170906141000b007bb7d69da90mr54055959ejc.31.1673348558066;
        Tue, 10 Jan 2023 03:02:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e15-20020a056402104f00b004918b6b5e30sm4712397edu.15.2023.01.10.03.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 03:02:37 -0800 (PST)
Message-ID: <39c80c05-3fac-6513-c941-7ae91959c88e@redhat.com>
Date: Tue, 10 Jan 2023 12:02:36 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] media: atomisp: fix videobuf2 Kconfig depenendency
To: Arnd Bergmann <arnd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230104082212.3770415-1-arnd@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230104082212.3770415-1-arnd@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/4/23 09:21, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The recent conversion missed the Kconfig bit, so it can now
> end up in a link error on randconfig builds:
> 
> ld.lld: error: undefined symbol: vb2_vmalloc_memops
>>>> referenced by atomisp_fops.c
>>>>               drivers/staging/media/atomisp/pci/atomisp_fops.o:(atomisp_open) in archive vmlinux.a
> 
> Fixes: cb48ae89be3b ("media: atomisp: Convert to videobuf2")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Mauro, can you pick this up and send it to Linus as a 6.1 fix?

Regards,

Hans





> ---
>  drivers/staging/media/atomisp/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
> index 2c8d7fdcc5f7..c9bff98e5309 100644
> --- a/drivers/staging/media/atomisp/Kconfig
> +++ b/drivers/staging/media/atomisp/Kconfig
> @@ -14,7 +14,7 @@ config VIDEO_ATOMISP
>  	depends on VIDEO_DEV && INTEL_ATOMISP
>  	depends on PMIC_OPREGION
>  	select IOSF_MBI
> -	select VIDEOBUF_VMALLOC
> +	select VIDEOBUF2_VMALLOC
>  	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  Say Y here if your platform supports Intel Atom SoC

