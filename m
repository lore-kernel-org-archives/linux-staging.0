Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7CB3FD3
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 05:17:46 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id D77913200946;
	Wed, 15 Sep 2021 01:17:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 15 Sep 2021 01:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=VkEg45wWZvFMJ5n7MVb77yTlTco
	iEuxLv8ec7ejO0v4=; b=crfjF/L2+xJtZAU2+JAWl6sBEHStmIlYK0MWJv7tOSN
	JmN/Lin25RUQiQSP1qUPHRkOUUj+c3xrd2S7jtkYHcQlY7QyfmkLMBAGZpgLiGu0
	83/zctkbjCegV4Mfl4bG28UwSRj714HeSaKyeRJu4Q7qBpNkPfPWtV4hgWV58LTR
	poegLCB0oxeJYUjRBaLKVoHAl19g8KLcaIJnq0AdqnNcUCR+4p9+RDI133QJI2x+
	WxncyzO1n3eSa5Ty+8y/fHRRYgI3/N2FHcXxs6Nyn8dfmNU088pTXXJ4R6CNmvXL
	jPgzfD0hCOEGqaoII6DMH3x/7KqKKQAzphKwyA/SxkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=VkEg45
	wWZvFMJ5n7MVb77yTlTcoiEuxLv8ec7ejO0v4=; b=nL8eBzL8NvrCtTXGBIe5EI
	9XnlftAw3YqG+WT78+6asDKZkQEA7LJzIkikAFtypZPugZpn+sH7OycGHXE+fYne
	Boy0tvfqYPO6oxwzB7S0jEJxpvDCLj4dqaBRTaNie+YyTu1ctOsYqiiu7c5/TbLW
	XgUB1P01DkLAzFiHJFQp8VddF6n/+X5a3+sYdx5ohcEAaTp4b35B07H7wI9ehRXq
	R73hYnNyzvkjfSZ6l5QucjJWP5XfFrtcIO1dgQhAsni90fGGoCZa6TocFyBzeFwE
	5/y2pcE93YyagSDxE2fFAbwdnvOzLKciYLB8nJxvB0iB46+/b6xX/sQ3XmkAs4OA
	==
X-ME-Sender: <xms:-YFBYUaNBV_E2DIfigPumX8SStKMk3TJkXwkypIwK6C3JozZrydEwA>
    <xme:-YFBYfYmyKo4pgIxjGBNLHQ4yvWez0wyBYBUCRrjfGiaEMNNGQSIORh6K6W10kNwk
    otQVoKMjB5EGw>
X-ME-Received: <xmr:-YFBYe_yYcAV6iYX0KfF2gOQj2hDfV3VSV1XNRkEF7uDIZ88b85pCZ7LqYmBy4wNxcFoH6jHkU9hzgx1v_LOOdY2XNTRmqYW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehtddgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepveeuheejgfffgfeivddukedvkedtleelleeghfeljeeiue
    eggeevueduudekvdetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:-YFBYeqVLmXPT_9-ovG1V7Tnjfr9iXrZaQ8ZXZO9and6uahNQIAZzw>
    <xmx:-YFBYfrUgUur9KA_5jHVaC4nHU-m08t0aby4modVTgcCrQspmONnjQ>
    <xmx:-YFBYcTm_m5-AGHkpSqWzY56cEjEYvMXw21oK8RXN2aFx_WNKcLAgQ>
    <xmx:-YFBYW3H8CmfMUQQta_IlGXZfpp3sFgqwWrm_3TIS0FlfLYDHmbddQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Sep 2021 01:17:44 -0400 (EDT)
Date: Wed, 15 Sep 2021 07:17:25 +0200
From: Greg KH <greg@kroah.com>
To: ua1422@gmail.com
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] Fix checkpatch.pl error for prism2mgmt.h
Message-ID: <YUGB5SmqM4y3W9NN@kroah.com>
References: <20210914231232.1592-1-ua1422@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914231232.1592-1-ua1422@gmail.com>

On Tue, Sep 14, 2021 at 04:12:32PM -0700, ua1422@gmail.com wrote:
> From: Usman Ansari <ua1422@gmail.com>
> 
> Signed-off-by: Usman Ansari <ua1422@gmail.com>
> ---
>  drivers/staging/wlan-ng/prism2mgmt.h | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/wlan-ng/prism2mgmt.h b/drivers/staging/wlan-ng/prism2mgmt.h
> index 17bc1ee0d498..19e648a81489 100644
> --- a/drivers/staging/wlan-ng/prism2mgmt.h
> +++ b/drivers/staging/wlan-ng/prism2mgmt.h
> @@ -58,8 +58,8 @@
>   *    --------------------------------------------------------------------
>   */
>  
> -#ifndef _PRISM2MGMT_H
> -#define _PRISM2MGMT_H
> + #ifndef _PRISM2MGMT_H
> + #define _PRISM2MGMT_H
>  
>  extern int prism2_reset_holdtime;
>  extern int prism2_reset_settletime;
> @@ -91,7 +91,9 @@ int prism2mgmt_autojoin(struct wlandevice *wlandev, void *msgp);
>   */
>  
>  /* byte area conversion functions*/
> -void prism2mgmt_bytearea2pstr(u8 *bytearea, struct p80211pstrd *pstr, int len);
> +void prism2mgmt_bytearea2pstr(u8 *bytearea,
> +                              struct p80211pstrd *pstr,
> +                              int len);
>  
>  /* byte string conversion functions*/
>  void prism2mgmt_pstr2bytestr(struct hfa384x_bytestr *bytestr,
> @@ -112,9 +114,9 @@ void prism2sta_processing_defer(struct work_struct *data);
>  void prism2sta_commsqual_defer(struct work_struct *data);
>  void prism2sta_commsqual_timer(struct timer_list *t);
>  
> -/* Interface callback functions, passing data back up to the cfg80211 layer */
> +/* Interface callback, passing data back up to the cfg80211 layer */
>  void prism2_connect_result(struct wlandevice *wlandev, u8 failed);
>  void prism2_disconnected(struct wlandevice *wlandev);
>  void prism2_roamed(struct wlandevice *wlandev);
>  
> -#endif
> + #endif
> -- 
> 2.25.1
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
