Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4651B258C;
	Tue, 29 Mar 2022 20:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648584516; x=1680120516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jJBFAHQdu8LK3MnfBlyd4ynLCpZPwxsuj3ERMXvrSf4=;
  b=Y/80ewZzz3JX/GADYrqpFODP9wq4b9dcEWBHf4/bFCihtn7piIzK/lKz
   9DDZSg72QBAizAaZ0XTR2/ApCAxd/Av7bSM+MkRBShhjvC19OSgCkDbCJ
   xPCnV74FmoxiHXVEwVXaF1nuy7ASSGl3X6lxLy0P7wGG1IxEP3fnepbeV
   ABQVsLmj2MJdTvoYlxDn3EUR1pEAiSSE5/mqgKVikuzqS/1yFQIQd3kcg
   RMdEmpFaGX3NoCPNZRYDTMtKUPJ72P2JtrzxhcFDMAJ+7L1vDX1DdtrH0
   fcjasa9VqIYTnKvIutzezeK6nTCQDY/KtyYfVl357ye/Ouopqdp6Sx/ZI
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="239292949"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="239292949"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 13:08:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="694848177"
Received: from alison-desk.jf.intel.com (HELO alison-desk) ([10.54.74.41])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 13:08:15 -0700
Date: Tue, 29 Mar 2022 13:10:21 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
Cc: outreachy@lists.linux.dev, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media:av7110:av7110_av.c remove blank line
Message-ID: <20220329201021.GA1171096@alison-desk>
References: <20220329190133.6243-1-eng.alaamohamedsoliman.am@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329190133.6243-1-eng.alaamohamedsoliman.am@gmail.com>

On Tue, Mar 29, 2022 at 09:01:33PM +0200, Alaa Mohamed wrote:
> according to checkpatch.pl results
> "CHECK: Please don't use multiple blank lines"
> after lines 73 and 78 ,I removed the blank lines
> 
> Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
> ---
>  drivers/staging/media/av7110/av7110_av.c | 2 --

Hi Alaa,

We are not taking cleanup patches in drivers/staging/media.
It's documented in here https://kernelnewbies.org/Outreachyfirstpatch
and I will repost the restriction on this list as the discussion
occurred a few days before the contribution period began.

If you look at the git history on this file, you'll see it is
on it's way out of the kernel, not on it's way in!

Please look at my feedback to Rebecca and Sevinj recent checkpatch
cleanups as guidance for your next (non-media) cleanup patch.

Thanks!
Alison





>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
> index 91f4866c7e59..1544f120e8b1 100644
> --- a/drivers/staging/media/av7110/av7110_av.c
> +++ b/drivers/staging/media/av7110/av7110_av.c
> @@ -70,12 +70,10 @@
>  #define PIECE_RATE	 0x40
>  #define SEAM_SPLICE	 0x20
>  
> -
>  static void p_to_t(u8 const *buf, long int length, u16 pid,
>  		   u8 *counter, struct dvb_demux_feed *feed);
>  static int write_ts_to_decoder(struct av7110 *av7110, int type, const u8 *buf, size_t len);
>  
> -
>  int av7110_record_cb(struct dvb_filter_pes2ts *p2t, u8 *buf, size_t len)
>  {
>  	struct dvb_demux_feed *dvbdmxfeed = (struct dvb_demux_feed *) p2t->priv;
> -- 
> 2.35.1
> 
> 
