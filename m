Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A6C4D17AD
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 10:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848816; cv=none; b=txQtOxtTMcjVATiX54VfnHvGa2CKF+QxZnnvx3SotXbNgdFglUaLETaY4p313Wf7Aae4k3uvN9M7A7o3/B0HZ4Hxs9qnbkAxGeYAb9prRZVw5X05xlpgJwn90HbojezqcOukYk6i/5PWjgGoYDx5lI/HHxqQVUpiOgmeMQtJdZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848816; c=relaxed/simple;
	bh=lVdGv+ilr9WlNpGBFEGFcM/RnLg+9ZGrF4ALyk+UVls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADOnmfeJsa7LcPOiNU93ak+tvP2OqXJOz38YOzfqQJdGpjBdMBT5HpMF6aMXzKojordEqJX9//Bul9Frb3FmKwtJi7BEKu9w8Y8QdQyN88s3V6A/9COR4J0/XuWjupgdNODYxN0lrd9ZyzRdRprpGZ8BagkVSHvUd6A/x4clJdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bh/7UuF3; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bh/7UuF3"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e20bb4583so236882166b.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 03:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790848804; x=1791453604; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tLtKrXyBLHYLDfJn7C9+9PKs3haoxGqRb1SBGI62Z74=;
        b=Bh/7UuF3k/pWu6Y2tJnHzsbUD5EdyrWAWZ2QuCxYhCXk/xN1U2BgyF7DXhLyIva5+N
         +a5XD03uS79elSPSIJ0pYvCEHa28YyUtYaIKysUxaTAf0chOH0fW7Tkpg2sCVlvzkXYx
         gGH4DPrhr2lUNWtssqjE/gFhRRclexBMSsmMksxjLw812p2l8l3vZvuL6O3wd6GA8Io9
         GeEkgBdjkAWwURQ3fdeGt6VhkWGpCMQUER7Zd2ys2v9IdpKQpOalF4/Y3jqzMpgMZZoA
         RCHkAAKycKLKmdpuglqz69UR9BL6D81knr01NwcG2EOmmLLMufSngOvNGU/JxiccI3lp
         jrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790848804; x=1791453604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLtKrXyBLHYLDfJn7C9+9PKs3haoxGqRb1SBGI62Z74=;
        b=feUm5SAJo4f0B2bsgCUl/AAChN5ffM6v0WJdxdQe6Gz5afE3hZKLbNzhwYODJB5F+o
         ns6MnjJ0XPrNBvVYRm0XvHiDB6AYZb18Uuv+3C7wu1Q2QomoyxL5kytxR5LyVa5sk1uX
         iwdp5DF8MBTLJgFiqHABBZLDZSwD8UZOwflAHKvX00fpl1UVPeIM9RZhS93bUy9qWViP
         njEP7Q+/GXYGfyNZ6z8pnZZyo7Ad6uhFlvR2cxyGek/1FjFqIZekBTnLioJgetBKXTn/
         tDw3R9qX4fBO1RzwcbBJYc1JJXr05PnBLZ/Ke5w0AWAwJ6TG1fxoVZ0bhQsV/KFlfHZx
         KiVQ==
X-Forwarded-Encrypted: i=1; AKwUvBy81/q3c8JJyumzqFjFbSeiKEmSSnv+UPzASp5NkzE2ueKsQKFtkocZPs7DSw64p/KuiK4Maad3o9wY4iMc@lists.linux.dev
X-Gm-Message-State: AFuF++kiLKyjdnAvMOfGG4NJunOM/T/xHZpthGX/G5EIKL4oR3/juAvE
	V/CgrY5m4UxV9fuuKb6uOoaAsAVU6iIx8VTxEeZCuz2glp+4qHcUwuAI
X-Gm-Gg: AYBFou2lBaxAHcDY+x4KhCsgDYKH7hl2a+Gib70j34j5RG+1YSgjRfJzzGNEsm7xnH4
	FVl7vnFPKH1NCSuDGwy9niiwzuhZP02Fe1ZQBFdm1qZi2n+RpCHuZ6sXYWt37whjXQD/3LEKnp5
	G1rIXTq/MMRi94zXX3wftwAZx2+lrRyvDZ8GcDsIL0CAfAyUs5NnGx3LKp9PacP5vFQiAZIgarK
	vAKTKEUgZxbJjhD0Suk957YpV627Bsv8EFj0Vm1omjBGnzEmnXEc3+1RWflinAxNjK/im5wFrgx
	yDfdoIfA6sCePpIdqBqJDDUStglo0g4bv9G0j6+MeMl/7k1jPcKXQpGIFDRCmtyFemcMyzOiokc
	kDj4OdTfSYr1H9dRtnNSXlRdA5z9/V6Ik9bdWLveR6n2RdPMtnEV7DxVUgzkbS8UMv26S6/tUgh
	ZYPZ63iGTtluzf5lhqQN02z0AyddOH/AUcYsRbnii3ygjYvgJengwEvhaY3lUPBvlG3uE=
X-Received: by 2002:a17:907:d90:b0:c1c:3b06:ed03 with SMTP id a640c23a62f3a-c2e23d5fc90mr371870366b.23.1790848803545;
        Thu, 01 Oct 2026 03:00:03 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e451fce88sm4087666b.74.2026.10.01.03.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:00:02 -0700 (PDT)
Date: Thu, 1 Oct 2026 12:59:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Amirhossein Hajimohammadi <info@hajimohammadi.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: stop overreading monitor
 interface name
Message-ID: <ar4vH3F5lLFijgTU@stanley.mountain>
References: <3B4B0B72-4DCE-4E40-9E87-732DCBAA4EAF@hajimohammadi.net>
 <2026092915-luxury-shush-6b29@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026092915-luxury-shush-6b29@gregkh>

On Tue, Sep 29, 2026 at 06:05:12PM +0200, Greg KH wrote:
> On Tue, Sep 29, 2026 at 07:18:11PM +0330, Amirhossein Hajimohammadi wrote:
> > From: AmirHossein HajiMohammadi <info@hajimohammadi.net>
> > 
> > cfg80211 passes a NUL-terminated interface name. memcpy() always reads
> > IFNAMSIZ + 1 bytes, even when the caller supplied a shorter string.
> > 
> > Use strscpy() to stop at the terminator and bound the write to the
> > destination buffer.
> > 
> > Signed-off-by: AmirHossein HajiMohammadi <info@hajimohammadi.net>
> > ---
> > Changes in v3:
> > - Add an explicit From header matching the Signed-off-by identity.
> > 
> > Changes in v2:
> > - Send the patch inline instead of as a MIME attachment.
> > 
> >  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > index 4416d0ec1..8f5032844 100644
> > --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > @@ -2158,7 +2158,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
> >  		goto out;
> >  
> >  	*ndev = pwdev_priv->pmon_ndev = mon_ndev;
> > -	memcpy(pwdev_priv->ifname_mon, name, IFNAMSIZ + 1);
> > +	strscpy(pwdev_priv->ifname_mon, name);
> 
> But we are replacing str*() calls in the kernel with memcpy() calls
> where it can happen, so why go backwards here?
> 
> What caused you to notice this change is needed?  Have you measured a
> speed up in throughput with this change applied?  How was it tested?

This seems like a legit patch to me, although it's probably AI generated.

net/wireless/nl80211.c
  5199          wdev = rdev_add_virtual_intf(rdev,
  5200                                  nla_data(info->attrs[NL80211_ATTR_IFNAME]),
                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This means that it is a string up to IFNAMSIZ (16) bytes long counting
the NUL terminator, but it could be less.  So doing a memcpy() is a
read overflow.

  5201                                  NET_NAME_USER, type, &params);

regards,
dan carpenter
