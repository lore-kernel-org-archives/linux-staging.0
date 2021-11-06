Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB7C2C96
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 22:17:50 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id c8so29565131ede.13
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 15:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PEPBFtPy6euab8Zfc2N05PNDo4G4kUq9C55s0Zp3FSw=;
        b=Jqd8CzsBOuuIaUQWJ3h7pWFGXZLdpZ3ZtWb5+mpq3POyVg2GCIRSM9III8XJMngCiy
         daK5cx4WhmT0+wj/BWvWEwLsszNwN6rMSGb1YJyXkqfwZZb4VyKvQpOhoMwn/u1mafO7
         WtCrna49ny0J8ElyQsf5g5G68rFhd8/IGOazyMF5Dm/HYra9yW/4oW5t9Cy3l/oYjx44
         F7JjAoWxZ7OVTC8/q5GhssJlI/kCRzI9oOq1cop5m2a3KyCwwDwqbJF/Pb3kH/aVUtWx
         pfKSJHoPGGGtnpUCijCrAV19FYEmFzrsnFp87d9wjXz6PzLGTTmVvsgyipdGOg7e0WTt
         r25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PEPBFtPy6euab8Zfc2N05PNDo4G4kUq9C55s0Zp3FSw=;
        b=YoJjAIIKOhuD+wYtzlkOB4wE9lchBXqw8H5iSXir8NGB/+xyilWEUpCKxoHFMRJyu0
         kdn8IIIu2agsdlB64vhYaAykRA0BosA6MKTV/Rqaq0CpLmzlLcCUyNLhLFqQUSBRhnIc
         c6BsYpPhdh1ORSe5x+ZWKrpqrjHm/WVt9CBedZnJ/9cLITFyVg81HCxJBJobHAEUkyUs
         AzrvP779LkUbKfs8zal22AQqsOKG1Dtr0kve+czqSJFwqXIegKt3MXXk+ES4khB2ZG9N
         S2P4c9EaTLYEAp7HWhxJI5fKKo6k4Qb6C6a7HZ2h79Ru10wY4nI6YEQiXhp6x37nVGMe
         REKA==
X-Gm-Message-State: AOAM530hVSzcIH1rA35EtEpVJpKA95wYzatgfC5M76F3LfZ5RbhjH46J
	IMqMhMCms18GQ/nOQeT5thw+uoSBAPc=
X-Google-Smtp-Source: ABdhPJyB5udQuiQ55cjjsKv48RM7hMcxhb5vXybWrjGlyhAol+A0uEQGF/QpN3qBtdl2KydWOgseYw==
X-Received: by 2002:a17:906:2a06:: with SMTP id j6mr84255491eje.401.1636237068946;
        Sat, 06 Nov 2021 15:17:48 -0700 (PDT)
Received: from localhost.localdomain (host-79-56-54-101.retail.telecomitalia.it. [79.56.54.101])
        by smtp.gmail.com with ESMTPSA id z25sm1751961ejd.80.2021.11.06.15.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 15:17:48 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Zameer Manji <zmanji@gmail.com>, Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev, Phillip Potter <phil@philpotter.co.uk>, Larry Finger <Larry.Finger@lwfinger.net>, Martin Kaiser <martin@kaiser.cx>, Michael Straube <straube.linux@gmail.com>
Subject: Re: r8188eu driver in 5.15 only shows wifi networks on channel 11
Date: Sat, 06 Nov 2021 23:17:44 +0100
Message-ID: <1977263.McJW3uIAVl@localhost.localdomain>
In-Reply-To: <4f40be0c-1989-fd36-2d40-2e896d8d944f@gmail.com>
References: <CABtXzjTvsN8sCQq0tMG+VZ8Vu04a1zR20P-hbQf-Mnpmu2gTNg@mail.gmail.com> <CABtXzjSOXiZW5J3-k-jkFS3N9p9k_X=F2JrvJc9_T+By8FJc8A@mail.gmail.com> <4f40be0c-1989-fd36-2d40-2e896d8d944f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Saturday, November 6, 2021 8:26:35 PM CET Pavel Skripkin wrote:
> 
> We need to review code better to prevent accidentally regressions
> 
> Thanks for bisection and your report
> 
Hello everybody,

I've just read this thread and I'm sorry for introducing a regression with 
commit 221abd4d478a ("staging: r8188eu: Remove no more necessary definitions 
and code").

Anyway, thanks to Zameer for reporting this issue and thanks to Larry for the 
fix :)

These are the output of my tests without Larry's fix:

localhost:~ # iwlist wlp0s20u1 channel 
wlp0s20u1  14 channels in total; available frequencies :
          Channel 01 : 2.412 GHz
          Channel 02 : 2.417 GHz
          Channel 03 : 2.422 GHz
          Channel 04 : 2.427 GHz
          Channel 05 : 2.432 GHz
          Channel 06 : 2.437 GHz
          Channel 07 : 2.442 GHz
          Channel 08 : 2.447 GHz
          Channel 09 : 2.452 GHz
          Channel 10 : 2.457 GHz
          Channel 11 : 2.462 GHz
          Channel 12 : 2.467 GHz
          Channel 13 : 2.472 GHz
          Channel 14 : 2.484 GHz
          Current Frequency:2.462 GHz (Channel 11)

localhost:~ # iwlist wlp0s20u1 scanning | grep Channel
                    Frequency:2.462 GHz (Channel 11)
                    Frequency:2.422 GHz (Channel 3)
                    Frequency:2.427 GHz (Channel 4)

It can scan the only three cells that are reachable from my current position 
and it seems that all 14 channels are up and working.

I see that Larry fills the elements of the array that I left empty. I can't 
still understand why this driver works for everybody else but not for Zameer.

However, even if the users do something unusual or have weird configurations, 
I believe that drivers should be resilient and keep working properly. 

Therefore, it's for sure a regression and so it must be fixed. I'm happy that 
Zameer noticed it and helped with bisecting, and that Larry found soon the 
roots of the problem and fixed it.

Again, thanks to you all,

Fabio










