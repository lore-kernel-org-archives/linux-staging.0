Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9632A70
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 07:47:45 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id t2so1185440edd.13
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 00:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Zsjvy1qsrTGnTOxXbEsGYch/GJur+b3ZaPfAaLrOvvY=;
        b=FjplD3p8O/mtqU64FCyP8IxhgKh8SMR0CKo3ev48LIlVj7XOxvQ8BbDYP874ktFzQR
         V6SYaGr0XHlaIOZ5DuFt/LGx/RGdM7rVBSiJWnsx2KdckW8MYjLkc5GGP1Y8gwAhP4Wx
         zdKZn3P4jHZv+J/Tno+uOHCEFUJHqUb+ouLfZY4VrPMwwW9ybJ9JrrgVfbsHgCCENW34
         vIa13puP2dlYsL3urDuS33MfegqXzxd/DaFoO2Izd3iWK9aDO4h+gpuKF2V33E//Cp4k
         yK6sNBomUQ1o6ATZxDVQKzjEvfBnr8q1qQoqvayNjoZT3GTjRXl3qFyduS6RVYHQ2ore
         TjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Zsjvy1qsrTGnTOxXbEsGYch/GJur+b3ZaPfAaLrOvvY=;
        b=iKalkBxRM2LmXsrz0rD104XxJNHmqueL/RQVOvMEnXRPqvtovp+yVzdafekT0prCVm
         P9ideMeebmXW93YHZHcJaO+McGV0zeEjvZdHg1r1gXJnZ7Tb9xIellLrXza1Juv7BVxG
         +HToRP8CeDc8yc9Kr9jQ4HcNzu0m3tro7/iCK2i4zUTJOP1Y3Iv3xwitDriIwEdlH5wj
         B1vDBbUKiuiwU6XQm7UJTqyehk9fN2qjrq4WQLjIlU7C/70bssj9upAejqi/GAzjUJ2N
         PbwjCk5n+UcVufx65siodX4tIEYQiCb/nGpxWnud7Dd6Yr+aM445l+/h93a3MglblM5M
         +U1Q==
X-Gm-Message-State: AOAM533Gft+YfQO1H6+SKIL5uARbNl6y3i1I/Rnpv9OQz43ILB8WkdH7
	j6ymJAOsg2QQXvM6ZETeLuQe+J6KJ58=
X-Google-Smtp-Source: ABdhPJymYHuzT8ho1hPbc8T3Dco7xUCtNsjHu4dfZMBQnoXoiIsEpgktSm13e1WHP53nVCzi8NQJAQ==
X-Received: by 2002:a05:6402:22c6:: with SMTP id dm6mr46878436edb.228.1626853663992;
        Wed, 21 Jul 2021 00:47:43 -0700 (PDT)
Received: from agape.jhs ([5.171.80.208])
        by smtp.gmail.com with ESMTPSA id k21sm10328265edo.41.2021.07.21.00.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 00:47:43 -0700 (PDT)
Date: Wed, 21 Jul 2021 09:47:41 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org,
	dan.carpenter@oracle.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH resend] staging: rtl8188eu: move all source files from
 core subdirectory
Message-ID: <20210721074740.GA1415@agape.jhs>
References: <20210719224601.255364-1-phil@philpotter.co.uk>
 <7bc43fb0-2dab-190b-c480-9e77cff863d4@lwfinger.net>
 <20210720090035.GB1406@agape.jhs>
 <08a8b372-8ec2-afcc-cc54-305d1dd74a59@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08a8b372-8ec2-afcc-cc54-305d1dd74a59@lwfinger.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hello Larry,

On Tue, Jul 20, 2021 at 07:22:26PM -0500, Larry Finger wrote:
> On 7/20/21 4:00 AM, Fabio Aiuto wrote:
> > maybe the information we will need one day is:
> > 
> > will the core/-os_dep/-hal/-include/-directory-structure be
> > welcomed in mainline wireless subsystem, when an rtl* driver
> > will be perfectly tuned?
> > 
> > At the moment I can't see such a directory organization
> > in any of the realtek wireless driver.
> > 
> > Sure there's time for that;),
> 
> The question is how much lipstick do you want to put on that pig? The
> current version does not use cfg80211, and it does not work with
> NetworkManager or a modern hostapd to create an AP.

yes there's a lot of work to do...

> 
> If you want to get the rtl8188eu driver in shape to be added to the regular
> drivers section, then I suggest you start with the v5.2.2.4 branch of
> https://github.com/lwfinger/rtl8188eu.git. Many users of the RTL8188EU chip
> use that driver. At least that version fixes the two problems listed above.
> If you want to flatten the directory structure, you can do it there and
> offline.

if there's a version closer to mainline (as lwfinger seems to be)
why keeping the actual rtl8188eu on staging instead of the lwfinger one?

> 
> I want to caution you that following this path will take a lot of time, but
> once you get it into kernel shape, it will at least be useful. I have never
> had the time, nor the ambition to undertake this effort.

yes, I understand, it's taking a lot of time with rtl8723bs as well, but
it's a good starting point for kernel newbies

> 
> Larry
> 

thank you,

fabio
