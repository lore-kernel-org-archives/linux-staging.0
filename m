Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F23156D9;
	Tue, 17 Oct 2023 07:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSQURUD8"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-59b5484fbe6so65947367b3.1;
        Tue, 17 Oct 2023 00:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697527187; x=1698131987; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sQwBZF7yomSeFnEELBnlnKpdEQecOf+IZL5sDoY9Qm8=;
        b=kSQURUD8oAHWotcxSJlRyp4fHhg5uP8DfitTUvqOVSvAGMgLZlatrIv0HvaxXMi/B+
         vfhM2UB/xsbqDQc0CKLFfymiFgmZCaaF1ABPfjiSjFkiWSSR5THggSgx3wZXgQBlw1S8
         y1jjn6RW0XgVKysuGoZRP6eX6qmKaUS/wtHX+pCdyQ1PXVE0c8lGORktvpXS0FY7XP8j
         nmwTxK/49x7mtrGeAEKITa7lzRxgO7uAgNuNTA7/X6YPauRmu26uinrH315bWKMK82es
         KKa5jfX3C5YKLOYs9wFmqtmjQecPyimgJc3/VssjC+GnTUYcAvgOLjchI8SvLLnS2Vk1
         yaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697527187; x=1698131987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQwBZF7yomSeFnEELBnlnKpdEQecOf+IZL5sDoY9Qm8=;
        b=v9EwTHXuxub67g8oojKT4piM9mHYW7ozzItCBBcgK3JE4Z5044j2wdZj+6i5f82NJ3
         /1UTQcqFleHfA8P1xqFNuwF+SQ3FKBuKtAeXmoNgjGS20b7kzIPg8ZhBO9g1wyo8zmt+
         9dg42Q58M8nReJ2VpAE9bsQyV5CHAqD7mExFiNbfRrLOObunxhukeNtIPLFE5W38jIl5
         hpEQGq9Xh0Q4QriZYvXqbyZ2CaBHp4cfDOvIh/uu8mW08UF0H7ByfoZ80/Zqzhs9ec2X
         ctRujtk1zw8xuPTDzaAEC8zzVHI+Aklp301Xi6OT1BbX6Fkj5CJSe0vNRnWx0tt7/SyQ
         1KmA==
X-Gm-Message-State: AOJu0YyxyY1PoMQj8gxxAmb+OPzQEPe/C1133RF2jfWoxMRpeV4NU2JU
	c8dcCLt5XnTlTpsBJ6PCbD8=
X-Google-Smtp-Source: AGHT+IG6JQThO8Ot4Zuv2WY0wihxScM3250ow9B9wyGNqK1zuSbkrPAU1Qq9rG2B1hQ3GmhPeHsaTw==
X-Received: by 2002:a0d:d382:0:b0:594:e148:3c42 with SMTP id v124-20020a0dd382000000b00594e1483c42mr1311925ywd.52.1697527186914;
        Tue, 17 Oct 2023 00:19:46 -0700 (PDT)
Received: from gilbert-PC ([105.112.189.86])
        by smtp.gmail.com with ESMTPSA id d77-20020a814f50000000b005a7ba08b2acsm409249ywb.0.2023.10.17.00.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 00:19:46 -0700 (PDT)
Date: Tue, 17 Oct 2023 08:19:40 +0100
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: outreachy@lists.linux.dev, forest@alittletooquiet.net,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Rename variable bUpdateBBVGA, byCurrentCh, byCurPwr
 and byBBPreEDRSSI
Message-ID: <ZS41jFfwBJ672Rb7@gilbert-PC>
References: <cover.1697495597.git.gilbertadikankwu@gmail.com>
 <0f6661a4-7281-4d26-8c26-ba03a567fcaa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f6661a4-7281-4d26-8c26-ba03a567fcaa@gmail.com>

On Tue, Oct 17, 2023 at 08:19:49AM +0200, Philipp Hortmann wrote:
> On 10/17/23 00:58, Gilbert Adikankwu wrote:
> > Make the variable names adhere to Linux kernel coding style and mute
> > checkpatch.pl errors.
> > 
> > Gilbert Adikankwu (4):
> >    staging: vt6655: Rename variable bUpdateBBVGA
> >    staging: vt6655: Rename variable byCurrentCh
> >    staging: vt6655: Rename variable byCurPwr
> >    staging: vt6655: Rename variable byBBPreEDRSSI
> > 
> >   drivers/staging/vt6655/baseband.c    |  2 +-
> >   drivers/staging/vt6655/channel.c     | 18 +++++++++---------
> >   drivers/staging/vt6655/device.h      |  8 ++++----
> >   drivers/staging/vt6655/device_main.c |  8 ++++----
> >   drivers/staging/vt6655/dpc.c         |  2 +-
> >   drivers/staging/vt6655/rf.c          |  4 ++--
> >   6 files changed, 21 insertions(+), 21 deletions(-)
> > 
> 
> Hi,
> 
> -       if (priv->byCurrentCh == ch->hw_value)
> +       if (priv->current_ch == ch->hw_value)^M
>                 return ret;
> 
> ERROR: DOS line endings
> 
> What does the "^M" at the end of the new line?
> Did you run checkpatch on your patches?
> 
> Thanks
> 
> Bye
> 
> Philipp

Hello, 

I do not know what this error means. If anything, I'm surprised there is
an error. checkpatch is hooked to my git commit and all the patches
built cleanly on my machine. I will resend now.

Thanks 
Gilbert
