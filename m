Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E072B2F2C
	for <linux-staging@lists.linux.dev>; Sat,  5 Nov 2022 18:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FEEC433D6;
	Sat,  5 Nov 2022 18:05:51 +0000 (UTC)
Date: Sat, 5 Nov 2022 14:05:50 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Stephen Boyd <sboyd@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Anna-Maria Gleixner <anna-maria@linutronix.de>, Andrew Morton
 <akpm@linux-foundation.org>, rcu@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-edac@vger.kernel.org,
 cgroups@vger.kernel.org, linux-block@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org,
 drbd-dev@lists.linbit.com, linux-bluetooth@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 intel-gfx@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-leds@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-ext4@vger.kernel.org,
 linux-nilfs@vger.kernel.org, bridge@lists.linux-foundation.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 lvs-devel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-nfs@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 alsa-devel@alsa-project.org, Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH v4a 00/38] timers: Use timer_shutdown*() before freeing
 timers
Message-ID: <20221105140550.0ccb277c@rorschach.local.home>
In-Reply-To: <20221105140356.6a3da628@rorschach.local.home>
References: <20221105060024.598488967@goodmis.org>
	<CAHk-=wi95dGkg7DiuOZ27gGW+mxJipn9ykB6LHB-HrbbLG6OMQ@mail.gmail.com>
	<20221105123642.596371c7@rorschach.local.home>
	<20221105140356.6a3da628@rorschach.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 5 Nov 2022 14:03:56 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> --- a/drivers/isdn/hardware/mISDN/hfcmulti.c
> +++ b/drivers/isdn/hardware/mISDN/hfcmulti.c
> @@ -4544,7 +4544,7 @@ release_port(struct hfc_multi *hc, struct dchannel *dch)
>  	spin_lock_irqsave(&hc->lock, flags);
>  
>  	if (dch->timer.function) {
> -		del_timer(&dch->timer);
> +		timer_shutdown(&dch->timer);
>  		dch->timer.function = NULL;
>  	}
>  

I still hate the above.

-- Steve
