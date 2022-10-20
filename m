Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A735E7E;
	Thu, 20 Oct 2022 09:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Wcfx1hC8DZ/1PbfFC7gOwR0jlSOsPZPDU6vogroyus4=;
  b=WZDWp5kt+eiMlJ6CawBFRtNu5w4b61XL059OOACkkDH3bq3HMt8mHZJp
   W1fLkgzFP/fAPD8IiCGkX5E51bArSF8+JBOjQLxt1yiaCXxIaRNcMJVgS
   TERq3SA8oARdQuuwJQagCW372GjNe9LWH0rm43rPbM//RnKql51kYrVvN
   U=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,198,1661810400"; 
   d="scan'208";a="66129322"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 11:17:22 +0200
Date: Thu, 20 Oct 2022 11:17:21 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Deepak R Varma <drv@mailo.com>
cc: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net, 
    phil@philpotter.co.uk, paskripkin@gmail.com, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
    kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: Re: [PATCH v3 06/10] staging: r8188eu: Add space between function
 & macro parameters
In-Reply-To: <79e0aa96b1c8b2bc0c0f8ef9e651ab254629c7a8.1666249716.git.drv@mailo.com>
Message-ID: <114d7521-a15-9569-cb38-69f4bb8990f7@inria.fr>
References: <cover.1666249715.git.drv@mailo.com> <79e0aa96b1c8b2bc0c0f8ef9e651ab254629c7a8.1666249716.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 20 Oct 2022, Deepak R Varma wrote:

> Space required between function and macro parameters to improve code
> readability. This Linux kernel coding style guideline resolves following
> error reported by checkpatch script:
> 	ERROR: space required after that ',' (ctx:VxV)
>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>
> Changes in v3:
>    1. Patch newly added to the patch set.
>
>
>
>  .../staging/r8188eu/include/osdep_service.h   |  4 +--
>  .../staging/r8188eu/include/rtl8188e_hal.h    |  2 +-
>  drivers/staging/r8188eu/include/rtw_cmd.h     |  4 +--
>  drivers/staging/r8188eu/include/rtw_io.h      | 28 +++++++++----------
>  4 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
> index 72990a1cdc66..ec2631455f08 100644
> --- a/drivers/staging/r8188eu/include/osdep_service.h
> +++ b/drivers/staging/r8188eu/include/osdep_service.h
> @@ -53,7 +53,7 @@ static inline struct list_head *get_list_head(struct __queue *queue)
>  	return (&(queue->queue));
>  }
>
> -static inline void _set_timer(struct timer_list *ptimer,u32 delay_time)
> +static inline void _set_timer(struct timer_list *ptimer, u32 delay_time)
>  {
>  	mod_timer(ptimer, jiffies + msecs_to_jiffies(delay_time));
>  }
> @@ -108,7 +108,7 @@ void rtw_free_netdev(struct net_device *netdev);
>  #define FUNC_ADPT_FMT "%s(%s)"
>  #define FUNC_ADPT_ARG(adapter) __func__, adapter->pnetdev->name
>
> -#define rtw_signal_process(pid, sig) kill_pid(find_vpid((pid)),(sig), 1)
> +#define rtw_signal_process(pid, sig) kill_pid(find_vpid((pid)), (sig), 1)
>
>  /* Macros for handling unaligned memory accesses */
>
> diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
> index 25f9200b1151..577cd3f4f797 100644
> --- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
> +++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
> @@ -165,7 +165,7 @@ void Hal_ReadTxPowerInfo88E(struct adapter *padapter, u8 *hwinfo,
>
>  void rtl8188e_EfuseParseChnlPlan(struct adapter *padapter, u8 *hwinfo,
>  				 bool AutoLoadFail);
> -void Hal_ReadAntennaDiversity88E(struct adapter *pAdapter,u8 *PROMContent,
> +void Hal_ReadAntennaDiversity88E(struct adapter *pAdapter, u8 *PROMContent,
>  				 bool AutoLoadFail);
>  void Hal_ReadThermalMeter_88E(struct adapter *	dapter, u8 *PROMContent,
>  			      bool AutoloadFail);
> diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
> index d0d6c53e2aa7..e47382ac64a0 100644
> --- a/drivers/staging/r8188eu/include/rtw_cmd.h
> +++ b/drivers/staging/r8188eu/include/rtw_cmd.h
> @@ -740,7 +740,7 @@ u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infra n
>  u8 rtw_setdatarate_cmd(struct adapter  *padapter, u8 *rateset);
>  u8 rtw_setrfintfs_cmd(struct adapter  *padapter, u8 mode);
>
> -u8 rtw_gettssi_cmd(struct adapter  *padapter, u8 offset,u8 *pval);
> +u8 rtw_gettssi_cmd(struct adapter  *padapter, u8 offset, u8 *pval);
>  u8 rtw_setfwdig_cmd(struct adapter*padapter, u8 type);
>  u8 rtw_setfwra_cmd(struct adapter*padapter, u8 type);

Strange double space.

>
> @@ -751,7 +751,7 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *adapter);
>  u8 rtw_lps_ctrl_wk_cmd(struct adapter*padapter, u8 lps_ctrl_type, u8 enqueue);
>  u8 rtw_rpt_timer_cfg_cmd(struct adapter*padapter, u16 minRptTime);
>
> - u8 rtw_antenna_select_cmd(struct adapter*padapter, u8 antenna,u8 enqueue);
> + u8 rtw_antenna_select_cmd(struct adapter*padapter, u8 antenna, u8 enqueue);

Missing space before *.

>  u8 rtw_ps_cmd(struct adapter*padapter);
>
>  u8 rtw_chk_hi_queue_cmd(struct adapter*padapter);
> diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
> index 925c7967ac04..87fcf6c94ff3 100644
> --- a/drivers/staging/r8188eu/include/rtw_io.h
> +++ b/drivers/staging/r8188eu/include/rtw_io.h
> @@ -209,7 +209,7 @@ struct io_priv {
>  };
>
>  uint ioreq_flush(struct adapter *adapter, struct io_queue *ioqueue);
> -void sync_ioreq_enqueue(struct io_req *preq,struct io_queue *ioqueue);
> +void sync_ioreq_enqueue(struct io_req *preq, struct io_queue *ioqueue);
>  uint sync_ioreq_flush(struct adapter *adapter, struct io_queue *ioqueue);
>  uint free_ioreq(struct io_req *preq, struct io_queue *pio_queue);
>  struct io_req *alloc_ioreq(struct io_queue *pio_q);
> @@ -285,18 +285,18 @@ void bus_sync_io(struct io_queue *pio_q);
>  u32 _ioreq2rwmem(struct io_queue *pio_q);
>  void dev_power_down(struct adapter *Adapter, u8 bpwrup);
>
> -#define PlatformEFIOWrite1Byte(_a,_b,_c)		\
> -	rtw_write8(_a,_b,_c)
> -#define PlatformEFIOWrite2Byte(_a,_b,_c)		\
> -	rtw_write16(_a,_b,_c)
> -#define PlatformEFIOWrite4Byte(_a,_b,_c)		\
> -	rtw_write32(_a,_b,_c)
> -
> -#define PlatformEFIORead1Byte(_a,_b)		\
> -		rtw_read8(_a,_b)
> -#define PlatformEFIORead2Byte(_a,_b)		\
> -		rtw_read16(_a,_b)
> -#define PlatformEFIORead4Byte(_a,_b)		\
> -		rtw_read32(_a,_b)
> +#define PlatformEFIOWrite1Byte(_a, _b, _c)		\
> +	rtw_write8(_a, _b, _c)
> +#define PlatformEFIOWrite2Byte(_a, _b, _c)		\
> +	rtw_write16(_a, _b, _c)
> +#define PlatformEFIOWrite4Byte(_a, _b, _c)		\
> +	rtw_write32(_a, _b, _c)
> +
> +#define PlatformEFIORead1Byte(_a, _b)		\
> +		rtw_read8(_a, _b)
> +#define PlatformEFIORead2Byte(_a, _b)		\
> +		rtw_read16(_a, _b)
> +#define PlatformEFIORead4Byte(_a, _b)		\
> +		rtw_read32(_a, _b)

Could these be inline functions?

julia
