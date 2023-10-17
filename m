Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610F915B1;
	Tue, 17 Oct 2023 04:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="a37R7m26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=91VBfy8MlK6h8xhN26uGVvVTiR7aGe5n9JQ5Xt05oGA=;
  b=a37R7m26HP2Xe8reoHtzOYjQUFQP0woq4SOIxjsdGTpuHCN8ZDBCzJgc
   b+v9IuF087pystSS9fuOaxcHudS84S4EiCFGEGDPGJpDEHeDgcRIGrOg7
   vMprw/2KdTBzZD24+gR1GAvHOtEBnb2WDM+ob/zIqRow+UX9G5/3R2r1l
   E=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,231,1694728800"; 
   d="scan'208";a="68896285"
Received: from unknown (HELO hadrien) ([87.129.180.234])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 06:48:01 +0200
Date: Tue, 17 Oct 2023 06:48:00 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
cc: forest@alittletooquiet.net, gregkh@linuxfoundation.org, 
    outreachy@lists.linux.dev, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: vt6655: Rename variable bUpdateBBVGA
In-Reply-To: <9bd935c464671db2654c654964812cc48f4603d3.1697495598.git.gilbertadikankwu@gmail.com>
Message-ID: <a060ab8-238d-dffa-ce4b-9b814667786c@inria.fr>
References: <cover.1697495597.git.gilbertadikankwu@gmail.com> <9bd935c464671db2654c654964812cc48f4603d3.1697495598.git.gilbertadikankwu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 16 Oct 2023, Gilbert Adikankwu wrote:

> Remove bool Type encoding "b" from variable name and replace camelcase
> with snakecase.
>
> Mute checkpatch.pl error:
>
> CHECK: Avoid CamelCase: <bUpdateBBVGA>
>
> Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
> ---
>  drivers/staging/vt6655/baseband.c    | 2 +-
>  drivers/staging/vt6655/channel.c     | 2 +-
>  drivers/staging/vt6655/device.h      | 2 +-
>  drivers/staging/vt6655/device_main.c | 6 +++---
>  4 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
> index 7d47b266b87e..f7824396c5ff 100644
> --- a/drivers/staging/vt6655/baseband.c
> +++ b/drivers/staging/vt6655/baseband.c
> @@ -2087,7 +2087,7 @@ bool bb_vt3253_init(struct vnt_private *priv)
>  		/* {{ RobertYu: 20050104 */
>  	} else {
>  		/* No VGA Table now */
> -		priv->bUpdateBBVGA = false;
> +		priv->update_bbvga = false;
>  		priv->bbvga[0] = 0x1C;

I wonder about the name bbvga in the line above.  Does the initial b mean
byte or is it a lowercase version of BBVGA?

julia

>  	}
>
> diff --git a/drivers/staging/vt6655/channel.c b/drivers/staging/vt6655/channel.c
> index 6ac7d470c041..c11bc2dbc356 100644
> --- a/drivers/staging/vt6655/channel.c
> +++ b/drivers/staging/vt6655/channel.c
> @@ -86,7 +86,7 @@ bool set_channel(struct vnt_private *priv, struct ieee80211_channel *ch)
>  		return ret;
>
>  	/* Set VGA to max sensitivity */
> -	if (priv->bUpdateBBVGA &&
> +	if (priv->update_bbvga &&
>  	    priv->bbvga_current != priv->bbvga[0]) {
>  		priv->bbvga_current = priv->bbvga[0];
>
> diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
> index 68bfadacfa7c..b166d296b82d 100644
> --- a/drivers/staging/vt6655/device.h
> +++ b/drivers/staging/vt6655/device.h
> @@ -246,7 +246,7 @@ struct vnt_private {
>  	unsigned char byAutoFBCtrl;
>
>  	/* For Update BaseBand VGA Gain Offset */
> -	bool bUpdateBBVGA;
> +	bool update_bbvga;
>  	unsigned int	uBBVGADiffCount;
>  	unsigned char bbvga_new;
>  	unsigned char bbvga_current;
> diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
> index b08fcf7e6edc..b654fc24d725 100644
> --- a/drivers/staging/vt6655/device_main.c
> +++ b/drivers/staging/vt6655/device_main.c
> @@ -179,7 +179,7 @@ device_set_options(struct vnt_private *priv)
>  	priv->byBBType = priv->opts.bbp_type;
>  	priv->byPacketType = priv->byBBType;
>  	priv->byAutoFBCtrl = AUTO_FB_0;
> -	priv->bUpdateBBVGA = true;
> +	priv->update_bbvga = true;
>  	priv->preamble_type = 0;
>
>  	pr_debug(" byShortRetryLimit= %d\n", (int)priv->byShortRetryLimit);
> @@ -423,7 +423,7 @@ static void device_init_registers(struct vnt_private *priv)
>  	/* initialize BBP registers */
>  	bb_vt3253_init(priv);
>
> -	if (priv->bUpdateBBVGA) {
> +	if (priv->update_bbvga) {
>  		priv->bbvga_current = priv->bbvga[0];
>  		priv->bbvga_new = priv->bbvga_current;
>  		bb_set_vga_gain_offset(priv, priv->bbvga[0]);
> @@ -1040,7 +1040,7 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
>  	long dbm;
>  	int i;
>
> -	if (!priv->bUpdateBBVGA)
> +	if (!priv->update_bbvga)
>  		return;
>
>  	if (priv->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
> --
> 2.34.1
>
>
>
