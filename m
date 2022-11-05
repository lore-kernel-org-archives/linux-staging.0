Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C7E2591
	for <linux-staging@lists.linux.dev>; Sat,  5 Nov 2022 14:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51DE4C433C1;
	Sat,  5 Nov 2022 14:47:32 +0000 (UTC)
Date: Sat, 5 Nov 2022 10:47:30 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>,
 Stephen Boyd <sboyd@kernel.org>, Anna-Maria Gleixner
 <anna-maria@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>,
 rcu@vger.kernel.org, linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
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
 alsa-devel@alsa-project.org
Subject: Re: [PATCH v4a 00/38] timers: Use timer_shutdown*() before freeing
 timers
Message-ID: <20221105104730.2bfd6740@rorschach.local.home>
In-Reply-To: <20221105141817.GF1606271@roeck-us.net>
References: <20221105060024.598488967@goodmis.org>
	<20221105141817.GF1606271@roeck-us.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 5 Nov 2022 07:18:17 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> Just in case you didn't notice:
> 
> Looking through the resulting code, I think some of the remaining
> calls to del_singleshot_timer_sync() can be converted as well.
> 
> The calls in drivers/staging/wlan-ng/prism2usb.c:prism2sta_disconnect_usb()
> are obvious (the containing data structure is freed in the same function).
> For drivers/char/tpm/tpm-dev-common.c:tpm_common_release(), the containing
> data structure is freed in the calling code.

Well, actually it is. In patch 5/38:

-#define del_singleshot_timer_sync(t) del_timer_sync(t)
+#define del_singleshot_timer_sync(t) timer_shutdown_sync(t)

This was the reason for patch 1. It was the only user of that function
that reused the timer after calling that function.

-- Steve
