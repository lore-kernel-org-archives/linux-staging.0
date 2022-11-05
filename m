Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6522FAF
	for <linux-staging@lists.linux.dev>; Sat,  5 Nov 2022 16:00:05 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id l9so4983084qkk.11
        for <linux-staging@lists.linux.dev>; Sat, 05 Nov 2022 09:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GP8p4dRzNVpyUotOfaypMmYTGE9lsMcq6qB3gjhmc04=;
        b=iIDJL03zNkH0lS9YORaCB4Nnx18G1RT5PAxkqTBkren7bOYLdVGnhhilx+OlS481lw
         gQr71gF/2R0QtX/qOni1Pt9vrqOkIr43rj0MZrH/uG69dzQgSBZeGC3nRHzTa1HEb5Zv
         OhEAlIPPkZmfK8ER3fSUpMd0BmaBeM97bdw94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GP8p4dRzNVpyUotOfaypMmYTGE9lsMcq6qB3gjhmc04=;
        b=pNR8mO9465jQtkNAzp53sr4li6SJhKkGmOV4dUW11h8N7c9O2AiWtgE4XhntkpMWNi
         S8+lURc4Dj+sWNH+8xOYDShR45LbpkALma7S0rGq9trxWFn2NKRCp9B5iMyOcif3Hvee
         BSwEYhb1pm/605tO9dV+HqzIJ1eeGUpht7+8zoRTIp5XMvozEuSqu+bjO7/N4rIiq/JM
         8jrn+D6W7HRwVv2KEoXBMXXqFtVCEycOgE7HmOTN+Odks/dWyACqOIyFJCtDJdlS2G8D
         OxOig0N0cx0riURgPO4+IWZY9J+7B0aOTGD0CRRPRarz8qAGlwWzo7se/GNr+WI9stEZ
         hdYQ==
X-Gm-Message-State: ACrzQf3Y3lzyWzWJrz69QCX4fAWP9lJZoTiN6MWF1tllhSF1e6JZg8ew
	neVXz5zdFaSlfmO8GvscRAB9qD/CJa8+uw==
X-Google-Smtp-Source: AMsMyM4FS4+1UqBHvggZyYxTTAl0hNr2gTsVFEVpdMotPSCcZoePD4EpA0aTrV9mq5DlVW9p5ja9Iw==
X-Received: by 2002:a37:42d0:0:b0:6e2:2b6d:e319 with SMTP id p199-20020a3742d0000000b006e22b6de319mr453692qka.298.1667664004587;
        Sat, 05 Nov 2022 09:00:04 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id x18-20020a05620a259200b006e42a8e9f9bsm2099955qko.121.2022.11.05.09.00.03
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Nov 2022 09:00:04 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-3691e040abaso68667417b3.9
        for <linux-staging@lists.linux.dev>; Sat, 05 Nov 2022 09:00:03 -0700 (PDT)
X-Received: by 2002:a81:114e:0:b0:36a:fc80:fa62 with SMTP id
 75-20020a81114e000000b0036afc80fa62mr40431421ywr.58.1667663992806; Sat, 05
 Nov 2022 08:59:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221105060024.598488967@goodmis.org>
In-Reply-To: <20221105060024.598488967@goodmis.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Nov 2022 08:59:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi95dGkg7DiuOZ27gGW+mxJipn9ykB6LHB-HrbbLG6OMQ@mail.gmail.com>
Message-ID: <CAHk-=wi95dGkg7DiuOZ27gGW+mxJipn9ykB6LHB-HrbbLG6OMQ@mail.gmail.com>
Subject: Re: [PATCH v4a 00/38] timers: Use timer_shutdown*() before freeing timers
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Stephen Boyd <sboyd@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Anna-Maria Gleixner <anna-maria@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, 
	rcu@vger.kernel.org, linux-doc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-edac@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, 
	linux-pm@vger.kernel.org, drbd-dev@lists.linbit.com, 
	linux-bluetooth@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org, 
	linux-input@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-leds@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-ext4@vger.kernel.org, linux-nilfs@vger.kernel.org, 
	bridge@lists.linux-foundation.org, netfilter-devel@vger.kernel.org, 
	coreteam@netfilter.org, lvs-devel@vger.kernel.org, 
	linux-afs@lists.infradead.org, linux-nfs@vger.kernel.org, 
	tipc-discussion@lists.sourceforge.net, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 4, 2022 at 11:01 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Patch 1 fixes an issue with sunrpc/xprt where it incorrectly uses
> del_singleshot_timer_sync() for something that is not a oneshot timer. As this
> will be converted to shutdown, this needs to be fixed first.

So this is the kind of thing that I would *not* want to get eartly.

I really would want to get just the infrastructure in to let people
start doing conversions.

And then the "mindlessly obvious patches that are done by scripting
and can not possibly matter".

The kinds that do not *need* review, because they are mechanical, and
that just cause pointless noise for the rest of the patches that *do*
want review.

Not this kind of thing that is so subtle that you have to explain it.
That's not a "scripted patch for no semantic change".

So leave the del_singleshot_timer_sync() cases alone, they are
irrelevant for the new infrastructure and for the "mindless scripted
conversion" patches.

> Patches 2-4 changes existing timer_shutdown() functions used locally in ARM and
> some drivers to better namespace names.

Ok, these are relevant.

> Patch 5 implements the new timer_shutdown() and timer_shutdown_sync() functions
> that disable re-arming the timer after they are called.

This is obviously what I'd want early so that people can start doign
this in their trees.

> Patches 6-28 change all the locations where there's a kfree(), kfree_rcu(),
> kmem_cache_free() and one call_rcu() call where the RCU function frees the
> timer (the workqueue patch) in the same function as the del_timer{,_sync}() is
> called on that timer, and there's no extra exit path between the del_timer and
> freeing of the timer.

So honestly, I was literally hoping for a "this is the coccinelle
script" kind of patch.

Now there seems to be a number of patches here that are actualyl
really hard to see that they are "obviously correct" and I can't tell
if they are actually scripted or not.

They don't *look* scripted, but I can't really tell.  I looked at the
patches with ten lines of context, and I didn't see the immediately
following kfree() even in that expanded patch context, so it's fairly
far away.

Others in the series were *definitely* not scripted, doing clearly
manual cleanups:

-    if (dch->timer.function) {
-        del_timer(&dch->timer);
-        dch->timer.function = NULL;
-    }
+    timer_shutdown(&dch->timer);

so no, this does *not* make me feel "ok, this is all trivial".

IOW, I'd really want *just* the infrastructure and *just* the provably
trivial stuff. If it wasn't some scripted really obvious thing that
cannot possibly change anything and that wasn't then edited manually
for some reason, I really don't want it early.

IOW, any early conversions I'd take are literally about removing pure
mindless noise. Not about doing conversions.

And I wouldn't mind it as a single conversion patch that has the
coccinelle script as the explanation.

Really just THAT kind of "100% mindless conversion".

               Linus
