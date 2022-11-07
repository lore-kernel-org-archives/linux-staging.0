Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFCC28E2
	for <linux-staging@lists.linux.dev>; Mon,  7 Nov 2022 10:54:55 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1667818024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qnhu/C4/dTNGh+9YxTAUPF0AHXOgpdZiA4TofS1TDao=;
	b=m8gFAB2FYV5B4BIkkbSCrPl5kngI1vwmC89wOqBJ/q73+RRLDUvN8153YBd0ancpYaUudU
	+fTzmJoLwRrrXw9ulhVtc41yRIMLNrOmB9kVLUOAn2xwOs861TQYPTmwfVqoXOpGOLsPn5
	hNBacxD9XN6Mi6tXS/NIbwjqzso2C6oqm6/L/mt2cpmfqfHELnCL8o8Pn38Ir7+eD8OVqk
	Lj3kRr5Ls1MIF7+wsJc3Ym/BQIZf8UhWrd8aE7FpoY/qhjIfIvELeoa8/ZXUqY5eKhjinO
	ZF4FT08X0F8jeyihKYji9kBCreFY8X9nEznXEcECfWmIcYVRm4zXH9JmYOmiiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1667818024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qnhu/C4/dTNGh+9YxTAUPF0AHXOgpdZiA4TofS1TDao=;
	b=bzVvnuX1mysTSSrkmkIGsLumN3FZV+biUwiIDeLZdScudMhEXojJ3c4U7ytkUdHNPdLCjD
	NbhAMzPLE4OU4lBA==
To: Steven Rostedt <rostedt@goodmis.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Anna-Maria Gleixner
 <anna-maria@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-block@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org,
 drbd-dev@lists.linbit.com, linux-bluetooth@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-media@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-ext4@vger.kernel.org, linux-nilfs@vger.kernel.org,
 bridge@lists.linux-foundation.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, lvs-devel@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-nfs@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] treewide: timers: Use timer_shutdown*() before
 freeing timers
In-Reply-To: <20221106223256.4bbdb018@rorschach.local.home>
References: <20221106223256.4bbdb018@rorschach.local.home>
Date: Mon, 07 Nov 2022 11:47:04 +0100
Message-ID: <87pmdzvy6v.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Linus,

On Sun, Nov 06 2022 at 22:32, Steven Rostedt wrote:
> As discussed here:
>
>   https://lore.kernel.org/all/20221106212427.739928660@goodmis.org/

Please hold off. It's only nits, but tip has documented rules and random
pull requests are not making them go away.

Thanks,

        tglx
