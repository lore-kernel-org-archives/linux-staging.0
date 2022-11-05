Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DA71FBE
	for <linux-staging@lists.linux.dev>; Sat,  5 Nov 2022 19:31:33 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id m204so8447530oib.6
        for <linux-staging@lists.linux.dev>; Sat, 05 Nov 2022 12:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTlAHc9k7qwIZyOhFoXagieaQq5pwRyAvyi0mAOE5RE=;
        b=jURw19XL/xOvCrYwmv2aWUKdeAoWjP9YO+FTg9LO7kNLGP2qrxnNI/DeaM/hhYlqsP
         YdQYptnzjKsYbbyAKOY5T5QWBhSSLuRj9tx/h3x3Iolz6OENad9xOgpnNTl3bQfF4abr
         IGnRZ+gwoVhjhy8eDyzb76gdYWeTNG8HbYJzf+upnNf3q7GfCqhXHTbMnctQM+lT4ISN
         LgN+zILvYp/x3cxyWSBN67VcIOLSthpIiMe3XVQLxJ5DNQbV3DpA0r2y4Xi6Om/6kI/T
         +bTGJHJtUOpMMkvOkxDlr0Z5JMnZYu43sVpFgzYDCR/HFlqDOFJ8Z5bQFtUlln66Rbqg
         ggdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTlAHc9k7qwIZyOhFoXagieaQq5pwRyAvyi0mAOE5RE=;
        b=KtseZ+KI3rSvyT1z/9DkMWyj5p/HV67qgi6hxfJ2z+yv7rr72a6KKcJPQohCJp/nKi
         uosXZb859dC0Fp5FY56V/x7plSABHsYf+CCGdbMQ/G/TXvwJYJa2LEfpEtWMMBYq1LHy
         6NjbiUscHwF2PBXx0TG1S/H6BozjslCJ9HmJEC18T6JADu3I/x9XOfc4V1jclFjtie+C
         PQVNMflGJzruLWfejC9IjxHaZHpKI71dUnCR7dywpRetjHOaEV29ySkToO3iX+aPKHOz
         OvVdH0XaWrCxH8nQYPIjl5q1/hpTGqetEAz88ixSbeKagSH0b5MjIM/T/RCu8ZCO3Ix3
         GcXw==
X-Gm-Message-State: ACrzQf2bppX9Pkfs+WIiDghcLXHXsHaV/3r63nEMSfqSqgfYrzspAZs2
	acIfzOIXICgjei6EZQ+5B4w=
X-Google-Smtp-Source: AMsMyM7VRYR4ja1354r4nOb4sGsFC9SF+e+FSsFCXSIKNyBk3irIl03bXoaveyKZeBBPlTvKUXlEMQ==
X-Received: by 2002:a05:6808:1708:b0:351:728b:3a03 with SMTP id bc8-20020a056808170800b00351728b3a03mr22106906oib.275.1667676692450;
        Sat, 05 Nov 2022 12:31:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l14-20020a4ac60e000000b00499499a8e18sm834040ooq.5.2022.11.05.12.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 12:31:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 5 Nov 2022 12:31:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Anna-Maria Gleixner <anna-maria@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>, rcu@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-edac@vger.kernel.org,
	cgroups@vger.kernel.org, linux-block@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
	netdev@vger.kernel.org, linux-pm@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bluetooth@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
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
Subject: Re: [PATCH v4a 00/38] timers: Use timer_shutdown*() before freeing
 timers
Message-ID: <20221105193129.GA1487775@roeck-us.net>
References: <20221105060024.598488967@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105060024.598488967@goodmis.org>

On Sat, Nov 05, 2022 at 02:00:24AM -0400, Steven Rostedt wrote:
> 
> Back in April, I posted an RFC patch set to help mitigate a common issue
> where a timer gets armed just before it is freed, and when the timer
> goes off, it crashes in the timer code without any evidence of who the
> culprit was. I got side tracked and never finished up on that patch set.
> Since this type of crash is still our #1 crash we are seeing in the field,
> it has become a priority again to finish it.
> 
> The last version of that patch set is here:
> 
>   https://lore.kernel.org/all/20221104054053.431922658@goodmis.org/
> 
> I'm calling this version 4a as it only has obvious changes were the timer that
> is being shutdown is in the same function where it will be freed or released,
> as this series should be "safe" for adding. I'll be calling the other patches
> 4b for the next merge window.
> 

For the series, as far as my testbed goes:

Build results:
	total: 152 pass: 152 fail: 0
Qemu test results:
	total: 500 pass: 500 fail: 0

No runtime crashes or warnings observed.

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter

