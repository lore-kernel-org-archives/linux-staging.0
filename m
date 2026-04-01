Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86F739A05C
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039625; cv=none; b=kdwTuavXA+6GQwikMLpwCGlH/7uf3MfV/6AvuO4mzj6Db9o7G+D0imRza6+fIzf4PR+O7bXTijCIlFwWr6GMts70ILIeAnyZBR6+lWaEXW1scjHPekO20N3bZKJ9gqv+h24q102+yyE3dGaYNvXHAseeHBDk9vghiswxu5/nujs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039625; c=relaxed/simple;
	bh=zGPlVUHCjZoYfFsFOzXJv3t5Gc+5g2Akc/eChqspeEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U65+8E2iS3m/sW6kjE8Hss2fMXwZI1wVFGSW4m2+iv3piv6n10Xd16OvLjSaLgkCNVbL9fy4hUfMPMDvsphs7Edw9xZ3JyrfB4Bt0gyPLdLmrt55TlqPJGNv88zvUpHugInN64BQ19rQTyqoL99QUm8MqElQBCUM4JvuEmqpyUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1UsPgSm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1UsPgSm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so80306295e9.3
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 03:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775039622; x=1775644422; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G34kEBdYg+ZgvngYa+7wgYAY1nzSK95X4oNiuiiqskA=;
        b=N1UsPgSm/eGy7PuSXJOtYPGzRMpnihdwCulD+rCQ9PHHjrb3wYPGw8iPm8gtYGppjE
         v0h4h+iGLzayAiBB8oc1eT4YM/NXfJp6YahYi5wLaVSzj6/5ctmaEeFAItEt8mFxUTWC
         9gSBp5SVUtJpvNwOqg99fK9quQ8uiYdpi+UzcAxUj6hIRNpb4Ce1cOW8e1mJ3Nx+4aJa
         8+8nb8gp+W//sNPZBlUDhtTubOrlISVWwmmvU+9gjuambQUEHTXZoCwsh8FHHOzyCNZ9
         ow2GrInlA5tzPzbqrUxsXSeFo327ihTun4yZltlN99yCT5vBiDsafltEsXpMKlP6l/wa
         r5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039622; x=1775644422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G34kEBdYg+ZgvngYa+7wgYAY1nzSK95X4oNiuiiqskA=;
        b=A0D05GIxl4Si3duKxKFbX3v4JWtWSKjWTHc+c9jy66ivH4uhByGUv1sfW1IO8LcjWi
         dmnRQLngy5aiPkK46+lqVUL6IhLzBxmgJ85HOk6vzuSfu+IaeE2izAtVjT1lKom32ByX
         bTiznXC8iK2g0uHuzziW9UQzqoWSM2XiNXf3Dc4pRjjHZiUk6kL7HQfdb3UzNOwHDteb
         7I2G2aeR+xgFqeM8xb6XvjYC57Edj3CX7YkIedQP8NtAwC/DBgFcTqc91PppaIyHX0RZ
         opSmaa26QHgQloEc9pc+fqeEJwTwjbhrjwivpomjAMiT2uTlD7vM3kMiIKwGZWRbwf3r
         MgvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCTZ7a8EYGUi3B/b6CyA9HNUDVOTIuW4UNLDZQbLxAr+Pcqr3IeTY/4c7VFoPMKEwE0pFjfcMM04Hd9OGe@lists.linux.dev
X-Gm-Message-State: AOJu0YxOjC3VWUykpdbLP9tSqHlhVkhaVTfyZ1qJaaUbjIjTdUcgk+aD
	5MTTZ6GKl8kCssRbia46G0FcgIiXQ9/6aXgS+LvIKs5OgIme1jEfxoNV
X-Gm-Gg: ATEYQzz5yTOm4LBJCyT46VbbFXqneS4h3zXPax26HYCzoJn882lvp+vHfoz6BEN657Y
	gnfN35JE1Xvp2AsVOHNa1CABkth8DRzDVZ3eibggLZQvoYOFPDT4QdPjDcr7MZBWXIn7rKugrL6
	1qtvfG3uoftE7qlM4YDy6rVJLDQINzEnTmXJqMVwIfblzYzo0f/f2LxNkcFWvWuo4x1G1DWFccv
	nRafcCmv9Th5oCrm96qlStvmr68sczbR+pwSHOiqfewyvv/DchD23jsLXR1ABNJ2XagT7B+L5k7
	2b8zUkWun4uZcLWasBftaZBEFdzuIb5X0Tg1QZdwwsMLyb9+NoVV3Sg9pS9CwTtxBg5lzaiMcAo
	Bc5f1z4APGQqlyiz/nx0zrF1mLQXdteg8zjHRNwCDBayo9nO/xmct47IiX9BFOwUxDPNtWmRzZV
	gzrtAk/v7y7dJ/4SjT03E=
X-Received: by 2002:a05:600c:8184:b0:488:7ff6:1f75 with SMTP id 5b1f17b1804b1-488835904c5mr48079095e9.21.1775039622071;
        Wed, 01 Apr 2026 03:33:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e72da6csm211696485e9.0.2026.04.01.03.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:33:41 -0700 (PDT)
Date: Wed, 1 Apr 2026 13:33:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: omer.e.idrissi@gmail.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/5] rtw_sdio_if1_init cleanup and small logic tweak
Message-ID: <acz0ghWV_WxNlcM3@stanley.mountain>
References: <272CEB11-DD9C-43BE-B47D-49F8BE1A0392@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <272CEB11-DD9C-43BE-B47D-49F8BE1A0392@linux.dev>

On Wed, Apr 01, 2026 at 12:17:41PM +0200, Luka Gejak wrote:
> Hi Omer,
> Thank you for submitting this patch series. I like the idea, however
> during my review I have found that there are several issues.
> 
> Patch 1:
> While the patch makes it visually cleaner, this patch introduces a 
> significant risk of a kernel panic. struct net_device *pnetdev; is 
> declared on the stack but not initialized to NULL. If the function 
> fails early, the execution jumps to the free_adapter label. The logic 
> then evaluates if (pnetdev). Since pnetdev contains uninitialized 
> stack garbage, this check will likely evaluate to true, causing the 
> kernel to attempt rtw_free_netdev() on a random memory address.

That's not true.

regards,
dan carpenter

