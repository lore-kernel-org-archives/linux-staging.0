Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6017C
	for <linux-staging@lists.linux.dev>; Sat,  5 Nov 2022 21:22:01 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id r10-20020a4aa2ca000000b0049dd7ad4128so1119372ool.13
        for <linux-staging@lists.linux.dev>; Sat, 05 Nov 2022 14:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oAUSnUna3zS1fBFrtEIiCL0CSikhXV9H9gl4bxAoOlg=;
        b=ZuJIeLB+J2B+Wi1b1yHoLdNdJG615BQeh3CPU6LD93y3msmDVTjWdZW9SDWuwWG0Ca
         YhJ+P7666j6kD5Xt3qGOHQOk6MqT4dr6x8NEoIAvnzfrmsju0oEob+uN+nSjB06pGmVE
         9YOPL0fQ+TfTab0XaBhkdWiy9kYH1H39RsusA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAUSnUna3zS1fBFrtEIiCL0CSikhXV9H9gl4bxAoOlg=;
        b=HJ07ycSFQwf3xpSQ2qm610EZIQVhYYg5CpaHlZnki8sBlJLM1GADyHFS4rgYZPSm5b
         +BIfBXYQAVJ0rCzIM7lUyEJw65Bslc0TIkvjgFOcEVcTTq0xrLRA/a0bLGfpL4qU5Y70
         iaSWzYLaOMnZ4DcgQ7v+marE9AsrLlQYuDnAbdA/13gJNPm4CJ+t2Occ59XbEUzIMW+v
         OU+fK2RMgRUs0fauSbzHnrPfRvgBxqx8pVT6j0aaoRYnPZExM/PDuYBoAP3v2ggjHFmU
         9Ss/UIwmE3MbTuCYvggii88gieRfuCjl11fyWUvOQQvf7pOqg5GubfLIr76dTvDT6r3K
         r1/g==
X-Gm-Message-State: ACrzQf27rUce/05b0Ahamw5+f+mq5Q2f18caoyz3UXXRLvbiMjr3hQJx
	fXjfregjZzPEC5RoPOxSQ9v1cgB+g7yGzA==
X-Google-Smtp-Source: AMsMyM7C3qI6zRmj8t3iMWg0b8tsUCaMAYVuXOYo9PEaSM+/EwC+XYXlt7USuxPQGJvYnPKWYJi2jg==
X-Received: by 2002:a4a:ab4f:0:b0:461:5f70:cf15 with SMTP id j15-20020a4aab4f000000b004615f70cf15mr18033346oon.67.1667683320834;
        Sat, 05 Nov 2022 14:22:00 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id g64-20020aca3943000000b00354948e04e4sm1019898oia.2.2022.11.05.14.22.00
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Nov 2022 14:22:00 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id j25-20020a056830015900b0066ca2cd96daso986303otp.10
        for <linux-staging@lists.linux.dev>; Sat, 05 Nov 2022 14:22:00 -0700 (PDT)
X-Received: by 2002:a05:6902:1352:b0:6bb:3f4b:9666 with SMTP id
 g18-20020a056902135200b006bb3f4b9666mr38314227ybu.101.1667682810745; Sat, 05
 Nov 2022 14:13:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221105060024.598488967@goodmis.org> <CAHk-=wi95dGkg7DiuOZ27gGW+mxJipn9ykB6LHB-HrbbLG6OMQ@mail.gmail.com>
 <20221105123642.596371c7@rorschach.local.home> <Y2bPlllkHo5DUmLY@zx2c4.com>
In-Reply-To: <Y2bPlllkHo5DUmLY@zx2c4.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Nov 2022 14:13:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjkkomrdcrAxxFijs-Lih6vHze+A2TgM+v7-Z7ZkXT+WA@mail.gmail.com>
Message-ID: <CAHk-=wjkkomrdcrAxxFijs-Lih6vHze+A2TgM+v7-Z7ZkXT+WA@mail.gmail.com>
Subject: Re: [PATCH v4a 00/38] timers: Use timer_shutdown*() before freeing timers
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Anna-Maria Gleixner <anna-maria@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, rcu@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-edac@vger.kernel.org, cgroups@vger.kernel.org, 
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

On Sat, Nov 5, 2022 at 2:03 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Something that might help here is changing the `...` into
> `... when exists` or into `... when != ptr` or similar.

I actually tried that.

You don't want "when exists", you'd want "when forall", but that seems
to be the default.

And trying "when != ptr->timer" actually does the right thing in that
it gets rid of the case where the timer is modified outside of the
del_timer() case, *but* it also causes odd other changes to the
output.

Look at what it generates for that

   drivers/media/usb/pvrusb2/pvrusb2-hdw.c

file, which finds a lot of triggers with the "when !=  ptr->timer",
but only does one without it.

So I gave up, just because I clearly don't understand the rules.

(Comparing output is also fun because the ordering of the patches is
random, so consecutive runs with the same rule will give different
patches. I assume that it's just because it's done in parallel, but it
doesn't help the "try to see what changes when you change the script"
;)

                 Linus
