Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D078B3219;
	Thu, 14 Apr 2022 19:43:20 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id t207so4884764qke.2;
        Thu, 14 Apr 2022 12:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Kl4Gb8dibgfKBMDtgfnzoEiPtmtB9KHx9N7a+Sz0WcI=;
        b=deJ2fNDL/pLSKKh3BMB6qBEs21CYtmEZkftWXzK34PNn312yvbZSSOBjm3M1yJFr0O
         TS9VXo+ttltY2auH1XYw+87cgy4EBeJNkPe5mdqPKX9EREoNVktYo4OjezxSpQfYTLx9
         wtQxwbpehmMiDomokie29JozB0G8AaQkBtbn+WGE5lgak+sfEw8lC6V4SV5M5a7+GpOx
         IVgcCNsXTk1HgXYopktsJgdaEyFa1Zpd2sg6YyZT9AEXDyeC6FtTP/B858INzKL/sVID
         ow9bUsclLJ3MRjdNZU3LX0Oomz0SlTBkk+3UCLU+vgQj+W8in0YlRSxuc8s6x/lZBnSx
         REPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Kl4Gb8dibgfKBMDtgfnzoEiPtmtB9KHx9N7a+Sz0WcI=;
        b=JXaxfyNvOUSE+AS5AkI+KHJLvH+IIsjQu9kj4+O3azOy6Oqv/IoT+m/Up+WMEVZX0G
         ppq3gX/Z4chG7goI6Pax+QDtaSunZBxsBReULXH90JsiBDjq2S70EeNjhDzQDPVenGAB
         lxE4FyEPFOsyVQpem1XKdkKkwDb1npNenOn90NiIEHwW/C0obSTpkK7ABxxn+VfeqKj9
         NAeQeHIdiys6K+F21I020zIpXWOJRHsShA3vhoo85cuHAqzy7G2pL6ZqFrMuxjFcNTfm
         Sd3gPronsa/XzBt1XPrQHmBD/5q/N+P7c75Nyp3gOdFWsPzFJZw6tfJl0SV/2Enq5oA3
         sYHQ==
X-Gm-Message-State: AOAM531FwgPH+lfGEzaQweZr+dCd4o/BSdwAjIeyHlzDLBfHEok8cLv+
	ea6n733XrU8agOTS+w3p+DHeB8+qYoKriMEl
X-Google-Smtp-Source: ABdhPJxcPhOFOpExjEr6gFnlRQU6b09MTwwMPxXLFuy+lVGN7ddULnayETUX5xQ7k6MMhBPQC9b6fQ==
X-Received: by 2002:a37:9a57:0:b0:69b:fbce:8035 with SMTP id c84-20020a379a57000000b0069bfbce8035mr3156152qke.187.1649965399839;
        Thu, 14 Apr 2022 12:43:19 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id h5-20020ac85845000000b002edfd4b0503sm1829105qth.88.2022.04.14.12.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 12:43:19 -0700 (PDT)
Date: Thu, 14 Apr 2022 15:43:15 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH 5/6] staging: r8188eu: replace spaces with tabs
Message-ID: <20220414194315.GC4144553@jaehee-ThinkPad-X1-Extreme>
References: <cover.1649880454.git.jhpark1013@gmail.com>
 <c2d719eba2a374be573034022218a098e4db9e77.1649880454.git.jhpark1013@gmail.com>
 <e32f1f61-127c-3e90-0f06-7b60cdca9ef7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e32f1f61-127c-3e90-0f06-7b60cdca9ef7@gmail.com>

On Wed, Apr 13, 2022 at 11:34:14PM +0300, Pavel Skripkin wrote:
> Hi Jaehee,
> 
> On 4/13/22 23:11, Jaehee Park wrote:
> > Use tabs instead of spaces. Issue found with checkpatch.
> > WARNING: suspect code indent for conditional statements
> > 
> > Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> > ---
> >   drivers/staging/r8188eu/core/rtw_mlme.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
> > index b943fb190e4c..7a90fe826d1d 100644
> > --- a/drivers/staging/r8188eu/core/rtw_mlme.c
> > +++ b/drivers/staging/r8188eu/core/rtw_mlme.c
> > @@ -722,7 +722,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
> >   			pmlmepriv->to_join = false;
> >   			s_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
> >   			if (s_ret == _SUCCESS) {
> > -			     _set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
> > +				_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
> >   			} else if (s_ret == 2) { /* there is no need to wait for join */
> >   				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
> >   				rtw_indicate_connect(adapter);
> 
> Not related to your patch, but looks like `s_ret` can't be 2.
> 
> rtw_select_and_join_from_scanned_queue
> 
>   rtw_joinbss_cmd
> 
>     rtw_enqueue_cmd
>       _rtw_enqueue_cmd <- always returns SUCCESS
> 
> 
> Other functions from calltrace may return _FAIL, but _FAIL is not equal 2,
> right?
> 

Thank you for your comment. Since _rtw_enqueue_cmd cn't return 2, 
should we replace 2 with _FAIL? I can make this change in another 
patch. 

> 
> 
> With regards,
> Pavel Skripkin
