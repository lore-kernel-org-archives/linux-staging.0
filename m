Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A53126B971
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 09:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663319; cv=none; b=W8du+wYYz4XR2+J1lHu8+COb9zDoUl2B2bazIl7hTnz/aIeW5XNfl/vhGaiZJ9aNrNq6lB0SBE7aQmVr+uFG5Kk/i9hdfkNnIkAnGUmKXhcUMp7qILh6xDJloK0BbLIxmgk4yPsuYjgWNFnTZvcB4FNR2MrcdpEHwJz4fQ4UIa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663319; c=relaxed/simple;
	bh=+T/9GAZRXXf4tKfjYKcvIMTqWuLPCWRh1s1jhkiF/40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PtTUbgHHmL07ymb73o5JaAlnAn4tSfPNakQ5KduRwgg+M1C5HEdLIVwpyFalkqEUxFfezRrwZfVPgiK/XzDPgvIRiyR5RM9c1+w6fLUbQgtXGMMOpe0HxQAlRPbDLfS1+7dWpGR2wfjnkDNgG4Q4J+F3bUpz8Z4hpjN8HORQZxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0QaQxTw; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0QaQxTw"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bd11a3729e8so421726466b.0
        for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 02:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778663316; x=1779268116; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+T/9GAZRXXf4tKfjYKcvIMTqWuLPCWRh1s1jhkiF/40=;
        b=l0QaQxTwmL+hW7WqB9VpamOIDZ4ewXevDLo+xWZdzH3SKv17WO95LciyBN4L1pKsBU
         VLq6lR+OAldceOB1xWLifpKcYmRAEwP+XbLi8969ghXjzWNsvMgsl5RDXPZUq5RnCmps
         YZsB5QDyfbR6OKNtEEIdos9T2tLZIjFy2Dy7JOK8Vt4JT4egzfG3fsNgJjan0IpY95pG
         7Rx0zobBzUQGLVaxNMYHRyB2uDQ1Rm2SFiC3d81LQAsHPVxbRW9GRze7h2Jb4ITd0Nj+
         xoVNO9hoq+/cAjNv8dt9GBsjnoAZS04J8eQOf6HL5yWCGCMbp2uEbp18CcPRLC02gDcJ
         3NMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663316; x=1779268116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+T/9GAZRXXf4tKfjYKcvIMTqWuLPCWRh1s1jhkiF/40=;
        b=N1GosWUvcuz/SAieIHY8Ier0ci4zaTh0bg8m/kSuyvpnLuDD4TLlJY159+BhFAhuH4
         UE7K87E7y+BcH4scBufbxuF692gIRZcXpXqV7AWpbkXKRD2VGACV6rmd6p4BZAb1QLhn
         cjkkZA9H+8fNZIjPmvdcrBUehmxMNy3SNlovoYK11Ygc7JkTK8EsQsO7rgZVSXk4F3Ey
         vvH7z7AZi/a+ZX7XAfYTt3Bv6gDtB2xWomMWk/g2WD8qMVHJlo3ckmlWO929Z4IBXg1g
         ANMfYONkM94TOn2vVA9bqdfdSTOWFGvgiBrvaxJOlguc+iblzdKhI7y5mTiEsXsftIHt
         4DTw==
X-Gm-Message-State: AOJu0YyWWGxWJHTe/dJpR1+lBWB1PPwmTv2203gIJkJOkFIrNuq4bQ99
	FlMWODlTL8M91ePsnu4NlA3fKwkUi9005ZfYHoR/hMAVgnAmqF25bEZwz7PO5MvxIcE=
X-Gm-Gg: Acq92OEhKX//oNKJfLEM+oioDw81nN4V4djaVn1BVEOXjh2IRq/YgnOPMzlozUSpveX
	KAWg1cYxHsWdI7UKJJNz4fabWfjzIW4qmRv7IKy5GRRY2CPFeCRubMh8zt8cUVbB4SgSgWfW1kL
	CxuHz8/OsLDHDEyr2xFfpT6qHHS70dOFCPa+8WeWiV4erKUOPqF//ct8hG5UqpbB+JhTH4Hzynk
	Zx6gdnOOMcSPlRX3/EQMv7UC1qdXic43A8IA312e5IGVIKSU3O35oYxP7gak7Rj10bnyosZb5Iw
	L5czKHRXXzM1CPjXVbeG+pb1tv7KEVHQKMoLepJ6EmKn95lJXCNxULSFA8S6U9sSNcN83jWgFEV
	FacvFDuqQMq/tPYyJljgHasQJlICDTJCT9rW9SI+mmedi3OZprltf1W3g97ieMcZmH0WzwzrzJf
	eTIWDhCHlISCOiBV2qO/wUKgJ7wUvPQK0Qco0sBQ==
X-Received: by 2002:a17:907:74c:b0:bd4:4f74:5ec5 with SMTP id a640c23a62f3a-bd44f747e03mr57745366b.8.1778663316160;
        Wed, 13 May 2026 02:08:36 -0700 (PDT)
Received: from gmail.com ([212.75.105.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcaf0660dbbsm796744366b.2.2026.05.13.02.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:08:35 -0700 (PDT)
Date: Wed, 13 May 2026 11:08:33 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 0/2] media: atomisp: clean up ISP configuration path
Message-ID: <agQ-_RceeEwo-50z@gmail.com>
References: <20260405093051.515222-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405093051.515222-1-azpijr@gmail.com>

On Sun, Apr 05, 2026 at 11:30:42AM +0200, Jose A. Perez de Azpillaga wrote:
> NOT TESTED, REVIEW CAREFULLY.
>
> This series cleans up technical debt in the ISP configuration path of
> the AtomISP driver.
>
> Resolves a long-standing FIXME by gating ref and TNR frame configuration
> behind the ISP feature flags that already govern their allocation,
> rather than unconditionally attempting to use frames that may not have
> been built into the pipeline, and removes a duplicate call that
> overwrites the same cached state with identical values.

hi,

just a gentle ping for this series. please let me know if there's
anything that I should do.

regards,

--
jose a. p-a
