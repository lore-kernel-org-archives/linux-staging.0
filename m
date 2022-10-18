Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7153A4C72;
	Tue, 18 Oct 2022 17:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666113977; x=1697649977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LSNpDELmghCpJxoRxEfeo1nnKFOQrGzqCjXSQCEcT4Q=;
  b=f4RYgmAaRvm+gNGnO0qngOKCJzSE/iDmqTUoqebNgutfyKfmuCWMbB0q
   SzN0Kw7dIzYXneW3VUIa/kgeNpp9/nHysZ0NABerPfBBc282IbWk8ovAq
   cfW0uokfGl1ue8qA4oAjT5tb/rRa6MZP3IT+1gUoC5Y9Fc6PHNSpFBtr9
   hUdTJFULxJKVVlzfLmUtgjGVW2tTUBs8iEujRk8jLfyOj0+y0ZydF22Yn
   4yUKUtrfgYRpKf5LhF/01d15335WNQbCBx2XYMUJG+nNx+snPZD43mtdH
   QKPGQcR5FR23PO8Nvxaz0uVG2SB3kF8aPLtxgWqtXw65GLqgyhE/sw8cV
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="370373077"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="370373077"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 10:26:05 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="579897654"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="579897654"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.251.6.93])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 10:26:04 -0700
Date: Tue, 18 Oct 2022 10:26:03 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: rts5208: Replace instances of udelay by
 usleep_range
Message-ID: <Y07hq98H0Qx18AcB@aschofie-mobl2>
References: <Y07OcqPNjSihOByt@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y07OcqPNjSihOByt@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>

On Tue, Oct 18, 2022 at 04:04:02PM +0000, Tanjuate Brunostar wrote:
> Replace the use of udelay by usleep_range as suggested by checkpatch:
> 
> CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
> +               udelay(30);
> 
> CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
> +               udelay(50);
> 

Hi Tanjuate,

I'd expect the commit log here to tell me why this is preferable, and
why this is safe to do - basically your summary of what you found
when you considered the checkpatch error report and then read
timers-howto.rst.  Including that this was found my Checkpatch is
good, but that's basically a footnote to the log message, not the
main point.

Having said all that, I see GregKH response and that is typical
for this change. This type of change, needs to be actually tested,
so it's not a good cleanup unless you have the device or some other 
convincing proof that what you are doing is safe.

Outreachy advice:  when you see a checkpatch error, and are
wondering how its fix will be received, search the Outreachy
mail archive for it. This one, I find repeated instances of
the change being NAK'd because the submitter cannot test it.

Alison

> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
> 
> v2: changed the max values of the usleep_rage instances as they cannot
> be equal to the min values as suggested by checkpatch
> 
>  drivers/staging/rts5208/ms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rts5208/ms.c b/drivers/staging/rts5208/ms.c
> index 14449f8afad5..a9724ca5eccf 100644
> --- a/drivers/staging/rts5208/ms.c
> +++ b/drivers/staging/rts5208/ms.c
> @@ -3235,7 +3235,7 @@ static int ms_write_multiple_pages(struct rtsx_chip *chip, u16 old_blk,
>  			return STATUS_FAIL;
>  		}
>  
> -		udelay(30);
> +		usleep_range(30, 31);
>  
>  		rtsx_init_cmd(chip);
>  
> @@ -4157,7 +4157,7 @@ int mg_set_ICV(struct scsi_cmnd *srb, struct rtsx_chip *chip)
>  
>  #ifdef MG_SET_ICV_SLOW
>  	for (i = 0; i < 2; i++) {
> -		udelay(50);
> +		usleep_range(50, 51);
>  
>  		rtsx_init_cmd(chip);
>  
> -- 
> 2.34.1
> 
> 
