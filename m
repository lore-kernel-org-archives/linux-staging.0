Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997193B1014
	for <linux-staging@lists.linux.dev>; Mon,  8 Jun 2026 08:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908714; cv=none; b=Q7s4/3RAOuzWFR1R/QPjidJixb1JTtlKsORuD5rWR4aoUdBLmyqIgk2u7jD+42h15Qky3C6tZ7aM9I198Jw1yzpoz+Fw05Dz/lahIZr2aONfvxRTqQE3zmeLFtxGPj1rfCxheKFhFWFM7pcRCedJzj33t0zObd9AvaKLSLr/drg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908714; c=relaxed/simple;
	bh=KxzcZczBnWtnF71WrvbJ931DN27De2S8SoNvlQedRC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyvPWbyM1tPpuO7MKRSjbfkPg6vWUqtXiSFRqPF1iN52/ONgqykKbDtAtmH8WtMmuzYP9BIG2W1iM6KJYwi1r+u9n4OgBLx01TKhfaZDpM64ELSzsyykgqZ9irv5jE4vAkhhyhF8jWzlUYl3ioe8pkDzXhjLF4BXUhx/F9WgEbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYV91cCV; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYV91cCV"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5176bbb9384so41835401cf.1
        for <linux-staging@lists.linux.dev>; Mon, 08 Jun 2026 01:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780908712; x=1781513512; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O248v2PloCfOKOL55ryzQvPbQCl4x0VQe69JsI4A4+Y=;
        b=FYV91cCVquOiPHqsRavxB9LG95+TBBZtk9hanNwyE/cuYwS1qd0Bf1KaiQTXq1X9Ae
         2bjlBjTPXguZ9uy6sXQS7LgkcTR7KPZg+SF10XbfZ4nLDYVgvSymAshMZZBqz9oLlbtc
         PgB6092+XSm+CWm+el/9HpnJK/LkKim4xXPD81ItzAGHOrm9RgWY8Fw7p9ZKXEl06v9W
         BDLDPQHgvuDnooPMLhK3VyaTk3Loeqm/TpJKgf1+6ZywH7aGUljvlzBLGzarys5OaTTf
         /uRnGxJMZdxuS59G6sUMN6wycs0A3VXO+Cw8x/B14siTVUH65OZGAWvzhBqOYb+XvjQD
         /Lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780908712; x=1781513512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O248v2PloCfOKOL55ryzQvPbQCl4x0VQe69JsI4A4+Y=;
        b=DhZw16YAsXKblrjR//0rtXoq866+pw/omx740ruYp0p63o5+uqq1AgWul1W5ymNPSM
         OjciTVG7r6iZcOOlmAQ47lW/tgvWE8olwt32ZSIO0S8iltzpp8RobUbZTViwQG/N6db3
         sEjT0eZ2F/76t8IXlMv9jiRdrWLcfBojAad6k0wti6MqDbrD5f0Mv1R2tQvuiaMS5OAl
         JabTPN77pHgP1PTjkv14TJt88QABKLZYdKwkFCgJMnv1H+FA0GZSr27tgaQ++71paHMY
         WIjbJwtVael4nH//Y6eBA5heN30WzestYqt18F+pDsDfAyWCIIZ6cDF8rpD7DW/qJxCv
         Mtgw==
X-Forwarded-Encrypted: i=1; AFNElJ/+bpJ1egmW8PKcXiEhJudNkaN2qPnmEaeuZ1MsH0CYd74n5+hOxVH1UhUuGjXlEQkYa5JygVxDZb7UrPnU@lists.linux.dev
X-Gm-Message-State: AOJu0YzxxJ5pIJ4AHBxlg6xcw2G6LG4hY3JQ86vUWO9H02wp3OWG31JL
	25nDUwHMfD5lQyfN4rBIs9jM/hqS0K5w0K5ZaLNzKE/Ce3xo68UcxIRh
X-Gm-Gg: Acq92OHjqc1+PDb2t6xTjfxm5t1BX3d57MWWPK1VLHHvHv/g6XChvdka7RoZ6zfP+TH
	ASeOjeH9BJvZObknwzDg7Y/3ydsaZJdnbLShJJ9I93jgDghR/OlkBlLxmsiUdpYzsDEx06dDY/u
	7996UbNK3A3Fi/YnZhoN73YT+GBx3K74s+r8y6jBtYAF85nCKCXEgCnQBhfk/+kv2/5ZJXXpNer
	w649Ez8Z57H2rO3nzdyEbVJt7KqKOwAvXOhjm/gE1vpwzAguW2XYSbsekNxsEXK3Y+coNpLMCfc
	cmbMTkry+YgbvkCJ3FuHVUHlhUs6WkCQUVSH17Y/1MGbwtgXl0WPDFQqSjZb8e+yM9r+7WE5xBk
	zy33x4xxuobRse/xWq0v716y9s9sEv9rzb+MlRxNZDqLAz6tuBY1PY6vBQGVj8sMQcSNor3gJs3
	kmUTnkN1LHR8oZpUPySA4IwacyJUPZ
X-Received: by 2002:a05:622a:6094:b0:516:ed02:c85d with SMTP id d75a77b69052e-51795b0e75fmr206862321cf.3.1780908712526;
        Mon, 08 Jun 2026 01:51:52 -0700 (PDT)
Received: from localhost ([43.225.189.113])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c08234sm149224681cf.6.2026.06.08.01.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:51:51 -0700 (PDT)
Date: Mon, 8 Jun 2026 11:51:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: Dawei Feng <dawei.feng@seu.edu.cn>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	abdelrahmanfekry375@gmail.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	jianhao.xu@seu.edu.cn, Zilin Guan <zilin@seu.edu.cn>
Subject: Re: [PATCH] media: atomisp: Fix resource leak in atomisp_pci_probe()
Message-ID: <aiaCoV1DQKBx4ph6@stanley.mountain>
References: <20260608082706.3287831-1-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608082706.3287831-1-dawei.feng@seu.edu.cn>

On Mon, Jun 08, 2026 at 04:27:06PM +0800, Dawei Feng wrote:
> During atomisp_pci_probe(), the ISP subdev is initialized via
> atomisp_initialize_modules() prior to entity registration. If
> atomisp_register_entities() fails, the current error path only
> uninitializes the CSI2 modules. This leaks the subdev entity and control
> handler that were previously set up by atomisp_subdev_init().
> 
> Fix this by calling atomisp_subdev_unregister_entities() to properly
> release the subdev state on this specific error path. Later error paths
> remain unchanged, as they correctly use atomisp_unregister_entities() to
> handle broader cleanup after successful registration.
> 
> The bug was first flagged by an experimental analysis tool we are
> developing for kernel memory-management bugs while analyzing v6.13-rc1.
> The tool is still under development and is not yet publicly available.
> Manual inspection confirms that the bug is still present in v7.1-rc5.
> 
> An x86_64 allyesconfig build showed no new warnings. As we do not have an
> Intel Atom ISP platform to test with, no runtime testing was able to be
> performed.
> 
> Fixes: 9d4fa1a16b28 ("media: atomisp: cleanup directory hierarchy")
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
> ---

The code is buggy, but this isn't the right fix.

Here is generally the standard way to do error handling.
https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

1. An allocation should clean up it's own partial allocations.  That
should not be handled in the caller.  2.  Every allocation function should
have a mirror cleanup function.

The atomisp_uninitialize_modules() function is just a dummy and was never
actually implemented.  The correct thing is to implement it.

regards,
dan carpenter

