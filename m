Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBB972
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 10:20:02 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id bt14so5145565ejb.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 03:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+kvaMj8EJUxo9/2klnChfd6kwIC9S45AjjV1Kjn+v+M=;
        b=gAk75JrC/Yt1l+MhZuQc/J2oYzOViLo/QAADrmHo15V1YaWMk+idGOEKoU/jD6EBJv
         iQblaavqqvZxCkAA45XOp1aHLeam5O/JTPPh5WXlL6uPp1TkaWTnQOJvHNTgzl/yiwSt
         /oz2HVmua6gzRXonqy/G9FIU2F5/aGLjYKfEAfOYCUvx9qEmwZBKuWF8fNnKc9S5Wjfc
         h9jCwHfWwRcllF3OJCC53Jj26H9HDmoX7kpS/AQOdrH2Cv8TzKnT7Ie21T84qkR5kVZI
         TQxuqH7W+eRuQbyhZE6oamLqcwoe585pI4VlB7TOawHOYUeyviyMM8EmLgX2XphmjW1x
         m8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+kvaMj8EJUxo9/2klnChfd6kwIC9S45AjjV1Kjn+v+M=;
        b=HsSnK3U8+4XtoL6h16DAYUgqhorhIx5pNL7UFeG8lrKzQvBrxv98B6L4L2SWoyfpBF
         lpoxVXjHswaK/Cc7Ts8wvSM78SR6PIkvxrMJxbA47HwTE5umsMePZtxx5SZ05Lf+tNfJ
         VePBiIb6DJlVI9XbE1Ve/aYXXr8y5Q8nis0o3L1yDqhCIZo3WxZUtBx5eP5YAngzCVId
         ggoPcwJj7esMWOIHMgSmoaklms2oxYCEsHXC8dBhqDUA4VuemZbQ556+uwrxNXYmoo3E
         ZtFX1kPDOOMSag3c8u/5CtArbMQ5EH9Mkb5+j7EfjsrqEWcNixPSdKJTd1CohaWo59YX
         yB+Q==
X-Gm-Message-State: AOAM530P1WPnguuHn94ZD7V0y+RdqI9U/sjhmRJvC8mPmJXnmuNrUp5g
	NoF4GzxRerHGege3UE9cn24=
X-Google-Smtp-Source: ABdhPJy6tGk/bfd8yr0ySl3vhr3cNdZliifKQEN1W2EIwz+Wu2Q/n1qplHX3ymzoYdEJAcq1SC6o+Q==
X-Received: by 2002:a17:906:4943:: with SMTP id f3mr3442697ejt.102.1629973200918;
        Thu, 26 Aug 2021 03:20:00 -0700 (PDT)
Received: from agape.jhs ([5.171.81.205])
        by smtp.gmail.com with ESMTPSA id k3sm1095440eje.117.2021.08.26.03.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 03:20:00 -0700 (PDT)
Date: Thu, 26 Aug 2021 12:19:57 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Provide a TODO file for this driver
Message-ID: <20210826101956.GB1416@agape.jhs>
References: <20210826014959.26857-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826014959.26857-1-fmdefrancesco@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hello Fabio,

On Thu, Aug 26, 2021 at 03:49:59AM +0200, Fabio M. De Francesco wrote:
> Provide a TODO file that lists the tasks that should be carried out in
> order to move this driver off drivers/staging.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> Thanks to Phillip Potter <phil@philpotter.co.uk> for for providing the first draft.
> 
>  drivers/staging/r8188eu/TODO | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 drivers/staging/r8188eu/TODO
> 
> diff --git a/drivers/staging/r8188eu/TODO b/drivers/staging/r8188eu/TODO
> new file mode 100644
> index 000000000000..4bccca69abac
> --- /dev/null
> +++ b/drivers/staging/r8188eu/TODO
> @@ -0,0 +1,16 @@
> +To-do list:
> +
> +* Correct the coding style according to Linux guidelines; please read the document
> +at https://www.kernel.org/doc/html/latest/process/coding-style.html.
> +* Remove unnecessary debugging/printing macros; for those that are still needed
> +use the proper kernel API (pr_debug(), dev_dbg(), netdev_dbg()).
> +* Remove dead code such as unusued functions, variables, fields, etc..
> +* Use in-kernel API and remove unnecessary wrappers where possible.
> +* Remove the HAL layer and migrate its functionality into the relevant parts of
> +the driver.
> +* Switch to use LIB80211 (This work is currently in development by Larry Finger).
> +* Switch to use MAC80211 (This work is currently in development by Larry Finger).

Maybe I'm wrong but I think Larry is working on cfg80211 not exactly with
lib80211 or mac80211. So I'd remove the clauses on parentheses.

> +
> +Please send any patches to Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
> +Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>
> +and CC linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org.
> -- 
> 2.32.0
> 
> 

thank you,

fabio
