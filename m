Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190494418EC
	for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 08:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786608943; cv=none; b=Vm9vOEFW2BKDaB6cMY8fMMraM3e9zDZGpaYpy7lyqamvGVyHbmnahE8wBCitj1E6+mKbtnTeAXQskgISjlRRLMFr2z2mYgtErIi/2/sJGCjTfENXgmIjIiRXgBq3vwhB7hTEsIutxcCqDig2qwVx/H0F+ET2JBKQPhH4uzPWoQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786608943; c=relaxed/simple;
	bh=CDW3D3ihlzfGcvfK3Kg26K2DWt1/HEjNmJeSJUhJbvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmOSA64gB11p986nX7XGnHIBf+gAb4oUBzenjC2w728YjvOWhkBaMGLCJkc7LGMwTDictoGr60p7IsXQLObzob6Yo67WzjLHHuuAM7L/yzYn19PgbxoGUCLVjD+MYa/owLV3dVLthdUO0lor8d6BCqjQCjA0UUo34p+0nxypM4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdQpooUI; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdQpooUI"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ee88fce572so17676256d6.1
        for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 01:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786608939; x=1787213739; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JEQS7llX9UaH8wutbu1sfenYXPYeQd9lp24h870ImTY=;
        b=hdQpooUIPXcEFzmddnGc8mcIL74cdjh0N+p0BDAujJ12MV40a/OHOodUcmx/uKiggN
         3x5FrnlVn7fQye+XhLB6wpPhtWzxYxUTjR60mB+KVfmBp+/grWOdUn7ZguSomDN862xv
         oNyi6qL8JPjE5NiFH+eVTwapqEiZXT59FisswOqoDjC/MKZB2nEQesHAPOLFQYEnUhwD
         tbx4eF3wsRmdZOMRRS3UBG7/EZS6IcgOz6ZjbCFqh9WSu3dN8icHGS1WMGB8nXQ8VcwQ
         ePqNQxwoYc0/y3DZBZ/tFCc2NODTlRGRwH4a0NGtLrBrtrtMdZJxxF+IBarCPKKrh9Ug
         pOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786608939; x=1787213739;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JEQS7llX9UaH8wutbu1sfenYXPYeQd9lp24h870ImTY=;
        b=iVh12mtvOij4HX2SFo/pNksWWQ1tDOxo55mwz5AXCmebf2wud5jEHcSpKhIx5dAWB6
         ApNKcntlgbGPFqVRtJxPe6VxrttKOXFAmE+WzFjaNMA5rnk6xosF+o0Zy5IZf0NU6JJD
         KXxoup4dxEvsEzc8Ae/KGsg7FaErfqw28dgJxfIje5+vMoW2AIajm6ASgxGoNpvf1n1W
         vQf/tzPAnuzByOT73O96Lz1g7JmC054uxgNnlUDDnKWTK+ncahiaaIlR1uAC0toxpCWo
         c2SD+Xq0B+u/WqCKMzXTzUcAL8b/6MMqLuAmU06SXILNhpdXnPWwATAvFKQ6tVEmPz4Q
         Y0zg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4hZnSBOzaYrtoZjUhHyWUsYAf22h3+qReMH+XTSk2a9bJPN2IASKKcEkF35g8hA33/8d3Aao7UYuyF2xn@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk7nuBOtzjreitS3FOZA9Li7cUT+QGhdYHZJsYSkoJCLYYTuia
	ESrRWeguXy9X52N3r2AOOIhXpum9/4ufBdd1Gr2egTi+nMY2U6jG6EdG
X-Gm-Gg: AR+sD12P0ULrdU/L5HKgb9JnuEWNGcCFb+prkMW5VhRJ1SWSjlOVH7fdWzS1uD4jers
	FabSWnI53zzJxHo/Zh8MNGKSpI/jRGbNAIrDs6CkcCHuuNjW8KT06AOQsRNf2rEcERNC09/0oeB
	/EQ8eGM2hVDaowKRXwP1EhnyM0KbW7u2Oc902tQTxfdSpwAGMfu9ijHWa1/3MbARQmwaizl33+i
	kXjLoPvfvqspWdVCgX4aIenM2LTFdTkveHuSgGXHEzeXBnlmBGGv/JHpqaGbUhgWRtOmZquMKNP
	fgyHUGABTIFIsxDYrRX5Goy8pr+A64AKKXjjpKE8xEOca/5zQW3GgkjYwli1d/vc2QU2emveenQ
	YW0CD1dP0J1VGT8Q/6I60rsIqyufo9SiFfDXUK06QgM1ytbKJiUTeUdanjulR9wS9QAfP3A580Y
	qpPeoeUiD6exG/ZcEBC15nZynovLJeN8F1FJ7ObkSdXeevA47nbn0xe7M=
X-Received: by 2002:a05:6214:53ca:b0:908:8f97:7d9c with SMTP id 6a1803df08f44-90a80b7767fmr39877276d6.30.1786608939438;
        Thu, 13 Aug 2026 01:15:39 -0700 (PDT)
Received: from localhost ([45.144.115.139])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a8179e584sm10187926d6.9.2026.08.13.01.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:15:38 -0700 (PDT)
Date: Thu, 13 Aug 2026 11:15:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rishab Madhugiri <rishab.madhugiri@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org, andy@kernel.org,
	sakari.ailus@linux.intel.com, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: Use ARRAY_SIZE macro
Message-ID: <an19JYgofcj2-5sC@stanley.mountain>
References: <an1vaFk4UrhQPkSu@stanley.mountain>
 <20260813075529.153217-1-rishab.madhugiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813075529.153217-1-rishab.madhugiri@gmail.com>

On Thu, Aug 13, 2026 at 07:55:29AM +0000, Rishab Madhugiri wrote:
> Clean up loop bound calculation by replacing sizeof(bds_factors) /
> sizeof(struct bayer_ds_factor) with the ARRAY_SIZE() helper macro
> to improve readability and maintainability.
> 
> v2: Move loop increment to the same line as the for statement as requested.
> 
> Signed-off-by: Rishab Madhugiri <rishab.madhugiri@gmail.com>
> ---

Thanks, but the v2 has to go below, also best to wait a day between
resends.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

