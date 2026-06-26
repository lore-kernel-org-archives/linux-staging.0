Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9863E2AD1
	for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 17:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782493960; cv=none; b=ttdNY4rHK6E52P+/UrkUw3rs/E5mORuXT6W63mx3k+Upm9jnVmLxGoNhKNHNa3p6/q/wchiyCfdcCrXXiWpkEStu2TbvF+vHPdL4TMlLbc1hlOHJhT1TXi1dCEgpXShDPZnF2yQAQAcv0nJ20RqeU0mtD/DpUPRzm3GGsT3lDS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782493960; c=relaxed/simple;
	bh=FN5fyt6J8xEgwwujClfrh/tyeEwNavCdAR/kun6PwSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M40rjSdOYMKSeSjoCXMQFqN1byleqW7cxPgcfD/bTIWkywP26T7GJfEuwwJb4jm9EJpIPDtHWc+4SJdU6usz5g4iVIdht0PoiywLG3WofG1S0cj/kFkjCPDy0reB6wQdRLBFIqnZi6rPIjYUOi4tmXce1ei2PxIWgUdrTFguRik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfXQ4T0d; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfXQ4T0d"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e9565cc13aso403808a34.3
        for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 10:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782493958; x=1783098758; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1YVsyic9DZic8R7y5tzhJj17BJhHNYupyP+EXVgbeVE=;
        b=PfXQ4T0dA+FYwi7Y51+8S+bAq88yhCB7sqB/9ij32/43S+ZF0ihTUk+L5Ga4d8ahQs
         k1eXVFn8KDBQc8C+4t5fIvkC2eBIXPVTt9qR6Pix1OElaF+difv0hQPJtYBz6qXjhTrg
         ShgKJ/m79eygcbQJ46PdplidspyyubjJGLqmJdhBljdkrFriYWKnu/fyNPcChQP0Zh05
         DPDxOvYpH44as2dOBxadDbprq/mpZcHUDVtRNXjhiC8xMDAPIfjZ7Gj85D4Wud2f5uAq
         aILxBxsFTZpnWrdF6oa9dSGNGrJ9SCnYHztLM2x3V+oXerwNzOD66j6m315kXk3HU6bf
         6mwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782493958; x=1783098758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YVsyic9DZic8R7y5tzhJj17BJhHNYupyP+EXVgbeVE=;
        b=EhX9gZ/feAel65DkwQ0mo03G0BJBOkXt+Gw3ByWA9S5mIOtm0gAo5o0TBRSOPuOxnx
         AzCc4iswVRVEhWor54Y0Acvbk2Z716TGk5OsTTFtr7AcJIHCBNjb20/X4SPJ/uuNdKkV
         +nXkvPJOeU/oF2OLfu+XK5rcz1ozIb3tu1Gfi/8b+0I9yDzVJ5V+3XorFWdALgS50RAD
         1K4IQSXWIdyD9GXjSzi0nPkdXNA4NBBmiJUZPBkXRtZhlTrmtRcO0WL23TpdwpHRTadd
         7Mri5ZIUvb0WQJ7JlJmAx59Cj9T6+18Q8giVARcdMVPSLcoiLEFlPU9ez7ufJNZSWinM
         qffA==
X-Forwarded-Encrypted: i=1; AFNElJ9cNRVbgHGiV5oSO1TZ9n03Hn6heAomnSA6ejUYzLhG0sledscClpcSiUcjuIJlW9Px5cdQHecSdNfwtnJG@lists.linux.dev
X-Gm-Message-State: AOJu0YyQ/Iv8gvSDxgGgA4CoeH83kkq2m3C3EYlAxVx45gCYKL0cthZC
	XNDkwjKWpeErXySFY4ype4mVCJTW+gLkRWIzVIahenw5DawSPG2hn5zh
X-Gm-Gg: AfdE7cnPYI5v5Im+ULWSG14Xr//SZ5rpFq1GwHNwEd7sqVa5aiOI6/VOcmUu1E74ota
	s4X/ROhYrfE6EQ27iTM+41gD2U6XbkudA0T1UGiGc9NAoQdNbvz+uKUtsNUs4Xjr/YMEl4PZRQY
	oF9e4+UXzV2xudM+7iPw30QvCrfG1DbiN0WUb8Dtrs82XuxEQZmgxOwV9r/nmoTLYqerH612wwG
	J8mmKOVWVOM7OCT6ZsTqcWbsO4fC6LjKFr7gvbMo4+n8BudciOC5XNj4/8X/udVpC13T/bUrJiV
	uMygztKS0IyKCJQho7eeanRw9H/Gie4xP71CKPWELTGja9/CD9u+7B0f8OUIcFChUW43kTjKgRG
	L2n6d6TkhTJBASY5JPNK8GAkZG8hGX9jTS0MrZ8D75tjToQOVQatFFI3OL3GvFYPGtooNvAh1Au
	cvWm3k
X-Received: by 2002:a05:6830:6af3:b0:7e5:b3f6:c6ad with SMTP id 46e09a7af769-7e99bf39192mr6725995a34.4.1782493958242;
        Fri, 26 Jun 2026 10:12:38 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa5d3554sm2112298a34.9.2026.06.26.10.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 10:12:37 -0700 (PDT)
Date: Fri, 26 Jun 2026 20:12:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: atomisp: validate sizeimage against the
 allocated frame in framebuffer-to-CSS
Message-ID: <aj6y_yXmQnDculLh@stanley.mountain>
References: <cover.1782484857.git.doruk@0sec.ai>
 <023f2124beb3d2fe9ab0ab6bd31717f0a6c9ff81.1782484857.git.doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <023f2124beb3d2fe9ab0ab6bd31717f0a6c9ff81.1782484857.git.doruk@0sec.ai>

On Fri, Jun 26, 2026 at 06:40:41PM +0200, Doruk Tan Ozturk wrote:
> atomisp_v4l2_framebuffer_to_css_frame() allocates the CSS frame
> (res->data) from arg->fmt.{width,height,format} but then
> hmm_store()s arg->fmt.sizeimage bytes into it. sizeimage is an
> independent user-controlled v4l2_pix_format field with no cross-check, so
> a sizeimage larger than the allocated frame overflows res->data (ISP/hmm
> memory). Reject sizeimage > res->data_bytes before the store.
> 
> Found by static analysis; not yet runtime-reproduced (Intel Atom ISP
> hardware required).
> 
> Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
> 
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>

We need a Fixes tag for all three of these patches.

> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 6cd500d9f..966b84402 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -3331,6 +3331,16 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
>  		goto err;
>  	}
>  
> +	/*
> +	 * sizeimage is a separate user-controlled v4l2_pix_format field; the
> +	 * frame above was sized from width/height/format. Reject a sizeimage
> +	 * that would overflow the allocated frame in the hmm_store() below.
> +	 */
> +	if (arg->fmt.sizeimage > res->data_bytes) {
> +		ret = -EINVAL;
> +		goto err;
> +	}

The math to calculate the size from width/height in
frame_init_raw_single_plane() and similar functions looks like it
has integer overflow bugs as well.

regards,
dan carpenter


