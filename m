Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476552EEE80
	for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 19:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787511996; cv=none; b=dnWYC0SRcx8k5ZaL4lmDIRpqLzDYYQkT+9gcLk4WJ+fGgrlz1+rJRAM7xbDq9pmXuRocMO8SilN2nWMLRS5pClOEFYSou6uvc5lzcoN6NCB/L0DiMgyZN5tQNnIJozREWUuQc5m7XY4tmSGpSH9U5/e7BRR546iLWEXhLA7eQRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787511996; c=relaxed/simple;
	bh=WfJujPFPMQu16pbczkVUSeGNV3OksUUSe/7rv6gNopI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swZKGsv/Rdu7IwqK3dCHWQ90ceu8Ea1Xz+WLCucuNlFJddi+JNl8f6uTvh7vRhJ4YmPp46HXCsjh/jGfjb77Wsc0c5niH26WgZSFaw7Du/adr/GzZIM5/jhNReWdRwdiPtfrfUn5Y9N1YH2+YublAPoxJVMkRlsjuV6fd3pY148=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+ESSJxb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+ESSJxb"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49800c6a846so23358555e9.3
        for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 12:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787511993; x=1788116793; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8j2wDnXl73tHxAMBLy9ypg7FWEyrB5lCfG4jDjmnX3E=;
        b=f+ESSJxb+0OWzIlSSCG1HSVGwgfaIr8qo0jwScpw6IuoiyJvMSf9DIzFLnyTlVzOOa
         U9yqm5yyheHQmbLGMUztgGSC0OsO/4G1J5ho77xlPVtOC3aPh4DJr4tGBD9uy1RG6zrY
         nBRfcGfZySFB23FjIfcj8Ipc4xopNQVhwXLFYOMM3XMBbObO74vtkDc6DWXUnfGDfZIF
         B2soMrcu904rJHXKDbaHRa6UglIYQaZ6e/ugLmkDgbwLrQBYkIOncR3MHmfhU/PxG7CZ
         gBstS7SEZNfZPjauh/8kf6ryNNjdrLdhlBxQ8L6OJzUhX+UAUssqum1ZjVu9zOnq+ftO
         iU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787511993; x=1788116793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8j2wDnXl73tHxAMBLy9ypg7FWEyrB5lCfG4jDjmnX3E=;
        b=WcSTrpsqPOJibtrxikTwgk5Pcq+hsSXdD3d5rSgxjnsruK+9kg2NEanW/49vBaSmCe
         4Oovy626y1SgGKhoTqeyo3TbVlOblKfq6u+8o/r4+V0weusZJauqUwysMcWMisW1QcCz
         IUnr/zo6Llm8UdDOEtr0FMdniF/nFgBLJMQvc55XWv4yBQ1Gp0+2UJELkQiqDaDISExI
         DZb2x0dtqHwVMRMwypUYO2aObrRrblm36uQd2n7MDvD91YAJ9SxtBPqBMRLnmIqBbf//
         be3uMPxbVRkdzKkbK7sIOphz253CV4AGcrR745wr5a7pjYO05HGkyesql+fGcFG/3knu
         pgzA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2QTcx6h9hudQV3zEY3Iqo3H+8XtyTuB1IHGFv4hxjbw4dNA8/P2cXa4RB4+vfBTqNs9HJppfohtM8Ya+P@lists.linux.dev
X-Gm-Message-State: AFuF++krOWLOt0Zk5UekYjP/Nau+t0yaFmhclJ31ag++q84+3aNfEZ5J
	djWxRC9IHaV15L4Uu2GcEMtWhCexKUTg0AvndX3JbojVDXZrlKFGMNGW
X-Gm-Gg: AR+sD135a7D3c/X0oVdqYiHNCrzjXoAJVaJkX4R3Uz51kPMg1weIEYhXrnKk75HnL/M
	OPe6mo59xuXLN6u58IvMk+kcQLFWzSE+JvglwNAYhKpoIZIRY+VuWC0EGiVkqxpKvOMzn8mdhxT
	Wo8s88LpiJfxTdiouXdHTVKmbOAXQZNwdyw1p0nzh2fIaV9lHxVXJ2MF+lKHLp12gGmoHTB5+ht
	LIQmAASkuZ/v8IUPo+fY+fk+Vr/+JAlkLQ/XfDM1P2DobCwZ0PW5PT1PqA9YYHfTFNhAItoxxIB
	cNtxzf4rYkHHuRFt2NifREZ8DGHkGbQ3a3XjZanPtZtYsEoHx0pm3Do0MugAZmzKgrbBgNgYA8S
	DZUwocicPgDAnSbvvdc+Wh9Cm9NVc8lM9QolI068j6xiObaz/Q3P6tiwxzOJTCKSdFymvXY07sK
	Lm7DqC8Fbg1HSjXETUJ3vOJ1zUXhqddlqjpd5Uk3NUZf+vZm3Quid354jDAI1Je/v9zkY=
X-Received: by 2002:a05:600c:530f:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-499b82f3d1dmr278836545e9.1.1787511993515;
        Sun, 23 Aug 2026 12:06:33 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9a95fe9sm65092595e9.0.2026.08.23.12.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:06:33 -0700 (PDT)
Date: Sun, 23 Aug 2026 22:06:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix space before tab in sta_info.h
 comment
Message-ID: <aotEtbWjveIfcx0X@stanley.mountain>
References: <20260823-sta-info-space-before-tab-fix-v1-1-c88118e72485.ref@yahoo.pl>
 <20260823-sta-info-space-before-tab-fix-v1-1-c88118e72485@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823-sta-info-space-before-tab-fix-v1-1-c88118e72485@yahoo.pl>

On Sun, Aug 23, 2026 at 06:12:17PM +0200, Tomasz Unger wrote:
> Remove a stray space before a tab in a comment.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Verified with checkpatch.pl - no new warnings introduced by this change.
> ---
>  drivers/staging/rtl8723bs/include/sta_info.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
> index 0f53e77c110c..c6cbe89806b6 100644
> --- a/drivers/staging/rtl8723bs/include/sta_info.h
> +++ b/drivers/staging/rtl8723bs/include/sta_info.h
> @@ -122,7 +122,7 @@ struct sta_info {
>  	struct recv_reorder_ctrl recvreorder_ctrl[16];
>  
>  	/* for A-MPDU Tx */
> -	/* unsigned char 	ampdu_txen_bitmap; */
> +	/* unsigned char ampdu_txen_bitmap; */

Delete dead code.

regards,
dan carpenter

>  	u16 BA_starting_seqctrl[16];

