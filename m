Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF863A9D93
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 14:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165362; cv=none; b=eMv+8j/qlGaZ77dUqhGLFH9f7N1uEJkVbL42mxEl6Rai4XrY6M2VF0Nxw9MLQdta0Dx4ycrC9eCU7uwZZxssK23PMwL9tgIS38367vrZ3GFCvMJvGux02ZJNq9bxd1g0MiQLpr6n5puhfdnIKjtmaoNzhs+FkjP3rrDJfm+D1e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165362; c=relaxed/simple;
	bh=Y4lAidnK8ixVh4u5dDIvgI0cB5YPZD7fys7/Pqdl/0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwFNUkHw7OTZCM1p0mjiNfN04AZWtq2y5U95geU3mVfX9WOBeMol8LNK4e1xoPoyu0aTHB4WlK9CcYOsQfLL94J3gWoZIaBaMtkgKF90pQ4laBEgPdrzmLBbdXrsbueMGMRmGp1Z/wJzoCzDfdFp1tAnyVItyUNwvniiXkjuMmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kg8cxVHI; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kg8cxVHI"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a86e4b950cso700667e87.0
        for <linux-staging@lists.linux.dev>; Thu, 07 May 2026 07:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778165359; x=1778770159; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rVozlmMpIRcWZcAcnv+MoZEMkF+3FWhqjax3IfjSw0w=;
        b=kg8cxVHI43JwIZjWo9BPwylyP2UjhDnz3mlOXZNZrK0DLr53qAPbk1C5z888revsVI
         d6DDzFFn8em0vXvNuIHAjOHlpB5sNFIO2DRTHl9L9DoUC7VYKaHKe2TR2CrPSv5IADoN
         j3YHqUgy+nL1CGC/rGgFZG47ABeDwowq1bSCIU7eWb8u0XAcD0K0ueYHtyuUwJq4sSUf
         OJ341vRJZJQIOUKndyi2Nxsa+X/o81wCNtiax4WZPvwZj7vaCGRZ34ieOzUyz4aRzQZ5
         8zjbi38HFrs+l31EeGPpiA9t9dgQItAPDaA6oChOJXU6bvR1nkPm1t205HbZI1+VGMUe
         Pc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778165359; x=1778770159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVozlmMpIRcWZcAcnv+MoZEMkF+3FWhqjax3IfjSw0w=;
        b=jBSSh8v9uBBXRWXyzMSkHiR4O5NmdSzx0UEDRrEtfuyifGHj3Ut2yz7Hv7hTMWtz7R
         s9hR7dGrLBri/TQBcaC6UyYViNbdq3hxcgZ8aGD6SY+abs8j3rat2OMtDW4bqIzO6KNX
         jiV43bXaTRqPcS1cr44YGcrLtGClNHDo/Rl479y+oYmZdh22qPczmThuc8UdwAs6vv73
         Lu07KbeSVIbjXA8ft/4mjP+gshnNz32y4sXao+cMxjAmSkN9ex+H/D1Sj+F3KeakUp+5
         uvJFtVVsMsQWFQgxlh2YoIG/Cip54TS0cbXd7zmBpaC7kBFWMw6Qrr7L1BPuIValJ9oP
         1Fcw==
X-Gm-Message-State: AOJu0Ywny/dnsh/Ss9V6Th1MQnGhTEqHpV885EeLuTs/TF1wTVS5+0cs
	zP93nFZE5ULbf3OWjb4/QEhUsPsLRinmE6JjWU4x9NgBg2iYV/vZboaN
X-Gm-Gg: AeBDieu1Zgnn03NfJO4EGRt/yV3ym6nOZVc5KHQwLJnyWLaE6nsGCCqS37FuEVB0yRa
	F0+VHtVm5v/LSvd6qkggm9B6SOCIG+12wJdb3VM036923jXoQbxDMvSpTIdh9FqgDR19Ozw55nF
	UyEr76da5ZJIc5/1s5Qi0mvylMSTlM/JGQUQIAlQQo+ohsDSVkTCdr/GAEzT40W76a8wxIHrA2s
	3rELzTm2rVFv8x6jN7WoY02ygXAq+fR4lkVO9W6XU1p+UqUHDyAtCv2rK4QyT4s4f/nG8Y7R0hX
	xM/TclE5QLH/frWQ5nEyJnEiZQN/lm6dsiaNqGe8fwTM2Z6rpKuEXvPxpSqTcS8ZTbqtRB0adC0
	Ws0o0sGkZuQN0PnG6e6dCXnwi1Mn4JuCY40IAJBvNN5AV+yCHWjV2V50RJo0g60N+hfD7Plb9o3
	0z83iAm88l9tI5LYdqiZJg6IzFfB7KbkeborkBs3JGS0hCAw==
X-Received: by 2002:a05:6512:118a:b0:5a8:8db6:b2a with SMTP id 2adb3069b0e04-5a88db611bamr2931013e87.20.1778165358243;
        Thu, 07 May 2026 07:49:18 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c22deefsm5711668e87.8.2026.05.07.07.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:49:17 -0700 (PDT)
Date: Thu, 7 May 2026 17:49:14 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Jennifer Guo <guojy.bj@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary block comment
Message-ID: <afymar3gk9tDjU48@archlinux>
References: <20260505185431.27037-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505185431.27037-1-guojy.bj@gmail.com>

On Tue, May 05, 2026 at 11:54:31AM -0700, Jennifer Guo wrote:
> Found a block comment formatting warning in odm_interface.h
> via checkpatch.pl. As far as I can tell, this block comment is no
> longer useful. Hence proposing to remove it.

Typically, a commit message states "why" it should be accepted, not how
you arrived at it. This is described in detail in [1].


> Let me know if I missed anything!

Is this really needed in git log?


[1] https://kernelnewbies.org/PatchPhilosophy

Thanks,
Nikolay


> 
> Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/odm_interface.h | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/odm_interface.h b/drivers/staging/rtl8723bs/hal/odm_interface.h
> index 400473ca58ca..c3b13f5f37db 100644
> --- a/drivers/staging/rtl8723bs/hal/odm_interface.h
> +++ b/drivers/staging/rtl8723bs/hal/odm_interface.h
> @@ -18,14 +18,6 @@
>  #define _bit_all(_name)			BIT_##_name
>  #define _bit_ic(_name, _ic)		BIT_##_name##_ic
>  
> -/*===================================
> -
> -#define ODM_REG_DIG_11N		0xC50
> -#define ODM_REG_DIG_11AC	0xDDD
> -
> -ODM_REG(DIG)
> -=====================================*/
> -
>  #define _reg_11N(_name)			ODM_REG_##_name##_11N
>  #define _bit_11N(_name)			ODM_BIT_##_name##_11N
>  
> -- 
> 2.34.1
> 
