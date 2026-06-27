Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1772459D1
	for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 07:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782544365; cv=none; b=CzmEJhdQFgAo5NCQWsuhP9vOhOehM7tDd+lLw6uSqMDiqm1gqyMpmS89EllSVZi6b1KBJqgXJTSsYnHUWuYjTGVRFuvCYLahks6fF3RoPlnV+SNPI80gX1NbCthyQ7Km0ulNNjqB9AYTVDtkjxuvUFfOR8DDKI/NpxTTbtMjpfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782544365; c=relaxed/simple;
	bh=veKScsnSI/cq+JEBuwcC2Di+VqVYaYnc+3Q6iZR+xNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZMrvlqEZTi4YRs8+SMeci36lRZ9ynZdTFN7RETQTMgEn70PyBlQzvL+ppXSjUmRda0YRB5w8BkWjjgBPThBHoR2ul7PYR4o24zAdmzKZxhy+gnfOh1zfrRGhnBZChM6SO/n+ILGQvPInqSLNCTzYwtESloJO2r0E+jF/adTJCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzRGqUHa; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzRGqUHa"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-69de16f5e80so856892eaf.0
        for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 00:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782544363; x=1783149163; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SpJ3MkO1MinfMbfKGuNU2NZ2kaTJwCDCK0TiolpPBcg=;
        b=gzRGqUHaSQdbOLJHEz6soKQyovkzsIZ4DrJm/fExS7kPs5+l5EHZaK/VAjukjk7IpK
         H/8csXiHsdAW2ZvLlaA0Z+o0uw+cbgZekvPbyMq56LCkJnh6dILSSir/Ho4Q0IUYRaHs
         jVSMS/ts9pJW3yeUwDOQckDjqnlOk/gb/b1VuFse3Hvfb5NysiHfNg+YxvxPEjJIWfQa
         4XcPdnb4etegtgoefasEPj8ddGxfXVaxz+JTXjTCaTy/Wmd8jxybD1BFS6vZ5CL+vOP5
         72B7NMfJ3UtAe6Zj/8UqnQIv7ZZM20eij8Sny8wrqiTPw0YCBN1VlcnuJixb+Q8goMc3
         n8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782544363; x=1783149163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpJ3MkO1MinfMbfKGuNU2NZ2kaTJwCDCK0TiolpPBcg=;
        b=XIf6Qu7tUuh4OYBXyrdmtxYzITqidIHMdxRp1+nqm7yWRJ2E6cy9XWZz6BbscycDxC
         uGZEvMcmi+WSJoDzavtKQD0s/bha4/0jT8u5bymU/a+T7Rq2hHV2iN9tQaw+4SNxkxCA
         xQ7iW+s3VFgp9/tMwymmVtRNkggSAm6sB6vX8nHenqimRwcig+AC+xhrliU4k7mCVede
         /5LoS9Bz4wH9phcSr/wlUm7A80IKrVqu8x6ZMtrQ0bypCzHjDMxmWYzhBQtoFG17cQLV
         TEp57n5HcYcidSo3JmnJTnStmN3l04DTJAilQFDwj50wVXwcZYzdsSJwjitwpeZQB2rF
         ZkVg==
X-Forwarded-Encrypted: i=1; AFNElJ+d5nQlWnORwOp9loKq5KjGJjp176IZiZcnJEudi8Mx08ZdKrfsgkJeM9g+q0oKIcJBYHU6lfA6b3U+AZdK@lists.linux.dev
X-Gm-Message-State: AOJu0Yx67K3QZPFeJKrKcL6+XHDU0x9zGv2H/f5ZokbBw9CbB/uHB0Bc
	yyM6ui5VdIw1NxYNqHyeMcd6ATIO9aNmJqWOUuEUmbYh15LdjkcmiYIV
X-Gm-Gg: AfdE7cm377yvuSmZYweq2KSC/VAgDJXxMRNFMJqdOUVxKQL067vzZIFYgcszr+THZLV
	MFPr/vQ3/utrEGh3tHNBVPoY4OxwK7HTooFFI//gATdSp4Wb/WPws5FdGJTXvvMzsogUsvTLwNH
	l6VRyXTy76c9GzoEuL6d2FmS0CmMulmclQi6fYkRXWwwYyzMSMDJ75npSkDH1oyfoEuQeWYSAdb
	FMXPUrq7hvCaQf5+5B1x7Alatkvx5ZUhb+tYQfXiE78aytM8GvaaK6K+0MunAAbSV104MIJPUPP
	jDffmAU2joK34Qegse4h2t4chCwpONDcLkvu4m+gS8Z2ONz/KXGZILAN/s72yB+x+oNJnt6YBEi
	7V+pAnbYLK4cYbi/2zEiX271ppNYR2hnzpceLKHHnMMkLBBzB4mgM85Q6//Tv9pvq6UnQSuevf0
	OUEqrK
X-Received: by 2002:a05:6820:f00d:b0:6a1:57aa:289d with SMTP id 006d021491bc7-6a157aa2ae7mr1248986eaf.30.1782544363315;
        Sat, 27 Jun 2026 00:12:43 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a1415266aesm3058413eaf.15.2026.06.27.00.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 00:12:41 -0700 (PDT)
Date: Sat, 27 Jun 2026 10:12:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: reject frame dimensions that overflow
 the size calculation
Message-ID: <aj934iSujRmfJ3St@stanley.mountain>
References: <20260627065556.88673-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627065556.88673-1-doruk@0sec.ai>

On Sat, Jun 27, 2026 at 08:55:56AM +0200, Doruk Tan Ozturk wrote:
> @@ -106,10 +107,30 @@ int ia_css_frame_allocate(struct ia_css_frame **frame,
>  				      unsigned int raw_bit_depth)
>  {
>  	int err = 0;
> +	u32 bytes;
>  
>  	if (!frame || width == 0 || height == 0)
>  		return -EINVAL;
>  
> +	/*
> +	 * The frame_init_*_planes() helpers compute frame->data_bytes (a u32)
> +	 * as width/padded_width * height * bytes-per-pixel * plane-count using
> +	 * unmodulated unsigned arithmetic, with no overflow check, and the
> +	 * result is then handed to hmm_alloc(). width, height and padded_width
> +	 * are user-controlled (e.g. via the v4l2_framebuffer ioctl path in
> +	 * atomisp_v4l2_framebuffer_to_css_frame()). A large width/height pair
> +	 * makes the size calculation wrap, producing an undersized hmm buffer
> +	 * that a subsequent copy then overflows.
> +	 *
> +	 * Reject up front any dimensions whose worst-case byte count cannot be
> +	 * represented in the u32 data_bytes field. The factor 16 conservatively
> +	 * bounds the largest per-pixel multiplier across all supported formats
> +	 * (up to 6 planes / 3x RGB planes with up to 4 bytes per element).
> +	 */

AI likes to add comments to every line which it changes.  That information
is already there in the commit message.  Everyone knows what
check_mul_overflow() is for.

It's like the ToS when you buy software, there might be some interesting
information in there but we'll never know because it's too much.  The same
thing applies to comments.  Don't comment on things which are obvious.

(You might wonder why, if this is obvious, wasn't it done in the original
code.  drivers/staging/ is for code which is obviously bad).

regards,
dan carpenter

> +	if (check_mul_overflow(max(width, padded_width), height, &bytes) ||
> +	    check_mul_overflow(bytes, 16u, &bytes))
> +		return -EINVAL;
> +
>  	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
>  			    "ia_css_frame_allocate() enter: width=%d, height=%d, format=%d, padded_width=%d, raw_bit_depth=%d\n",
>  			    width, height, format, padded_width, raw_bit_depth);
> -- 
> 2.53.0
