Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E073FC1
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 10:43:44 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so10684132pjr.1
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 03:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1f+cT+VJAS51jJ+h2gpiKcy14OxlVz6YvCOSyx2MnME=;
        b=oZ3ZLErOjhQyMFCiIQ3EZ8XK1u6SbSR0fl9NnF4wO2FQm2Fx/ccx6zKsPt4wvJd9eC
         jeZOlHYxp5/cEliJy23je/Ywdkg7Sn63IcTLaDZJ3PYGg2NuN5q2amtWc9HqvoUQyYar
         Wmc2dRaixDGBO4J0jdAXvicqWMCen4HRXy7mi6VlkoCqqvyy+31yPuQx/9mCufmGZ471
         9qxWpe0KP6L1gmpwR1FG9JV8qLcqs9rRMnMYbuNHZ+zAfdnP7byMrRuvS/hsnX9rkhth
         ypb4erbAZfIqQv0vtQEhJPKK67trkb3Y1rIDT0jaAwlP/2TZ8NZhXd33FRwOm1hFIKo5
         mP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1f+cT+VJAS51jJ+h2gpiKcy14OxlVz6YvCOSyx2MnME=;
        b=OxTo+J78YTbSK1nLObQviC3qoigZUIWrB8oWFp9pK4DpSi95AuyPv2boKLaX+sGTKi
         JnH5ddkgcnV6RAK71y75kPjH7ANQT65Bj8VVkTfesaYcONyqq2nURaTCOH1uqyvDJP1f
         NRKyu5FdveJEb6Wgd0eq/2RPPbFbuTtxRTwLsUFOVhdoLyO5J/w5AWyk7KNtHsg5n40E
         TeFxNK9c+xAnDS25/uJogDVUsw5EyC4Q5sp2zHFRxhVkzgFQlLGVaZpdynk26PMiQHl2
         nFXSec3p3ieAD6sxlrz/MEqPr2p85Dvaf6XhP6g4Ml2bdnERI4N6LCaqwtMgm6ku+lIL
         LKvQ==
X-Gm-Message-State: AOAM530tApNgIMjg9i/q0QgwnMuSOdnaBnUhxMDs6Zw8bRxqV37TgC2P
	87l2OfHBwUBZ1QjW1aXlvouCI6Lx+gavlw==
X-Google-Smtp-Source: ABdhPJw4VPobL8ViBRn4tBBCsMoFsY1DfA+hg0jzXCV4L5Ns1x0C4jLZXG8dSosjM/60k8Qp3eRUQw==
X-Received: by 2002:a17:90a:aa85:: with SMTP id l5mr16009069pjq.111.1630147423863;
        Sat, 28 Aug 2021 03:43:43 -0700 (PDT)
Received: from localhost.localdomain (125-237-24-95-adsl.sparkbb.co.nz. [125.237.24.95])
        by smtp.gmail.com with ESMTPSA id q126sm1246922pfc.156.2021.08.28.03.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 03:43:43 -0700 (PDT)
Date: Sat, 28 Aug 2021 22:43:38 +1200
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: gregkh@linuxfoundation.org, hello@bryanbrattlof.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: fix docs typos and references to
 previous struct names
Message-ID: <20210828104338.GA8113@localhost.localdomain>
References: <20210828101242.GA6841@localhost.localdomain>
 <20210828102302.d7nhe2bkw6h5quqa@kari-VirtualBox>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828102302.d7nhe2bkw6h5quqa@kari-VirtualBox>

On Sat, Aug 28, 2021 at 01:23:02PM +0300, Kari Argillander wrote:
> 
> Re: [PATCH] staging: pi433: fix ...
> 
> This is version 2. Subject needs to be [PATCH v2]. If you generate using
> git format-patch add "-v 2" in there.
> 
> On Sat, Aug 28, 2021 at 10:12:42PM +1200, Paulo Miguel Almeida wrote:
> > In the comments there where some grammar mistakes and references to
> > struct names that have gotten renamed over time but not updated
> > in the comments.
> > 
> > Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> > ---
> 
> You should have log here what did you change from previous version as
> this is v2. You can also add who ask this change That should be like
> this:
> 
> ---
> Put your version log here.
> ---
> 

I see. Will do, thanks Kari :-)

