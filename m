Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047AB7E
	for <linux-staging@lists.linux.dev>; Sat,  5 Mar 2022 10:57:50 +0000 (UTC)
Received: from dslb-084-059-247-134.084.059.pools.vodafone-ip.de ([84.59.247.134] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <postmaster@kaiser.cx>)
	id 1nQS6X-0005hR-Fm; Sat, 05 Mar 2022 11:57:41 +0100
Received: from martin by martin-debian-2.paytec.ch with local (Exim 4.94.2)
	(envelope-from <martin@martin-debian-2.paytec.ch>)
	id 1nQS6W-005djc-Lh; Sat, 05 Mar 2022 11:57:40 +0100
Date: Sat, 5 Mar 2022 11:57:40 +0100
From: Martin Kaiser <lists@kaiser.cx>
To: Qing Wang <wangqing@vivo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] r8188eu: core: use time_is_after_eq_jiffies() instead of
 open coding it
Message-ID: <YiNCJFFLPcD+aGnr@martin-debian-1.paytec.ch>
References: <1646018092-61367-1-git-send-email-wangqing@vivo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1646018092-61367-1-git-send-email-wangqing@vivo.com>
Sender: "Martin Kaiser,,," <martin@martin-debian-2.paytec.ch>

Hi,

Thus wrote Qing Wang (wangqing@vivo.com):

> From: Wang Qing <wangqing@vivo.com>

> Use the helper function time_is_{before,after}_jiffies() to improve
> code readability.

> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  drivers/staging/r8188eu/core/rtw_pwrctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
> index 46e44ae..9894abb
> --- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
> +++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
> @@ -102,7 +102,7 @@ static bool rtw_pwr_unassociated_idle(struct adapter *adapter)
>  	struct wifidirect_info	*pwdinfo = &adapter->wdinfo;
>  	bool ret = false;

> -	if (adapter->pwrctrlpriv.ips_deny_time >= jiffies)
> +	if (time_is_after_eq_jiffies(adapter->pwrctrlpriv.ips_deny_time))
>  		goto exit;

>  	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE | WIFI_SITE_MONITOR) ||
> -- 
> 2.7.4


This doesn't compile on my system:

  CC [M]  drivers/staging/r8188eu/core/rtw_p2p.o
In file included from ./include/linux/irqflags.h:15,
                 from ./arch/arm/include/asm/atomic.h:14,
                 from ./include/linux/atomic.h:7,
                 from ./include/linux/rcupdate.h:25,
                 from ./include/linux/rculist.h:11,
                 from ./include/linux/sched/signal.h:5,
                 from drivers/staging/r8188eu/core/../include/osdep_service.h:7,
                 from drivers/staging/r8188eu/core/rtw_pwrctrl.c:6:
drivers/staging/r8188eu/core/rtw_pwrctrl.c: In function ‘rtw_pwr_unassociated_idle’:
./include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
   12 |         (void)(&__dummy == &__dummy2); \
      |                         ^~
./include/linux/jiffies.h:111:10: note: in expansion of macro ‘typecheck’
  111 |         (typecheck(unsigned long, a) && \
      |          ^~~~~~~~~
./include/linux/jiffies.h:114:33: note: in expansion of macro ‘time_after_eq’
  114 | #define time_before_eq(a,b)     time_after_eq(b,a)
      |                                 ^~~~~~~~~~~~~
./include/linux/jiffies.h:166:37: note: in expansion of macro ‘time_before_eq’
  166 | #define time_is_after_eq_jiffies(a) time_before_eq(jiffies, a)
      |                                     ^~~~~~~~~~~~~~
drivers/staging/r8188eu/core/rtw_pwrctrl.c:92:13: note: in expansion of macro ‘time_is_after_eq_jiffies’
   92 |         if (time_is_after_eq_jiffies(adapter->pwrctrlpriv.ips_deny_time))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~



time_is_after_eq_jiffies checks at compile time that its argument is
unsigned long but ips_deny_time is u32 in the r8188eu driver.

We should change ips_deny_time to unsigned long, the rtl8723bs driver did
this as well. ips_deny_time is used in these places

  11     92  drivers/staging/r8188eu/core/rtw_pwrctrl.c <<rtw_pwr_unassociated_idle>>
             if (adapter->pwrctrlpriv.ips_deny_time >= jiffies)
  12    363  drivers/staging/r8188eu/core/rtw_pwrctrl.c <<_rtw_pwr_wakeup>>
             if (pwrpriv->ips_deny_time < jiffies + rtw_ms_to_systime(ips_deffer_ms))
  13    364  drivers/staging/r8188eu/core/rtw_pwrctrl.c <<_rtw_pwr_wakeup>>
             pwrpriv->ips_deny_time = jiffies + rtw_ms_to_systime(ips_deffer_ms);
  14    399  drivers/staging/r8188eu/core/rtw_pwrctrl.c <<_rtw_pwr_wakeup>>
             if (pwrpriv->ips_deny_time < jiffies + rtw_ms_to_systime(ips_deffer_ms))
  15    400  drivers/staging/r8188eu/core/rtw_pwrctrl.c <<_rtw_pwr_wakeup>>
             pwrpriv->ips_deny_time = jiffies + rtw_ms_to_systime(ips_deffer_ms);

rtw_ms_to_systime converts milliseconds to jiffies and returns u32. We
should use msecs_to_jiffies instead, this functions returns unsigned long.

Do you want to have a go at this?

Best regards,

   Martin
