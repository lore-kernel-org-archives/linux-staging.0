Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3A67E;
	Mon,  3 Apr 2023 01:21:58 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id y4so111198160edo.2;
        Sun, 02 Apr 2023 18:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680484916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cy9vAKh1SRYsjRJ8W4Bk+i1NkUBPumqbVrEbWjhh5Fc=;
        b=X9MbgiVAqpAsMwjKEaSh1WtuNTtZP+qfKhbY0jGwZFSScHv16z4rRic/5SO9E0ZMDO
         Ut0paFXlg6zg1emacna3VdXOs9WevneldVXVYmD5SIUKMdBHqklbqOeBKoRpjIqFG7LR
         +Q+KvC2qNwDVOQADLPQsDIP3DtuulQIObKkygyz31ooSXCzCl1cia/2+9gZ+6oekvbIb
         j73kvCPkeVcb5IGBtT3/qA5YGCLUnQZpHjxbFX/oseJOQAjq62SCPBoHOOw1HAKOCsNw
         JIuBJO5VNcP57WdvS2k7YZve6DiIcSSlmVhwQo10NTAaQsJ8ojwsZLpsZVGR+86vzDxe
         TbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680484916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cy9vAKh1SRYsjRJ8W4Bk+i1NkUBPumqbVrEbWjhh5Fc=;
        b=vmdy84fdQ3lxEFrVW2ENK8sgADNnN4d2jeICmrTmv4dJg8tdET7vrrI9XKyP1xuWXT
         vkEv++XMesNSHzT08DmQoj8y9D0pfk2PNS3M7FO7+rS3nBu3EZJwYcr7IDoDgmF9GKmg
         mybpBGzEZnhae5k7SDVpC4qhXZW5Yk1UkiU2IyK4mvUdh7t0qaI9ZwGYoxqXKwW3woqp
         lhz1EWDcSE17dtvuLY+zwp36gsVSJDhw2KFal3VWjyHgqTIOvIy+25iwd5wHd2HViwnF
         S+BMCgUyaMWt3BgheXXPZGtalArXq2b6+Gy1MKSrA2CjgXCtpbUJ6AO+T6brueJD9ukE
         X5uw==
X-Gm-Message-State: AAQBX9f3+Q3yGBUiiG3g4ULA0QvNzrRPkHzVQYvzSEhKJUAxXW6PPz/w
	TZ54SEYK79hCcguYOxxSOT0=
X-Google-Smtp-Source: AKy350bNl1jreipDIob/3r+nXH8ZnNBarE8ORo0800gplNiVNhtpMvqSInA6zXj85vzaItVXHL2H/g==
X-Received: by 2002:a17:906:8053:b0:93b:5f2:36c with SMTP id x19-20020a170906805300b0093b05f2036cmr30131818ejw.61.1680484916462;
        Sun, 02 Apr 2023 18:21:56 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090630ce00b0094596ff8240sm3783596ejb.110.2023.04.02.18.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 18:21:56 -0700 (PDT)
Date: Mon, 3 Apr 2023 06:21:53 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: outreachy@lists.linux.dev, hvaibhav.linux@gmail.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alison Schofield <alison.schofield@intel.com>
Subject: Re: [PATCH 1/2] staging: greybus: add a single exit path to
 arche_platform_wd_irq()
Message-ID: <ZCoqMSy1Ary0sAp9@khadija-virtual-machine>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
 <e670baa9bde47a3bdb02e59ec37a438a62c52dd1.1680185025.git.kamrankhadijadj@gmail.com>
 <642a1fdcb2648_394c3829469@iweiny-mobl.notmuch>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <642a1fdcb2648_394c3829469@iweiny-mobl.notmuch>

On Sun, Apr 02, 2023 at 05:37:48PM -0700, Ira Weiny wrote:
> Khadija Kamran wrote:
> > arche_platform_wd_irq() function has two exit paths. To make the code
> > more readable, use only one exit path.
> > 
> > Suggested-by: Alison Schofield <alison.schofield@intel.com>
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
>

Okay, noted.

Also, would it be okay to send a patch revision with the changes or
should I wait for the feedback on Dan's comment. Here is a link to it:
https://lore.kernel.org/outreachy/6ce8aa34-e600-4d6a-adad-ead8255342e5@kili.mountain/

Thank you!
Regards,
Khadija 

> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> >  drivers/staging/greybus/arche-platform.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> > index fcbd5f71eff2..a64c1af091b0 100644
> > --- a/drivers/staging/greybus/arche-platform.c
> > +++ b/drivers/staging/greybus/arche-platform.c
> > @@ -153,6 +153,7 @@ static irqreturn_t arche_platform_wd_irq_thread(int irq, void *devid)
> >  static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> >  {
> >  	struct arche_platform_drvdata *arche_pdata = devid;
> > +	irqreturn_t rc = IRQ_HANDLED;
> >  	unsigned long flags;
> >  
> >  	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
> > @@ -180,9 +181,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> >  						WD_STATE_COLDBOOT_START) {
> >  					arche_platform_set_wake_detect_state(arche_pdata,
> >  									     WD_STATE_COLDBOOT_TRIG);
> > -					spin_unlock_irqrestore(&arche_pdata->wake_lock,
> > -							       flags);
> > -					return IRQ_WAKE_THREAD;
> > +					rc = IRQ_WAKE_THREAD;
> >  				}
> >  			}
> >  		}
> > @@ -204,7 +203,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> >  
> >  	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
> >  
> > -	return IRQ_HANDLED;
> > +	return rc;
> >  }
> >  
> >  /*
> > -- 
> > 2.34.1
> > 
> > 
> 
> 
