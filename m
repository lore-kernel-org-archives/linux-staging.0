Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AB54028E9
	for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156194; cv=none; b=SZkcyCYEWG5xDLVXM8OCSUZOsR6Tiq4p9/ZMThtRH+45TGtsFiDYh86u+SkDBQrYMZYCArq6c0C56c5aviFWXr/iSz2JxEBHeaR4n/MFly5CIQLy/eEcSKNzCUzI4Kj0dan4djfrFY9ihCeK+TfF/ZlmgWheOr6S31Gun+T82U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156194; c=relaxed/simple;
	bh=VrO0yBQQdwabPAskQcTlcwcJS7C62is/NjAMMY/StHU=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HnpwMxnz+zhVa1F7WTmfuF1MagzNYR/aM/P1rm+fhJvTrdSNf4aN++wpwaoCM29nXHxkk4Ze4XiM6mKAnc8HrBoX8MqPhHV5j5F5TTpuu5WPGcSTBqMXaP4P8IOrw2rTTQKjqrPK+N6tFNf5JOJJyYTk6G6B7ETpI6ohdCG5EEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atWMolqx; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atWMolqx"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84864086bfeso2498416b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 05:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785156192; x=1785760992; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OKrnHJ/zkmSszgdE5PzXsaOxi77PgVXbDJ7BJN7kTtE=;
        b=atWMolqxLV+EVoJDd2gn/HCfjLJCMqfbx6uQueMKwmQZgaahOSR4HXUPbuIlfdatZv
         5gHOcLH3z+5BYo2Q3KbTN2steKdlv5myE5wpxIwI0oHTcJGHmC6UnyOYhLTermExH/J7
         WQg1AeBB6spFjWvkbDVmmJaotgMXN0P+/oubo2wT34o31fGCs6Txtxn/UL/Eio/ughN3
         rtmiiqb9YEFPmU7eIQyWz1Sd8jnDGz8rMcoyrXi//ki8AmOxJfb+EALLnw0RSwLCBTy2
         EPZZf0P3gDPZOMncIkHRSdYeLUxMkZM2N4ERksP47i2BA7OZgnmgy/QeBda1urNI4Lzo
         R83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785156192; x=1785760992;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKrnHJ/zkmSszgdE5PzXsaOxi77PgVXbDJ7BJN7kTtE=;
        b=s+3byVES3hpJJm8nKQsNJ6joImAvCjcoTpLBtV/MOgtHqcPWjDi/17jqQ1fP1aNtgU
         uajlyc/qG1sgnn7W9cTBU5KvhXzNwZZ5rOBeKURN58gLY1HekEf7q4xXEZAGyerZxGA4
         XFuMlJpQEYiNPAb0awaBUuWInitWUdmLxwEis8pFvP/UQXGcgBWGgx2WZ19ENwIArjsr
         mcTdg2SluLAKF4U3aCJF90VIWVlV9NHk3hI1hLZJly9g8saeBF4mdyl1BZqcG4+HtBPP
         rcYIAlJArQNvwHpVJlqGvSOybB71yrY+zy0iY75+wV2o2fD+2eVUXDoM4h1D67ut4738
         50oQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3crNryECkgzwU9ZLcNNO5Pfv03HnpbSVZbR4nDUG/0e5NyYAb89g/9Lcp3bcfmelxf+NFOTeI0bKaSu9k@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu7AADh9pWv9Z/wOyG6c0z7Hf5VLs4xd2mKCyDRgIMia/Pp6n0
	964DvX+unP0DLi0WdYWbfyTldtr9lish74VFrr1FSZNgf+d5N4J1CKuS
X-Gm-Gg: AR+sD12DJthilEAxCTtAwYI168ca+LCNCLNngdkl2+AgzOzkXTOsUX8qM5ken0T/2YZ
	IL0DCV9q7/Dd+eVz1NBMyOvUoyrOSBU01ao5MLSn2XnedltKtItT55bp1fZDjtZwF74mxKrtLqy
	1pOD1WvkQjeBObTUcchFy1dGEgGKYs5El2CJqo/DNuZ6uRFEi50MsGMjfhRhB36g4Mbc3xZg/T7
	SwH9c2J3gWksQVK8m/DpgQsnY3IE807Z4Cvlrf02MeK5+5sZmV5/YQ82i1RQQwWbn1Af5zrRjqh
	ifPzBJaSeR2UaOu+plkBS8kuU4uCku/UrZ/3PlWwwW5P7AT33U5E0225AH/EYtF/P/qak4HQUTd
	TXNVdCjhhvFQQgs/ThyFWBhdNLAEUTooVpjxgCboeaUCHL7SA+vmWiyyLTQLP9nqj5i0eme3TQb
	ihM7fFf2Y7
X-Received: by 2002:a05:6a00:1f12:b0:848:2d1d:836f with SMTP id d2e1a72fcca58-84e59449d00mr6615290b3a.28.1785156192339;
        Mon, 27 Jul 2026 05:43:12 -0700 (PDT)
Received: from luca_send.eml ([101.9.192.104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5341d68asm2992595b3a.46.2026.07.27.05.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:43:12 -0700 (PDT)
Message-ID: <20260727204307.24353.alvinhuang0603@gmail.com>
Date: Mon, 27 Jul 2026 20:43:07 +0800
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: tegra-video: vi: fix probe failure on skipped last port
In-Reply-To: <20260707152425.571254-1-alvinhuang0603@gmail.com>
References: <20260707152425.571254-1-alvinhuang0603@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon Jul 27, 2026 at 1:10 PM CEST, Luca Ceresoli wrote:
> Do you have a real use case where ths failure happens?

No, I found it by reading the code.  I went back and checked the in-tree
tegra DTs that have vi ports: lg-x3 (p880), nexus7-grouper and
asus-transformer all link the port through to a CSI channel endpoint with
data-lanes, which parses fine, and asus-tf600t has no remote-endpoint so
it skips on the !parent path, which leaves ret alone.  So no in-tree board
hits this.

> Also, mixing two different return values may solve a bug but makes for more
> intricated. I'd rather second a fix based on moving the whole foreach loop
> body into a subfunction, and make the foreach loop body as simple as
> calling the subfunction and handling returned errors. This would fix the
> code making it more readbale.

Agreed.  This one was already committed to media.git/next on Jul 18
though, so I would rather send the subfunction split as a cleanup on top
than respin it, which also keeps the stable backport small.  I have that
version building here and can post it.

If you would rather have the committed patch dropped and replaced by a v2
with the refactor, say so and I will send that instead.

Thanks,
Hao-Qun
