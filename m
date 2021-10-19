Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145AD2C88
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 13:50:34 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id 21so13684066plo.13
        for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 06:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=7bWCy+vGoiNojSGdNHWw+YkSCdB9FTguHH56bDPVWDY=;
        b=dCDV4cTkPvAkepbo1XKUOOZymMLGdk8CNpIjVYH0kPqaidcZhvkiEHx0wO+5+nGLGa
         34hKRx4yurnSH0fjI2V1TOb6eGcaD3ehgyoGPozzWszpGPX/prGiZx/TSQNondwUMmFy
         iLyirEBoiaQz/a8/Q4Kgbj6ktEa0FwHCV86wYop/npzbWsVIAptACSrQfi4NDYehz5a/
         39vGFMXqHHx9ChrU6iLEVzRYbtJrC6ef1QgB1Z9RJe1WN0zE2Cpep5sZduOzh4GT+Q35
         dSTLg8lRqMbGGcdqrwEhl98awmd+znUb7KLEHQ3yxzROul/cjtAOUrepQ90wwP6AL6Y8
         9CyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7bWCy+vGoiNojSGdNHWw+YkSCdB9FTguHH56bDPVWDY=;
        b=qFe9b38VQButBp1IyfqGtZ2+9inwW+sDr7eVVNx8nG92+Stme5QexSeBtuRN/Foi4w
         AlGp/mmkaBBjmxka4s3Ba6rB6rMSo3bU7caNgcjEf7Bxy2wR41dEBH3RW/zC3QX39Nyd
         VwfQjqi9TcEu9SC6lL8xYtgyDjTmjPLpU5Kgmh0DCbkPV4vzJcQCwWvVzaVIzkzPqoJE
         6AiP9AAO+dsTzl2xRp9ahRe9ZeDqTzl7lAyhRIRKW14kZBNXZjioTcyJxbpI1Nz4BcR0
         d0ThygEnsPHwJqWwS4tJzAqcissTtV7S6t/RtqYWE7VRyZunv4X+/P4b6kx36pBbANhC
         duwA==
X-Gm-Message-State: AOAM533UIq6IkXA+qAKJm5A0Ae+8/HGQeJNQYim5KuYx93Z0GhvS/489
	+RjMAC7/OrCaYjmZH7bsFMc=
X-Google-Smtp-Source: ABdhPJzWKroHyD0TurJgmzojv92Xs3vW6K+DwWKfSDfVngQ8E/Fl4I1WKNlHw2KC9TB5sFLKCqSRgA==
X-Received: by 2002:a17:90a:9292:: with SMTP id n18mr24699pjo.120.1634651433354;
        Tue, 19 Oct 2021 06:50:33 -0700 (PDT)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id m2sm16137077pgd.70.2021.10.19.06.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 06:50:32 -0700 (PDT)
Message-ID: <7550e3359471726cf14572dd4860c238f166dde8.camel@gmail.com>
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
From: Tsuchiya Yuto <kitakar@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Patrik Gfeller <patrik.gfeller@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Yang Yingliang
 <yangyingliang@huawei.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Aline
 Santana Cordeiro <alinesantanacordeiro@gmail.com>, Dinghao Liu
 <dinghao.liu@zju.edu.cn>,  linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev,  linux-kernel@vger.kernel.org, Nable
 <nable.maininbox@googlemail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Fabio Aiuto <fabioaiuto83@gmail.com>, 
 "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>
Date: Tue, 19 Oct 2021 22:50:27 +0900
In-Reply-To: <bc7f699d-d77d-83ad-ce5b-6082f30881c1@redhat.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
	 <bc7f699d-d77d-83ad-ce5b-6082f30881c1@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 2021-10-18 at 09:48 +0200, Hans de Goede wrote:
> <Added some more people to the Cc who are also definitely interested in this>

[removed Alan from Cc as not reachable]

As I also mentioned on another thread, sorry, I failed to add people
to Cc who I should have definitly added...

And I might have sent all of the emails to people who I should not
by blindly using `scripts/get_maintainer.pl` for the first patch with
`--cc-cmd`...

Sorry if that's the case for some of you...

> Hi Tsuchiya,
> 
> On 10/17/21 18:19, Tsuchiya Yuto wrote:
> > Hi all,
> > 
> > This patch series contains fixes for atomisp to work (again). Tested on
> > Microsoft Surface 3 (Windows) and Xiaomi Mi Pad 2 (Android model) with
> > v5.15-rc5. Both are Cherry Trail (ISP2401) devices.
> > 
> > I'm still not used to Linux patch sending flow. Sorry in advance
> > if there is some weirdness :-) but I did my best.
> 
> You actually did pretty good AFAICT.
> 
> Also thank you so much for working on this. Finally getting working
> atomisp2 support is awesome!
> 
> I actually have been working on and off on this myself
> (even did a bit of work on it this weekend).

Thanks! and I'm glad you're also interested in this!

> 1. Find android (5.1) x86 kernel sources which I can build from
> source and get a working Android (on a device with Android pre-installed)
> with a kernel build from source -> Done
> 
> 2. Get a regular Linux distro to boot with the kernel from 1. -> Done
>    (normal Linux v4l2 utils do not give a picture, might be the need
>     to set preview mode)
> 
> 3. Add ioctl debugging to the kernel from 1. capture a trace to see what
> Android userspace is doing -> Done .  See here for an example log:
> 
> https://fedorapeople.org/~jwrdegoede/atomisp-logs-t116/
> 
> 4. Write a userspace utility mimicking Android userspace, I started on
> this this weekend

What I did is rather, as soon as I set up chroot environment on Android
kernel (mipad2), I gave up writing userspace tools by myself and searched
for an existing ones :D

> 5. Once I've 4. working the plan was a bit vague, the idea was to see if
> I could use that to quickly get the mainline staging version to work; or
> alternatively forward port the working Android kernel sources to
> mainline from scratch.
> 
> But it looks like 4 and 5 will no longer be necessary, which is awesome,
> thank you so much!
> 
> I'll try to look into this series in more detail; and try to get thing
> working on one of my own devices when I can make some time for this.

Thanks. It's great if this series is tested by many upstream devs.

> 
> > 
> > [...]
> > 
> > One of the issues on the upstreamed atomisp is, the driver is a result
> > of the following two different versions of driver merged by tools using
> > `ifdef ISP2401`:
> > 
> >     - ISP2400: irci_stable_candrpv_0415_20150521_0458
> >     - ISP2401: irci_master_20150911_0724
> > 
> > and we don't have such firmware made for irci_master_20150911_0724.
> 
> Right this is something which I also noticed (but I did not do anything with /
> about yet)
> 
> > I confirmed that the driver version irci_stable_candrpv_0415_20150521_0458
> > works well on the intel-aero version atomisp for ISP2401, too.
> 
> "irci_stable_candrpv_0415_20150521_0458" is also the version of the atomisp
> firmware shipped in CHT tablets which come with Android pre-installed. So
> I agree that this is the version which we should go for.

OK.

> > [...]
> > 
> >   ## for mipad2 (and whiskey cove pmic based devices)
> > 
> > For devices which equip whiskey cove PMIC, you need to add non-upstream
> > regulator driver [1].
> > 
> > [1] work done by jekhor, which seems to be from intel-aero or old
> >     Android kernel
> >     https://github.com/jekhor/yogabook-linux-kernel/commit/11c05b365fb2eeb4fced5aa66b362c511be32a34
> >     ("intel_soc_pmic_chtwc: Add regulator driver and definition for VPROG1B")
> 
> Interesting I recently bought a 2nd hand mipad2 myself too. I still need
> to put Linux on there. I'm definitely motivated to do that now :)

I'm glad to hear that you also got a mipad2 :) It might be a interesting
device to look into. It even won't boot without nomodeset, no battery
charging/status on mainline kernel.

By the way, instead of adding whiskey cove regulator driver, we may also
add a "hack" like the other PMIC in atomisp_gmin_platform to control
regulators [1].

It seems that to do so, it needs to "read" value from the PMIC before
writing. So, I'm not sure if this can be achieved easily with the current
mainline kernel though.

[1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/commit/6204d4b7aeefc4db622f8ac57b87bf2c76c6c8aa
    ("atomisp_platform: add whiskey cove pmic support")

Regards,
Tsuchiya Yuto

