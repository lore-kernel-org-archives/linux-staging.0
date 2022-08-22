Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309944A02
	for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 18:06:01 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id r16so14202464wrm.6
        for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 11:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Csmpukwgo5IDJeAZNtEo51qxCB580Q6PQAbe+39XAEs=;
        b=flMnpNlyMf98yXaTDUHLxaouu8dZiDrDL/ODHRRNw7MGZaD5AlbSioph709BtOkrFw
         IZBoL15cn+9jUk/wMVedfuN1Rw0dYL83uNaRb24qCeOPdMTt9dHl1NdRox4nNATn3+m7
         mvrJE2rek2CBrrBz3CIewfmNRX6gnifg/wv69uOq6QjFhG9ti/uRG4h4FPzd2I6+Baj8
         BPcbN2TwmTC6JNZfi9F3+oFDr+RZDBtKY3H30SUzIHPz5WxO1eak1WcocbAYq6B2pCHQ
         5NMkHTTcV0shr+GkeNH6my6Bk4JbRPIsvijstncvdvs4PrecIbQyKmm+7OOi3E2SKmof
         tLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Csmpukwgo5IDJeAZNtEo51qxCB580Q6PQAbe+39XAEs=;
        b=esxkZTk7y/VueCRJWGDQF7FmlVe62ngYY3oDjCUJG3vOin0SOXOAYXhh9tiTGGrHPC
         /MuT6bqb0uzGHoUUSfiSJHNMyL+bhP+RP2srsANHmKT18xXiXaPV7RXQUTMFJAcFT14w
         HRZKRBF92f5gB33olq/sWMt+Azbu5BXxGtHspWjXjY6U9nOVRT73l20beIsMDjoEb55B
         Rfwvi5I0N4nLVQwSGqVczxlHQlKByS3zRKlJS1THjFg8Yf+de+fxONIhWMIzj9X3ooER
         gVz7HKj5+o90VqFZ1hu/uU6KTZYLQptogasWeYkAVqFK+zUmOsXu58BVBvETR8l9lbMw
         zPyg==
X-Gm-Message-State: ACgBeo13umTwh/bxvP4o8X4FBcv5Z8qquBLMfsFeeo3MMMdJkpe8esCX
	ORq0NfN485GJ0Ust6yu1XDo=
X-Google-Smtp-Source: AA6agR6ZvTHnMaSxUzmtXd4F93OXpQZlDYmNRtz2QDv3B2maMzfD5b1HRYZ40Q/fTsDqOPFurm3I/g==
X-Received: by 2002:a5d:634f:0:b0:225:2ab4:d539 with SMTP id b15-20020a5d634f000000b002252ab4d539mr11042085wrw.149.1661191559446;
        Mon, 22 Aug 2022 11:05:59 -0700 (PDT)
Received: from [192.168.1.100] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id w3-20020adfde83000000b002253af82fa7sm11469438wrl.9.2022.08.22.11.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 11:05:59 -0700 (PDT)
Message-ID: <434d644b-2688-c3e8-814e-b9b2f2b86f85@gmail.com>
Date: Mon, 22 Aug 2022 20:05:57 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Split multiple assignments to individual lines.
Content-Language: en-US
To: Christopher Carbone <chris.m.carbone@gmail.com>,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <YwOjt+ZrQkKFGRH9@valhalla>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <YwOjt+ZrQkKFGRH9@valhalla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/22 17:41, Christopher Carbone wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> CHECK: multiple assignments should be avoided
> 
> Signed-off-by: Christopher Carbone <chris.m.carbone@gmail.com>
> ---
>   drivers/staging/sm750fb/sm750.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index dbd1159a2ef0..a0f8ae359248 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -386,7 +386,8 @@ static int lynxfb_ops_set_par(struct fb_info *info)
>   
>   	ret = lynxfb_set_color_offsets(info);
>   
> -	var->height = var->width = -1;
> +	var->width = -1;
> +	var->height = var->width;
>   	var->accel_flags = 0;/*FB_ACCELF_TEXT;*/
>   
>   	if (ret) {
> @@ -498,7 +499,8 @@ static int lynxfb_ops_check_var(struct fb_var_screeninfo *var,
>   		return ret;
>   	}
>   
> -	var->height = var->width = -1;
> +	var->width = -1;
> +	var->height = var->width;
>   	var->accel_flags = 0;/* FB_ACCELF_TEXT; */
>   
>   	/* check if current fb's video memory big enough to hold the onscreen*/
> @@ -723,7 +725,8 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
>   		0x800f0 + (int)crtc->channel * 0x140;
>   
>   	pr_info("crtc->cursor.mmio = %p\n", crtc->cursor.mmio);
> -	crtc->cursor.max_h = crtc->cursor.max_w = 64;
> +	crtc->cursor.max_w = 64;
> +	crtc->cursor.max_h = crtc->cursor.max_w;
>   	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.max_w * 2 / 8;
>   	crtc->cursor.vstart = sm750_dev->pvMem + crtc->cursor.offset;
>   
> @@ -1027,7 +1030,8 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
>   	if (!sm750_dev)
>   		return err;
>   
> -	sm750_dev->fbinfo[0] = sm750_dev->fbinfo[1] = NULL;
> +	sm750_dev->fbinfo[1] = NULL;
> +	sm750_dev->fbinfo[0] = sm750_dev->fbinfo[1];
>   	sm750_dev->devid = pdev->device;
>   	sm750_dev->revid = pdev->revision;
>   	sm750_dev->pdev = pdev;


Hi,

the subsystem and the device is missing in the Subject.

I propose you look into https://kernelnewbies.org/FirstKernelPatch to 
read about the Subject.

I personally prefer more this:

 > +	sm750_dev->fbinfo[1] = NULL;
 > +	sm750_dev->fbinfo[0] = NULL;

That gives a better overview.

Thanks for your support.

Bye Philipp

