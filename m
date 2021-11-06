Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E68C2C80
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 18:30:32 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id s13so19112885wrb.3
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 11:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BIIyAtDCkj56X6tydET6i22fhxrgxmbq38aVGTO18UE=;
        b=RHTrxs2xtgzdzoHvqDOlqsIaBJa458htUIvwEz51mV8Jwh9fcqScF7jSr9NmA7VI37
         kqv8IoeNj1FMIKnltHmO4t0jnTtU1MoFa9Vl47LOj4K2C7IiuswHKJ0fbIloTWmzndaJ
         5EcZzfSox+YC3Lx7sN31NGy19SQHeP1wS/8hOLVNFSvylQC/0fYFE2Yra/WJEuJXjd/G
         9X4kJ15jT+wHapovxolyEGxKeF8dr6CdRVo4plF6GGnO8FHKWqQUWHm6Jl+F1SpHnu1Y
         NZVjOosEUWR/YXBrpMa6U83Ch8Nn8nL9CqEwesqUJq1NiOcAH0ipO7sZ4HTuZaIu3g8R
         RxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BIIyAtDCkj56X6tydET6i22fhxrgxmbq38aVGTO18UE=;
        b=poNz0W9WX7MHfAJ96qxpVKGj4B8Op/ngPUqObxsGscbDoLXuTomvH2JXu3g9pu1QvL
         CYBhGfLbvQwDegAV5ssQpldLUyRJvq/YxPWI5py8p794eaXGK5cJKnw+GbgGo/NX8q62
         KHzepSZOGb3Iw+bTDkMaj1Wr4xe/Oub8PxFpN/oB9IiK7dw59A2fohGyMnrCFvC+CYSu
         rg22qcWR2oNQa0GFoGlVgejcuCzFM42xCWsJrBlY2hS/qpfMcMlJftcJGAQ0dWxoj1v7
         Mx0AQr+IEue6tHRNwZoVfi58toN1H2joa2crsqSvGm4oCEP75uyoaHLbObX1eHMUOjF9
         74NA==
X-Gm-Message-State: AOAM532XRUc+vU3diL1Xbo9d0PxR5A8vUcPqxt3GOvqm9KxVJTS8cwtO
	Sbq+5StZehzn8offa++ie/pwLQ==
X-Google-Smtp-Source: ABdhPJxmpn3IFfzKVKolTk7M12/q4+AQGi3aQnXB0cMKBWZH/++NIeDhYihpAUyjQ7rPyaWBhQMkGQ==
X-Received: by 2002:a05:6000:1688:: with SMTP id y8mr14962747wrd.420.1636223430971;
        Sat, 06 Nov 2021 11:30:30 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id c15sm11019116wrs.19.2021.11.06.11.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 11:30:30 -0700 (PDT)
Date: Sat, 6 Nov 2021 18:30:28 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: Zameer Manji <zmanji@gmail.com>,
	Larry Finger <Larry.Finger@lwfinger.net>
Cc: Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>
Subject: Re: r8188eu driver in 5.15 only shows wifi networks on channel 11
Message-ID: <YYbJxFAAFuIA8t6W@equinox>
References: <CABtXzjTvsN8sCQq0tMG+VZ8Vu04a1zR20P-hbQf-Mnpmu2gTNg@mail.gmail.com>
 <2d7b9450-159b-f244-f4c3-e9db753f83eb@gmail.com>
 <CABtXzjSjkQTMmrA_PmbLaMUFR9X7xUMx+VG=v1jsdLQAdg+rJg@mail.gmail.com>
 <510e2388-41ea-bf66-16ee-eb282cc41405@gmail.com>
 <5ed4c9f0-111a-7a13-1426-2f9f26b9937a@gmail.com>
 <CABtXzjSOXiZW5J3-k-jkFS3N9p9k_X=F2JrvJc9_T+By8FJc8A@mail.gmail.com>
 <CABtXzjQk87ZhYcc2h5mU0mR+6zC7rKrpP-g6uE=DxE56NXQXpA@mail.gmail.com>
 <YYa0e98JTsE0PPDL@equinox>
 <CABtXzjTkER+2KzsfhcYVN+gDGWUTmpX=2smdfine_fa-b+nsRA@mail.gmail.com>
 <21b97629-00b1-0fed-a4f3-fc318372aea2@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21b97629-00b1-0fed-a4f3-fc318372aea2@lwfinger.net>

On Sat, Nov 06, 2021 at 01:09:23PM -0500, Larry Finger wrote:
> On 11/6/21 12:16, Zameer Manji wrote:
> > Hello,
> > 
> > I would be happy to test the patch. I am not an experienced git user
> > when it comes to
> > taking patches from mailing lists so I would appreciate it if a commit
> > was pushed to a
> > git repository that I could pull down.
> 
> Sorry for assuming your level of familiarity with Linux. I find that anyone
> that can do a successful bisection is pretty adept. Unfortunately, I do not
> control the repository, thus I cannot push patches.
> 
> Please tell me how you read E-mail. Do you use a local mail client such as
> Thunderbird? If so, I will send a special patch form that can be installed
> with git.
> 
> Larry

Hi Zameer,

Just setting up a temporary repo now with Larry's v2 patch applied. I will
share the URL shortly so you can just clone/pull from it.

Regards,
Phil
