Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA531372
	for <linux-staging@lists.linux.dev>; Mon, 25 Jul 2022 14:39:36 +0000 (UTC)
X-QQ-mid: bizesmtp72t1658759925tes7hwx1
Received: from smtpclient.apple ( [111.193.9.146])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 25 Jul 2022 22:38:43 +0800 (CST)
X-QQ-SSF: 01400000002000B0V000B00A0000000
X-QQ-FEAT: DQ0OCu3gog1JVD1aMWAG4Hzd0HB957q6ScZb3/kq17UDFTyfwdmQb/6ecqjF8
	eE5OIYywqAy6jzuY4FIO9RM5B1GETLurAPOVmaicr7eAxKNEew43TCCsKF17vEim+KlGrqq
	TeaZwBauxmOkQGu2+lIYIdxZiG6lJiwhMgYvNmkKCbjn4fAPvX7KGAqFtyAluaodXwWAEPi
	sMg5MSAXAGwcpOo1g21x2MeU6IUZun5GbFkFq3muAvTkWg8R9f9iIlSjggT+YzW1bYaPsG8
	j1NsDD1kWdoxotEBrFfUTZakTQaJv7Q1USHOOcbkLbZwEhnx7DQ6ps5BSsvI2u//KJsoT4H
	QF6kVQVltNmGV5X2QjhK31quG5gxNfYaaWU2z2MoZolb8af71hdQWnWSbBvlUEkeTqPPuvL
X-QQ-GoodBg: 2
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [PATCH 0/7] USB: cdc: add control and state defines
From: Yan Xinyu <sdlyyxy@bupt.edu.cn>
In-Reply-To: <20220725075841.1187-1-johan@kernel.org>
Date: Mon, 25 Jul 2022 22:38:42 +0800
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>,
 Felipe Balbi <balbi@kernel.org>,
 linux-staging@lists.linux.dev,
 linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <5964CFE8-1B65-4FE2-9154-0F1C079CE916@bupt.edu.cn>
References: <20220725075841.1187-1-johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
X-Mailer: Apple Mail (2.3696.100.31)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:bupt.edu.cn:qybgforeign:qybgforeign4
X-QQ-Bgrelay: 1

> On Jul 25, 2022, at 15:58, Johan Hovold <johan@kernel.org> wrote:
> 
> Several drivers use the control-line and serial-state bitmap values from
> the CDC spec, but there were no matching defines in the global CDC
> (UAPI) header.
> 
> This series adds the missing defines and converts cdc-acm and f_acm to
> use them.
> 
> One staging driver also had an unused set of CDC defines which are
> removed.
> 
> The final patch by Yan Xinyu, which triggered this work, converts the
> usb_wwan driver to use CDC defines instead of hardcoded values in its
> line-control handling.
> 
> Greg, are you ok with me taking these through USB serial (where there
> are a few more drivers that could potentially use them) or do you want
> to take the lot through your tree directly?
> 
> Johan
> 
> 
> Johan Hovold (6):
>  USB: cdc: add control-signal defines
>  USB: cdc: add serial-state defines
>  USB: cdc-acm: use CDC control-line defines
>  USB: cdc-acm: use CDC serial-state defines
>  staging: gdm724x: drop unused CDC defines
>  USB: gadget: f_acm: use CDC defines
> 
> Yan Xinyu (1):
>  USB: serial: usb_wwan: replace DTR/RTS magic numbers with macros
> 
> drivers/staging/gdm724x/gdm_tty.c   |  6 -----
> drivers/usb/class/cdc-acm.c         | 42 ++++++++++++++---------------
> drivers/usb/class/cdc-acm.h         | 20 --------------
> drivers/usb/gadget/function/f_acm.c | 20 ++++----------
> drivers/usb/serial/usb_wwan.c       | 10 ++++---
> include/uapi/linux/usb/cdc.h        | 13 +++++++++
> 6 files changed, 45 insertions(+), 66 deletions(-)
> 
> -- 
> 2.35.1
> 

Thank you so much for spending your time to write this patch series!
And thank you and Greg for your reviews, they are very informative
and educational!

sdlyyxy



