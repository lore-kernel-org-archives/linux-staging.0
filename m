Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB936D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 08:05:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F350061151;
	Wed,  7 Apr 2021 08:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617782730;
	bh=mlyMvKhaf1o3icGWjPF64TVY48gFXxVgW8CnfXSrWZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nq46qRCrdrX0lQjTs5Ljvmor6tWA2xpb9rl7blBxjQxqz2lajnmKpTMuSa/2RUmkM
	 HIxswUO03pEkWoP+Qu6+Aj9Js7xm1EaWBer1/90j23Qgm1MAr9/OijbVpou3mNcMt4
	 l46k96xnyNLEPr1/jWZUXMMirn2x3JwALnbZmEqU=
Date: Wed, 7 Apr 2021 10:05:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH] staging: rtl8712: fix avoid CamelCase in xmit_osdep.h
Message-ID: <YG1nyA3ZJbEzVNDu@kroah.com>
References: <YG1l6QIKRMjqgPiD@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YG1l6QIKRMjqgPiD@kali>

On Wed, Apr 07, 2021 at 01:27:29PM +0530, Mitali Borkar wrote:
> Fixed Check:Avoid CamelCase by renaming SetFilter to set_filter
> Reported by checkpatch.
> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@example.com>
> ---
>  drivers/staging/rtl8712/xmit_osdep.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8712/xmit_osdep.h b/drivers/staging/rtl8712/xmit_osdep.h
> index b76021b568f8..7ad2ac6f5ff0 100644
> --- a/drivers/staging/rtl8712/xmit_osdep.h
> +++ b/drivers/staging/rtl8712/xmit_osdep.h
> @@ -35,7 +35,7 @@ struct xmit_frame;
>  struct xmit_buf;
>  
>  int r8712_xmit_entry(_pkt *pkt, struct  net_device *pnetdev);
> -void r8712_SetFilter(struct work_struct *work);
> +void r8712_set_filter(struct work_struct *work);
>  int r8712_xmit_resource_alloc(struct _adapter *padapter,
>  			      struct xmit_buf *pxmitbuf);
>  void r8712_xmit_resource_free(struct _adapter *padapter,
> -- 
> 2.30.2
> 
> 

Did you try test-building your change?  Always do so :(


