Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A1172
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 08:52:07 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id h9so23982939ejs.4
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 01:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DBowD0LpUSYqGQgp8Uy+in22QZFYoAPzG1AXR1S5Y/Q=;
        b=U9iRCFMXSOgrC/7O8/c4f6II7vlzJXfdZdfq9/kczKFfXkig/mLs4CrDoXPnqAQlK6
         9tYL5oiF6mVL6EhC/SUFJ15WA/7OIQVw6BpTA+ZIGzu7RD/2pKzlmP36LCkce1Q6eLND
         cERy1Y8+ML/6t4JgGnSE3wdb+rF1wXaKVZFjGS6/3+tVu/IiKLGf/+RqQTMNN3dUBypo
         RkCRAdchnbkFUBqVg+cI/9E2++8fvvyjHRIXqKAMPxomuxmIVeyXFFOd352TyVi6CA7A
         OCmHPdV6ZWSBPJDBDpSEQVqMES/qIk/+M6DFys4h3vWWnhSW1F+lUpM1bBf2dpxraeKa
         SFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DBowD0LpUSYqGQgp8Uy+in22QZFYoAPzG1AXR1S5Y/Q=;
        b=uRtotuxD/hMkWOD6ocJ7og1CHxs7MlMEMCK9Oa1OBFwQ/mWMKCkm6329KkelxRObhk
         e32XS/ArW9ZX78LCZFAd8x50DgYRfupO5rlz0ly+fRO4XgyzZlBgqP0lMjnnwRt1KHdx
         wQUIz/jzrttUr/oCOhbseWsQgwrZ3udRwAKFmgajeOdwrSB1kFCJgztMQrFQNrEkgoza
         +AAqc0YdnNSj88ZFYemBtjKH2HapBTgwSfELr9CKyrnMHn+NcmihSHirUklYORXqb214
         fBDSDGsRirhYqM8gqmFYv9g/jYJaA4fHoPUxcspuI4WJRYmD5kW0oll7qmVDoAj8NEUb
         jP1w==
X-Gm-Message-State: AOAM532Z6zKYRv2cb5T8KQuXQJ5hMwKIrW4/JP6c6Iq4xQ/dCPId7+Sd
	Job29FfgrY22/lDO8sQqGms=
X-Google-Smtp-Source: ABdhPJwztqkrmeLlkEVv0eg5yhDRTOWtF0jbc5iuyGczkeB387GoA0GgMNI5dH6DeK1VJhVaSv6WpA==
X-Received: by 2002:a17:907:174b:: with SMTP id lf11mr19275181ejc.35.1630227125671;
        Sun, 29 Aug 2021 01:52:05 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id c10sm3636152eje.37.2021.08.29.01.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 01:52:05 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Phillip Potter <phil@philpotter.co.uk>
Cc: straube.linux@gmail.com, Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: r8188eu: simplify c2h_evt_hdl function
Date: Sun, 29 Aug 2021 10:52:03 +0200
Message-ID: <21174665.bKA57LRvRV@localhost.localdomain>
In-Reply-To: <20210828212453.898-3-phil@philpotter.co.uk>
References: <20210828212453.898-1-phil@philpotter.co.uk> <20210828212453.898-3-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, August 28, 2021 11:24:52 PM CEST Phillip Potter wrote:
> Simplify c2h_evt_hdl function by removing majority of its code. The
> function always returns _FAIL anyway, due to the wrapper function it
> calls always returning _FAIL. For this reason, it is better to just
> return _FAIL directly.
> 
> Leave the call to c2h_evt_read in place, as without it, event handling
> semantics of the driver would be changed, despite nothing actually being
> done with the event.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>  drivers/staging/r8188eu/core/rtw_cmd.c | 21 +++------------------
>  1 file changed, 3 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index ce73ac7cf973..b520c6b43c03 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -1854,27 +1854,12 @@ u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt)
>  
>  static s32 c2h_evt_hdl(struct adapter *adapter, struct c2h_evt_hdr *c2h_evt, c2h_id_filter filter)
>  {
> -	s32 ret = _FAIL;
>  	u8 buf[16];
>  
> -	if (!c2h_evt) {
> -		/* No c2h event in cmd_obj, read c2h event before handling*/
> -		if (c2h_evt_read(adapter, buf) == _SUCCESS) {
> -			c2h_evt = (struct c2h_evt_hdr *)buf;

Dear Philip,

Not related to your patch, but what kind of odd assignment is it? c2h_evt takes
the address of a local variable and therefore it crashes the kernel whenever
someone decides to dereference it after this function returns and unwinds 
the stack...

> +	if (!c2h_evt)
> +		c2h_evt_read(adapter, buf);

Having said that, I strongly doubt that this path is ever taken. I didn't check the call
chain, but it may be that the function in never called or, if it is called, it always
has a valid c2h_evt argument. 

Actually I don't mean to suggest something specific. It simply looks odd, so I'd check 
and if this happens to be the case, I'd remove the whole c2h_evt_hdl().

Regards,

Fabio
>  
> -			if (filter && !filter(c2h_evt->id))
> -				goto exit;
> -
> -			ret = rtw_hal_c2h_handler(adapter, c2h_evt);
> -		}
> -	} else {
> -		if (filter && !filter(c2h_evt->id))
> -			goto exit;
> -
> -		ret = rtw_hal_c2h_handler(adapter, c2h_evt);
> -	}
> -exit:
> -	return ret;
> +	return _FAIL;
>  }
>  
>  static void c2h_wk_callback(struct work_struct *work)
> -- 
> 2.31.1
> 
> 




