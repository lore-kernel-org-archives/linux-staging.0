Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE5B2F22
	for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 14:56:30 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id l8so7747340wms.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 06:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MaU4xcoIvuYlrJkvIksCMnsfWTJ9NQrt07UqgdSvUt8=;
        b=cjAdENS67WVP+1GqCou7olNn5RC35WH4WRlkKDbs/3IG/+oHzdd58hv3xbOgmXydgy
         RuG6uQW4Mml1SuomuHGOYsfyCRqcZ4WqDfzck0ooA+VcKNodUAi7mMq5zeJkSbsa3E6y
         P/UT7PL9AANkKuYjuVapWLwst1YI7WzELKpB5zqFdB1fP9jQhEmh4QayDcnD1JHKCsn2
         oMW8mC8Y9WVh63P0n2tgfgTGSBmnDChnX8JNe52D76/5HDqRuZ18Ux8HfFlQLy+a+d4V
         yjAcAwDkcAYWAuu00c+ESEOSZai3UUnTAq7oUXCocGHgZ4s/x4Lzvwn/4nAkHJPj4puy
         QMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaU4xcoIvuYlrJkvIksCMnsfWTJ9NQrt07UqgdSvUt8=;
        b=wTMfiFgD+4Zg+AlYPQJrCAkhW/dEkwaJo1lSJpcJVSjUnQay2Q9pHB6JGKK6d6Et6z
         f9cVtP46LTE33X+thZFv+8dfH3qXJWD47sFV1jsSqhf/F2PBT2utN+1XBodFmUYZO5nc
         J88wgDx9yPH+xepLkpf2DlXAU4B8OYnZN0TJIkfJ/Oiof5AupbYU3g2fsPe6o/1+aIH1
         ayV59tJu/o5Z5Hl08r+UWM/0JqZYvYAsjPVDcQPgVISTjTGJNPB3i51f6+ISv/QwWFAU
         npoDK9QE7/VIAfk9yVHXU3vbeW3Ipq4x/ozxMkFJ1SfjYFX8m9Yc59Oq4DgGtDInqdYz
         3Z/g==
X-Gm-Message-State: AFqh2kq9/ucImNhBZ0d8HV7iZvRGXLq3TJTM8KCvOeWWJ4DE+KBIqRWe
	ZzyBkdljxewTMSER+88wOEg=
X-Google-Smtp-Source: AMrXdXs8GnprtjlQg8wOe27VuMXLmamnap+2Vh2Z5ePwcvK++/uQ0cMcbw/Mooxb6Q+yt5LCzwdEmw==
X-Received: by 2002:a05:600c:ad0:b0:3d9:ebab:ccff with SMTP id c16-20020a05600c0ad000b003d9ebabccffmr15616483wmr.33.1674053788750;
        Wed, 18 Jan 2023 06:56:28 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l11-20020a1ced0b000000b003dafb0c8dfbsm2674533wmh.14.2023.01.18.06.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 06:56:28 -0800 (PST)
Date: Wed, 18 Jan 2023 17:56:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: Brent Pappas <bpappas@pappasbrent.com>
Cc: andy.shevchenko@gmail.com, ailus@linux.intel.com,
	gregkh@linuxfoundation.org, hdegoede@redhat.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org
Subject: Re: [PATCH v4] media: atomisp: pci: Replace bytes macros with
 functions
Message-ID: <Y8gImBdR6YpEKZEb@kadam>
References: <Y8bq25jjRdgTTd7/@smile.fi.intel.com>
 <20230118144226.13127-1-bpappas@pappasbrent.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118144226.13127-1-bpappas@pappasbrent.com>

On Wed, Jan 18, 2023 at 09:42:26AM -0500, Brent Pappas wrote:
> Replace the function-like macros FPNTBL_BYTES(), SCTBL_BYTES(), and
> MORPH_PLANE_BYTES() with functions to comply with Linux coding style
> standards.
> Replace multiplication with calls to functions/macros from overflow.h
> to prevent accidental arithmetic overflow.
> 
> Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>
> ---
> Changelog:
> V1 -> V2: Use size_mul() to perform size_t multiplication without risk of
> 		  overflow.
> 		  Remove the inline keyword from function definitions.
> 
> V2 -> V3: Add commit message.
> 
> V3 -> V4: Use array_size() and array3_size() for multiplication.
> 
>  .../staging/media/atomisp/pci/sh_css_params.c | 38 +++++++++++--------
>  1 file changed, 23 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index f08564f58242..7e111df5c09d 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -98,17 +98,27 @@
>  #include "sh_css_frac.h"
>  #include "ia_css_bufq.h"
>  
> -#define FPNTBL_BYTES(binary) \
> -	(sizeof(char) * (binary)->in_frame_info.res.height * \
> -	 (binary)->in_frame_info.padded_width)
> +static size_t fpntbl_bytes(const struct ia_css_binary *binary)
> +{
> +	return array3_size(sizeof(char),
> +			binary->in_frame_info.res.height,
> +				 binary->in_frame_info.padded_width);

This indenting is not correct.  Do it the way that checkpatch.pl likes:

	return array3_size(sizeof(char),
			   binary->in_frame_info.res.height,
			   binary->in_frame_info.padded_width);

[tab][tab][tab][space][space][space]binary->in_frame_info.res.height,
[tab][tab][tab][space][space][space]binary->in_frame_info.padded_width);

(Same for the rest obviously)

regards,
dan carpenter


