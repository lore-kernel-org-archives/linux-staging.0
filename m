Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1571F8691
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 07:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776412537; cv=none; b=W6tKj2gI0nuKeVdLSxDkXsIdZ1/dru6+6QBhSGgwJafx+RWD/SYv5/Vw/VotJLUKbrX7+5M0wVmJYbg2g7I3GMtgxKystI20z/DP4W+IathoPdJdcT+cdj6svcpMiPyWITwGvy3WnUdlBgLK0YB14aTdOZIdkFHE8CYAaXUeU2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776412537; c=relaxed/simple;
	bh=qwnO/dPC+6Jc/EcZmne1nxWrHKF3qJsdiX+Yx9rhCrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7fzSVuXAtmxQuRV+A7P2u4x8+aWKs9VTjulKgZF4wkdKal//yGZprSec+UtWS8ffIevnDblulf24ypJB3bTSIFj6s2FjwBVe5OslndtLn6vLA7TJOJVfcKN7g94lfHI7DvRRApnXwmjSTSsa5lot+SEHyKcFfrHYooiT38nep8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKw9QhLZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKw9QhLZ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48374014a77so4423955e9.3
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 00:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776412533; x=1777017333; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x2gJY7+fGqaHfkh90snhoclQbfvZOKiwtCzkHBs5oMY=;
        b=bKw9QhLZ8WMKRk3iCv+HTx6RYIGN+a2+Nb2TCDNpl6IsrE6tcWU2/dzl7QJraS+UVc
         ldX9WXpqxBUXN+lAKX3/+AIP7TX0Hzl/qZspeYQP0pJGl16PJUfABOUraBDY8ygxEdjH
         di6wqyAKzfwE50IXoAFKGrXdAmLejTbGmM0aP2yErtOaAR+DAloHsqJJqisQlmUQvFAS
         PRv/Cj1OvkOuiGRB61BEKuOWrWggnzKyx2t7yAwQvlTo1yYulIItxEkPGWm/LNoY7Hk6
         ruMGQEksP3z1JnQvBrTQIWkd8SaCF1bTqXiVfKD4Q8udv1WfUDWJTviyig6CpJF0odlN
         ia5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776412533; x=1777017333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2gJY7+fGqaHfkh90snhoclQbfvZOKiwtCzkHBs5oMY=;
        b=Eb91hUK5ALFnlr68kGeSkcRPcV8PBs0nMM9om+SLKbmDXbfz/V40Xpd/JWHBpY23GE
         In/liXYCccuxsoy9muChoDP96gI9CIyamsMf3S8R2K3oY3Wnbb88b8QYy5lCPwtJPmpc
         Nh+hlZVJe7QMvL+7if6/iWvwdBEVdBACmpgVp7yLbx67Xk4XirKsScvzSbSCWPjidNRW
         vzq+5SEF5ePNKsyUPziZg2zPh/4XLArvuUVmfV8TFKkoV4hgkfxep0459D7T5S4jlnyj
         qkvPBGlodaHA9dVtGK0axQwFO132VvV0ANB1kVpsbHUGvzhlG3Bi37CPukv1nEyXKOuu
         jbNA==
X-Forwarded-Encrypted: i=1; AFNElJ/ITuLBXhkaC55Mmj7v5pl5vewEEynQG5D1WNu78FF9CiH+UP3b5b65TFn/koooE/1jCsIPruEH3N8vXZG9@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4RImAycZXuVUyTOKp2UV9/jNirLhPYhPjDcQfTSyIGe08UziJ
	TEER0XPnv0o3LQ2JO4rFk1htgVr1gh8u0Hu/Y8DWSYdp5n0qNqjrM3NO
X-Gm-Gg: AeBDiesULRMW8VUD5+iVbUx3niu7DG2m73kXFEqkgpZz2Vb4zaOphbPhlMqxaEqvpWr
	BTUYWHVPdr6qaDCEw/HeZuWPHdjiM0MLyYO1u8cmC75wy+6qw5vx2lM+IFI1E+l0MgwxeTo9Cfk
	Da4RPAW309HiIo52/4dzcRkWvFzpRjjABb2dmSrFAaqcTp4CJ8PkgbuLyuJATlW3cp3870VMr9h
	qkrvnlMLE7DBH2NmKJSZmzzKy+vTeox2lOwYxgB8y58iEwn17Oa4sCJgXDwe8ruKGf0CbN8uDR9
	GYzpUyelJ3SjIi/JcQE/N12buWJZIwZdpfT+G25bWyrpj/v60JsFAlh1xV8IRGrb+dyFSS7AvkF
	yBH7NlpAt7TjF+/dGFvUA1HafoevHuI7fIqnslg1qu0VdDMCjj6PhAqcB3TPsg/Bw7VxlC3yuDE
	FwrHa9cTbH0iU/SM76uLvuD1Gy2dcBow==
X-Received: by 2002:a05:600c:a30a:b0:488:8d44:bf98 with SMTP id 5b1f17b1804b1-488fb74a5f3mr18115405e9.7.1776412533399;
        Fri, 17 Apr 2026 00:55:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc177dafsm30313095e9.4.2026.04.17.00.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:55:32 -0700 (PDT)
Date: Fri, 17 Apr 2026 10:55:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Huihui Huang <hhhuang@smu.edu.sg>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: atomisp: fix memory leak of dvs2_coeff
Message-ID: <aeHncYMO-m183mOZ@stanley.mountain>
References: <V2_MESSAGE_ID>
 <20260417070124.2677399-1-hhhuang@smu.edu.sg>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417070124.2677399-1-hhhuang@smu.edu.sg>

On Fri, Apr 17, 2026 at 03:01:24PM +0800, Huihui Huang wrote:
> There is a memory leak in
> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c.
> 
> In atomisp_alloc_dis_coef_buf(), dvs2_coeff is allocated by
> ia_css_dvs2_coefficients_allocate() and stored in
> asd->params.css_param.dvs2_coeff. If the subsequent
> ia_css_dvs2_statistics_allocate() for dvs_stat fails, the function
> returns -ENOMEM without freeing the previously allocated dvs2_coeff.
> 
> Add the missing ia_css_dvs2_coefficients_free() call before returning
> on the error path.
> 
> Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
> ---
> v3: Remove unnecessary NULL assignment per review feedback.
> v2: Reword commit message per review feedback (no code change).
> ---
>  drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> index be5f37f4a6fd..d6e135c42e2f 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> @@ -1363,8 +1363,10 @@ int atomisp_alloc_dis_coef_buf(struct atomisp_sub_device *asd)
>  	/* DIS projections. */
>  	asd->params.dis_proj_data_valid = false;
>  	asd->params.dvs_stat = ia_css_dvs2_statistics_allocate(dvs_grid);
> -	if (!asd->params.dvs_stat)
> +	if (!asd->params.dvs_stat) {
> +		ia_css_dvs2_coefficients_free(asd->params.css_param.dvs2_coeff);
>  		return -ENOMEM;
> +	}

The design of this code is that if we have an -ENOMEM here the caller,
atomisp_update_grid_info(), calls atomisp_css_free_stat_buffers() which
calls ia_css_dvs2_coefficients_free().  I can't tell if adding a second
ia_css_dvs2_coefficients_free() here leads to a double free.

I call this style of error handling One Magical Cleanup Function.  It's
always buggy...
https://staticthinking.wordpress.com/2025/03/31/reviewing-magical-cleanup-functions/

regards,
dan carpenter

