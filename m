Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95DA5C614
	for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 07:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710401858; cv=none; b=JPrAWgcACsieNNphxW/5MK8m0E+/Sx/5yWmIm9uhkW6wMsZxcm2D7+k7h04ErSdFqpiLwal7YDBVnayzyzkoGP5qUaxJrqsOCLRv1D+Xmpf0cZnSQkzx2Vc8wWlE4HAKKaN3ZBRAhltP2FP8iWyfL8MkqeeKYenc4G+Aez2Aeno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710401858; c=relaxed/simple;
	bh=h/noaULKqc6hSe5tg/b8NBkZtRpoPLoFI5/seEtHSUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IstheTfaSlqQVRxl0stiyqREL0fa7HEjaQ7xt+LpzD/SgYp0+1Sqrc91zEXP9lS4G9YGf025/uoAo/dYvcVUfrBG2G3kVkX8fxIWWQWNo2LMBRranJ8evoYoyu+ynz3fSaxDrZX0xJrAE20YcfTKCstRVYWPA6uCeQ9Xifjng64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vGXGEWQ0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vGXGEWQ0"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41324a16c9eso3725025e9.0
        for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 00:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710401855; x=1711006655; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g2xMEgErE0oZaNn60SyZkOBivkFZHVII//dNP0p/AvA=;
        b=vGXGEWQ0Bt6oKh0XUiNTklp/4sAAVLn/7Shd+Wu/bGJLG6zbu0QjtkVeSwNZSyOxrv
         xNoB8VbikZEoln6RCVEjiNnBeVd2sYfn1O1gjKgV458MU9Xg8+0/cOZFFpayjvrIhwSi
         f70I/ip6s6wymgSJOfdm9T8WgXjmHK3F+ln6CknHOrxB/1oCEim+MUvbby5IGsyVuw+3
         CoPEd6vOQNi22C1ezo9PoYy78j8zAs3szgsSW/dPoWtx1mpHQH0ri8HyDFj9sPxdS1PV
         eQ7iIefUq3WQaNUdx91CyISP8zjhIF+TFyCdy5p+NqFdX4fEX+4iXsm2/mdk/6bbslEh
         d+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710401855; x=1711006655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2xMEgErE0oZaNn60SyZkOBivkFZHVII//dNP0p/AvA=;
        b=xGOIqgj49ZmAJgpmYai5OAspZN9oUltMP1b0PClW2GVzVMQubKNykOskd8+TpZElfZ
         ky+zSS44qhMy+tzjZnm2GfSx8vqABr3mAM/IF2p7g33KqKkMqaWjUR5VrToyIX3JcELh
         0nCjT7aujTgBZYm7rHKzReYtYi5MgqgvO8fLk4wL8vn3KG/rnrLfWEHiHgFgZeF408kf
         OFHK744REzg7AtyH1q9aSCr53zWF1vO/wRrtC3mjrCjtZSu77wgt/1zi//ehTEmTCVVS
         FUrgb7braR7zki2o2oGspFf2y0zz6qFf1Vagfw0k7wLHP/7gJpSS9dN1rgwMAtj6IsgH
         rCjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC3agDdFpC7pVhrKb4F/ccIHA4huHxFUrwZISEdSUWSa3Iw+bIGF23ditJZKRZveL8ijbbLJnk0OPt6e3+YQoApPR9mxeJJBC/pCKojw==
X-Gm-Message-State: AOJu0YyeL0UaclzqDXfvtEIH3Jfe8gxJ43rPMxceK2GQlPqoavoXioD/
	7m1XEBJHd9q+KDhW1cxs2QRTFW+FSoUdQtvlWBTTQiUsP1itS3928s2CL5PnLDw=
X-Google-Smtp-Source: AGHT+IGqoG0yaFgrjuSXEyheErkxym5o4y1BxFNQO/f8KnR/q5sTXHRvaQm1Gon5B4sF618nxOd7UQ==
X-Received: by 2002:a05:600c:1994:b0:413:f2a1:c47b with SMTP id t20-20020a05600c199400b00413f2a1c47bmr489038wmq.16.1710401854633;
        Thu, 14 Mar 2024 00:37:34 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id je2-20020a05600c1f8200b004133072017csm4779037wmb.42.2024.03.14.00.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 00:37:34 -0700 (PDT)
Date: Thu, 14 Mar 2024 10:37:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alison Schofield <alison.schofield@intel.com>
Cc: Ayush Tiwari <ayushtiw0110@gmail.com>, Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: add comment for mutex
Message-ID: <41239f06-596e-4c17-95ed-4bf06ba9f9ec@moroto.mountain>
References: <ZfHuokO3pQXMOxcC@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
 <ZfJhtBrsL3elRve8@aschofie-mobl2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfJhtBrsL3elRve8@aschofie-mobl2>

On Wed, Mar 13, 2024 at 07:32:20PM -0700, Alison Schofield wrote:
> On Wed, Mar 13, 2024 at 11:51:22PM +0530, Ayush Tiwari wrote:
> > This patch adds descriptive comment to mutex within the struct
> > gbaudio_codec_info to clarify its intended use and to address
> > checkpatch checks.
> 
> Hi Ayush-
> 
> You may be right, but you need to convince your patch reviewers
> why your comment accurately describes this mutex.
> 
> That's always the ask with this kind of patch.

Heh.  Yeah.  The comment wasn't right in this case.  The lock has
nothing to do with registers or register access.

> 
> BTW - Don't start your commit log with 'This patch...'.
> 

Outreachy folk are a more particular about some of this stuff than I am.
Which is fine.  Could you do me a favor though?  Could you ack patches
once you're happy with them?

regards,
dan carpenter

