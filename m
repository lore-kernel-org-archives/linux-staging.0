Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBF770
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 12:54:54 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id bx7so5345906edb.12
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 05:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=x4egqT+11QPAlQXCi8F1GF6pnWQgf5rcpliAg7WMras=;
        b=pD1cQ3dX1GvJ/4xpDbhw4+PDZQ7FUR//hZObefyaJKqiMbZ/Y6II9K5E2mpQan/b28
         Dm50GaAXr0zaJqWMvXfs5oUy3exHUryei3XDYiLTLvinE5ELIG+2yLyvOeRMciStHER/
         +LDGfdjEe1N/z2ywPnUzRZWvpqJ/dJiQ43YyGqcvpcVFs4LgnJuq8ouDE4b+9vjzdyG8
         xuSAecMJgfkAfco9OWI1DtSXH5NkMhL8EarD/FR/+z/th0JsGS7y9v3sFkKI4JQARq7U
         v9WjqdNtbj8QmrUyYOHHhCrYn9dkNc9zt3B1IPA8j/z/lVJbm1IWS3e30H4Pk4NhwEeK
         tY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=x4egqT+11QPAlQXCi8F1GF6pnWQgf5rcpliAg7WMras=;
        b=cb31lFIp6+xCHzJWerMlocja98PIUPZ3cJhky4qk3erdMpMSNgHWzcsBsnvf2xCRbR
         46iOoT22BEqF4NuEb0rM8jIUx21daf7UlbZHZE8mLS5QuJAzQveyDJhYmBLoPoXfsKX9
         OzFqeCP1mHQmjbBFENrwMioCxbfua4+lZwpCsO2OPRIsIwwx0JXnhOmRPRFB90UCbk8n
         krS0ixzGB4+YrU+C50FyrG7chdk3bAkr33ll/O/MX/EMtHpemj8frXxWvJSJo9nC7ucj
         D+SutSZqlAFKVsaM24AyBaE5OserDvxSqJQ8G7eC7M3fiXVv8+6DCLeX+f7N0g2zG/uC
         iXoQ==
X-Gm-Message-State: AOAM530r3OQc4gw/EDsl8zva5xPt0EXshfvfxO+3K9bKU9KK8uwTQsan
	3oBm8oJ/P+rLNm0/FmHI5bY=
X-Google-Smtp-Source: ABdhPJznJ2znIahVNVXZ4ozR1jZPIlWF5bjOjdkBWKEJPHoXaZhy0XXNsQxy/JNvcO1F0dcbtAVYHg==
X-Received: by 2002:aa7:cd54:: with SMTP id v20mr15474915edw.80.1617368092715;
        Fri, 02 Apr 2021 05:54:52 -0700 (PDT)
Received: from agape.jhs ([5.171.80.213])
        by smtp.gmail.com with ESMTPSA id x17sm4140794ejd.68.2021.04.02.05.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 05:54:52 -0700 (PDT)
Date: Fri, 2 Apr 2021 14:54:49 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.carpenter@oracle.com, joe@perches.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/16] staging: rtl8723bs: remove RT_TRACE logs in
 core/rtw_xmit.c
Message-ID: <20210402125448.GC1420@agape.jhs>
References: <cover.1617356821.git.fabioaiuto83@gmail.com>
 <72ab5222629f912ca2dbe825d194108992d321e7.1617356821.git.fabioaiuto83@gmail.com>
 <20210402115626.GV2088@kadam>
 <20210402124045.GA1420@agape.jhs>
 <YGcSTvoyPtBsXgfp@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGcSTvoyPtBsXgfp@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Apr 02, 2021 at 02:47:10PM +0200, Greg KH wrote:
> On Fri, Apr 02, 2021 at 02:40:46PM +0200, Fabio Aiuto wrote:
> > On Fri, Apr 02, 2021 at 02:56:26PM +0300, Dan Carpenter wrote:
> > > On Fri, Apr 02, 2021 at 12:01:21PM +0200, Fabio Aiuto wrote:
> > > > @@ -568,20 +561,11 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
> > > >  	if (pattrib->encrypt > 0)
> > > >  		memcpy(pattrib->dot118021x_UncstKey.skey, psta->dot118021x_UncstKey.skey, 16);
> > > >  
> > > > -	RT_TRACE(_module_rtl871x_xmit_c_, _drv_info_,
> > > > -		("update_attrib: encrypt =%d  securitypriv.sw_encrypt =%d\n",
> > > > -		pattrib->encrypt, padapter->securitypriv.sw_encrypt));
> > > > -
> > > >  	if (pattrib->encrypt &&
> > > > -		((padapter->securitypriv.sw_encrypt == true) || (psecuritypriv->hw_decrypted == false))) {
> > > > +		((padapter->securitypriv.sw_encrypt) || (!psecuritypriv->hw_decrypted)))
> > > 
> > > You've done too much clean up here.  Just remove the { but leave the
> > > == true/false comparisons.
> > > 
> > > If the patch is only changing five lines or code then fixing checkpatch
> > > warnings on the line of code you are changing is fine, but in this case
> > > you're doing a bunch of changes and these sort of cleanups make it hard
> > > to review.
> > > 
> > > Ease to spot that the curly brace changed:
> > > -		((padapter->securitypriv.sw_encrypt == true) || (psecuritypriv->hw_decrypted == false))) {
> > > +		((padapter->securitypriv.sw_encrypt == true) || (psecuritypriv->hw_decrypted == false)))
> > > 
> > > Hard to spot:
> > > -		((padapter->securitypriv.sw_encrypt == true) || (psecuritypriv->hw_decrypted == false))) {
> > > +		((padapter->securitypriv.sw_encrypt) || (!psecuritypriv->hw_decrypted)))
> > > 
> > > regards,
> > > dan carpenter
> > > 
> > 
> > thank you Dan, it's a good tuning process for me. Shall I resend the
> > whole patchset? Maybe some of them are ok...
> 
> Yes please, you do not want me to pick and choose individual patches out
> of this series.  Our tools grab the whole series at once to apply them.
> 
> thanks,
> 
> greg k-h

ok, got it,

thank you for your patience,:)

fabio
