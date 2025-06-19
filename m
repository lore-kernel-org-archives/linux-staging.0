Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CBD23C514
	for <linux-staging@lists.linux.dev>; Thu, 19 Jun 2025 13:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750338741; cv=none; b=nKH4wsP4vomE/+aEnSMPUvJWRtfzObhpvjyYylVUhDGCd/aA/091mhg1jFZInEO9e4oe4Zdp9m6hQtXOYwXAVxcphzsfUBPWt2gy5zpN9f8Af1DVJRAFe/iPOTIBIDfdMUZ0NemXaw1l1grMaeAAQCkX71n3S7F39Ir4oBQHt8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750338741; c=relaxed/simple;
	bh=ldNnVS970F2F5ruzbqCTs7m0omf/SRAAeBdBWihXSYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aI5n2OT7UaaFUmQKSGoW5cpfk26sOMjCr31oei0hcTzXO71B/AQIE5//jDq/2rRDhpZm9VCUhedCepdGszHPfpf7zwXiOkE/u38Vv+/A3k8UeZdwky7Fzktc1IFqnpBvmMB4ZpieOnjbc/eD0CcaQ8O5P29dFzyPZU5zZo7NPBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEsYJM5f; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEsYJM5f"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23649faf69fso7482375ad.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Jun 2025 06:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750338739; x=1750943539; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RqWV9JP+McBtH9eFIQdmAQmPNwQM5tz55iqZfgdc/80=;
        b=XEsYJM5fmvR2ugmrNHodpi7IuBi1pZq3tkvNSnCQHJb40VWO311JHGzrGsstNYeQY7
         yaXC+xf4knGMx7AG4IYYb8fV6A4Wj2ItZXblkHzdGC0oYeRnSrAf4t5iMRSfSUeXhKzn
         WdP2fd5h3MZKwJ4xW4gY3Zl89W6udgu9ELG0+3xS0Af+Eu3AH/RN+qEScRQCRzCJJXQ3
         hbzXkQ0kEuhGl0P7nYrGRSl1fRrHQKyIsIVeTqAnCnIcatOdVI4+W/ibLE5T0S32XvTw
         VvZa9MP9Bj0jdkPqt3u8zRWkIrOnHMIstzPXylNQ5+M//QWqG9UsGWkhJFdJzhXHdopD
         CLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338739; x=1750943539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqWV9JP+McBtH9eFIQdmAQmPNwQM5tz55iqZfgdc/80=;
        b=n0WEsgZXiuFR/Sz8x5MABI9iDkD98rDt1OufQ+HsGBSjogEcSwieN2v/pJAVKV2c/V
         0EZISBo8KbaI014R+IHdxCO4g8X4YZw+mccK9GbgtI2aKuGErqBEx7YucJh+yR8DGClh
         gC5Rxsb443UTLanqY+rRFsfN3o6MBwNiDl/A1hxVWkEM+UGZY+DQcIxyEthTCehNCh33
         rWTL7ep6uQNjz0xKUZUMALC8FZtrsApveKnnVgQGrImrA+CW1/c8bHKki+r0LSVEtDLz
         UtTh0YcE5zQG/w9o/1BOE2S2/OSpMKB1zphW06/I6a+Zc8Cs4Zv5nEfgEgU/6Q6coHfh
         pMVw==
X-Forwarded-Encrypted: i=1; AJvYcCUFseGcC992XxXjYGAI2CH4H2edk/yMYeCgpUc4auu/uyIkQT8G32xH3d8/vXOG1UjwGg4vM+YO6nMCA5eN@lists.linux.dev
X-Gm-Message-State: AOJu0Yxb+UJrtIaig/p/lGmEOZR0or2f6rlxXC2d115lLkqFytxN22ZE
	kfIGIuSAaaEpug3b6SMnsP4GhEx8mW7ivzzBJNA9ONJ5Qm5rPcmWCOrP
X-Gm-Gg: ASbGncstuBj9ViKDHkK/3tQv8q30gEo262FKQCt8u8YP3jBe9fj9YXRb8Wfxm6GHKS8
	qDngZu01MKAggrMS0U8u+69LwxaDtZIPkesvTWgA2SEPKGBf8HtfI86uiqhvFhYYmkgpWVF2niO
	DXdYx0PzWNtD0dRs1zKTnN5hv4nEYdsZMB+UdlK50pb5zfaaMFpgDk02lqbUklGVj/MoB2fvovx
	ZWJRR71YAFIT4JmH9kHS3V4YgjRmaYttSMQgtr15D/e9ZSAonw1w0m9ijzhW8GX+jqxyBRAHhQC
	9yBAag70Jy4ckCNiMNhwq/Ll+4VvX5/PnRGaxyRpX/f9VPXvyPweh7pvz5qCWrUG0Vz7
X-Google-Smtp-Source: AGHT+IHpGCeQa4EgCd+bXQDWfWH00aS/Vlp+Xmg8MpVwaUtOQ6Vyja4Guh5GMlgXlnR5Y49u1nolUg==
X-Received: by 2002:a17:903:46cb:b0:234:f182:a734 with SMTP id d9443c01a7336-2366b13c96dmr314421245ad.31.1750338739216;
        Thu, 19 Jun 2025 06:12:19 -0700 (PDT)
Received: from zinc ([182.216.63.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2366e7c0560sm100206825ad.76.2025.06.19.06.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:12:18 -0700 (PDT)
Date: Thu, 19 Jun 2025 22:12:13 +0900
From: Kisub Choe <kisub.choe.0x1@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: rename 'proc_setBLANK'
Message-ID: <aFQMrXRzui58krqA@zinc>
References: <20250618141555.5434-1-kisub.choe.0x1@gmail.com>
 <2025061817-jacket-nacho-50d6@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025061817-jacket-nacho-50d6@gregkh>

On Wed, Jun 18, 2025 at 04:26:10PM +0200, Greg KH wrote:
> On Wed, Jun 18, 2025 at 11:15:55PM +0900, Kisub Choe wrote:
> > Rename 'proc_setBLANK' to 'proc_setBLANK' to
> 
> That doesn't rename anything :(
Rename 'proc_setBLANK' to 'proc_set_blank' to
> 
> 
> 
> > conform with kernel style guidelines as reported by checkpatch.pl
> > 
> > CHECK: Avoid CamelCase: <proc_setBLANK>
> > 
> > Signed-off-by: Kisub Choe <kisub.choe.0x1@gmail.com>
> > ---
> >  drivers/staging/sm750fb/sm750.c | 4 ++--
> >  drivers/staging/sm750fb/sm750.h | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> > index 1d929aca399c..bb2ade6030c2 100644
> > --- a/drivers/staging/sm750fb/sm750.c
> > +++ b/drivers/staging/sm750fb/sm750.c
> > @@ -577,7 +577,7 @@ static int lynxfb_ops_blank(int blank, struct fb_info *info)
> >  	pr_debug("blank = %d.\n", blank);
> >  	par = info->par;
> >  	output = &par->output;
> > -	return output->proc_setBLANK(output, blank);
> > +	return output->proc_set_blank(output, blank);
> >  }
> >  
> >  static int sm750fb_set_drv(struct lynxfb_par *par)
> > @@ -605,7 +605,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
> >  	crtc->ypanstep = 1;
> >  	crtc->ywrapstep = 0;
> >  
> > -	output->proc_setBLANK = (sm750_dev->revid == SM750LE_REVISION_ID) ?
> > +	output->proc_set_blank = (sm750_dev->revid == SM750LE_REVISION_ID) ?
> >  				 hw_sm750le_set_blank : hw_sm750_set_blank;
> 
> Why do we even need this function pointer?  Why not just do the check
> above when it is called instead of this indirection?
> 
> thanks,
> 
> greg k-h

Dear Greg,

Here is the updated patch with revised commit message. No code changes.

Regards,
Kisub Choe.

From 9c32c6f5091c8babe54bfde7b3a6de47d9026a55 Mon Sep 17 00:00:00 2001
From: Kisub Choe <kisub.choe.0x1@gmail.com>
Date: Wed, 18 Jun 2025 22:55:00 +0900
Subject: [PATCH] staging: sm750fb: rename 'proc_setBLANK'

Rename 'proc_setBLANK' to 'proc_set_blank' to
conform with kernel style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <proc_setBLANK>

Signed-off-by: Kisub Choe <kisub.choe.0x1@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ++--
 drivers/staging/sm750fb/sm750.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 1d929aca399c..bb2ade6030c2 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -577,7 +577,7 @@ static int lynxfb_ops_blank(int blank, struct fb_info *info)
 	pr_debug("blank = %d.\n", blank);
 	par = info->par;
 	output = &par->output;
-	return output->proc_setBLANK(output, blank);
+	return output->proc_set_blank(output, blank);
 }
 
 static int sm750fb_set_drv(struct lynxfb_par *par)
@@ -605,7 +605,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 	crtc->ypanstep = 1;
 	crtc->ywrapstep = 0;
 
-	output->proc_setBLANK = (sm750_dev->revid == SM750LE_REVISION_ID) ?
+	output->proc_set_blank = (sm750_dev->revid == SM750LE_REVISION_ID) ?
 				 hw_sm750le_set_blank : hw_sm750_set_blank;
 	/* chip specific phase */
 	sm750_dev->accel.de_wait = (sm750_dev->revid == SM750LE_REVISION_ID) ?
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 9cf8b3d30aac..40051798efbf 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -170,7 +170,7 @@ struct lynxfb_output {
 	 */
 	void *priv;
 
-	int (*proc_setBLANK)(struct lynxfb_output *output, int blank);
+	int (*proc_set_blank)(struct lynxfb_output *output, int blank);
 };
 
 struct lynxfb_par {
-- 
2.34.1

