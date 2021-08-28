Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C471072
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 10:23:07 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id k5so20060089lfu.4
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 03:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OxLig78dAqoxosBKMwaBsTeV8nh1tFLfxAZZJhisw/8=;
        b=MR7jqwl/eTSmUxA+WWkgCBwW4sHAq8sPSvOyoIkhN4y1+jpH9855fAyGlnERiOTuiK
         KgmNtHFYdCy0KQwPr868pDh1h2ebBF7UWGxULpMLMEG894fgXehhhK+iMvtUrk8gysmQ
         d7M0r0YW2a5bMTGfccYiMQ5oSrmPn91a1nBMN3ToPwIsssgazas3vvZSl3l5ibf8YuUF
         7SPxRC6z6YIQ+LzXWfaJZnXWJyAcKkJ9o63xidxiqNPclMtyJT4291P0I4B/TfjHCBXx
         pUoz6DJKrCXKfXz6uOj+8m4wGZodvbUrP+Pu5B97nxDZYqM6/TccTb9jjx6jm9Fq9+KW
         6ApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OxLig78dAqoxosBKMwaBsTeV8nh1tFLfxAZZJhisw/8=;
        b=PYQHwk9ya1Ch3GH/nvz35mAm29u5+sA7oZgX4vTrkr3DfQoaweGRGBqNR6yaHQHctQ
         /2p5rYAP6CX6UrjPAam37BnxfUxWreqPvA95o//bPApoDHA2bsGb8smpA+f9G+AWsxMO
         ytSyu0+n8cwWuaDzOwkax+DYPvJSko4C+y/WMMgGu1vhRIVmoqZ4PKv60tEld2oNsqET
         WAtXiwAUpzqATo/DNUJZoQpc2aFdSsKf4/6WUnf6KrjPTXVakBZ+9UhnZhubU9lfIAxY
         4lBMHG2URnafxZGHP6XaKibasm/PVhlAhgyuFXbIac5BDjSORkz7VLuvrf6A49Wvff+r
         8Gxg==
X-Gm-Message-State: AOAM532E+RMNGVFWkSgnaY/tqeN7Pv8cPrikEFmTHn+vY3hzDkNqmugC
	TySOAxbPvgHa0xn4PI87KRg=
X-Google-Smtp-Source: ABdhPJzSCg2wRltK9ix/7rIGPCUhyGhUD4Zh9MP6AmopLjBRkT0CpFE9CiZ2kNWj1GO/lYKiKQTyFA==
X-Received: by 2002:a05:6512:238e:: with SMTP id c14mr10398615lfv.324.1630146185896;
        Sat, 28 Aug 2021 03:23:05 -0700 (PDT)
Received: from kari-VirtualBox (87-95-21-3.bb.dnainternet.fi. [87.95.21.3])
        by smtp.gmail.com with ESMTPSA id y10sm918666lfh.40.2021.08.28.03.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 03:23:05 -0700 (PDT)
Date: Sat, 28 Aug 2021 13:23:02 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: gregkh@linuxfoundation.org, hello@bryanbrattlof.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: fix docs typos and references to
 previous struct names
Message-ID: <20210828102302.d7nhe2bkw6h5quqa@kari-VirtualBox>
References: <20210828101242.GA6841@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828101242.GA6841@localhost.localdomain>


Re: [PATCH] staging: pi433: fix ...

This is version 2. Subject needs to be [PATCH v2]. If you generate using
git format-patch add "-v 2" in there.

On Sat, Aug 28, 2021 at 10:12:42PM +1200, Paulo Miguel Almeida wrote:
> In the comments there where some grammar mistakes and references to
> struct names that have gotten renamed over time but not updated
> in the comments.
> 
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> ---

You should have log here what did you change from previous version as
this is v2. You can also add who ask this change That should be like
this:

---
Put your version log here.
---

>  drivers/staging/pi433/pi433_if.h | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/pi433/pi433_if.h b/drivers/staging/pi433/pi433_if.h
> index d5c1521192c1..855f0bebdc1c 100644
> --- a/drivers/staging/pi433/pi433_if.h
> +++ b/drivers/staging/pi433/pi433_if.h
> @@ -5,14 +5,13 @@
>   * userspace interface for pi433 radio module
>   *
>   * Pi433 is a 433MHz radio module for the Raspberry Pi.
> - * It is based on the HopeRf Module RFM69CW. Therefore inside of this
> - * driver, you'll find an abstraction of the rf69 chip.
> + * It is based on the HopeRf Module RFM69CW. Therefore, inside of this
> + * driver you'll find an abstraction of the rf69 chip.
>   *
> - * If needed, this driver could be extended, to also support other
> - * devices, basing on HopeRfs rf69.
> + * If needed this driver could also be extended to support other
> + * devices based on HopeRf rf69 as well as HopeRf modules with a similar
> + * interface such as RFM69HCW, RFM12, RFM95 and so on.
>   *
> - * The driver can also be extended, to support other modules of
> - * HopeRf with a similar interace - e. g. RFM69HCW, RFM12, RFM95, ...
>   * Copyright (C) 2016 Wolf-Entwicklungen
>   *	Marcus Wolf <linux@wolf-entwicklungen.de>
>   */
> @@ -33,8 +32,8 @@ enum option_on_off {
>  /* IOCTL structs and commands */
>  
>  /**
> - * struct pi433_tx_config
> - * describes the configuration of the radio module for sending
> + * struct pi433_tx_cfg
> + * describes the configuration of the radio module for sending data
>   * @frequency:
>   * @bit_rate:
>   * @modulation:
> @@ -46,7 +45,7 @@ enum option_on_off {
>   * @repetitions:
>   *
>   * ATTENTION:
> - * If the contents of 'pi433_tx_config' ever change
> + * If the contents of 'pi433_tx_cfg' ever change
>   * incompatibly, then the ioctl number (see define below) must change.
>   *
>   * NOTE: struct layout is the same in 64bit and 32bit userspace.
> @@ -81,8 +80,8 @@ struct pi433_tx_cfg {
>  };
>  
>  /**
> - * struct pi433_rx_config
> - * describes the configuration of the radio module for sending
> + * struct pi433_rx_cfg
> + * describes the configuration of the radio module for receiving data
>   * @frequency:
>   * @bit_rate:
>   * @modulation:
> @@ -94,7 +93,7 @@ struct pi433_tx_cfg {
>   * @repetitions:
>   *
>   * ATTENTION:
> - * If the contents of 'pi433_rx_config' ever change
> + * If the contents of 'pi433_rx_cfg' ever change
>   * incompatibly, then the ioctl number (see define below) must change
>   *
>   * NOTE: struct layout is the same in 64bit and 32bit userspace.
> -- 
> 2.25.4
> 
