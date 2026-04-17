Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13833859FE
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 08:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776412898; cv=none; b=a1EVaA563cWyYQ0sFJ9BxeI46l4rr5mOC2K+eguHe2TYqBfvQrmc2OKPBYr57SxbHwwqlHEtKHezyESCdElIV6xiXQYpmxaHqcG9+0ELJiFcp34V6SthVeZxwd0c66gmjiXBuzoyna6uoS/O3DgIybQvELn84wGNQ9dfy9wx0kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776412898; c=relaxed/simple;
	bh=E61CLs/TOZ+fqQeNjE+IVq/6jI44xVi6r2MOe0iAMFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IanzzOTdGsfu6ZhvhzW5sbKi5c37Cq2h0zll5NNc2Rp0ov1LCzE9DOf9SynDxfZyxvah6yO6WajoVj/Ok/NgHUwKNPtGgmI5+6XzpxN2TWhQwBFnbDyNYunWX2RtJFnan8XULQ1z9l4G45eyftRIwAboqmQy+S012iQZKReCNjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deRMSvzO; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deRMSvzO"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d73422431so249445f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 01:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776412894; x=1777017694; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WAbA/rea0AphHw4Y3No18IGU2RBEKq1oJbRMenVLx2g=;
        b=deRMSvzOJsuA9QgZPbB2vr4Mx5GxHD5XykyTe4oyOzlT/ubgHVADqc5jvslKe3qlHF
         Dx8/LbhTbCGRmqiGLjGv5a6FVmqzwX9SFMzjbY9cbSUk4W+3LEPfh0mQ9madlneFGInj
         0E7wDAj2nshRs5zvMDxulAyED6/LuVpND/Jtthr+tOBD0O3Jdvif4kU+VNW6I6SbeaSj
         tWuNvlNwzzRs9ZF45cvIsoUXJq4bn8lE1j1tBSlRXAPK+kPEtsmG/ZLwTkJaofdx5rW0
         SmQiyZqFRPjlaNFQlf0ajHZS+935I7nn/MIZW3BNumkp3NQNL7+oB9TA4G/3aEO5oYcO
         7TRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776412894; x=1777017694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAbA/rea0AphHw4Y3No18IGU2RBEKq1oJbRMenVLx2g=;
        b=naz8hTJm3MtpRSqnyckOTGR2YtRep7AF9oig4EFpGBbHubOXlVFS3uRDK29+KdfdsG
         BgyXYC4cjZtLmzVi+/mXJR7RWEMAVwYEUF4ntpfV72/m20zPEb2tMM92Drn9cF8E95nF
         LcLFHXg2u9YqV87o0SUORMtx7gZBRkYg4LAlQ9FyWzOBnE3ZrF9XlhWIH6yMe1ryLO8d
         l2y4foejV1SYfiqKxVe1A2NnW39F6wA3CLys16MwE/xgoKcz0r6k8xKogb3ccCj2oKGW
         UxKl4RyxJKEM6Wva/dSpyXWvZPjgNH2AbEhL23oYrQ23erhPk9bn3g4kvefspBHzNHq8
         Nd6g==
X-Forwarded-Encrypted: i=1; AFNElJ+Ln2ytowv+ZB2wGiFc/SK0Vec7GwdyAcGyQgmsI3SxfSf6FVKHs5HowOTPp2EqGmNVA4bOxvOG3JwHTExw@lists.linux.dev
X-Gm-Message-State: AOJu0YxN5sxmlwTJacQiMrwNWCNjZY6KV3piT278dTn1H87BUf8IpWuY
	nzjpHk+QgALUipOsL3ekiZvvQ20jPX3KjsWNY1Sl1kumhVkCgqq9ho0V
X-Gm-Gg: AeBDiesV+uoIBI9A0Ki6ejoUmMrjiWOUjbxDGPvFm644+czw/eYKgUh/IbuCtKbJpY1
	CupVPQDIw+7itly1IvuiL4fQKO38udQDbtZXorkMSqe/kjyqCPR0dBtS7oxC7NRSSHO0L10NPxB
	3kRRcjktjmmRLsK1VT4k8z1KUZlhdLENE+RgOXS8SuKz5XEZMDIhtfjU/kV/pQhZhIKrYlhLInh
	iQNduEbnf2FtIPDUUi/DSVMhbXW6hPZKCi8/IujAUvLjvgkfKHKvZoOKfAM/g0rp831K7OEUuMa
	dBHzPnGXZRh0NO8KBF27dwNOUEvXbXGjrl5oWCJEVfO8AAUSxcYPMowrqase8I5dyuGps1rdmBG
	TBsHihYs/Cp5G/7huDLO54HXptKZGetnhoDVBabPf7KGbrTTwQ24b50JRYFB75wppujcDprbkJH
	kDNk1tZNgyqDeADvdbqYU0i80QlfuK6XpdKMU6yadt
X-Received: by 2002:a05:6000:601:b0:43d:b0f:eb44 with SMTP id ffacd0b85a97d-43fe3dd4e9fmr2452398f8f.15.1776412894006;
        Fri, 17 Apr 2026 01:01:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4633bsm2468491f8f.26.2026.04.17.01.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 01:01:32 -0700 (PDT)
Date: Fri, 17 Apr 2026 11:01:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Huihui Huang <hhhuang@smu.edu.sg>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: ipu7: fix boot_config leak on
 queue_mem failure
Message-ID: <aeHo2WOF1Rcp9zwf@stanley.mountain>
References: <20260416074800.2493565-1-hhhuang@smu.edu.sg>
 <20260417073939.2686170-1-hhhuang@smu.edu.sg>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417073939.2686170-1-hhhuang@smu.edu.sg>

On Fri, Apr 17, 2026 at 03:39:39PM +0800, Huihui Huang wrote:
> There is a memory leak in drivers/staging/media/ipu7/ipu7-boot.c.
> 
> In ipu7_boot_init_boot_config(), boot_config is allocated by
> ipu7_dma_alloc(). If the second ipu7_dma_alloc() for queue_mem fails,
> the function returns -ENOMEM without freeing the previously allocated
> boot_config.
> 
> Add the missing ipu7_dma_free() call before returning on the error
> path.
> 
> Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
> ---
> v2: Reword commit message in imperative mood. Remove unnecessary
>     NULL assignment on the error path.
> ---
>  drivers/staging/media/ipu7/ipu7-boot.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/media/ipu7/ipu7-boot.c b/drivers/staging/media/ipu7/ipu7-boot.c
> index d7901ff78b38..495b3e05a9b1 100644
> --- a/drivers/staging/media/ipu7/ipu7-boot.c
> +++ b/drivers/staging/media/ipu7/ipu7-boot.c
> @@ -263,6 +263,8 @@ int ipu7_boot_init_boot_config(struct ipu7_bus_device *adev,
>  					   GFP_KERNEL, 0);
>  	if (!syscom->queue_mem) {
>  		dev_err(dev, "Failed to allocate queue memory.\n");
> +		ipu7_dma_free(adev, adev->boot_config_size,
> +			      adev->boot_config, adev->boot_config_dma_addr, 0);
>  		return -ENOMEM;

Adding a free here leads to a double free.  It's the same issue.
One magical cleanup function in the caller.

I haven't looked at this but I bet there are bugs in the error handling
since magical cleanup functions are always buggy.

regards,
dan carpenter

