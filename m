Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B6A6D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 08:27:52 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id h25so12496339pgm.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 01:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ntPmOtLTBQO17iO2C/J/ncPJWSh08MXYx+HubKJAAco=;
        b=DgDxwehh+Y1geD1x94gB5CIcgxFxYq2ix10Hazya1dhlitsPuWwtLaeacuzPSmgZKB
         1jDCyIESK3asjo77f01em0nRZPUJCfa3Z3n3oDJYGrzIJfVGLP4d/z1UzgZg0TsMQpp9
         F8pb6+cGVhGfTlp+UqfcS/jjuiKrOUT/oBPE7/+PUoaF2GxwIcBuW+oEyIIk43ksimfB
         rU2XzKJoEsTunZUzcS5/xH+r/p5WH9jEi4bWkCZPYEoqnrMneY6o8TfDDAkak6lQyEhm
         FUB3uu5oizynLS7Nt0tYZhTyQgOjl58C+BfveOaTxrRRM0IGwtpIu2SmlgC45wXiod+4
         ylkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ntPmOtLTBQO17iO2C/J/ncPJWSh08MXYx+HubKJAAco=;
        b=gvRzHvnfyBuEhrAeMauenKJiw+YMHkasV4be6LSarJTSmI58jfCV19BkcWIE7hsIKd
         BqlZhMGbjBDMr1eKex48EtI1M1d8SECU0dURFZbEKLe/ldDwsXDMn3iRcmK4Za1u25n0
         UAhZTj2nK94j+7uVOHqHsdI4GAr2yBZm/8cDQTx78vTnL0ciLIW3LLwq24bk8pgA1xx1
         hsQLKY8uiS0NtftmPxRWOsHxP/xQV4HCOrpE8QmOniOLzmISeTlnmmeYmODPDHOC2Jes
         Xssg3tZ3bZdoMzhronbVAR1bJ2So9QSrZvAtXDgotIQRRI8/H/78GK2Z5XLz8b7iNVC5
         v0QA==
X-Gm-Message-State: AOAM5307TqGC78SfwRKsRF8d+upQPbSkKwZMtuwQzJ7djvS06mQ1UEzZ
	FK8v4XsrT42C0BF+2yU3QK8=
X-Google-Smtp-Source: ABdhPJySc6gloAuTNcaXpmXnMgeewxCipjgewulWGsAiSehmJ/N0gclf05LA7y+Ge2ge6B3WJ1aMjw==
X-Received: by 2002:a65:4082:: with SMTP id t2mr2249130pgp.396.1617784072324;
        Wed, 07 Apr 2021 01:27:52 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id v25sm20484716pfn.51.2021.04.07.01.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 01:27:51 -0700 (PDT)
Date: Wed, 7 Apr 2021 01:27:49 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/49]  staging: sm750fb: Update enum values in dpms
 to snake case
Message-ID: <YG1tBSqVTwKQChHV@localhost.localdomain>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
 <16693e7cc62f84ea1ec34b7d5cbd77c4cd1965e8.1617776878.git.pavle.rohalj@gmail.com>
 <YG1eFxQDP6dITlXA@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YG1eFxQDP6dITlXA@kroah.com>

On Wed, Apr 07, 2021 at 09:24:07AM +0200, Greg KH wrote:
> On Tue, Apr 06, 2021 at 11:36:16PM -0700, Pavle Rohalj wrote:
> > Fix "Avoid CamelCase" checkpatch.pl checks for values in
> > enum dpms.
> > 
> > Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
> > ---
> >  drivers/staging/sm750fb/ddk750_power.h | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/sm750fb/ddk750_power.h b/drivers/staging/sm750fb/ddk750_power.h
> > index 7002567a47d2..4756db1ccb9c 100644
> > --- a/drivers/staging/sm750fb/ddk750_power.h
> > +++ b/drivers/staging/sm750fb/ddk750_power.h
> > @@ -3,10 +3,10 @@
> >  #define DDK750_POWER_H__
> >  
> >  enum dpms {
> > -	crtDPMS_ON = 0x0,
> > -	crtDPMS_STANDBY = 0x1,
> > -	crtDPMS_SUSPEND = 0x2,
> > -	crtDPMS_OFF = 0x3,
> > +	CRT_DPMS_ON = 0x0,
> > +	CRT_DPMS_STANDBY = 0x1,
> > +	CRT_DPMS_SUSPEND = 0x2,
> > +	CRT_DPMS_OFF = 0x3,
> >  };
> 
> And the build does not break with this change?  If so, then why are
> these here at all?
> 
> thanks,
> 
> greg k-h

I do not think so, I was able to build and load the driver with these
changes. It looks like this enum is used as a type of the state parameter of
ddk750_set_dpms function, but the three defined constants are never referenced. 
Should we get rid of dpms enum and change the type of the parameter to an unsigned integer?

-Pavle
