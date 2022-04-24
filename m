Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770957C
	for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 19:17:26 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id m15-20020a7bca4f000000b0038fdc1394b1so11259380wml.2
        for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 12:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=TAcvEbQ4Hi/Z0gz3UjE0i+qjlqG34Q9luvJnqApGvbA=;
        b=D/ADx9khHILYQpQIWtOdHIN6aldQ/ty9pW+eLDL0qrnHBF9ARTTrdJqiJTxn2BABWB
         gQWV0cOA5moixUEIyB4iOCp418tlodOVDVtVipfO9d+sijOSxoLDX2EzOpE/zrPSjL7p
         KbrLLdaOS5936HyM/1sVrEU39q/MhbI6w7w1wpXY4DOvcCvmv/wcDsiEiJSN38oEDWBt
         8hXn1JvxpMutRFc+EQe/w5BYU0EZfDwgSWfrrGt9fwteSoSYFauqVZNEAIRfAf6jUjcR
         OKuK4BrKMPzJQPfwNfqgrcDFGHNEMDRhAQD4uL36r/SqQV19ggfyGM7JYF7aL0TWNcXj
         /xqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TAcvEbQ4Hi/Z0gz3UjE0i+qjlqG34Q9luvJnqApGvbA=;
        b=JsAKiVp2UxS1IQ+O0UPbEsJbVvhliocGq8W80z4UCid2LndCP1nOZVw+Zv3lNvv401
         NzeR0R27/srrLEFeORuUU5C5lRk9dmb6fVVet+xDkd1UF2bzVKlmJXgvDZNd3giorx90
         iITVrSoVuRlHFjLdNOmT7HiXhKRDCPbXob7ZgaLSKnpQw+iX1VjddAQjUW2Io9Cl4TCt
         4Fk5nRAyyBnGNJ54tP6xPwnTrbDSCq91aRQJW+6DCVabLhSbskGUinsgcgyNpltSOo8C
         Q5a6/txaOVmsokYm6+s9tFWbUgXMxDVzvdWFjXjNNlY5N8v7k3uE8fPITYbOcyTTL1Ns
         VPDw==
X-Gm-Message-State: AOAM530ZTVW4sst2MOQjJWwkjgEvs8jlezoHVkQS3q/2YAE3PsC3oEOD
	LvyO76EtJiiY0O8u2Ics9AqEIg==
X-Google-Smtp-Source: ABdhPJwQPYtw9aEjA/OKMsrIT2eP69V9xi4HGkzFtFs5y52dVv9etB+hmue427mZ/Ag2IPb/B3593w==
X-Received: by 2002:a05:600c:a0b:b0:389:dd65:66f1 with SMTP id z11-20020a05600c0a0b00b00389dd6566f1mr13267425wmp.95.1650827844718;
        Sun, 24 Apr 2022 12:17:24 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id r6-20020a1c4406000000b0039229d3c4eesm6954825wma.12.2022.04.24.12.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 12:17:24 -0700 (PDT)
Date: Sun, 24 Apr 2022 21:17:22 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Ian Cowan <ian@linux.cowan.aero>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	dan.carpenter@oracle.com, mjpeg-users@lists.sourceforge.net,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/4] staging: media: zoran: add zrdev_dbg() macros
Message-ID: <YmWiQsrPj0uIpZ7w@Red>
References: <20220423051745.292683-1-ian@linux.cowan.aero>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220423051745.292683-1-ian@linux.cowan.aero>

Le Sat, Apr 23, 2022 at 01:17:45AM -0400, Ian Cowan a écrit :
> This adds the zrdev_dbg() (pointing to dev_dbg()), zrdev_err() (pointing
> to dev_err()), and zrdev_info() (pointing to dev_info()) macros to the
> zoran drivers. These are the preferred method for debugging and this
> will allow to extract the device from the zoran struct to make the call.
> 
> Signed-off-by: Ian Cowan <ian@linux.cowan.aero>
> ---
>  drivers/staging/media/zoran/zoran.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
> index 654c95fa5aba..42b86356c022 100644
> --- a/drivers/staging/media/zoran/zoran.h
> +++ b/drivers/staging/media/zoran/zoran.h
> @@ -19,6 +19,7 @@
>  #define _BUZ_H_
>  
>  #include <linux/debugfs.h>
> +#include <linux/dev_printk.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/videobuf2-core.h>
> @@ -301,6 +302,18 @@ static inline struct zoran *to_zoran(struct v4l2_device *v4l2_dev)
>  
>  #endif
>  
> +/**
> + * Debugging macros
> + */
> +#define zrdev_dbg(zr, format, args...) \
> +	dev_dbg(&zr->video_dev->dev, format, ##args) \
> +
> +#define zrdev_err(zr, format, args...) \
> +	dev_err(&zr->video_dev->dev, format, ##args) \
> +
> +#define zrdev_info(zr, format, args...) \
> +	dev_info(&zr->video_dev->dev, format, ##args) \
> +
>  int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq, int dir);
>  void zoran_queue_exit(struct zoran *zr);
>  int zr_set_buf(struct zoran *zr);
> -- 
> 2.35.1
> 

Hello

Thanks for your patchs, removing dprintk is a good idea.
Please use pci_xxx() instead of dev_xxx() to be consistent with the rest of the driver.
The comment title is misleading, zrdev_err is not about debugging. What about Logging macros ?

Regards
