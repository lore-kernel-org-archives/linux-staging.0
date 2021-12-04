Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA67468
	for <linux-staging@lists.linux.dev>; Sat,  4 Dec 2021 09:09:45 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id y13so21161115edd.13
        for <linux-staging@lists.linux.dev>; Sat, 04 Dec 2021 01:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=piWjoUd6FQrfDeKgRE9IYypzptj8wVsWHJQeGXe8XeU=;
        b=I91Ap0U+7TYHdAtefQ/emo7CYRpiakiJUfcBKICXVgI6ODhqCFYrhWFWFQibicUxys
         ByohGScAGeHZeXtGRO9YEJdu4KfOBMtrCD3AkhFw858nddHD1Vm3433jvFo1HXuUczQS
         jLFC2mf+h73XmijFtL9z27vGw63nB6jCR2CnQ92U/mSz3iDJzsUjPpIWmk0mT6INfzhE
         /3PeZJeRMC930K2TC2IvVhgv7IWxZpw2qdujbQh+lR0qET1riEXkhB/Sa+px96RIJVCC
         pvaI9FXPapjvSvmCMh6i2T9oxBO92DtLzBFjhx7XUbp1TufgBhROgTfkvyDB5waZzljM
         T0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=piWjoUd6FQrfDeKgRE9IYypzptj8wVsWHJQeGXe8XeU=;
        b=78cbLm4JFEExdmoG3jxGmqyFS8N3blUSVhTRlG4dDXfOzOueoNHkpTURL3iriNhlSH
         0nbGr2UAvcarWn3exHV+/7vd/fBBbuB1vZEAnWIytWeEp6yzFoqTbpitPdJ2MMrnPIRd
         JeY3kc5HVJlsLggizE75wlIwz2BBCnWRTAUi1IgQJk6zqdw1O4X038MGK8fxetuIx8Be
         ii60eWS6g6QNUg2Oppcrz+R/8DO7gQIYo13i68fkE0L4s/OqzBcjCb2mIvc+Hfvwlojd
         KQkYYzcdvdkzw/Bq7kRSykImCOKamdEN0U0F99w2N3ghduQzajvp9F8Z3zX+1NsWuuaU
         zxZA==
X-Gm-Message-State: AOAM533WRUWglVL48UCvLSth4As7PfBF7brvWM85KXkLSvxKBSFgUAqf
	0mLAcGZQXyARjQMooqwrQ5Y=
X-Google-Smtp-Source: ABdhPJxhRlai+oq1hnO8N30Wk/09aFIOvvrgqIvDeWLwq6bboeYyDdwJU/n91v61lQr9XliCForpzg==
X-Received: by 2002:a05:6402:190d:: with SMTP id e13mr34522176edz.282.1638608984255;
        Sat, 04 Dec 2021 01:09:44 -0800 (PST)
Received: from bulldog (host-79-17-112-183.retail.telecomitalia.it. [79.17.112.183])
        by smtp.gmail.com with ESMTPSA id l26sm3417925eda.20.2021.12.04.01.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 01:09:43 -0800 (PST)
Date: Sat, 4 Dec 2021 10:09:41 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: refactor byMinChannel to min_channel
Message-ID: <20211204090941.GA3805206@bulldog>
References: <20211204004041.3825744-1-alb3rt0.m3rciai@gmail.com>
 <e0fea904-1861-0003-1b04-6d2e966657da@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0fea904-1861-0003-1b04-6d2e966657da@gmail.com>

On Sat, Dec 04, 2021 at 11:27:43AM +0300, Pavel Skripkin wrote:
> Looks like this variable is set, but never used. Shouldn't it be just
> removed?
> 
> Same for max_channel (or byMaxChannel).

To be honest, I would prefer leave them where they are. I'm only
refactoring the code considering less the logic aspect.

I don't know if these variables will become usefull in a second
moment.

Anyway, If you consider that this could be a good moment to remove
them we can proceed.

What do you think about that?

Thanks,
Alberto



