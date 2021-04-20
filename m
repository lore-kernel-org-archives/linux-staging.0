Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F5E71
	for <linux-staging@lists.linux.dev>; Tue, 20 Apr 2021 08:39:08 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id r12so57043875ejr.5
        for <linux-staging@lists.linux.dev>; Tue, 20 Apr 2021 01:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZvkZNcTCjJ4DOk5BhwBwPcGUeYy+SoY/Ss5mc7x5ctM=;
        b=A3zK6H9kjDOQjFcZjMihyD8k8Xrz1viO3fo++3aGs9bOeptKRzaiOYYcmVnTynGOXK
         tsric2vvbijynjc+ZkeR2SgMfBqh5jn1p6fWwjk3pg5tFVEjsJlPZXIkaEWSsylSKkbE
         //C63Wq2bifvK+eZIjY3/tX4aoEwrWLasUAB5T00YI9eZ82+8Q7x4nGmYi7d8L4Uuj5x
         W4DyBaWHFDraBKYSTTUy1n+pPRYvyDF9ES2b63kySUiCoRxr0uGm/GQF00W6AkquPtcN
         jYWdT4ABRfhVsQJQ9mmBInIOXEXVWC7Xk2rYKFGa2NDpoG6NJlQ2m6PJLiOCUZ3Ii3vt
         06jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZvkZNcTCjJ4DOk5BhwBwPcGUeYy+SoY/Ss5mc7x5ctM=;
        b=lMLoTye9XoZe5B0JMZiROWZBLGYXKmHocfKUEgPk0vB1wh77xJfl8LBPVHVDieluGi
         jVuVo167+dVH035Pp5UJtkgoEGSyQoQr0M0GVXN9KyGk8g3U3r1ndliYwUmdvfEiVMjm
         J+SLIqUkL4wZu3VcfLe03xrMCMqtN5iMem0VTPgo4tdyg1TQIUP2RwyEx45faeNJ0KOf
         cthtjB/wuv+uD3Vt2QHmdDA0M8EW6ZU/8ab6mSWAMQLh9OSlt0RjupPpRpsVZBxS4BRN
         5M+ieCGD/L6wDYEHcXpK0Fo/TorjXyEZ2EudVlh0hLWOoJcvTHyIp7NJ3052goIRAP80
         2Y4Q==
X-Gm-Message-State: AOAM532fvNNQLjLHjvYdCBK1eKnnPdtBd+yGBkgV31yWV+lWMb00D4ZP
	NJ33IDshSwEvHqiJOWeyTE0=
X-Google-Smtp-Source: ABdhPJymJxj6CDAJUuKFpNkW6UBwUkLMczD4w0xuFeYTIaY1UrrgxFy1iOZKxHOIdEYSpz044fF6zw==
X-Received: by 2002:a17:906:7e53:: with SMTP id z19mr26547876ejr.422.1618907946935;
        Tue, 20 Apr 2021 01:39:06 -0700 (PDT)
Received: from agape.jhs ([5.171.72.235])
        by smtp.gmail.com with ESMTPSA id s11sm15187370edt.27.2021.04.20.01.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 01:39:06 -0700 (PDT)
Date: Tue, 20 Apr 2021 10:39:03 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Deepak R Varma <mh12gx2825@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] staging: media: atomisp: fix CamelCase variable
 naming
Message-ID: <20210420083902.GB1411@agape.jhs>
References: <cover.1618859059.git.drv@mailo.com>
 <17478627f128cdafed389b64ecf389d319295dd4.1618859059.git.drv@mailo.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17478627f128cdafed389b64ecf389d319295dd4.1618859059.git.drv@mailo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi,

On Tue, Apr 20, 2021 at 12:45:57AM +0530, Deepak R Varma wrote:
> Mixed case variable names are discouraged and they result in checkpatch
> script "Avoid CamelCase" warnings. Replace such CamelCase variable names
> by lower case strings according to the coding style guidelines.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  .../media/atomisp/i2c/atomisp-mt9m114.c       | 62 +++++++++----------
>  1 file changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> index 160bb58ce708..e63906a69e30 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> @@ -999,10 +999,10 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
>  	struct mt9m114_device *dev = to_mt9m114_sensor(sd);
>  	int ret = 0;
>  	unsigned int coarse_integration = 0;
> -	unsigned int FLines = 0;
> -	unsigned int FrameLengthLines = 0; /* ExposureTime.FrameLengthLines; */
> -	unsigned int AnalogGain, DigitalGain;
> -	u32 AnalogGainToWrite = 0;
> +	unsigned int f_lines = 0;
> +	unsigned int frame_len_lines = 0; /* ExposureTime.FrameLengthLines; */
> +	unsigned int analog_gain, digital_gain;
> +	u32 analog_gain_to_write = 0;
> 

this patch is made of multiple logical changes, i.e. more than one
variable at a time are renamed. Maybe this should be split in
one patch per variable name.

thank you,

fabio
