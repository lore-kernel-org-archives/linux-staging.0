Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9B951C07E
	for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 07:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061777; cv=none; b=G7KmCBCz3+m4UHJE7xJZ3Y58sFGEsg57rGQ85EJckxAGRpYyw5iYKsC4kpL1UAyE3qQEb/rp9MPzZGZg+9e2nqV18qNuGO5C4dW2aH5wuJfMaN1iT3S/ZhZOawP3M5Vn0m5XMiMjsIlq/QrXwaxQ6269jptyvCVDFY9lswMOQ9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061777; c=relaxed/simple;
	bh=g2Xy9jDjDZ3K6DmNsnmaoN1dj1u+mGq37X7BB/6Az8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXAH5RTIt0PcEdvgrjMHOjsS0idDZB2O8l7m+xqGPOHbysO4cf2E7liEMmRaqAsVj93EuVo3vxpstPBtZmfei8GLeOHquiH/dpCK68kwDBCUVbli0NoEwCuZA+7cM6NF5QVZbazLJKsXrhjrL5Lc9UWI9Bg9HLTx63+UViOAgDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkJsj1nm; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkJsj1nm"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-488615e6cfcso219492f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 00:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790061773; x=1790666573; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zOpUj0Pnwod3tVYOQ3yCnTP6vZoRZm1tHkQP7O06AhU=;
        b=XkJsj1nmpdGIxZ6M3GPgKwXQyQBPpi3m8VLOQR/8j78NINkHaa5XcmXownb4DXsD3E
         T4K3PDFsVA2+0baMAt3g1/3rxZrX9nkFhsCgCtC70C7rHPswpoTLwvsOv6sfuQ+BKIGh
         UMOo0KZlnM8L7JjGUrPlitLCtzw38EOIcsxGNCV3n4l/LH/hgsSbEdYd0lz+dcnTt4WC
         PgsMxgDKdMlvj1bi+13p4TgL1bdsiRgPmHH9DhEBKJn1rMme3Wjf/Im6v5DrKixxdY8i
         uVnCdJrjA/6EPUAbeNAlbrEzDfxvEA7j3wbCUheVvM2J89Tc+2MRW0FV1v2SOIJi7uZe
         WvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061773; x=1790666573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zOpUj0Pnwod3tVYOQ3yCnTP6vZoRZm1tHkQP7O06AhU=;
        b=Lh39OJQsWCqLaoMp/9+lAt7tzKuP7LeuEAbQBRqH1f5VYZuv9qPI0IF2BPlp65jROW
         VbHQFi7SN0+h68lWBQJLorxLWh072/prbOuz5uP/1GOnfkbjz4QJ4qwZxp72UAFWYHfB
         o07edgs4bENql0RsyQrvamTw7H9iXpSM7MPfU37fh/kKHn0yO/czYZKdZ+rUELcrRR3E
         GvaVEHZ2PUE2CPGTZK2VGpYYNn98EZiOxmOAVXqbvduyNqrhx8xHU9CvCU0llUNLEaPr
         MvXw1psL+0rDI3k+esozqHjvFvbai0QigsD/37sm/JSvEJG+XnjI6LDfKk15NmdwvQmO
         av/g==
X-Forwarded-Encrypted: i=1; AKwUvBxgQpumusjmI1VnN0hb0HKv/dOd1gVEadX3henyGUOxahEDKneI+MhJtzjwZr+BGB2bzLu5mvNWcwoi103J@lists.linux.dev
X-Gm-Message-State: AFuF++nsWGQ3iwXlgUg8S8AOTf9Nvui0YscyF+Nbnf0RWNoUhNbO9xMr
	BJWU5fs1pBm2G9sUQwp5M6epUiOwvDhrmGsnFKd5u3QHfdhE7MDYkJVm
X-Gm-Gg: AYBFou2HXLEb8zHbWQym4jjQPjnM4q4sxCgKJbJ0vqR23iTlPMedcsOIm2FQQT8MTjY
	woMPLd64KQIfJSEh9Zsm7TPqYaDQWFcua7bUQasC43TZP69aTeL9ag0PeWeX7RrbJNpAnFF+Ur/
	1uR0lHRvRwEesfIK55rHOz8IcsQNShafvc5FpsSVxUADht+q7/qNTL7BkDnwANlqq/s6aEdghSs
	25bqYQuFa4jJxEEnXfajDL1Kmdm81M6lOgKcrYcOvVAnT65T7tYt2HpCk5ndRBMbUCusijv1zU6
	yCW8v+k96hr+ylPJ4zVnDDsvuAg8XwUPUCg54X7O/UoI9ggUa6ap82sQk24edS8Sfr57icWV1OH
	Xu2YcRhTfDqa/3D2T1Spwnkl2FW3VaQBcyVvrnbG4aoFX58Icj5SpUnkjeqMQvafsPkSL3ZNdoV
	Ofsu5keKAb5QzZnM2FjRp0JIPG5o1e41994P+AxSh6R9/tD17vk5+1W0VN+eD3RwBJsgfsq8Phq
	yJ5cw==
X-Received: by 2002:a05:6000:41f8:b0:485:8226:c69e with SMTP id ffacd0b85a97d-48861021808mr2450244f8f.29.1790061773363;
        Tue, 22 Sep 2026 00:22:53 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862793792sm3387192f8f.31.2026.09.22.00.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:22:52 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:22:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Lucas Costa <2000.costalucas@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: free cmap on framebuffer release
Message-ID: <arIsyPJno_UGVvSK@stanley.mountain>
References: <20260922035302.167378-1-2000.costalucas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922035302.167378-1-2000.costalucas@gmail.com>

On Tue, Sep 22, 2026 at 12:53:02AM -0300, Lucas Costa wrote:
> The driver never calls fb_dealloc_cmap() after it has been allocated,
> so when the buffer is torn down we leak.
> 
> This happens on every unbind, and when an error is detected in
> sm750fb_framebuffer_alloc().
> 
> fb_dealloc_cmap() gets called before framebuffer_release() in both places.
> 
> Fixes: 81dee67e215b ("staging: sm750fb: add sm750 to staging")
> 
> Signed-off-by: Lucas Costa <2000.costalucas@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 8b93bfeb217b..92412534239c 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -910,6 +910,7 @@ static void sm750fb_framebuffer_release(struct sm750_dev *sm750_dev)
>  	while (sm750_dev->fb_count) {
>  		fb_info = sm750_dev->fbinfo[sm750_dev->fb_count - 1];
>  		unregister_framebuffer(fb_info);
> +		fb_dealloc_cmap(&fb_info->cmap);
>  		framebuffer_release(fb_info);
>  		sm750_dev->fb_count--;
>  	}
> @@ -943,6 +944,7 @@ static int sm750fb_framebuffer_alloc(struct sm750_dev *sm750_dev, int fbidx)
>  	return 0;
>  
>  release_fb:
> +	fb_dealloc_cmap(&fb_info->cmap);
>  	framebuffer_release(fb_info);
>  	return err;

This works, but I don't love One Err label style cleanup.  The label
name is no longer accurate.

The cmap is allocated by:

	err = lynxfb_set_fbinfo(fb_info, fbidx);

So ideally there would be a cleanup function which is called something
like:

	lynxfb_unset_fbinfo(fb_info);

Then we would only call it if lynxfb_set_fbinfo() succeeds instead of
if it succeeds or fails.

unset_fb:
	lynxfb_unset_fbinfo(fb_info);
release_fb:
	framebuffer_release(fb_info);

	return err;

See my blog for more details.
staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

regards,
dan carpenter

