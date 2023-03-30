Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0108BEE
	for <linux-staging@lists.linux.dev>; Thu, 30 Mar 2023 17:05:04 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so22648668pjp.1
        for <linux-staging@lists.linux.dev>; Thu, 30 Mar 2023 10:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680195904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/RhTCvFU04Z911eDGmWlcdN2E+0Qy15cuZmJweiAivc=;
        b=fvUJQbWt4yQoIbRQI7cGdmkpux1QTQ59o3AYRW4kc8O/u53k8CXl1SLTm5fxQsUa4z
         bzFy2QIdcXqUkTk6GcwIBShLWs5voSZjnFVEzCp+A3mCO2cknU0qlX/xKpIp6+hH5nlm
         mhNwrpl9JAKt8idKediVSksmKqszs+DS3A8KkQ1HDM0NdKsRZMybebctL8JKXH++JM3s
         jxWL9lNuAr6RRq6/awFn2H2bsboN6p0uJj8wmgCwY4RglnGrgScwfP/7LXR2dSB8+mjS
         VE/k5oE8/8SJYu+Wa9lKXNdI0OYkVYmWc5EcDeXrOVUR7qt5g63rb6aE/nBX14rz4gq4
         Mw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680195904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RhTCvFU04Z911eDGmWlcdN2E+0Qy15cuZmJweiAivc=;
        b=bYJk7IXOnqIXIztiTSgX68MpLLogyu2YJjgZupHr6q40XXRNz3HbbNf/HZ/kEXccWS
         ZvYmB4LnYf8DLFatkvZIkSoSdJNJ0MAFGhgWjX2V8Y8bzDgzqgop3D4diX0SsYNTlM2B
         zB3GgCeQjXhNpGZsyi4euz8rttQR2OczMyXTtvvzdyIbDPp7ZcuyZO18Rt9Ff63kqEqC
         IQavgjBdz9DqzSoVliMSYQUEGgJ9+GzhMaRd4yRDw90xPm7NoJzkIiIR7/KpYZnJYGTT
         /FstKhXxZu4qd8hUCNDKyIyKc94acWtj7r3wb6h6dgTzcOWYd+P5YEHhinuuN9IBnchr
         ktVw==
X-Gm-Message-State: AAQBX9dYKobUjPW+WsAo0jPWmsVGiPBFrC24U8RKaWls41mIwyaVrGP/
	4MTE10UMmPsQNA3b2NrJ1iw=
X-Google-Smtp-Source: AKy350Zs4OW6OX4RIyWsRZaEsTlbNgRwErlR6RkRS+/xLHprZ6SkMogglY331/j4Pp1Q22KUWB/UsA==
X-Received: by 2002:a17:902:ced0:b0:19f:1c69:54b5 with SMTP id d16-20020a170902ced000b0019f1c6954b5mr25910790plg.12.1680195903901;
        Thu, 30 Mar 2023 10:05:03 -0700 (PDT)
Received: from joel-ubuntu-desktop ([2407:4d00:2c02:823f:14a7:49e0:2d87:e0ad])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902724100b001a198adb190sm25066247pll.88.2023.03.30.10.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 10:05:03 -0700 (PDT)
Date: Fri, 31 Mar 2023 01:04:59 +0800
From: "Joel C. Chang" <jcchangg3@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: driverdev-devel@linuxdriverproject.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: ks7010: remove unnecesary parentheses
Message-ID: <ZCXBO0cugdyR80g3@joel-ubuntu-desktop>
References: <ZCWEM7DCDUEOzBe9@joel-ubuntu-desktop>
 <ZCWFcosyX0PllKLI@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCWFcosyX0PllKLI@kroah.com>

On Thu, Mar 30, 2023 at 02:49:54PM +0200, Greg KH wrote:
> On Thu, Mar 30, 2023 at 08:44:35PM +0800, Joel Camilo Chang Gonzalez wrote:
> > Remove parentheses not needed in if statement
> > 
> > Signed-off-by: Joel Camilo Chang Gonzalez <jcchangg3@gmail.com>
> > ---
> >  drivers/staging/ks7010/ks_hostif.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
> > index af3825578d85..8bded7e88ce7 100644
> > --- a/drivers/staging/ks7010/ks_hostif.c
> > +++ b/drivers/staging/ks7010/ks_hostif.c
> > @@ -129,7 +129,7 @@ int get_current_ap(struct ks_wlan_private *priv, struct link_ap_info *ap_info)
> >  	size = (ap_info->rsn.size <= RSN_IE_BODY_MAX) ?
> >  		ap_info->rsn.size : RSN_IE_BODY_MAX;
> >  	if ((ap_info->rsn_mode & RSN_MODE_WPA2) &&
> > -	    (priv->wpa.version == IW_AUTH_WPA_VERSION_WPA2)) {
> > +	    priv->wpa.version == IW_AUTH_WPA_VERSION_WPA2) {
> 
> If you look in the archives, you will see that I reject this type of
> patch all the time.
> 
> Also, please use scripts/get_maintainer.pl to determine who to send this
> to, you used a very old mailing list address that is long dead.
> 
> thanks,
> 
> greg k-h

Thanks for the input. I wasn't sure who to send it to, since the TODO in
the driver and the script have different email addresses.

Is there a place to check for inactive mailing lists?

