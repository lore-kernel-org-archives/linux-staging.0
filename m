Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD048F63
	for <linux-staging@lists.linux.dev>; Fri, 23 Dec 2022 15:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F15C433D2;
	Fri, 23 Dec 2022 15:41:15 +0000 (UTC)
Date: Fri, 23 Dec 2022 10:41:13 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner
 <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Anna-Maria Gleixner
 <anna-maria@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, linux-sh@vger.kernel.org,
 cgroups@vger.kernel.org, linux-block@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 netdev@vger.kernel.org, drbd-dev@lists.linbit.com,
 linux-bluetooth@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 SHA-cyfmac-dev-list@infineon.com, linux-scsi@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-ext4@vger.kernel.org,
 linux-nilfs@vger.kernel.org, bridge@lists.linux-foundation.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 lvs-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, alsa-devel@alsa-project.org
Subject: Re: [PATCH] treewide: Convert del_timer*() to timer_shutdown*()
Message-ID: <20221223104113.0bc8d37f@gandalf.local.home>
In-Reply-To: <20221220134519.3dd1318b@gandalf.local.home>
References: <20221220134519.3dd1318b@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Dec 2022 13:45:19 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> [
>   Linus,
> 
>     I ran the script against your latest master branch:
>     commit b6bb9676f2165d518b35ba3bea5f1fcfc0d969bf
> 
>     As the timer_shutdown*() code is now in your tree, I figured
>     we can start doing the conversions. At least add the trivial ones
>     now as Thomas suggested that this gets applied at the end of the
>     merge window, to avoid conflicts with linux-next during the
>     development cycle. I can wait to Friday to run it again, and
>     resubmit.
> 
>     What is the best way to handle this?
> ]

Note, I just did a git remote update, checked out the latest, re-ran the
script, and this patch hasn't changed.

-- Steve
