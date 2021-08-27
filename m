Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB063FC2
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 15:39:06 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id j12so12109172ljg.10
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 08:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=aJjrhfVKj3vxQ+lx3HC3TkHGZ1lkkMCuCZabHXAHjL0=;
        b=hMNRm1wDJUk1V37+niYoqO3547B+bg6cY4zxnTm/kdKHeqV+3iC2+f3y1YDd/okkQB
         xA2as3iRdhVgX6o6susy5xB6kjt5tkLf9kFixk1zp18B5zPc369rQagCBc6gnX1eGgU0
         xLHmlYEW8pj+PLU6I7RM+6p+s9mj5NCB2BSRZVGxVJOsUinT0drPH2y+gI54KRf/3a+K
         DSQVmH6RSLFnu933xCgAOiupsdixIq/z01uICQr/AkAmuPfRjbGX2t0veBjoQx6QrAdY
         wUYuTSJpW1cDglD+z9XIPifDsViD0qEtclKfxuN6bATijT1/f05Jyvhi7kQ4sHyAJeJZ
         l8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aJjrhfVKj3vxQ+lx3HC3TkHGZ1lkkMCuCZabHXAHjL0=;
        b=bTx3z3v/tYauB0SJr5rVSz0UXsZY9IKyLgk2r/rwnxHiMZUedI3tmwkF4gQlg9xzMz
         fsRgvB3XViib1IKMc0hp9YjQY7WUhz8FgM+UZdT9LHbJUeOiqUGIldQiA6pgPkbOv3pH
         VfwEG64/D8960Fm081p/BPnV5cCkiBcjTb+iGSJBpQ4OhDZ0O7t/oKCbQcH89E6zVsjS
         pUy3Q7BQ7eXG/HHMw+WVO6YvKldkgH6J5UFXc+5hcD4Fp71vy67WZou5gVHNaW5qqT0B
         rQPaX3YINKZ0C07wo/7FrgA2ioQ6IWzb1f4f2fOnG8vM6tk/4ObAhEWjARcp4RwX9fO6
         fUuA==
X-Gm-Message-State: AOAM532or/DkTiHdsUcpU62eipETHalXxieouD47md4aSISOoeZCVXt2
	/sRl9tyOCFrLXdEukpJVvls=
X-Google-Smtp-Source: ABdhPJw6Zoc+6q2/rnqmd1L2cSRdqXdC9d3DG0edcULART9zgQzrYoiKdfMInv1PE/7wJDpPIFI4cA==
X-Received: by 2002:a2e:94d0:: with SMTP id r16mr8433182ljh.403.1630078744106;
        Fri, 27 Aug 2021 08:39:04 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id j1sm719729lji.124.2021.08.27.08.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Aug 2021 08:39:03 -0700 (PDT)
Subject: Re: [PATCH v3] staging: r8188eu: Provide a TODO file for this driver
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, Fabio Aiuto <fabioaiuto83@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20210827100813.18610-1-fmdefrancesco@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <dc56ba64-182c-2e9d-0be5-c0244c8270cb@gmail.com>
Date: Fri, 27 Aug 2021 18:39:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210827100813.18610-1-fmdefrancesco@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/27/21 1:08 PM, Fabio M. De Francesco wrote:
> Provide a TODO file that lists the tasks that should be carried out in
> order to move this driver off drivers/staging.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> v2->v3: Added a task suggested by Dan Carpenter
> <dan.carpenter@oracle.com>.
> v1->v2: According to reviews by Fabio Aiuto <fabioaiuto83@gmail.com> and Greg K-H
>          <gregkh@linuxfoundation.org>, remove "[] is currently in development...",
>          indent and properly wrap the lines, remove the unnecessary last paragraph.
> 
>   drivers/staging/r8188eu/TODO | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>   create mode 100644 drivers/staging/r8188eu/TODO
> 
> diff --git a/drivers/staging/r8188eu/TODO b/drivers/staging/r8188eu/TODO
> new file mode 100644
> index 000000000000..98f918480990
> --- /dev/null
> +++ b/drivers/staging/r8188eu/TODO
> @@ -0,0 +1,13 @@
> +To-do list:
> +
> +* Correct the coding style according to Linux guidelines; please read the document
> +  at https://www.kernel.org/doc/html/latest/process/coding-style.html.
> +* Remove unnecessary debugging/printing macros; for those that are still needed
> +  use the proper kernel API (pr_debug(), dev_dbg(), netdev_dbg()).
> +* Remove dead code such as unusued functions, variables, fields, etc..
> +* Use in-kernel API and remove unnecessary wrappers where possible.
> +* Fix bugs due to code that sleeps in atomic context.
> +* Remove the HAL layer and migrate its functionality into the relevant parts of
> +  the driver.
> +* Switch to use LIB80211.
> +* Switch to use MAC80211.
> 

I think, we can add an entry about error handling. There are _a lot_ 
function calls without proper error handling. rtw_read*() calls are on 
me, but others...




With regards,
Pavel Skripkin
