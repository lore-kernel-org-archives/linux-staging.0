Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1FB68
	for <linux-staging@lists.linux.dev>; Sat,  4 Dec 2021 10:14:55 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id y12so21448213eda.12
        for <linux-staging@lists.linux.dev>; Sat, 04 Dec 2021 02:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y+u6DzOaodOVmRU21cq3ttbjYk+i0/oaFcwFczRIG8k=;
        b=iZUQkmkoEJyMM4HkG+yoB/3LW3KIbaKrxuZgseDRzNQQNTRbNTC9H0TS+uc4lmLAE3
         Zg6t7zbbeuLhFGBEk/4exzyWCjLFLs29S4T+HIAdNgF2V1Mslf2KydrOdQHlJpMRwQsd
         CXEt2qua2OfEEztNA0PvVdJsosXNsXMXnkRdnUGQFyQcfSKguKPBxPSkqwgozOLITaHG
         mdqbYq5hsHP4Icm+452OlnKkHIEysm+KEN9UmdZWmBCCgyo3cwp0+ckaAQl9gLquEUU3
         5zOyzNO1SPDWPmr9n7Dvq4OGw5jjqjEhr2xMPOyweH2DDPFQX0u85ywa5nBNp5sRoLS1
         lvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y+u6DzOaodOVmRU21cq3ttbjYk+i0/oaFcwFczRIG8k=;
        b=PqW2ZSOJXV4zx1k1gnPQxvsfo7rBbjPOxWO0+3wV6+z8sEVt/47RMiYM8TugI71NJh
         vY31Qke4b4LWYTCMsXZi0XZs2xVjBCFoVQA8OMyBxUOmj88KP9LQPXWPN47hR9uWLS0G
         GlRJYit2HaSWARR+PXEoPXkhIjiwknVSYfo02qPcTMptJlXxeH2Ld2UWUzjMvnG7my6b
         TP5qTs8JXsJKlSxKulXah3X7U96Om3VY2MTSdDjPXSeDvM+S6IUmCknTlP72+YJdtGj+
         MV9j2MBECV62SnZXUI7ktWLpdCcq4qYwyCZIGemXUUOjIQxVvamVdU4DEShwG02HNKJT
         NfiQ==
X-Gm-Message-State: AOAM532sKug+unf7TNR4bH9tJnrqNKJxt4LxOlzGcjYtu3AynpgW4/lh
	wkvkYQWKT31hgV/c8DXkMsA=
X-Google-Smtp-Source: ABdhPJwa1KxAHMBGFVs5f0OLFd1aIKz7UV84/zFkKdftE0623y/O91vqGlakiTXBTfWqlFsm8GgXzg==
X-Received: by 2002:a17:906:35d7:: with SMTP id p23mr30315982ejb.32.1638612894361;
        Sat, 04 Dec 2021 02:14:54 -0800 (PST)
Received: from bulldog (host-79-17-112-183.retail.telecomitalia.it. [79.17.112.183])
        by smtp.gmail.com with ESMTPSA id i8sm3946502edc.12.2021.12.04.02.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 02:14:54 -0800 (PST)
Date: Sat, 4 Dec 2021 11:14:52 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pavel Skripkin <paskripkin@gmail.com>,
	Forest Bond <forest@alittletooquiet.net>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: refactor byMinChannel to min_channel
Message-ID: <20211204101452.GB3887246@bulldog>
References: <20211204004041.3825744-1-alb3rt0.m3rciai@gmail.com>
 <e0fea904-1861-0003-1b04-6d2e966657da@gmail.com>
 <20211204090941.GA3805206@bulldog>
 <Yas05neinXtoEC+6@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yas05neinXtoEC+6@kroah.com>

On Sat, Dec 04, 2021 at 10:29:10AM +0100, Greg Kroah-Hartman wrote:
> On Sat, Dec 04, 2021 at 10:09:41AM +0100, Alberto Merciai wrote:
> > On Sat, Dec 04, 2021 at 11:27:43AM +0300, Pavel Skripkin wrote:
> > > Looks like this variable is set, but never used. Shouldn't it be just
> > > removed?
> > > 
> > > Same for max_channel (or byMaxChannel).
> > 
> > To be honest, I would prefer leave them where they are. I'm only
> > refactoring the code considering less the logic aspect.
> > 
> > I don't know if these variables will become usefull in a second
> > moment.
> 
> Fix the code for today, do not worry about tomorrow for stuff like this.
Wise word... :)

> > Anyway, If you consider that this could be a good moment to remove
> > them we can proceed.
> 
> Please remove things like this that are not needed.
I will proceed.

Thanks,

Alberto
