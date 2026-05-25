Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F6532A3F3
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 17:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779731981; cv=none; b=Y+UOLhJ0qkAYR8Yr2EuIVK9lyjujdkGyU6nIe+NlcxRJNgytIPp5hRnocH3kw9llZuVai/Zuai6hrUBUlXZfmZ14K0RnQYlQWWPcEOcSVvxG3W25ieAJvmsAgcAr+U2dzvwxm9W0kjAKAodOX0lwlpiW4J8ifXpCaB7SwyT8vKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779731981; c=relaxed/simple;
	bh=S/xqFbtjDgfEvzk1IBW4diLflB5UVwH5c+jheCwIM9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vl24DHZuF3WnOhdjgQwaxqZd+WYUaiQ2bHkBUGzskPCdeIDU52FF7/RIAWep/YD+2lWPiXfyvUIioW/NkNW89rG12dQaulPw24FgIC8CoV7vPef3gK8yjNVrJv1iWmNVLpgo0Au1RCyEwWJbP3YB4qfVFdPPGf+YnwS8+MzGaww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pqJ1VvZS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqJ1VvZS"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49056b9f04aso26918135e9.0
        for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 10:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779731978; x=1780336778; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3GG8UhS31v7SJSxB8IIgM3kHMRCXi6lEwoONMAg/rE=;
        b=pqJ1VvZSdcidGgL4D4zOOR3b7AciWSUeSk4Q6yvcw3wKYdBD7IKY/h866J1bktWPn5
         r1TjR/icdqmi2rWvAaJJEwXc35nt88mimql1icCCiVeLzddt2yuSWsB7rELpy1MQI9xK
         sCwj8B4nix+LuuW8zMHrkXzxcKlsTs+swbei3qGK6BYlYyYDS8AIOOb+nrWWNt5C8XOm
         vImp0zWmKDFdkdklnRPizLWk/0z1mPGyIpHUg4HanFQLz9dBtW4MKThCXWF6wZ1Im+6R
         RvUyB9pqf/vClIyp2ZRPuJH03FILGM/bG6o2nQJtx4/U4epyZEoKGO3VFlcHOoS/km/m
         gvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779731978; x=1780336778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3GG8UhS31v7SJSxB8IIgM3kHMRCXi6lEwoONMAg/rE=;
        b=EhbasG+iPkDjphmSntFV48w5mQ7uRBVyV16tNgzU0Lqmg3L74Yv0vLMKotytIAkZ2f
         oA7VVLH88Pr0eFTLB4UjYgjYfHYjOUFRqt3JN63Do463yyqKh4tzyScr51UJPBL9/fyq
         CHJTNa2f1SJzUZ2UyI/jYh5YIx1iqtDXMnhew2usd55P/fEbEZoxm09xaRZ0f2IaWZpw
         4+LxNbMQkTZW6c1r3iEr9+IMGF2yUAD0zzj+iuDt6VH2ocScsfQfCrb813WpJvrOcmfv
         sZkyan1RdEWr4nTSZL+DWM9mtntz9PfapHuXJaoRefJTdS6JEiQMWNDttPB/PpFt1vQj
         hoGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/uzE7/PIH+FRznqLXjI/AAccH40tv6ltexC09DG89SKWbnqBxfkrSuOhXSXR9xn7wFjlKOqY3Tsah231e@lists.linux.dev
X-Gm-Message-State: AOJu0YzcSOeMQCu8jdoMWfnGSRNVp9uv8y7uLv+7gjcvTCdKw2fzxNCE
	r4mo0GsaiHhcqMEn0twJOQJlCJkdP0iOBm4rvFgWYtdOZlQdfXMNZh1z
X-Gm-Gg: Acq92OEN7bL3sv9kvUW1abmECQTgzZuKIhMzorwYqt9pycIaZzACQlG9w6anwMJjtFP
	Cyc4O9WZ/vjuSxdqF1XydiInSSFP+YhQTyb8QMKOrKAEuP4pRjJC/zUCJp1WfqtqMInMtTrVng2
	DyF4uzINIU2MCDbFQoRa1qjLApRlxbOxfU2xeC/Ej4ZwZOH3o2K5P8DYHAMCUMusKTalit8yT+b
	BVm4C42Ni8aQZDI0hOZjLGikpk/FzYDd+8klWbHNn+H9uYszaI54OxWBBEJ8pUZ9fOgO8lSCX0r
	J/S/yZIrGDaOBHGqntPPxlUQShZOgebayvkBDI1p1y3dgzIBGLxMcQqJTgeODz++h3cUegkZ2Qt
	3gteyHfMtTN1Zk+k0H6EFJN3chs8KEsJ+aLLcCJWNl907MxE/rsRTZL6l5wTaxL8v3HzF2IY/Mb
	CEmZ0Sa8SLac1orYIqOcWHlR0=
X-Received: by 2002:a05:600c:821a:b0:490:5cd8:d21c with SMTP id 5b1f17b1804b1-4905cd8d437mr138639585e9.14.1779731977764;
        Mon, 25 May 2026 10:59:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904527dbf3sm251200325e9.6.2026.05.25.10.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 10:59:37 -0700 (PDT)
Date: Mon, 25 May 2026 20:59:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ahmet Sezgin Duran <ahmet@sezginduran.net>
Cc: gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] staging: sm750fb: deduplicate fbinfo loop in
 suspend/resume
Message-ID: <ahSOBXtMU93GY7tL@stanley.mountain>
References: <20260523051509.166152-1-ahmet@sezginduran.net>
 <20260523051509.166152-6-ahmet@sezginduran.net>
 <ahQB8C1gTr7LF0FO@stanley.mountain>
 <86216e7d-7867-4041-892b-aafeb39781b8@sezginduran.net>
 <ahR1O_dF9XyVEmPo@stanley.mountain>
 <6a5de920-b246-4568-8c32-626a696c670a@sezginduran.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a5de920-b246-4568-8c32-626a696c670a@sezginduran.net>

On Mon, May 25, 2026 at 07:31:33PM +0300, Ahmet Sezgin Duran wrote:
> On 5/25/26 7:13 PM, Dan Carpenter wrote:
> 
> > 
> > I thought you were going to to abandon the ARRAY_SIZE(cdb) in v2.
> > 
> > regards,
> > dan carpenter
> > 
> 
> Which, I did:
> 
> (v2 link): https://lore.kernel.org/linux-staging/20260523153459.177488-1-ahmet@sezginduran.net/
> 

Ah, right.  Fair enough.

regards,
dan carpenter

