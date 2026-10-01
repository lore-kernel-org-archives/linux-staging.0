Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AEB436BC9
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 05:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833062; cv=none; b=aF7I05BfGxpRpAw5wEfeL0/CvTAD7XVfW2FBjkeBtgaqCrqCV+YjjsLq8gaHoeLIXVKbvo1VwhOhAWNQbCh4u3ABwEqr5IyVXvKv3QyxwaO9uWrjeJx+OZS9iXvwtDeYNpu/cezCsCyDjrKaWtYDj+hrXgag7F7emiPwHdjiEo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833062; c=relaxed/simple;
	bh=8vn0HoE2JSL54hO2nxzi4TGXG2Otv/y4HImelgibpwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IW3CqPFK/UyOaOj3wQ39XRQdOzs+vukJai7pkxYSbJOFZBd1xFP+wmZQPOPLb0Ulz53Us40QJBXxrD++oiD7cGPa3VcPqnEFjRVnKJpIyhI4dn7OWj4VxfQYhENOzBQpd6aq5U65zrHLKfEJvbIeV1cYdxnLviKy4hWwx5VUidw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eG+Mc0CZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eG+Mc0CZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FF41F000FF;
	Thu,  1 Oct 2026 05:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790833061;
	bh=LO/sUY12T5ZqL/Qeg7u/20cXqh1Mtxi+RQ0q/6/c8GY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eG+Mc0CZV+0rmqDAlL6DjiqP+Gf7JeBMQNymUiJzdSaUkD34xLTzfW7sVT0/2xm1r
	 9rsuxcXuE6MwvZXz0YoBLN1xn1fJla7NZ0Iwg9GFyzA7X5TOrWfCBMtRmCs47c5m/d
	 b60yD++2134LCE14iqS9F6iWhPAHkde4ivmk7RBU=
Date: Thu, 1 Oct 2026 07:37:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?WWnEn2l0?= Mehmet <yigitmehmetcintay2@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: rtw_cmd.c: convert CamelCase structs
 and callbacks to snake_case
Message-ID: <2026100158-cobbler-unwanted-0e6a@gregkh>
References: <CACzRdUFuF+CrcLSJKH5jL9ief_Hwx7q1vveqgbnm2B3N7WNmWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACzRdUFuF+CrcLSJKH5jL9ief_Hwx7q1vveqgbnm2B3N7WNmWQ@mail.gmail.com>

On Tue, Sep 08, 2026 at 01:00:15PM +0300, Yiğit Mehmet wrote:
> >From 9b93f99e0d16a43c33369a5f2515925ca265e6dd Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?Yi=C4=9Fit?= <ymailnull@gmail.com>
> Date: Tue, 8 Sep 2026 12:42:56 +0300
> Subject: [PATCH] staging: rtl8723bs: rtw_cmd.c: convert CamelCase structs
> and
>  callbacks to snake_case
> 
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index ce3dfa1fe..68e3fc761 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -34,7 +34,7 @@ static struct _cmd_callback rtw_cmd_callback[] = {
>   {SET_AUTH_CMD, NULL},
> 
>   {SET_KEY_CMD, NULL}, /*20*/
> - {SET_STA_KEY_CMD, &rtw_setstaKey_cmdrsp_callback},
> + {SET_STA_KEY_CMD, &rtw_set_sta_key_cmdrsp_callback},
>   {SET_ASSOC_STA_CMD, &rtw_setassocsta_cmdrsp_callback},
>   {DEL_ASSOC_STA_CMD, NULL},
>   {SET_STA_PWR_STATE_CMD, NULL},
> @@ -131,7 +131,7 @@ static struct cmd_hdl wlancmds[] = {
>   GEN_MLME_EXT_HANDLER(0, NULL)
>   GEN_MLME_EXT_HANDLER(0, NULL)
>   GEN_MLME_EXT_HANDLER(0, NULL)
> - GEN_MLME_EXT_HANDLER(sizeof(struct addBaReq_parm), add_ba_hdl)
> + GEN_MLME_EXT_HANDLER(sizeof(struct add_ba_req_parm), add_ba_hdl)
>   GEN_MLME_EXT_HANDLER(sizeof(struct set_ch_parm), set_ch_hdl) /* 46 */
>   GEN_MLME_EXT_HANDLER(0, NULL)
>   GEN_MLME_EXT_HANDLER(0, NULL)
> @@ -141,15 +141,15 @@ static struct cmd_hdl wlancmds[] = {
>   GEN_MLME_EXT_HANDLER(0, NULL)
>   GEN_MLME_EXT_HANDLER(0, NULL)
>   GEN_MLME_EXT_HANDLER(0, NULL)
> - GEN_MLME_EXT_HANDLER(sizeof(struct Tx_Beacon_param), tx_beacon_hdl) /*55*/
> + GEN_MLME_EXT_HANDLER(sizeof(struct tx_beacon_param), tx_beacon_hdl) /*55*/
> 
>   GEN_MLME_EXT_HANDLER(0, mlme_evt_hdl) /*56*/
>   GEN_MLME_EXT_HANDLER(0, rtw_drvextra_cmd_hdl) /*57*/
> 
>   GEN_MLME_EXT_HANDLER(0, h2c_msg_hdl) /*58*/
> - GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelPlan_param), set_chplan_hdl)
> /*59*/
> + GEN_MLME_EXT_HANDLER(sizeof(struct set_channel_plan_param),
> set_chplan_hdl) /*59*/
> 
> - GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelSwitch_param), set_csa_hdl)
> /*60*/
> + GEN_MLME_EXT_HANDLER(sizeof(struct set_channel_switch_param),
> set_csa_hdl) /*60*/
>   GEN_MLME_EXT_HANDLER(sizeof(struct TDLSoption_param), tdls_hdl) /*61*/
>   GEN_MLME_EXT_HANDLER(0, chk_bmc_sleepq_hdl) /*62*/
>   GEN_MLME_EXT_HANDLER(sizeof(struct RunInThread_param), run_in_thread_hdl)
> /*63*/
> @@ -978,7 +978,7 @@ u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid,
> u8 *addr)
>  {
>   struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
>   struct cmd_obj *ph2c;
> - struct addBaReq_parm *paddbareq_parm;
> + struct add_ba_req_parm *padd_ba_req_parm;
> 
>   u8 res = _SUCCESS;
> 
> @@ -1896,7 +1896,7 @@ void rtw_createbss_cmd_callback(struct adapter
> *padapter, struct cmd_obj *pcmd)
>   rtw_free_cmd_obj(pcmd);
>  }
> 
> -void rtw_setstaKey_cmdrsp_callback(struct adapter *padapter,  struct
> cmd_obj *pcmd)
> +void rtw_set_sta_key_cmdrsp_callback(struct adapter *padapter,  struct
> cmd_obj *pcmd)
>  {
>   struct sta_priv *pstapriv = &padapter->stapriv;
>   struct set_stakey_rsp *psetstakey_rsp = (struct set_stakey_rsp
> *)(pcmd->rsp);
> -- 
> 2.47.3

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

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
