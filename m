Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1276035F188
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 10:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074576; cv=none; b=byRQzcYziohZF2aBXXDlcZcGxTaQyEpmBtuezu/KLMURymWq34U+6Wi7lnaD/HZse+zQ3LhZM9fv20KPEpt4n7/j4bytCYEn3jH6ZPzkp0QyJwf3MbmFDQQwHVwEjjPixztIvx4nNvrq1u+I/OKm9MgdkGzkGcBLuXMwNThZaDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074576; c=relaxed/simple;
	bh=kcFblZIautjwHK2Vy2J3AGSdQpVSXAg+nv5VyeOoIG0=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=ANJyxQvpFjHHrwqveZk4EoIj24VZ/+fRx7m5rVSS8Ks+D1x349GLITgUuolBS2MeX5FmsAaTdz2HpUuN0lD03W7XIfUO0AmPiO/5nLDjFca5UD9rEYPRCRwBdNRtRTRET7ifrxjKb00BTIMlz1lItUBUHidRf4DbZRpkihLYijo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKhnFpjQ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKhnFpjQ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b93698bb57aso760392066b.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 03:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074573; x=1776679373; darn=lists.linux.dev;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09a3O6d1W+1rc2kx9Pz8OV5bGy+ArYt+o+cPEdWVuHE=;
        b=jKhnFpjQc5kw6Je853B5acsmTCgcInzpqEuFm+1bj5uZyMsM5mWB63vQvr3Xw+U3jo
         6w3vNnLJ+T32CAb4edPExYdzQgEG+QWULlXBUsE42jEyAFBrCOeu8WoGw4GCceXcOsxP
         w/0eO7BQBj/XZJR4fyecXqNPTteMshYIfcElD6CwzuEBjLwcdkVZ+pL/C+jy048GUYc7
         f3BKbn25tMjXn2C0HMseOYOkkHWo8r2eKJMj5/YJnnWXwMeBKFsX7C+pipVXgblVDaRh
         1MlwQHJDpTzhcqdXb+WKm0+oHGNfPxedoeDleUwKzBaP0Qc0utVk6ANGoN982rpY+Y2I
         YGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074573; x=1776679373;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09a3O6d1W+1rc2kx9Pz8OV5bGy+ArYt+o+cPEdWVuHE=;
        b=YOjfu6F/LSZrYO9WNzLMCqUQAxfLvKdVoOlNkLjcyi9L82HUHfDmL7jmcODYNbpxuD
         dWGaZQ+wKb/BxMcAAwljySSubd4L03UE+6YQLX7OvOarCFxYNpMp5otaesOjZTJi1KLL
         7iXsJNTW1gQ4SfHIYN+/7Lfw24+Bge/A9BlY6UoEMuBONKT7JDLzYK0A2l/3p5SCwJhT
         11bA5h3JNVEsu5zowCJLP4DRXqlA0jwUbiKt32tOBi6KeldxM4xdu/A3ZQcG0DpCG2GA
         DlzmEbufifTg+7UVZFyoGaD7WafVzqWFCIVMJyiHMapowGKte1qxSJb5xOx4oztCdqoi
         Qp+w==
X-Forwarded-Encrypted: i=1; AFNElJ+Z/9YwFdNrJxly4Wf95hVw4hOt01wibJTY3glf9C0c5LaHPz7gxBtEtOyBQd5Ku7F3RmIYlV14SLhnAkhE@lists.linux.dev
X-Gm-Message-State: AOJu0YzdKHYhTklXll01Eg+7RufgcZAkhNIwh4PqBh8+g0QvGVZtYVNq
	TNycxlMMVrRO9XpxnmWqRkV57fMn6ux0DjGPEbp4H2e9cJF+q+jyc8Tc
X-Gm-Gg: AeBDieuxYbyN7U0IdNCgvjMOOauvkAl0lXISXuKFJmyMbAA/Y7/gjOpRhTT+UTgDdR1
	JCSrNHtmt7r9HafHISnS5+9MxCdTQPjsBFtiSw/sJchPWcyOFJ76o0n44tWsq/FUE07l88SliPI
	y3Ga+OnpzQXt5TKlVBOoHdjDzdkItbykJ0BvjQ/hVjq7W4Jq4XfTxdhSh+5n++4CBVMY5oq/Gn3
	T6t4EvKIrp5xpL1jL+4fPKZ7ShpVb0VABJbC9XaUA0jc9ZgCGf6OYoCTNJY9SJ5Q2/ZP1AZAM++
	4ZJ24R/AqX7+vqKjnAav0LlQXK3F3lj93B0MEaIqr3SKZPbUTpT71L4uhIVjBph7uGGnD+ht/zj
	JFvsdlonlwfX03omF4gEd89ydpC9i4JgYqSKpCCZ6s3fk9Hh6E81Kau3Y+NU4lLne/k7/EKCC4Y
	1fra552Ae7xgDREcijmH5RGMYdTo9Ta8ftA89Fvt91nd1cUQTJwSKg7PS8oybhAN0ADz4R4sTVG
	js9jLgltcgnLNC74BCGNZa+4PIqGJ6UcP10i432M0BS580V7hZq7XAEk/Nxwg==
X-Received: by 2002:a17:906:dc8e:b0:b9c:ba09:db7d with SMTP id a640c23a62f3a-b9d76d8e108mr590538266b.20.1776074573148;
        Mon, 13 Apr 2026 03:02:53 -0700 (PDT)
Received: from ahossu.localdomain ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a78sm298786666b.50.2026.04.13.03.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:02:52 -0700 (PDT)
Message-ID: <69dcbf4c.170a0220.3ae28e.ec02@mx.google.com>
Date: Mon, 13 Apr 2026 03:02:52 -0700 (PDT)
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, bingbu.cao@intel.com, mchehab@kernel.org, gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] staging: media: ipu7: fix double-free of pdata in error paths
In-Reply-To: <20260412205057.386856-5-hossu.alexandru@gmail.com>
References: <20260412205057.386856-5-hossu.alexandru@gmail.com>

On Mon, Apr 13, 2026, Dan Carpenter wrote:
> We need a Fixes tag.
>
> The put_device() frees isys_adev as well so this is a use after free.
>
>     ret = dev_err_probe(dev, PTR_ERR(isys_adev->mmu), ...
>     put_device();
>     return ret;

Good catch on the use-after-free in the return value. Will send v2 with:
- Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
- Save error code via ret = dev_err_probe() before put_device() in both
  ipu7_isys_init() and ipu7_psys_init(), then return ERR_PTR(ret)

Alexandru
