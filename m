Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7773F5BD6
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 08:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721848; cv=none; b=RqGyfqM11F8fnHHM/pvQOPc3jPHmcffX88cjHbh2uy4UAJ6TDEpff0DRYmGSFcM5lBlb8t78ln9Rpgg5NmlIEmqRgFJK9ZXV9WgKqzyvrE6A140V6DUZJ3kichwHKD9a5efYc/lyt9G69FRXJ7+J+5mNB9jhTC+vg2GWOjdE1fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721848; c=relaxed/simple;
	bh=abts/1MRf4sGQNrs+Qra6uETICHxnjs03xjp5k5HK2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9WOLtdP/aq69YEZAadpE9rRr/skCrLc3VN9QEg05Gpvr2xzGViUPggX/yWy6bs/Zs+rU8nzfPvqF7L3+YaWcnEjFiq82PkcUyLWcz6Ho6W+hXbBYfB8sWdzRMDz+oLNPWKn8QK7ESAKBXCaTg4bG+6pseUwxu6sZzv3ui2zAxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5M8h4Qs; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5M8h4Qs"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-698439b6e8aso3440988a12.3
        for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 01:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782721845; x=1783326645; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fq4MrGKf+YRbreREYMtKaIO+6uUYvLSEbh1uxDtYk3E=;
        b=d5M8h4QsC16RAoGsRY+mE1i8gyyplSz+42k2A2KGHL3U+x+qaLCjAqgABCsy9H4fVc
         MrY2PGBKtLjI+fk8B/8STS8V+yVpq3xIg+2GRoavtnEXfytumr60yY0J94BmsefL1TVb
         +St/S9T9Q07EK8PThcd2g96ayiPtIVdWxiQyWtWQsPghcLZUug6TnfjCTz22AxeBDMqO
         bDRAjZ2QmiD2IDYrlIVl4IdMH7fs1nVsUrkFRkZVjnv2OlpkMhMoXsdHHlTVR7aYL4cC
         8KMCI7KlzRwVyBmHoCZleE/gd5e5crX/7J0rq+011TrZzvT9lf6gGaV1C9s3qGd3I/ns
         Sibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721845; x=1783326645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fq4MrGKf+YRbreREYMtKaIO+6uUYvLSEbh1uxDtYk3E=;
        b=ipJs98jVBFaO17RG4k+8Vl7W9BFgeDBu+B00D8JrDkvn9XdVj4af9Ej+LcVOTzT+OQ
         82cWEa49BhbYHWGk4v6ztOqRpbWcVuj09XJUFqHMTqktXwi+ExywkUc+pb0tm+UQNxGB
         pzVEWo82ZYHSzpz3Fi0RFtAvLidXRPPftLqy09HYazVUUXOTFxPjSGRmu608CZM/J8pM
         l0Ibpbn9mMEVLzAp0iHsf2YesJo6UhMnzVvR2hnk3SXYNz67NUGjBBEMhOOxTwqslUJb
         ulqbBX9V+NfdxRmw/jV8m70/251QQ1Ev8ABmQX/eGQKyBz179WnbSG8TAgEkt3BYuNjg
         LoJw==
X-Forwarded-Encrypted: i=1; AHgh+RrdRSxVyixA8Goth9jK9BqqV6uuOntmhAg3iwFL3aUamtslNT4+JkYOc2HGAjPtwftUSm+ENEDAZkOC8TVl@lists.linux.dev
X-Gm-Message-State: AOJu0YzefLeCX1jBC7caTQAZYXOBq3tWLpxqaQXL1eSlVJn4QmbYM13a
	yV/9gh/Hf0q2NO3vmMK59yO/6oVlIUTvsayt2/+7UfXnhhDmi71UeiC5
X-Gm-Gg: AfdE7clpgcAdsaTlktdtHauz8fpbIMffp4P4KZdE8J+CJnUjRyhNotacyFEcNTmvKJO
	p8Un88iO4p5XQpRmLRC+msQEYS99VwtvXABG2vFgRJU/wt6MGkh8qqL36xlAJYnEqO/qorYgTBO
	b8eHjAk1Mw1pkkLOg5H/aG9+ndqkbwxqXdP2ZLKKfhUIebpamgY6XzIo3ytST7a//o6fb4HC5MZ
	RFbCyFq8m25VRhBgkIZ/iy5Oj6gaMdG48MTeLl9OVgBLTaz7iFPK2Zd1ke5mFv4Ljfq17Zex4ps
	DYujlDBlK4SPiI/TDAOmGj56jVMaPwDQ0/mDQshSJMmU+6w3nkSP3RLcwdEUl2AYWwMhhQfPThC
	H0eqtGuK+UdFEwxfDo5PW7ghMpKpbkM24uiVXMjqMzn9sFGnRI8leJEA/3/4uLhyRWrrngzciRJ
	hTsXg9yox6sw==
X-Received: by 2002:a17:906:6206:b0:bed:87c:b24e with SMTP id a640c23a62f3a-c1205eef62emr702909766b.29.1782721845095;
        Mon, 29 Jun 2026 01:30:45 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:9cf4:43df:e612:817b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1276ec6c96sm39712166b.43.2026.06.29.01.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:30:44 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:30:40 +0300
From: Dan Carpenter <error27@gmail.com>
To: Dawei Feng <dawei.feng@seu.edu.cn>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org, azpijr@gmail.com,
	kees@kernel.org, arnd@arndb.de, pontescpedro@gmail.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, jianhao.xu@seu.edu.cn,
	zilin@seu.edu.cn
Subject: Re: [PATCH] media: atomisp: fix CAS scaler descriptor leaks
Message-ID: <akItMNqgKTDBCGV0@stanley.mountain>
References: <20260627060151.2543613-1-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627060151.2543613-1-dawei.feng@seu.edu.cn>

On Sat, Jun 27, 2026 at 02:01:51PM +0800, Dawei Feng wrote:
> load_video_binaries() and load_primary_binaries() create a CAS scaler
> descriptor before allocating and looking up the YUV scaler binaries.
> Several failure paths after descriptor creation return without destroying
> the descriptor, leaking the frame-info arrays owned by it.
> 
> Route those exits through a descriptor cleanup label while keeping the
> existing pipe_settings ownership model. Also clear num_yuv_scaler when
> capture scaler binary allocation fails, so the existing failure unwind does
> not iterate a NULL scaler array.
> 
> The bug was first flagged by an experimental analysis tool we are
> developing for kernel memory-management bugs while analyzing
> v6.13-rc1. The tool is still under development and is not yet publicly
> available. Manual inspection confirms that the bug is still
> present in v7.1.1.
> 
> An x86_64 allyesconfig build showed no new warnings. As we do not have
> an Intel Atom ISP camera platform with matching sensor firmware and ACPI
> camera graph to test with, no runtime testing was able to be performed.
> 
> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
> ---
>  drivers/staging/media/atomisp/pci/sh_css.c | 35 ++++++++++++----------
>  1 file changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index 00082276f1db..d0ff16ba890f 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -4528,20 +4528,20 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
>  			  NULL,
>  			  &cas_scaler_descr);
>  		if (err)
> -			return err;
> +			goto destroy_cas_scaler_desc;
>  		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
>  		mycs->yuv_scaler_binary = kzalloc_objs(struct ia_css_binary,
>  						       cas_scaler_descr.num_stage);
>  		if (!mycs->yuv_scaler_binary) {
>  			mycs->num_yuv_scaler = 0;
>  			err = -ENOMEM;
> -			return err;
> +			goto destroy_cas_scaler_desc;
>  		}
>  		mycs->is_output_stage = kzalloc_objs(bool,
>  						     cas_scaler_descr.num_stage);
>  		if (!mycs->is_output_stage) {
>  			err = -ENOMEM;
> -			return err;
> +			goto destroy_cas_scaler_desc;
>  		}
>  		for (i = 0; i < cas_scaler_descr.num_stage; i++) {
>  			struct ia_css_binary_descr yuv_scaler_descr;
> @@ -4557,10 +4557,13 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
>  			if (err) {
>  				kfree(mycs->is_output_stage);
>  				mycs->is_output_stage = NULL;
> -				return err;
> +				goto destroy_cas_scaler_desc;

What about freeing mycs->yuv_scaler_binary?  There are a bunch of
other leaks...  I would prefer a more complete fix.

https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

I would probably just do the free before the goto since this is not
part of the cleanup function.

		if (err) {
			ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
			goto free_output_stage;
		}

...

	return 0;

free_output_stage:
	if (need_scalar) {
		kfree(mycs->is_output_stage);
		mycs->is_output_stage = NULL;
	}
free_scalar_binary:
	if (need_scalar) {
		kfree(mycs->yuv_scaler_binary);
		mycs->yuv_scaler_binary = NULL;
	}

etc.

regards,
dan carpenter

