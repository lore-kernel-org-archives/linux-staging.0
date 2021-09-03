Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D753FC1
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 15:30:12 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id m26so4560773pff.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 08:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mQCffvfvV6JjsByh+9Z8w1Be6P4PW+G6FOMb0ew1msw=;
        b=gAnOOmkhTS2neE2n9NHe0rSRsuMcoL3zb2hBTQPzAGT/H21fgG+I7KO2aHhb8VIc1i
         ZgnRcCR4vo9iYrMSzGKOndL6t3lQJYa4cMsEvcG9a3TJLp3tz9iHMpXcNSS8sfc2ezYL
         g0fL5eXqomkKEuKpnEhrI5gr2rUHk666Mhi16JYThAe6ScI1u65oKM9Kktnjj3aFTAQ3
         FwFO6m8ktOuC6gXHmEQA2+BZ2orN1hB45SebL8UowrLnAOSwYVC6rPKkjs/eWCS4fY0e
         pIrvrV7d9EXuiAcwo/E0FsIwkfp7iplricef3xfEb3QerLigwwS2xRzZYzssj440+1OK
         SKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mQCffvfvV6JjsByh+9Z8w1Be6P4PW+G6FOMb0ew1msw=;
        b=ssAHSytS3BR1A/SCs+0XWKBeprrVyhS/p2AC4A8Xl8L0pYEDq8e6h0kckpi90SWkmA
         KyLlDWjLrlDDhtsKMc8PcB7fyah31+INN64B8/GHO8ySgOFXrxc3IT6wmIMwPULccu+9
         zlAcW3Sr9C90sNGKrLvSGo+zUljtJO4VoVbtctf3Q0ScYxYkhjdbuMyj5Qtu5XPCiqRq
         RDl++xs9irT9QTWJVxOTM3lsoUCIfpgzw2b8vcBabwlRSGiJRmT1ARM5yc9W43YuYCbD
         2opqiCf7IrtpHfoN4y1J37YpgIV8OnzDDRd5skAMXhdoQBmsjmaOuHBYXNI+VkIWkmg2
         dHCw==
X-Gm-Message-State: AOAM5301UxGGmdlglAKXaxw8OiYvvirqH0m3FLPikrYR/DvhbOlmwIPk
	1mG+ccI5ralnJrum0R24MOu4gmreZaFwN6aGfTnShbiXeCQ=
X-Google-Smtp-Source: ABdhPJxFVxl2f5ZRJT54W5bx6B/EWLGUKxlzq+TAI7oBkptT1ecCneQS5jermNCTfBs3p12V1XgJ+ssm05bxXq+ZsZ4=
X-Received: by 2002:a63:101c:: with SMTP id f28mr4086711pgl.330.1630683011667;
 Fri, 03 Sep 2021 08:30:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210902111339.GA577108@panther> <YTCU3SpFgyFbxXs3@kroah.com>
 <CAPGkw+z5b52n7rjHH3_LtH5tmt66ZBvqpbiGTj430Ncqv2ZcBw@mail.gmail.com> <YTG/jv1bZUpDOrh4@kroah.com>
In-Reply-To: <YTG/jv1bZUpDOrh4@kroah.com>
From: Krish Jain <krishjain02939@gmail.com>
Date: Fri, 3 Sep 2021 17:30:00 +0200
Message-ID: <CAPGkw+x7oXb2Wrj79O1o0WYhtbqQPDmSTVGuWdxnV3UuAKFZPg@mail.gmail.com>
Subject: Re: [PATCH] Fix formatting for file "hsdma-mt7621.c"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 3, 2021 at 8:24 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>
> A: No.
> Q: Should I include quotations after my reply?
>
> http://daringfireball.net/2007/07/on_top
>
> On Thu, Sep 02, 2021 at 10:24:47PM +0200, Krish Jain wrote:
> > Hi, I use nano. I don't see my editor asking me to wrap the changelog
> > text? What exactly can I do to get it properly line wrapped properly?
>
> If you have an editor that is not set up to wrap your lines at 72
> columns, then you need to do it "by hand".
>
> thanks,
>
> greg k-h

Ok, doing that right now. And sorry about top posting, you know it
takes a while till a habit goes away. On autopilot mode, I just am
used to writing on top.


Best Regards
