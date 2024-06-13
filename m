Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ABF14B942
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 19:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718306521; cv=none; b=F6OzK28shU+Ff7BNF+jbceqFClleALHS8BiuQMXQE5Ua9n3pN+fgyHjolX3oK2TgQnVQe38mSSDD0Zikotka9/jb2wYhXey92BLQ0swReCxZJmWIGIiby2KHKgax0VRmnYbvI80WDpXzROLA64f26smN6jiMhg2ubPz5OC8mBYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718306521; c=relaxed/simple;
	bh=DtpVjB5sWQlCVYIqC72LrS433BYoesAm2RPCyqhlDqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOtw3xuPmXe57ptP9UGteKMsudTwgxeIA1KBEb1EZk6xVYB5kWnoIc3poaui2zrr2qi1C/R/dujwq9Z3uPDOCzw9hf+a8gfOExvkOy5u7ODMCuHINtZB682/VtcJ4dJDWCjte1WNSPCRLx8Xc+0HmDyMSeQvRtoMo8MwgrWKHDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KTFZcU+S; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KTFZcU+S"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4217990f997so10846325e9.2
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 12:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718306518; x=1718911318; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n7FkFcl3NcUnPjJ/3i8zWPfRNnb33v+XbwikQNsK1NA=;
        b=KTFZcU+Swfx5QzzE2KP5cK8wP9H0NxKWOvv98NZGHD9t4EUwppNApqgwaoDt9OLR/o
         DQcnn9iZ/7LFU0rqvrh0TX9YrVuS04WnMh983frT3pit/mnLHWmtpZO5UrdvBeNHV5Kf
         6yI4bH6V0pSMSIlsGC9AG/vSm4ODbcm6Abg4Y1cR7mnK0jaDLs2M8psMrvOhEvkZHz8i
         6SfwDeysy0naEMrJmS0dlM76uufFN6GfIRBhGmzwVOYHLQPUPoRdNS+ewigap725C1Ef
         XHQU6Vc0xPCqcpk7Jo8PJs6nm1A3y3k6XajGQECoGk1E58JqjL8hGyuUYGq+ZPvK+4oj
         NJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718306518; x=1718911318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7FkFcl3NcUnPjJ/3i8zWPfRNnb33v+XbwikQNsK1NA=;
        b=E9wdcjteZcMnAJgd0wsmcvK9a2uTifEj11fuNGB1MV8AhQ8BpleYlo4gKvhgfvO6Cf
         bnVzOCtlkib7n4B9So2J6z0djzbcFEBg8ApLAfCIJ7Ti/5xL9oVdceHzxxTpasxrrprl
         xSdFB6V7QLWGAmO7JJbcsPCFaKnSGvZPgwxhuMhlr/cbR0I8Hbm2LSanD/KKdump4oO6
         OLQa3xh3QvZxvSUr1fuWJPwEjSZ9ugDAKxuNBqripKtDte8shvTWeF9duWg3Yq0BzXXS
         VdTs1XtlrgnkILGX8mfa7u7BsTg3KbcGXOszDiZblGh8NiTCCs1SFKUizQi6OaD9yz4T
         +UZw==
X-Forwarded-Encrypted: i=1; AJvYcCVybymVH1iyoRY5HLPWOjR5R6AteIcabmW6lqH+/VfP1ibxx83TJ6ecXm+lNHE7MXDPhL40ij0hYqdKHqZ8RKwThXpRD8nLHE0JOBuT3A==
X-Gm-Message-State: AOJu0YxMBtBVgev4lKb7BHvoVrp0a8zlzIcL1KSXgEzy5S+/h7QlkdtZ
	MwhEz98SXK/Rk12l5h2gqBBKsoX6a8eIuIvC0awtpVOuUF/RaE4qwBFzaSsy3uk=
X-Google-Smtp-Source: AGHT+IGX6SQaOm6gsbMfRyp/T0mtjG1ZhlSQ10k4BzkF3I/QyjnCIlOiS+4+o4+r50rTnJ/QZr1CdA==
X-Received: by 2002:a05:600c:2d8c:b0:422:140:f440 with SMTP id 5b1f17b1804b1-4230484adc9mr6269195e9.36.1718306517743;
        Thu, 13 Jun 2024 12:21:57 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f602e802sm34335595e9.11.2024.06.13.12.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 12:21:57 -0700 (PDT)
Date: Thu, 13 Jun 2024 22:21:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Teddy Engel <engel.teddy@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] staging: rtl8192e: Cleanup multiple issues
Message-ID: <c0f2bca8-a7e6-4874-b5fc-98911a7c09d8@moroto.mountain>
References: <cover.1718291024.git.engel.teddy@gmail.com>
 <ee01dbd2-fe83-46cf-9ceb-279a06ce9aad@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee01dbd2-fe83-46cf-9ceb-279a06ce9aad@gmail.com>

On Thu, Jun 13, 2024 at 09:05:03PM +0200, Philipp Hortmann wrote:
> On 6/13/24 17:16, Teddy Engel wrote:
> > Remove some unused constants, macros, and structs.
> > Capitalize a constant.
> > 
> > No specific patch order required.
> > 
> > Teddy Engel (6):
> >    staging: rtl8192e: Remove unused constant IC_VersionCut_E
> >    staging: rtl8192e: Remove unused struct phy_ofdm_rx_status_rxsc
> >    staging: rtl8192e: Remove unused constant WA_IOT_TH_VAL
> >    staging: rtl8192e: Capitalize constant RegC38_TH
> >    staging: rtl8192e: Remove unused macro dm_tx_bb_gain_idx_to_amplify
> >    staging: rtl8192e: Remove unnecessary pre-declaration of struct
> >      net_device
> > 
> >   drivers/staging/rtl8192e/rtl8192e/r8190P_def.h | 8 --------
> >   drivers/staging/rtl8192e/rtl8192e/rtl_cam.h    | 1 -
> >   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     | 4 ++--
> >   drivers/staging/rtl8192e/rtl8192e/rtl_dm.h     | 6 +-----
> >   drivers/staging/rtl8192e/rtl8192e/rtl_pci.h    | 1 -
> >   5 files changed, 3 insertions(+), 17 deletions(-)
> > 
> 
> 
> Hi Teddy,
> 
> please combine patch 1 and 3 (Remove unused constant ...) . You can change
> more than one item in a patch. But it has to be of the same kind.
> 

Could you combine that with the earlier patch that deleted
IC_VersionCut_C as well?  (Unless that has already been merged).

regards,
dan carpenter

