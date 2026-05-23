Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B644A34DCF3
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 10:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779532356; cv=none; b=BBC12M0dDFj8/K1znxURplZWKvdJMiA8kb39eYwoULqNEWoFA1ZaaM6m9QmH1BjjEOD2q/SadbS94PHpXxtpk0kDzsZ4sK37mLyiYtn8Pjatew8QVBIvkgfhVDJkmzS+FbKJV7eITWmvC0ZL01bOplEA/p0iY5wgUDI0oGvgZrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779532356; c=relaxed/simple;
	bh=Y+Wn2R0VWz84RiiULIWE3Qcwl4KChD6NmP0xlQmjXmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rDku68xOU+tV8DtdGKaynPi4d77FcfwMAkL0FAXOmbO+wAv+tO7wZNuGAMo4MWYoofsLOiEgRm03qo1x1Evbo7lbKwWHjpDU863jOwYiqUfJNL0gDz9ShuzFCWJdBxR9p98bBoC9739RpDGhK26kO0NL7x7horu2ixOPczMeNLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4cd895y; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4cd895y"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso21492025e9.2
        for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 03:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779532352; x=1780137152; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ggHOISHKznsuBI6AMYxE191lJyAYomYQchI1gW6FXAs=;
        b=R4cd895yB7XblAN5EbNOsYp0hn99ZxcyUyHT5m+woZ8bFykj/nbi76KvRmJcHxmxrs
         vpZhmPoxXRXnftRMoP902uJLEDEjue6a7eZYdKGuspkFeP/ZAJn06F00wpX3/+d1mKgb
         0gA72fuy1WoSJoJsMMwT40UZpFlQN0URugb6LCbbk1jrbbNSdD7Pe/f00YTlud4YoMTO
         acFQl0EJ0vp+4ZIShX/zLfBtfcsyNUruzSba2KTP9x8Dw/eu3LxM2jPSojsvMPAfonV3
         7luZxD0jP2P8dC36uglW+WdzRkA7r5Giu/MmrrGEqypNwndO2yGyOu3+PCruG+yUM1Kt
         KLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779532352; x=1780137152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggHOISHKznsuBI6AMYxE191lJyAYomYQchI1gW6FXAs=;
        b=cm4c1TLCAkNTW4aelbgPHxVxWmZoHjuc690ZABG+O/B+BTGQEWvnrpyQ3zLe/sMgoI
         6inbPnqferGFrDcm7RLURL0IJBiLUyrKXVwOqylxGZ/XdGjMRSgr3BRdXRJzk3PCH6WO
         TlYlJafwHuZj5iQDx+5x0ifhIdS5VdDdvfLTi4c8g4TaZelB7CTpiWxrRyJH1BuNAKy8
         FBQUtUPx4wZnfyhpyg/fAXNMrh+Hwykeyaf6dbbmzxZVkUT7w9M563yJfm5hF8EIjPxZ
         g3l8nBoilAVSprXD4W3RgKNzJIV5GMkMX7JE/Qy01U845nBVJRlR6kATPuYJDyKXP7wW
         1k1w==
X-Forwarded-Encrypted: i=1; AFNElJ8eeZs8EPi+2778pO/tRof1bZFxz1L43jntxa2pHwkvN3FE3nwY1kXjW8L3xJytUSNXOFNM7ltVYfdOhTAs@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1aZVafIEgn6UW1U2M2vp4HJjoxjqt2dLxcTWdMVBzIkYG3l1n
	JroVlac7uZL62oHcxTW0Lv0lPZccWxkBVreCBbGIGfCnphWia5CGQFZ/
X-Gm-Gg: Acq92OE+uIcorETglni3ooFDtOT8POJmUiiwGbVLq+77HBD6eziMP+wv/bsYbGnRT73
	HJj3hhNaKSVa4Rrg8Zic+O7J71tDsuL9Ahe+lIQoyfC3dImhdj9NwL+bt98KSF4eElKbXSntYVs
	9EaNUqBl+tTbEnXADjr1jBm0apKPsrP0kBzQprlaDr80Z4ewcDgtAlskKbgep8Io1mX5O7m7R7d
	d0lFkZge1zNS7hF37hIqOfZUk7ztC7dpXY8Bf9C/JNrg1DnPJSpwwdVs2KvPgKUW+WVlCJaXjbc
	+rLO2+l3jdqX7XZYB1U8kW6OHj7MzToVxQu3Sz8U1bsx1c2UxbZVOAPKq4/DK0Y/xuKDB66N/sq
	Is8CdSw24f7zbnPt8o/DRsn24UxQkzcmrjizSJ2bNPCY3ydY8yvRaL/SmytGSd9hsOqvb/ZxP+U
	nJiSBMANYcmJfzfPEsdJXyGLo=
X-Received: by 2002:a05:600c:4fd0:b0:490:3dc7:9778 with SMTP id 5b1f17b1804b1-490426d3f0dmr103782715e9.23.1779532351688;
        Sat, 23 May 2026 03:32:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d4850dsm10548467f8f.17.2026.05.23.03.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 03:32:31 -0700 (PDT)
Date: Sat, 23 May 2026 13:32:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/2] staging: rtl8723bs: remove dead
 rtw_atimdone_event_callback()
Message-ID: <ahGCPHzSRKys3gpp@stanley.mountain>
References: <20260522190256.49830-1-khomenkov@mailbox.org>
 <20260522190256.49830-2-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522190256.49830-2-khomenkov@mailbox.org>

On Fri, May 22, 2026 at 10:02:55PM +0300, Andrei Khomenkov wrote:
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index a86d6f97cf02..c56082cd5264 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -5619,7 +5619,7 @@ static struct fwevent wlanevents[] = {
>  	{0, &rtw_joinbss_event_callback},		/*10*/
>  	{sizeof(struct stassoc_event), &rtw_stassoc_event_callback},
>  	{sizeof(struct stadel_event), &rtw_stadel_event_callback},
> -	{0, &rtw_atimdone_event_callback},
> +	{0, rtw_dummy_event_callback},
>  	{0, rtw_dummy_event_callback},
>  	{0, NULL},	/*15*/
>  	{0, NULL},

This patch is fine...

Reviewed-by: Dan Carpenter <error27@gmail.com>

But, dummy functions are really discouraged.  It's supposed to be that
the caller checks for NULL and then doesn't call it.  No point in having
a do nothing dummy function when we could just store a NULL pointer there
instead.

And most of that table is NULL pointers!  I looked at the callers and
it's alarming that I don't immediately see any NULL checks.

  5657          /*  checking if event size match the event parm size */
  5658          if ((wlanevents[evt_code].parmsize != 0) &&

If the callback is NULL then parmsize is 0 so we don't care about the
size...  Just continue.

  5659              (wlanevents[evt_code].parmsize != evt_sz))
  5660                  goto _abort_event_;
  5661  
  5662          atomic_inc(&pevt_priv->event_seq);
  5663  
  5664          peventbuf += 2;
  5665  
  5666          if (peventbuf) {
  5667                  event_callback = wlanevents[evt_code].event_callback;

Get the call back.

  5668                  event_callback(padapter, (u8 *)peventbuf);

And crash...  I guess we are relying on this table to be in sync with
the wlancmds[] table in drivers/staging/rtl8723bs/core/rtw_cmd.c.
That seems pretty risky to me.

  5669  
  5670                  pevt_priv->evt_done_cnt++;
  5671          }

regards,
dan carpenter

