Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F3D379999
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 11:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771931462; cv=none; b=eOzqDrRp4TSspxJmnLp/bLEMGiTzwMJJIsKW/bvyEhZxaezSxaczBFSCZWQnxXgFNugFYzxgQ32UMlghT7t1xAOiPXZ04XNRVOdOX6Y5Iv0v2GwSq/xSQQEehqtXmnR6Rm91AvOTlZhMJjPuULxB4UlY9SyKWLWiulJXlkfjGZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771931462; c=relaxed/simple;
	bh=UoTmcy1kGqSbKp9UvI7cbx3A0Gvjw1r4m79HNxJZOgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpNQfHXZS+3omTkuq7AA7zJ6M8OdPXGHpDxJiVNKQC3WaZ4pmfXQm+4PFPpSINKhUzcG61QNb5iSkMjq+1Kl36aCFAdq2UgA5kQBpkuqAvsul+IAGgAYB9pj03rZycuuI7BqvpOjUuzARu/0igDZzKIFv+G3hbEMs25gHuKNMhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VSPTnE1v; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VSPTnE1v"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4359a16a400so4787757f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 03:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771931460; x=1772536260; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vRoVgKZTjVgEGLvF9t3Ev9ld0SZE7ZS83siXeBHpJcw=;
        b=VSPTnE1v+aWpbdCnauKtTw2EYTrIAIV3JSvQX84XK06lreDWlhhWxaqCPK2qh2U8O1
         h8UF6DA9UvkGL/HnTgwtdpQPMcqif1SzcOvBqAxeC6AhKQMhQLjCPE19qt1JRtl9Hss2
         sYo7K3sti1N9lbArX+yK2ywAiE0vr1VyadzlzGKji9rgdm9BOzlxqrwElhyXqQSkmEND
         9E01MPxq4siH0ZW1Q0HXmuL59RZ1sfVDC+2HNb9Z5YW/NVYZ0fbxRBewaGLrgiS4eZUj
         CN9CmuYccfbqFf21F4/wag4/3tDBXNh+nwEe2h2WVzXE7egbBspng+E3KLgAmF7wcFjq
         ntTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771931460; x=1772536260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRoVgKZTjVgEGLvF9t3Ev9ld0SZE7ZS83siXeBHpJcw=;
        b=Yf3ibYwfHs8ulstjN8nnWosl1PeUXnwQVK2lhCVrVETEq38WJOw1KhOd8omWgoRqAU
         MFwROJK2IgJCFBPliWgdPG6JxLmEQhAnZZvQREkgja6slpRkBbkRHjTY3NdF/t5HePzi
         kIWjmyuJzef47NdGPbvUmZ914uXD+SXucGSD6GnYZBYMHkXFh/QSEPWjZiHsIhBnAzgd
         p+IaTK1El0xPbeKnpxnAYPXJSLB/KTkaIOPSsOrZHm2foWD3UakVv0cpxEiiheDZ74dP
         TNejfSantEkinoXE34BrSjZ41y5BN67JF3/vP5C7LgEPweI7DLusfOIn2IqthrYTzLsj
         +xPA==
X-Forwarded-Encrypted: i=1; AJvYcCVUHocdsMm2nSTWBxqntU8IH7oOdHdiSAgQrnms+jg/PjflWjsfZMK168xvl+ts5r4kRxMHjCQIGFqASWlf@lists.linux.dev
X-Gm-Message-State: AOJu0YyMhw2cO0wNvqc05hEL2IpJevs84RQcR38UdnfAru++cG6JmT/P
	3P8C+AuKeK/hrnJ69mgBMKBD+vDBHFvZMR8cSKJdHXuuEjhqBhAxI5PJiETpFfSvQ/8UIaT0qhZ
	HovLy
X-Gm-Gg: ATEYQzzAXbWkOL3g18iAoWkJjdIBj5vrVbrbmCi66YIF747uOszckdt1uI5dr/wTptC
	QaVxW6mILed2jaXDMua4OUMZMZGVSY3IVWOhS3uMk4wfg1NiFI30bU41An7+US8hXy+uh8okqq8
	dYx1uWczT83C02BoHSSPTSO3y1EOiR56/poV/1MW2tyjvTZHwAKCd2jhF6i5QpZNHmfs+3Ug9Ej
	JK4VhEARxM6s2Z0Sw5z5cZOAJqa1mv1DWqcUIo7aYODlPbE5mxUDGrXUYIsR5JfIUC9ycDQgXCo
	gxtcGbTPRTHtxGUh5MrJVqapBaq0H4BTMuVRmNiPiOgwqTUdeoCR/3ai7GFg0nu74P8GKNqyzWv
	5bT4pLCYfsZINtb4zpG92yLOWKSvMYhjLW95LUJYVNNRZ5c8i/J/kEV0xQCXYnZe8mRUChDcLUQ
	yJAwAbtP0nLf/lmTC/zMB7gETkCklA
X-Received: by 2002:a5d:64c3:0:b0:437:7589:100c with SMTP id ffacd0b85a97d-4396f18a60cmr20044684f8f.58.1771931459824;
        Tue, 24 Feb 2026 03:10:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54754sm26385029f8f.36.2026.02.24.03.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 03:10:59 -0800 (PST)
Date: Tue, 24 Feb 2026 14:10:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: media: atomisp: Fix "acquistion" typo in
 input_system_ctrl_defs.h
Message-ID: <aZ2HP-2JBEYvi-Fv@stanley.mountain>
References: <20260224105335.51418-2-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224105335.51418-2-giorgitchankvetadze1997@gmail.com>

On Tue, Feb 24, 2026 at 02:53:35PM +0400, Giorgi Tchankvetadze wrote:
> Change "acquistion" to "acquisition"
> 
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---
> v2: resend as series with unique subject lines (Greg)
> 
>  drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h b/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h
> index e26b9ba3356a..49e327b55b9f 100644
> --- a/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h
> +++ b/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h
> @@ -222,7 +222,7 @@ InpSysAckOverrule  2/0  [3:0] - 'b0101,
>  #define ISYS_CTRL_PORT_ID_CAPT_A                  0 /* device ID for capture unit A      */
>  #define ISYS_CTRL_PORT_ID_CAPT_B                  1 /* device ID for capture unit B      */
>  #define ISYS_CTRL_PORT_ID_CAPT_C                  2 /* device ID for capture unit C      */
> -#define ISYS_CTRL_PORT_ID_ACQUISITION             3 /* device ID for acquistion unit     */
> +#define ISYS_CTRL_PORT_ID_ACQUISITION             3 /* device ID for acquisition unit     */

Now there is one */ which is not aligned with the others.

regards,
dan carpenter

>  #define ISYS_CTRL_PORT_ID_DMA_CAPT_A              4 /* device ID for dma unit            */
>  #define ISYS_CTRL_PORT_ID_DMA_CAPT_B              5 /* device ID for dma unit            */
>  #define ISYS_CTRL_PORT_ID_DMA_CAPT_C              6 /* device ID for dma unit            */
> -- 
> 2.52.0
> 
