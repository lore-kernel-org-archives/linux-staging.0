Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B583F19B
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 14:36:02 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-335624d1e26so189121187b3.4
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 07:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=TZVv6t/Vb50UGFw4xrEvLnKQQHc/AlCgbJyFx+UnJqE=;
        b=cGICaOE/bOr2oM0atOdLA9KTFAOhyW+1lHEZwl2kkxFa3MLPRJQsXq16Dg3NgvnDjt
         lBOA51KpZbhSIMgdg0LN3clVYiyYLj3aTae7ZRYSjv3fvGbmn9pC2RQau3cMxw9jzYna
         bJM3Ttxbhx3MdCRyfdmY68P9t0TTwQeuCdw3mlTbtX5z0lj+XAcXaGWUwMv+13QTIPe2
         e1E5WprAKL2uSFU77p629z21i76Y8KyZPkmM0tN49iwday+3MbUMEeUkISbBH1nv4MVO
         +ElqbU8Dlt6xKAnmw+tACxXFmIefDGsL+LdefANKg1KgnOZL0piAcRpLP6x4ABsgNuhQ
         eHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=TZVv6t/Vb50UGFw4xrEvLnKQQHc/AlCgbJyFx+UnJqE=;
        b=5y0a8I5QeP7cuBcjC3cWSD6lkxXJbafkmlvEOliCVvgUZILlCndeRkAmMGo/r15WHQ
         QgcU2hJwaUwVGlMHxjUWT7DqRb8X4+1+eXaWIrxJpqW4NDTE4xmMt8l0Egq5HHDFNQ6o
         hqVYiK7KzfZSeh+q9gVxeaHIrfu2uLYwaizX6jqnPHVzAyQfJ4jwQ0hD2k3jsUcG5Uq9
         QckDMw9dtApQOMpnx96etg34jJKAYulGYzfjfrBEhw1X+0aY0jESRluLTinbfY6kSw3q
         vineiQqOYYyFHKWa2YsKtD0ZJVfaCnqUPKXoNk+5Wt+FXXAhsro0Hk+/T1PQHZB+cyud
         3zWA==
X-Gm-Message-State: ACgBeo1FennR2PFxfsQMqSh0ReXjUed4h730p+363FKae6dIr1hcZzVG
	7+DgJK8AyD3RydAC+trWe9/rkzGFvHRGPgsuHqA=
X-Google-Smtp-Source: AA6agR5+SUbdeY4HNkDjvLbuHYOCjU4m86Q1e/NPaMcn3cOS8nUx1XqdEddQ0bbLe8WWs0m1racOsm2b4HSgLD/U1kE=
X-Received: by 2002:a81:7c5:0:b0:338:8d4d:41ca with SMTP id
 188-20020a8107c5000000b003388d4d41camr6173755ywh.393.1661006161685; Sat, 20
 Aug 2022 07:36:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202208200447.kdEhBy9a-lkp@intel.com> <cover.1660977535.git.namcaov@gmail.com>
 <63626444-a7ee-a0c4-ec0a-f44a810e25ea@redhat.com>
In-Reply-To: <63626444-a7ee-a0c4-ec0a-f44a810e25ea@redhat.com>
From: Nam Cao <namcaov@gmail.com>
Date: Sat, 20 Aug 2022 16:35:50 +0200
Message-ID: <CA+sZ8B8ouMSMmArTVzbkqeWQx4Zqg2=gPaviTrkOFvBoswv_Jg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] remove useless files
To: Hans de Goede <hdegoede@redhat.com>
Cc: lkp@intel.com, Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org, 
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi

On Sat, Aug 20, 2022 at 2:17 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> Patch 1/4 seems to be missing?

Patch 1/4 is there:
https://lore.kernel.org/linux-staging/46d73e331bae2192a328f6691763f39ea6c18b08.1660977536.git.namcaov@gmail.com/

>
> Also please squash patches 3 and 4:
>
>    staging: rtl8723bs: remove odm_NoiseMonitor.o from Makefile
>    staging: rtl8723bs: remove odm_NoiseMonitor.h and odm_NoiseMonitor.c
>
> together. Ion other words remove both the files and the Makefile
> target in a single patch please.

Sorry but I am not sure what I am supposed to do with kernel test bot.
I agree that it makes sense to squash these 2 commits together. However,
I separated them because I want to have 1 patch addressing the problem reported
by the bot, so that I can put the "Reported-by" line to this patch.

If I squash them, should I still put in the "Reported-by" line, despite the
commit not exactly fixing the reported error. Or should I just leave it out?

>
> Regards,
>
> Hans
>

Thanks for spending time reviewing.

Best regards,

Nam
