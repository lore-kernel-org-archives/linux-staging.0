Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E849A2C85
	for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 12:33:25 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id i20so50908036edj.10
        for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 05:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RJTUyJAg/0qOBSGu2m8VD16gMsA5V6NtIjIDHvnL/j4=;
        b=fYB/MfUpM2tfoS/PgqHaV0QQ496ObCtwA2wf1Pa5YrCg0XOosY1KpaO4aU4aPh4Oad
         NsODjk+rviw29QeQ+esAp6PovUcQmbt/Kp403piNECfUIgNLRmgc315odnPxvG3LV76L
         9aQ4UBsgFzhpZ3ALgaLteAWwFIMLUZag471IihbyI7I76ToqtC1rQa+PVQhPWQ2x33/1
         +00o1rmHd6+N3znUeRkBDGbWNu02g/7gnWPLWMnZY+qls6bwzjNpwkR46xm9pd9mpDwn
         ra1t3MidYMKZxt0MKfrnPUSC9msmhBJE7arxfEIm6kkeP0N8AT/5rbY4xphEq/q4YnPY
         6Oog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RJTUyJAg/0qOBSGu2m8VD16gMsA5V6NtIjIDHvnL/j4=;
        b=6YnT2oxaLCWJmwg49yilFFdqbBVTYC9z60r6dMPphquMiLlAOdcmffsZb9uUkh3tkn
         jGS1v1zWLnbVmxJvO4FWgmj/1WVUmqV3s/VxZTN2ETOfPDkbUFv4QcWCCz1o009MEum6
         glXz47OAawLOg7zwSo51S79MWIQSlBowKEQ+pSPYAiLWq00lmC4/s/9rIqjOklR3PYAw
         fY+wDKycJm7jdnqUwJUqO7d6UF+xnw0Ckpb+xyMdK2WEUtW62gHM24zVFhMhES/Mb1rg
         I+rW0iu0d5kNoXRLJyfmlTCqEsaRnWC5EsG5PpfMbCdyf8v5NaVfhzUU4ea0x6YUbTLc
         EiiA==
X-Gm-Message-State: AOAM53399lNy3K7u22rBK/2MpW4V3XtCaeADg3Z8fYCHwqoGJpjKf0Zf
	AlKl0Tzqat1AdUom/sSk+3w=
X-Google-Smtp-Source: ABdhPJwyDliN6EEI1VKA/p8Y/OrfXeYL2sGqclnGX8StVSvJfbPFNVf1pfAvQMUmOe6pQsLTdpWAmQ==
X-Received: by 2002:a17:906:4c8c:: with SMTP id q12mr24795449eju.254.1633955603864;
        Mon, 11 Oct 2021 05:33:23 -0700 (PDT)
Received: from localhost.localdomain (host-79-43-109-12.retail.telecomitalia.it. [79.43.109.12])
        by smtp.gmail.com with ESMTPSA id y19sm3094934edd.39.2021.10.11.05.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 05:33:23 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com, ross.schm.dev@gmail.com, marcocesati@gmail.com, saurav.girepunje@gmail.com, insafonov@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: saurav.girepunje@hotmail.com
Subject: Re: [PATCH v2] staging: rtl8723bs: os_dep: simplify the return statement.
Date: Mon, 11 Oct 2021 14:33:21 +0200
Message-ID: <4541535.Yaozv5YaVW@localhost.localdomain>
In-Reply-To: <2482197.HNbSr4JpUv@localhost.localdomain>
References: <YWJ0vSrgsiKK7suE@user> <2482197.HNbSr4JpUv@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, October 11, 2021 10:54:11 AM CEST Fabio M. De Francesco wrote:
> On Sunday, October 10, 2021 7:06:05 AM CEST Saurav Girepunje wrote:
> > Remove the unneeded and redundant check of variable on goto out.
> > Simplify the return using multiple goto label to avoid
> > unneeded check.
> > 
> > Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> > ---
> > 
> > ChangeLog V2:
> > 	-Add goto out after the memcpy for no error case return with
> > 	 ret only. Free is not required on no error case.
> 
> Please write versions logs that reflect clearly and unequivocally what you 
> changed between revisions and why. Subjects, Commit messages (Changelogs), 
> and Versions logs are the "specifics" of your work. There must be no 
> inconsistencies between these and the code or the history of the changes of 
> the code.
> 
> You may think that I'm pedantic, but since I acked your patch, I don't want 
> to be misunderstood to be a promoter of approximate or clearly incorrect 
> messages.
> 
> "Free is not required on no error case" conveys the message that you have 
> changed something that is not required but that is still potentially 
allowed.
> 
> This is not the case because the problem that you fix with v2 is _not_ 
> something that is merely not required and unnecessary. You have fixed a bug 
> that is introduced in v1. Introducing bugs is not allowed. If you do 
> something that is not allowed you cannot simply say that it is not 
required. 
> 
> > 
> > ChangeLog V1:
> > 	-Remove the unneeded and redundant check of variable on
> > 	 goto out.
> > 	-Simplify the return using multiple goto label to avoid
> > 	 unneeded check.
> > 
> >  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 22 +++++++++----------
> >  1 file changed, 10 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/
> staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > index 0868f56e2979..ae9579dc0848 100644
> > --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > @@ -2312,7 +2312,7 @@ static int rtw_cfg80211_add_monitor_if(struct 
adapter 
> *padapter, char *name, str
> >  	mon_wdev = rtw_zmalloc(sizeof(struct wireless_dev));
> >  	if (!mon_wdev) {
> >  		ret = -ENOMEM;
> > -		goto out;
> > +		goto err_zmalloc;
> >  	}
> > 
> >  	mon_wdev->wiphy = padapter->rtw_wdev->wiphy;
> > @@ -2322,23 +2322,21 @@ static int rtw_cfg80211_add_monitor_if(struct 
> adapter *padapter, char *name, str
> > 
> >  	ret = cfg80211_register_netdevice(mon_ndev);
> >  	if (ret) {
> > -		goto out;
> > +		goto err_register;
> >  	}
> > 
> >  	*ndev = pwdev_priv->pmon_ndev = mon_ndev;
> >  	memcpy(pwdev_priv->ifname_mon, name, IFNAMSIZ+1);
> > +	goto out;

As Pavel noticed, probably you'd better return 'ret' here. The logic does not 
change, but I guess that this is what Linux developers usually do.

From a review by Dan Carpenter of one of your other patches: "[] Do nothing
labels only hurt readability and introduce "forgot to set the error code
bugs.".

Thanks,

Fabio

> > 
> > -out:
> > -	if (ret && mon_wdev) {
> > -		kfree(mon_wdev);
> > -		mon_wdev = NULL;
> > -	}
> > -
> > -	if (ret && mon_ndev) {
> > -		free_netdev(mon_ndev);
> > -		*ndev = mon_ndev = NULL;
> > -	}
> > +err_register:
> > +	kfree(mon_wdev);
> > +	mon_wdev = NULL;
> 
> Probably you have already read a message by Greg Kroah-Hartman that 
confirms 
> what I wrote in another message: "There is no need to set a local variable 
> like this to NULL.".
> 
> So please submit a v3. With the two changes requested above, my "acked-by" 
> tag is confirmed again.
> 
> Thanks,
> 
> Fabio
> 
> > 
> > +err_zmalloc:
> > +	free_netdev(mon_ndev);
> > +	*ndev = mon_ndev = NULL;
> > +out:
> >  	return ret;
> >  }
> > 
> > --
> > 2.32.0
> > 
> > 
> > 
> 
> 
> 
> 
> 




