Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3510770
	for <linux-staging@lists.linux.dev>; Wed,  2 Jun 2021 19:23:22 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id t3so4237583edc.7
        for <linux-staging@lists.linux.dev>; Wed, 02 Jun 2021 12:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=amAyKy+cBzc+nTFVAZp6p9ey/7b5OWawo68azxvbzJ8=;
        b=SczK1ewZLDBTpzxJkFl4u1ntZlgkpCL7i9gtbj2fpVhU/3LxOvYwuEWs3dYeS71ZqT
         K2Q55fRYpGSb48PJX0fWSn/6xIATyH7MvFaU41hIcV1vJTwf/E1im7K0rZ71v7OZCWug
         x4CfMe3iNwUcKOMtLYR0XbmRnNfgv/ANhrtwt/HBJmaOFhLWB2FprdUFF7/H2skOVufB
         riy473TtPDnV/KzeH0V6CcWrp/uQ9mBoD7v85g6jL8PpAxZBuobOb9UE7yrKV1UMNh33
         ObF5ZEYi9seTBrYx/FW1v28CGt+FmftgC7VPhvHZ8RbR5qYiJOS03RH/qnWm9jtXY5pG
         EY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=amAyKy+cBzc+nTFVAZp6p9ey/7b5OWawo68azxvbzJ8=;
        b=BxAvRCbEMNJhEGs7Ej2ELITYvzwwzeRk3pVyS6ISGK//JBOqe2OXRvwcPZ++Bz4Jyw
         spalpS9Enofc8Wn2QoR8mIv9bnFpIG+GwNPx56a4DbSzDH7EVMcXNPFz+WEbnXpQfFUC
         J9m8T4mDtE/VtANqzJ0fLGTfR+2mGhHygvUz5a+IlqY1L0UPmMST/S1tjLWfaPl4+j87
         kYjH4lYtRuGx56tUdAxexY8dRfYYoPAzuqjqs+txrCgKabonfgJ0v6332Qyg82Ji8TDp
         7RRZC5tqk8lb3/rnRWL91oA+eIbC7EzzMgR8Sc436ira4Kl57fXZ8esL9/7iLb7FmIyG
         SFzQ==
X-Gm-Message-State: AOAM531I7d2lLwzyGCiv0avQKRHf/GETmYhBo5c2U+2dOAnLmM6NjK/Y
	OY3S9yQMLCerDAd2tifhmyI=
X-Google-Smtp-Source: ABdhPJypRHfDm6NtuVDE0ngA1EteaGo37miElQC5HCzJ2FSyef/w4ctpbeUAYcnYJyYCVxyDK/Fskw==
X-Received: by 2002:aa7:d1d1:: with SMTP id g17mr12805439edp.86.1622661800763;
        Wed, 02 Jun 2021 12:23:20 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id q4sm473229edv.24.2021.06.02.12.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 12:23:20 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Zheng Yongjun <zhengyongjun3@huawei.com>
Cc: sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [PATCH v2 -next] media: atomisp: Remove unneeded if-null-free check
Date: Wed, 02 Jun 2021 21:23:18 +0200
Message-ID: <3753626.ARhKoE1mID@linux.local>
In-Reply-To: <20210602014547.4135423-1-zhengyongjun3@huawei.com>
References: <20210602014547.4135423-1-zhengyongjun3@huawei.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

On Wednesday, June 2, 2021 3:45:47 AM CEST Zheng Yongjun wrote:
> Eliminate the following coccicheck warning:
> 
> drivers/staging/media/atomisp/pci/sh_css_firmware.c:367:4-10: WARNING:
> NULL check before some freeing functions is not needed.
> drivers/staging/media/atomisp/pci/sh_css_firmware.c:369:4-10: WARNING:
> NULL check before some freeing functions is not needed.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/staging/media/atomisp/pci/sh_css_firmware.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
This warning has already been fixed on May 27th (with the only exception of 
the removal of the unneeded cast):

[PATCH] staging: media: atomisp: pci: Remove checks before kfree/kvfree
https://lore.kernel.org/lkml/20210527193922.25225-1-fmdefrancesco@gmail.com/

Fabio
>
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> b/drivers/staging/media/atomisp/pci/sh_css_firmware.c index 
f4ce8ace9d50..5301cc014c7e
> 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> @@ -363,10 +363,8 @@ void sh_css_unload_firmware(void)
>  		unsigned int i = 0;
> 
>  		for (i = 0; i < sh_css_num_binaries; i++) {
> -			if (fw_minibuffer[i].name)
> -				kfree((void 
*)fw_minibuffer[i].name);
> -			if (fw_minibuffer[i].buffer)
> -				kvfree(fw_minibuffer[i].buffer);
> +			kfree((void *)fw_minibuffer[i].name);
> +			kvfree(fw_minibuffer[i].buffer);
>  		}
>  		kfree(fw_minibuffer);
>  		fw_minibuffer = NULL;




