Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAC310F5
	for <linux-staging@lists.linux.dev>; Thu, 25 Aug 2022 00:16:19 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id j1so14153197qvv.8
        for <linux-staging@lists.linux.dev>; Wed, 24 Aug 2022 17:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=Cmz7fm7ebAGzssd3xJv7sbaJQZ+F0fhv8ZeE1c0Oss4=;
        b=BbYn0gFpEl3t63BpXevWKjNWuybXv5dgRXX7NNXPmwPDV9WWbsy2TFL4AwK2WAOF4L
         Dl4uRGvFfS12lFjlJXalRvXeB5i7idDZdGtHs6QvTz2Xte8AaqV204WOLXovQE6EnXgW
         uGT1RLT6seACe4OxhcJBK9A8hwv2kMfHPBMs71iQN6+/obi92jtetOqAPRlh6Po2s3Fx
         mFAVPac+9ZrznBGYP/HjluetrUxYQKcCgU397MVRCTX+3r3gFoGFQcJNePmhXvgEe96q
         9fmyo6AYUA/3FC798Q2kAFuZZno1eELFCfz9xaJlGZPuUlmSKBIVqXOCyoJrI3iYY+5l
         5zIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Cmz7fm7ebAGzssd3xJv7sbaJQZ+F0fhv8ZeE1c0Oss4=;
        b=ittFsWLurrLizFPLyxPiEn4Zlx5OlEOEAGVNWrR1feZVRUREja8a4dVfzJyDbz06M7
         W3sh2OvGCqX5QC7HhaTr5uzv0sMicCjPTnOArn4LdSdwXvfUHE+obTgxrT4KqCjoN0ar
         GNSNIaw6hg+D8FyfmKvTys4kR01ooAFcyAL+686QOQdI65Yk6XBBYx11+yh+UtU35ahL
         OmTH5Fy4JqVhoBuY3iVOEM7vVGB6q/MpFoTB+FnzWPYml9T+MUl//tUboRDh8+3wyG85
         g57pK8aiJcxg/+9L1v/0GZg42R/BPFGHb7erKh5J3fRV5XjcqUH7ZjTvafpmfw97ao7l
         c7SA==
X-Gm-Message-State: ACgBeo1lx2FRUXr5xE9nTd5WFBYOpTbfd+EPjaCwA79O/aSo7I7COHNt
	fVb+Aov+KUaFOkees/KVKlU=
X-Google-Smtp-Source: AA6agR7cudaJBqJrWLroeNxaCLhFvEoy84qSAugT7HJRE0bR27KLPBU9oxZxVKYL3iYhZ2vl888dww==
X-Received: by 2002:a05:6214:262a:b0:496:ccc1:12c6 with SMTP id gv10-20020a056214262a00b00496ccc112c6mr1524662qvb.33.1661386577905;
        Wed, 24 Aug 2022 17:16:17 -0700 (PDT)
Received: from valhalla (2603-7081-5203-61c3-0000-0000-0000-1449.res6.spectrum.com. [2603:7081:5203:61c3::1449])
        by smtp.gmail.com with ESMTPSA id u9-20020a05622a198900b003430cbb0006sm15193239qtc.1.2022.08.24.17.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 17:16:17 -0700 (PDT)
Date: Wed, 24 Aug 2022 20:16:14 -0400
From: Chris Carbone <chris.m.carbone@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: split multiple assignments to lines
Message-ID: <Ywa/TiT46IH4vDw0@valhalla>
References: <YwQGaLoBHH9C0aXN@valhalla>
 <YwRzJN5yORAtq8md@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwRzJN5yORAtq8md@kroah.com>

On Tue, Aug 23, 2022 at 08:26:44AM +0200, Greg KH wrote:
> On Mon, Aug 22, 2022 at 06:42:48PM -0400, Christopher Carbone wrote:
> > 
> > diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> > index dbd1159a2ef0..6f4c31635cc4 100644
> > --- a/drivers/staging/sm750fb/sm750.c
> > +++ b/drivers/staging/sm750fb/sm750.c
> > @@ -386,7 +386,8 @@ static int lynxfb_ops_set_par(struct fb_info *info)
> >  
> >  	ret = lynxfb_set_color_offsets(info);
> >  
> > -	var->height = var->width = -1;
> > +	var->height  = -1;
> 
> Odd spacing on this new line.  Did you run your change through
> checkpatch?

Yes; checkpatch didn't report any problems with it.

Thank you for your time,
Chris Carbone

