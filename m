Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB3270
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 16:54:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61F31610C7;
	Fri,  9 Apr 2021 16:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617987256;
	bh=6BYqCREsMTupMhpQBxMglMi1SSUzmui8owN4hO2d6qQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ImcCiNXIad0jJkWNwrcKmGLeU6qiMldElVeD59ysCeBvEqoyI5hehOIrI3rWIHlft
	 cDqnlvcpFEkhKWi++6IMBtV5qLt87546HVteu5Zu6eNBrs4AT3LtR7iPhCcG6RsGQb
	 qUDXIDrIpdb9PSdd/k7E7Z9eh7nR6D2hGyn4ZSxjp+5igu0Kmrpvr4wH+YbV/Un2dr
	 ZHqAC8yRHQj8beubuUt83Qi/IKMYXnEx92gXWQVAg16tHnu7C80lYCKEIWMIbDj4Uq
	 R0x394o/Cvdf+b4qDJ3rffi+spWoRNcln6puhxuHvFpWqRBplbPavSU5wtvy84X2y7
	 gJd8v1VQnkSPw==
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210409100250.25922-1-andriy.shevchenko@linux.intel.com>
References: <20210409100250.25922-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] kernel.h: Split out panic and oops helpers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, James E.J. Bottomley <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Christian Borntraeger <borntraeger@de.ibm.com>, David S. Miller <davem@davemloft.net>, Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, H. Peter Anvin <hpa@zytor.com>, K. Y. Srinivasan <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Chris Zankel <chris@zankel.n
 et>, Max Filippov <jcmvbkbc@gmail.com>, Corey Minyard <minyard@acm.org>, Paul Walmsley <paul.walmsley@sifive.com>, Michael Turquette <mturquette@baylibre.com>, Dinh Nguyen <dinguyen@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Alex Elder <elder@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Jens Frederich <jfrederich@gmail.com>, Daniel Drake <dsd@laptop.org>, Jon Nettleton <jon.nettleton@gmail.com>, Eric Biederman <ebiederm@xmission.com>, Josh Triplett <josh@joshtriplett.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, Lui
 s Chamberlain <mcgrof@kernel.org>, Iurii Zaikin <yzaikin@google.com>, Mike Rapoport <rppt@linux.ibm.com>
To: Alexander Egorenkov <egorenar@linux.ibm.com>, Alexander Lobakin <alobakin@pm.me>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <bjorn.andersson@linaro.org>, Christian Brauner <christian.brauner@ubuntu.com>, Corey Minyard <cminyard@mvista.com>, Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Carstens <hca@linux.ibm.com>, Hongbo Yao <yaohongbo@huawei.com>, Jason J. Herne <jjherne@linux.ibm.com>, Joe Perches <joe@perches.com>, Joerg Roedel <jroedel@suse.de>, Kees Cook <keescook@chromium.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Marek Czerski <ma.czerski@gmail.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Michael Ellerman <mpe@ellerman.id.au>, Michael Kelley <mikelley@microsoft.com>, Mihai Carabas <mihai.carabas@oracle.com>, Mike Rapoport <rppt@kernel.org>, Olof Johansson <olof@lixom.net>, Paul E. McKenney <paulmc
 k@kernel.org>, Peter Oberparleiter <oberpar@linux.ibm.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Scott Branden <scott.branden@broadcom.com>, Steven Rostedt (VMware) <rostedt@goodmis.org>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, Wang Wenhu <wenhu.wang@vivo.com>, Wei Liu <wei.liu@kernel.org>, bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, dri-devel@lists.freedesktop.org, kexec@lists.infradead.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-edac@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@v
 ger.kernel.org, linux-s390@vger.kernel.org, linux-staging@lists.linux.dev, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
Date: Fri, 09 Apr 2021 09:54:15 -0700
Message-ID: <161798725520.3790633.11854722005020364662@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1

Quoting Andy Shevchenko (2021-04-09 03:02:50)
> kernel.h is being used as a dump for all kinds of stuff for a long time.
> Here is the attempt to start cleaning it up by splitting out panic and
> oops helpers.
>=20
> There are several purposes of doing this:
> - dropping dependency in bug.h
> - dropping a loop by moving out panic_notifier.h
> - unload kernel.h from something which has its own domain
>=20
> At the same time convert users tree-wide to use new headers, although
> for the time being include new header back to kernel.h to avoid twisted
> indirected includes for existing users.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Kees Cook <keescook@chromium.org>
> Acked-by: Wei Liu <wei.liu@kernel.org>
> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---

>  drivers/clk/analogbits/wrpll-cln28hpc.c       |  4 +

Acked-by: Stephen Boyd <sboyd@kernel.org>
