Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9002D0C97
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826204; cv=none; b=DuuTrVylmZICeSJzKUia1v5FIbb9afNmT0ZjGRABC74+zPqtyu4PSTh6IWN8TaDw33uVZ9J7yfyZ9DJ0V/Il5+9f6byQh/U3A39AleZEbI/NTMfC6Odg2hgwU3qmtOwET0C7fs+clDJg5bZ7NmFhhRKWT6CAcOrgzKMpBmT+GQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826204; c=relaxed/simple;
	bh=vP5xmxbAtsReBgizcKAYtCOV1Q+2TzkNAQm0ELHFxVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSmcwW7Y47vhDDIQ738OOOnBH771Ie8DdUpvf62g1/t0eeSXmifPIi9gNj18l00rORj6V3TFLCK+1R9PnA6rsvlrlKX/Q4cCHR4IIBi6qGlImzPOiuwnmuyB5LWOAJGA1OjldeYjWdZ8OqcGWVYM64O9dGBvBCB26+vWYLM8cBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQi+kknW; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQi+kknW"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bdbd631a6aso281232e0c.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 06:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782826202; x=1783431002; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4rMj7L3fCtkNCkQ3FJAGXRTneX9MRuVE2CQ0qk3jLeQ=;
        b=dQi+kknW0DgA7UMTuvWY/FB7HGCdlmAvHJorjCIR0MXnM1WgcMDJe/FdVADcYRySqF
         YymDGRBJ3w5CGJsSU5KNysbWgYW3iQeQE0bfqlJKaX+Mi2ymTCRdQbdsCqY0kGmPsXOb
         aZO140LhFhvLWWz+wCJxl9rw4ZlNnpdUHhaLcU2BZ1NOp1gYtmq6V/NIYYOpAp0n6x5q
         GOSh4D0nDN0hAu+sOif1ylfJQ6C0KQkkRQ+5nLiMkNb1VvPvACKP/tHwcyVJP//7CLUS
         aAQv0dTiecCUBXA5+oH0zhp9ATYdP3hV/QEkBFKQ9A3qK6QMdFuy6WAP20pWWr8UD/aB
         hdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826202; x=1783431002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rMj7L3fCtkNCkQ3FJAGXRTneX9MRuVE2CQ0qk3jLeQ=;
        b=UNOoQh6J/SgBgKSK4rZ+QYBHOEt/+4m9bqwrelLHQmmr4AJLi4GapAGyqZOzTQsAcm
         i65pZkAu4mtDXHwy1uudQ6TnkxIYiEVGtZRXTOvHcuh6H6BtX8ljE7tDfZzRCftuR+Xd
         r1EajO/dwcIowTjrLjRhb35W9SEomrn8K+cSc5nKmNyBNztu+DCqB3D4ev5u805N2d21
         nDS68vArdfjfQNNbYQBN+81OuolXf5QadhXppLLXnMUG5p+JlWnsuXBWmFKgDI4DCewy
         ITYk5ZlvTFHWXCSKL9lYbFs4vGt96rNgogWVHiVK1OFaV1J8hnb3iG14cCdHv+eUzXnu
         sKDA==
X-Forwarded-Encrypted: i=1; AHgh+RrHKqVPiTe3SYsvGGAXc2c7LG9Vc3gmsreu9iBCVB4aen4sWhSn+slsn3YXLc/Cf0fs0LWjoaY0oCi7hkeV@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ6KUM2bNH2JXKgl1KM3JySsb+oRJDDbYepGlt9fpk1+gW2NBx
	5wyutYBNtnAzykcOWh/XHDdSGxy4TXVHj8NP8pEzk/hAHeN8Gm1KgmwD
X-Gm-Gg: AfdE7cm4qvp+tDPfXo/DgNWXgk8h7CBr5D15+sl89YKmKiAIhW1x8fttUlcQm0WXMvc
	mWZUL6wDffn8v94etumtf1KgSwX8kmy8mVdsLFzi5zJcoyDwrt3Z9x9V3r+UkhCsFonOqBgqi9+
	thJxQCrI6SxrntsRhy1IjRYJuNgN3M7WC+KbBEsvCCAGP6ehGus3DhegL8gl0aKe1ZkavtY29x4
	mdGK+jjevIZMDDm/mB/e9VKFHKZIRFxKuNWTjMwl5Gs4IAU20TV1mz4N8djjtsRkkQwODrjsh2b
	o0zxfPg/EJBSHTYQdZhkdJaXdIyMEMQWz3h0jmdwY2Vr5bsAER7XR8BFSRFv8CPr27ldRJIbhx5
	OCu1rhT/LsU01VEXrhva6I4SXYUA+YbSgdIS4J0Y0nNERB0mX/00PGuFm8oTyZbxEgUVyjPY/mO
	71XqcM
X-Received: by 2002:a05:6122:288c:b0:5a0:90e0:a4c5 with SMTP id 71dfb90a1353d-5bdc95175c3mr469899e0c.8.1782826201821;
        Tue, 30 Jun 2026 06:30:01 -0700 (PDT)
Received: from localhost ([74.80.182.83])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bdc189bfc0sm1353432e0c.7.2026.06.30.06.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:30:01 -0700 (PDT)
Date: Tue, 30 Jun 2026 16:29:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdanmarcus@tutanota.com>
Subject: Re: [PATCH] media: atomisp: fix block comment formatting style
Message-ID: <akPE0_FWWMAe8BfS@stanley.mountain>
References: <20260630131226.23374-1-bohdandmarcus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630131226.23374-1-bohdandmarcus@gmail.com>

On Tue, Jun 30, 2026 at 04:12:26PM +0300, Bohdan D. Marcus wrote:
> Fix a block comment formatting warning reported by checkpatch.pl
> in atomisp_cmd.c to conform to the Linux kernel coding style.
> 
> Signed-off-by: Bohdan D. Marcus <bohdanmarcus@tutanota.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 6cd500d9fd26..20abc2c0de80 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -2520,9 +2520,12 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
>  		if (sizeof(*cur) != sizeof(dvs2_coefs.grid) ||
>  		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
>  			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
> -			/* If the grid info in the argument differs from the current
> -			grid info, we tell the caller to reset the grid size and
> -			try again. */
> +						/*
> +						 * If the grid info in the argument differs
> +						 * from the current grid info, we tell the
> +						 * caller to reset the grid size and try
> +						 * again.
> +						 */

Why did you indent it so far to the right?  Something went wrong?

regards,
dan carpenter

>  			return -EAGAIN;
>  		}
>  
> -- 
> 2.55.0
> 
