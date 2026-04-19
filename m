Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B22376BD7
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 05:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776576861; cv=none; b=FEEt/RWHAbHeRfFNJQWPb9az+piLFshx9xPERDlGQ35/ois+hBLz/naqgRN+7DTbCBsQrVmS3glYi3/QGAGDFutngzitudJcDFUUPmyWSWa++RjNhc5OP+xZJP7cmpuGFeM8v7szkVpZlGuUts3LE+Dm9Iws97eTB707dt0/Ctc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776576861; c=relaxed/simple;
	bh=z1PCjRbcqhgBuKXqOKAzYSY15WfhsnLk0EGtGGtrgoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8+rnsRd9oxhVE23WJSXjsuKTYhSnqmFaFSGmH3SpyUDGNpSXOGPw/MFfPbsfPHZGWAkSHGNQJRBgpLpuaFFNWys2p8WNdun0K21bOba5HApJIUMn0l0MNaWpMFrjTG1y8I5JFndivGpw+c4IeWNeYVDNy43R0ye9udgunpRisk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=f/PR9ZYB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GTFOoeek; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="f/PR9ZYB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GTFOoeek"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7A63D7A0137;
	Sun, 19 Apr 2026 01:34:18 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 19 Apr 2026 01:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1776576858; x=1776663258; bh=xmtPDubW4h
	Yj7IsUBbTtOr2FDnZMl11Rp8JXbmdbxHk=; b=f/PR9ZYBOyf0N64pRIBVbCKlWG
	7/Ro6ROzqE+e2ZOd0jzT6WY4ddyXHJsg2lVHBAu3bmbr5vW5SfaseR1cgXIf/4OT
	sJ+NMap+LtN/0vFyU+sklkplihCweUTFt7pd3fbVRzmxn4NyTuMly2gIUIWjhFMn
	Dv7D67rK1EYeVrTb9PsqdmoYRAciCafe+ms+MzTYuHU1UexMQfHb4RIAIPAcsmgw
	lef5nlXS2czH+uuM6zBzCRsarF5lc2C+9zgXWCNg1tGh3Bp2hqiqwegNeZes8UsE
	Tpq8dURbHN0m9uiCUSxlIftqM2ozp4PjolxQLSyTmG3H8bLBeiiPPdV/8xEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776576858; x=1776663258; bh=xmtPDubW4hYj7IsUBbTtOr2FDnZMl11Rp8J
	XbmdbxHk=; b=GTFOoeek2I0XKReeOcaxNPTYCyMRs2qqosV8g6ui9MH9Kr5z8FK
	LDbXrJc0/pS9O6+eRnyHiaec5YUyMBuokSvzxrc+h7OFreTO9bFs6cnrmaWJ4OgP
	Gs0O5MTYADNBIJyup2D9mZiTfHeBFvyIBtR8+bPU1JVd/lOGbTupcwvt+C2aLhPl
	30z2zPbSXkHURMkXwib6U9SVg7YjH5T8JOiv7cFQKTnEJO6xAlQuAYvqJ7C1Q7Sc
	QsyYNF6rXLPXOYQTwWEcC2UAwo1/JFbrdXjpH9TST+kT8W8X1QoVBNOBDuAlFrr7
	ZowQQcNsndzh7zOdNECwOu2ufpY7JK6ZoeQ==
X-ME-Sender: <xms:Wmnkad9T_fcy9BT8wmy2yE_NTSiP0NVM6f3PgLwgUL9pMB1K-fftug>
    <xme:Wmnkafgd67zgPQG3tghy_AaBc1YvsaMETgFrnmp2VlZU47E3EX8kjbR-fcQDKNpCG
    CBRO6NwVsbus-fz4e7wL845XtcEN5XYBZxBbome68orTo1o2Q>
X-ME-Received: <xmr:WmnkaVfI6QqXsNRe5KbxoC849MYiA1hug7hsNhTHs4eplLP98b2HWFyPRwV-G65o6byNUvSf0f1JeHVba_PJAl_2zA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehgeekudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttd
    dtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecu
    ggftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtd
    eufefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehknhgviihophhophesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlihhnuhigqdhsthgrghhinhhgsehlihhsthhsrdhlihhnuhigrdguvg
    hv
X-ME-Proxy: <xmx:WmnkaerEUiCah8Gv8Q4isQ93eceZGh74tFMMuUy7TQ-qvhZE-g5jcA>
    <xmx:WmnkaSAnyxss38w8dWzLsTupI8PYHtPd54TyweO_wAK_SbCLvIWwUQ>
    <xmx:WmnkaTZPU0cLX-2Y-TEa1Ym6qPbokPe-X2sO9mynoHTDZ9uThY4bpA>
    <xmx:Wmnkad7QfbR5g8eRYo6gDUOyu6h-bBgd1Z-4iXAc74u1o7c1nNM_vQ>
    <xmx:WmnkaS5YSEcfI7B5TsqDiiwz4_sj1Wk71aFcJRjtbi-B0gOCdQjlNdPo>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 19 Apr 2026 01:34:17 -0400 (EDT)
Date: Sun, 19 Apr 2026 07:34:16 +0200
From: Greg KH <greg@kroah.com>
To: Vakii <knezopop@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] rtl8723bs: improve readability in cmd filter and traffic
 watchdog
Message-ID: <2026041948-snowless-imagines-15e6@gregkh>
References: <CALvkU=r8n4ZPDfw+-Y2M6078udukf8u2xEKTag_QrAeXwjAK7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALvkU=r8n4ZPDfw+-Y2M6078udukf8u2xEKTag_QrAeXwjAK7Q@mail.gmail.com>

On Sun, Apr 19, 2026 at 01:24:07AM +0200, Vakii wrote:
> 

> From ab0da1c2ba7446be7f5d0a0ba88a2b1503f39f4d Mon Sep 17 00:00:00 2001
> From: knez <206253445+knezoWTF@users.noreply.github.com>
> Date: Sun, 19 Apr 2026 00:56:32 +0200
> Subject: [PATCH] rtl8723bs: improve readability in cmd filter and traffic
>  watchdog
> 
>  - Rename bAllow to allow_pre_init_cmd
>  - Convert traffic flags to bool where appropriate
>  - Improve comments for traffic detection logic
> 
>  No functional change.
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index abb84f8aecbe..e0c57652e0f5 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -298,12 +298,13 @@ void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
>  int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj);
>  int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
>  {
> -	u8 bAllow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
> +	/* set to true to allow enqueuing cmd when hw_init_completed is false */
> +	bool allow_pre_init_cmd = false;
>  
>  	if (cmd_obj->cmdcode == GEN_CMD_CODE(_SetChannelPlan))
> -		bAllow = true;
> +		allow_pre_init_cmd = true;
>  
> -	if ((!pcmdpriv->padapter->hw_init_completed && !bAllow) ||
> +	if ((!pcmdpriv->padapter->hw_init_completed && !allow_pre_init_cmd) ||
>  	    !atomic_read(&pcmdpriv->cmdthd_running))	/* com_thread not running */
>  		return _FAIL;
>  
> @@ -1127,12 +1128,16 @@ static void collect_traffic_statistics(struct adapter *padapter)
>  
>  u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
>  {
> -	u8 bEnterPS = false;
> +	bool bEnterPS = false;
>  	u16 BusyThresholdHigh = 25;
>  	u16 BusyThresholdLow = 10;
>  	u16 BusyThreshold = BusyThresholdHigh;
> -	u8 bBusyTraffic = false, bTxBusyTraffic = false, bRxBusyTraffic = false;
> -	u8 bHigherBusyTraffic = false, bHigherBusyRxTraffic = false, bHigherBusyTxTraffic = false;
> +	u8 bBusyTraffic = false;
> +	u8 bTxBusyTraffic = false;
> +	u8 bRxBusyTraffic = false;
> +	u8 bHigherBusyTraffic = false;
> +	u8 bHigherBusyRxTraffic = false;
> +	u8 bHigherBusyTxTraffic = false;
>  	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
>  
>  	collect_traffic_statistics(padapter);
> @@ -1156,7 +1161,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
>  				bTxBusyTraffic = true;
>  		}
>  
> -		/*  Higher Tx/Rx data. */
> +		/*  Detect high Tx/Rx traffic load. */
>  		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > 4000 ||
>  		    pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > 4000) {
>  			bHigherBusyTraffic = true;
> @@ -1191,7 +1196,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
>  				bEnterPS = true;
>  		}
>  
> -		/*  LeisurePS only work in infra mode. */
> +		/*  LeisurePS based on traffic state (infra mode only) */
>  		if (bEnterPS) {
>  			if (!from_timer)
>  				LPS_Enter(padapter, "TRAFFIC_IDLE");
> -- 
> 2.47.3
> 


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
