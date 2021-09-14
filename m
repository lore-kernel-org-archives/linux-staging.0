Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FD03FC4
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 20:00:19 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 0D5B45C00D5;
	Tue, 14 Sep 2021 16:00:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 14 Sep 2021 16:00:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=xcpvvo3wRbgseIBt8SbFvs+YTol
	G54jbrz6RUN3VRY8=; b=H7PHarOTjFonL2lpevJjyjTYHmIc+S5A0iJ9cTZUAPT
	4fJ/jqm9K7BSDj9z7xbIhgWY3jsakhEj57/14V0CUjPECT39v1cm9kpzVypPwmOI
	+cDH2xXLTFNTs6nO0uC/aAGy7EUnlBk1KdR6B00DJIyW3l4CrNm21odIOrGiKHOM
	XMtKJQaxwZD1d66anst8Z1q3zNMH0Z5pXXJrFDhWoBYKqhCeD+sFbcCD+ZG9gRU5
	5nu52ZgVNR6X0hakNwzhsri4/uw/PMxASTDAihYBtqfYFFKxjQWuZU8fGulgGuYX
	2ZdJP5NEHKXCPHx8aP1/OsHNnoRTgPFhft6a6YA/7dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xcpvvo
	3wRbgseIBt8SbFvs+YTolG54jbrz6RUN3VRY8=; b=R3AbuqfnSROouOyHUfLVs+
	M4UeRLkVLczf8wZYUzUavUwiiHjar1XdUoO9w48gkvZKKbucE/1aCzAE2uWnkCK2
	9LiugG9ZFL2pQWEXWTJkAFo9lJ/cTEh3MrQuj6WxUEdWprqjEXn9MHADnf7PmhL0
	iT8Kgf+8jtYzvBmCWDswqsWrr/usl1WxRAUB4QN0DNEf/6mIq96eihZ/ApyU/10j
	FgDxSVxuApsCDJ9BnGc/BYwlyQYcKDLMKHR3qquWZ5w0wSJ5MIST49JYQwLmq9ft
	qsRwSMGPx5lSK3I/8tk29oL9kG2NRcB7FXpEmM57WoSgNCJnTFEmw93sV6pjPbLQ
	==
X-ME-Sender: <xms:Uv9AYTQcFIMCaUOwLVsQejOZOPoa5heQW_CsV6vNK896RyocUflRQw>
    <xme:Uv9AYUzWzED8pZurATIqseD23kapOPA0CP_EMSOsxZVRLakV2wsbJh3e3HR-mLvw4
    ZtefY0NAP0F6w>
X-ME-Received: <xmr:Uv9AYY3eLw3XaUWHg6R2Km5H2JRqsopEXyweToB87V4ZInuSQ1FSj5T4l8fuFapm7v6YUUt2XNTuQpWv7dYCq_eG9tQZ8rw->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucggtffrrghtthgvrhhnpeevueehjefgfffgiedvudekvdektdelleelgefhleejie
    eugeegveeuuddukedvteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:Uv9AYTDcM1ScVAfZaryu8FveFfvD7wtH3eaD9F2JyOZZPe5ced7zeQ>
    <xmx:Uv9AYcika0osJ_ON3nSI5LQuE1auxg9B2PIgXen7xGSdURM7Meyhdg>
    <xmx:Uv9AYXp1Jz_SiTxDFvKwKNI0vX-w45jdA6AwsvL77Gsp7zYLAQzYOg>
    <xmx:U_9AYfuC6zhhPsXr3WhtbRblIGYqV6KUY91IXStGLlqLLaITIGU6Rw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 16:00:17 -0400 (EDT)
Date: Tue, 14 Sep 2021 22:00:10 +0200
From: Greg KH <greg@kroah.com>
To: ua1422@gmail.com
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] Fix checkpatch.pl error for prism2mgmt.h
Message-ID: <YUD/Soc1BDL07adm@kroah.com>
References: <20210914183803.1616-1-ua1422@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914183803.1616-1-ua1422@gmail.com>

On Tue, Sep 14, 2021 at 11:38:03AM -0700, ua1422@gmail.com wrote:
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


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
