Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DE93670
	for <linux-staging@lists.linux.dev>; Thu, 17 Feb 2022 09:32:20 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id k3-20020a1ca103000000b0037bdea84f9cso3563686wme.1
        for <linux-staging@lists.linux.dev>; Thu, 17 Feb 2022 01:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nbXYhw8dgoBziBxoGAo22rvr5bNzjQ5ucWxP7h7o2B8=;
        b=CeCHv6teUMuPC/sZNjh3SNiO72NIUgD+NSubxrOwOB8OUOadK9Ag9DlSSAK1R6B6wH
         hUIOshX680Xz55BPdqtdlG0P6FgIlPdPvh3nEfJ6XJ/JCvmtNugY8ePOlRK3KzFWyEE3
         3ZDmmfc4T4FQrIybwGlODuPpVcUgkWukOubW0H59wt4MIJaJoT09FP4ABpT01oHylXhH
         BtWflGNeCj1PARxLwhj/jfphLkmRJ6xRBkeNphZf7q6Bz92+8Pt0rdP22ivdQfGkFsaR
         mP5IPRxY/XmOyVJtrfFCkzRW4gAT3GvquXxf0XmdyldAUAet+jbQQCBEG6szYj/fzmjT
         QbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nbXYhw8dgoBziBxoGAo22rvr5bNzjQ5ucWxP7h7o2B8=;
        b=fDJd9a7VsIl1B5EeXJiAa39ciQnWm1NBYd0BHV1KWMLOulqjBkFSweFFQUZ0MT4fdo
         WSBqv845NgKbw/CZdf0IMkRJpiIQbtzU9yaGkacRmOjppwQ1mTx4zLBzCjfyw1jP3yxD
         p1iugX0BCS4jFLnRL+0GXBJoKbKfrwyf4ah7Gu+744Kmn5Dvue7vrbsOf/t1oWQodBNG
         53yJyc4v5G3IN1DikYLE0wSVimxBNFN5XkeMqLHnu046L9WS1Ylxf65g6i5qLQxHAhzW
         vc9OQ+sJBU9A+csS8pIn5E/XGeqQBHmFkaZ7Sb9AkQO7GQU+veBsaQD0PnVJBenk+Ld9
         xYrA==
X-Gm-Message-State: AOAM5301DLQh2vnaasBzqZr6LdmzTF3JNzchAp9GYh8Qp/lfJhlfQ+dw
	3YBemKo7mp8IqFj02FpEyp98qCutjvA=
X-Google-Smtp-Source: ABdhPJxRNLwCDd9nmp+raZKa4cBctVx6tmXCI47K8udxt40tReAq7npn1n/BSyUmtQ6x/t4795b9mQ==
X-Received: by 2002:a7b:c932:0:b0:346:35f6:e81 with SMTP id h18-20020a7bc932000000b0034635f60e81mr1903292wml.15.1645090338480;
        Thu, 17 Feb 2022 01:32:18 -0800 (PST)
Received: from leap.localnet (host-79-27-0-81.retail.telecomitalia.it. [79.27.0.81])
        by smtp.gmail.com with ESMTPSA id c5sm7606994wrq.102.2022.02.17.01.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 01:32:15 -0800 (PST)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: r8188eu: Use kzalloc() with GFP_ATOMIC in atomic context
Date: Thu, 17 Feb 2022 10:32:13 +0100
Message-ID: <8028416.T7Z3S40VBb@leap>
In-Reply-To: <YgvQZDBLCsvwTtJM@kroah.com>
References: <20220208180426.27455-1-fmdefrancesco@gmail.com> <20220208180426.27455-3-fmdefrancesco@gmail.com> <YgvQZDBLCsvwTtJM@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On marted? 15 febbraio 2022 17:10:12 CET Greg Kroah-Hartman wrote:
> On Tue, Feb 08, 2022 at 07:04:26PM +0100, Fabio M. De Francesco wrote:
> > Use the GFP_ATOMIC flag of kzalloc() with two memory allocation in rtw_set_key() 
> > because it is not allowed to sleep while it executes in atomic context.
> > 
> > With the GFP_ATOMIC type flag, the allocation is high priority and thus it 
> > cannot sleep.
> > 
> > This issue is detected by Smatch which emits the following warning:
> > 
> > "drivers/staging/r8188eu/core/rtw_mlme.c:1603 rtw_set_key() warn: sleeping in atomic context".
> > 
> > Fixes: 79f712ea994d ("staging: r8188eu: Remove wrappers for kalloc() and kzalloc()")
> > Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> >  drivers/staging/r8188eu/core/rtw_mlme.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
> > index f5b2df72e0f4..860835e29b79 100644
> > --- a/drivers/staging/r8188eu/core/rtw_mlme.c
> > +++ b/drivers/staging/r8188eu/core/rtw_mlme.c
> > @@ -1600,12 +1600,12 @@ int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv, in
> >  	struct mlme_priv		*pmlmepriv = &adapter->mlmepriv;
> >  	int	res = _SUCCESS;
> >  
> > -	pcmd = kzalloc(sizeof(*pcmd), GFP_KERNEL);
> > +	pcmd = kzalloc(sizeof(*pcmd), GFP_ATOMIC);
> >  	if (!pcmd) {
> >  		res = _FAIL;  /* try again */
> >  		goto exit;
> >  	}
> > -	psetkeyparm = kzalloc(sizeof(*psetkeyparm), GFP_KERNEL);
> > +	psetkeyparm = kzalloc(sizeof(*psetkeyparm), GFP_ATOMIC);
> >  	if (!psetkeyparm) {
> >  		kfree(pcmd);
> >  		res = _FAIL;
> > -- 
> > 2.34.1
> 
> What code path is calling this in atomic context?
> 
> thanks,
> 
> greg k-h
> 
I blindly trusted Smatch and didn't check properly :(

Now I'm pretty sure that all(?) the code paths that lead to those kzalloc() do 
not call rtw_set_key() in atomic context.

The only calls chain that seemed to call rtw_set_key() in atomic context was 
rtw_set_key() <- ips_leave() <- _rtw_pwr_wakeup() <- rtw_set_802_11_disassociate() 
but Smatch (and I) missed that, immediately before calling ips_leave(), an 'if'
condition makes _rtw_pwr_wakeup() exit and return to rtw_set_802_11_disassociate().

Therefore, please drop this patch.

Thanks,

Fabio M. De Francesco  



