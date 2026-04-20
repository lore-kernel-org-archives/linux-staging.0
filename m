Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8188338553D
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 07:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670972; cv=none; b=HXANObe/F7V8sDZSDA9conr2XkevSTl7DjZqEuxQsfzN/cwFrh94d9EelmFtiD2zjYnux9mwZI1f13SxTns4aQ/H/OhjUYo5pUWqDonrW5WDtSYiVf5puWAyFZeFDKSEMN88JpN+LVv+Ry6erGaq8FydoEYpIgBuky1EMJZEOIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670972; c=relaxed/simple;
	bh=V8o6tIOPJB70Q+H7F0EhswID0SRlwm59Gc3fNDk0zuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXbBz7A1Qhu6fALGvpQJumod8bAeSqbNq8hU4tfmRujkbzfo+5Mb5457NhbjNg/cWAnfneTJiRcZv0yIWjDTnqlO0lqswwihlCYnjkdkxx/0CywHOvuAMxcsmV6rMB4iacgo9KeExJzi/D1d5hBA70pgGg8rryWuE5TOOPH0VlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBBMF4OD; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBBMF4OD"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82d0b68837aso1692530b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 00:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776670970; x=1777275770; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8o6tIOPJB70Q+H7F0EhswID0SRlwm59Gc3fNDk0zuo=;
        b=fBBMF4ODsvlW9zYrf9iJ8+QQukxCwx4QqeQUB2i/zYKx2lPkBD/XqiL2Otj3lEfQva
         9ClR2qzdukDQTrMcJgIzAX5FczxxIe6y2JGarnnBLtnoreLH3Jqlwr3NX7RZ95loVoCN
         sMfuqgoRJ62jQL9R86NjvxEuivbwLNvWBezXFSkWoNf1bdK39Az/G/HDY9xX69Mfol81
         XtPZk4RIa4GEwRoT8Y0PACE28Kl6lkYYGsn+5sThDJB1nMkPKw9AL7n9Kue/TTbrwRvK
         qdouCMzmywL6UVqsd5Q0TkPTbEZblCRBHcl6E1fPr/WK4qlpFUbVynyGSIX+FrbyQmyI
         V3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670970; x=1777275770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V8o6tIOPJB70Q+H7F0EhswID0SRlwm59Gc3fNDk0zuo=;
        b=qKSP+iXzOelktbphJeUyPZ2E/Rha0imvX7bKGu05PzcY+Wkx5cPWETt9Gj3PQCk5Dn
         t21qb72c1kqay2qICv6tg8jETJf01X2mM3a/qpagTF0ZTSwp1roKe3eD9RqS70yvulWk
         EZs4ktb00uLkrsPx4TV5fj3fos8njCeD8JUcchH5Tsq1J2gASjzxY0twCmXC0paYOnLq
         GJ3wQIGdluc8suSKCT2VH3JWX+5GY/riGdE0JO4Th37V0kKszuEag0wNLaP8MGvxQjY7
         8BlPQwnaKut9STh+LvTEuwUDyVWcdxa0lTpQIqYOKekg0C+IjZEn+lf1KOnqp3DmMWR6
         wbsg==
X-Forwarded-Encrypted: i=1; AFNElJ9wE5zHyX/o56EF+lKg6YtJkGoZTeVOc3RzvlqHSj8TpCBx3eE1VC7ohkoVrleobsPa6lXhVREdks2X3Im9@lists.linux.dev
X-Gm-Message-State: AOJu0YxxbWTMEpgNtj0y9jIgCY5x0ZCkAue5v4cqq9JU0uzOYDtQeCit
	hrhwvwTAtE/ECPlxJHwz4v4A38zvtaDcH+1ZkRpNHOuD6TGoRrc49TYF
X-Gm-Gg: AeBDietMVMGeiR7T0wYR+zyk11CfF4LNTjkqB6YZl0NAKqRWuL/DoZn+wbxjsbBx1qq
	X2H0hXfZhYJP3O0maC1FO3dHGerRsB4++N2d27fXxMR6s2aLyGp+YT0492Rca3ocQcPhBJNHIFC
	nej8eOAJDEv8mBl1NmMnX2KkHgSMBn1fiAeG7R0cA6/QBocQjUODW67UaBWVXRM8xXuyr4UmWUn
	+ZSzeBw932IQVPsWhnVRxEGd71hdOdKfAFSeVDb22yNFnrccshzoiUtry6bWPWk7NAKbIjscVup
	oljXFFrobF0NBTTNPXC4SKhmTcBNnrpcrxk+1xqLijCjmrylXIrBN0OQuHWHdUETr0oqloVpL1E
	5EASWTv9i2xLMlSSBR8UZLkVw8BwA5nj41qVFxg4xoKnm8ksaBDpCmP+TfKC1xOvzF1M510Hp40
	auV8zOZ0vrEMbF5mtAAoiqpTyjwql+3qB8wd1wpZOEWzJPqmDLzAd1xZhAmA13zVU=
X-Received: by 2002:a05:6a00:1f09:b0:82f:5576:2860 with SMTP id d2e1a72fcca58-82f8c7ded1dmr12538412b3a.9.1776670969763;
        Mon, 20 Apr 2026 00:42:49 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9819e5sm10137292b3a.2.2026.04.20.00.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:42:49 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: andy.shevchenko@gmail.com
Cc: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: csi2: Fix DPCM decompression for source pad format
Date: Mon, 20 Apr 2026 13:12:35 +0530
Message-ID: <20260420074235.106713-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAHp75VfxwFW3nWLjKS6TXPHYJsqPJWB6G_M08t6eTkcodOj7zA@mail.gmail.com>
References: <CAHp75VfxwFW3nWLjKS6TXPHYJsqPJWB6G_M08t6eTkcodOj7zA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Apr 20, 2026 at 09:46:39AM +0300, Andy Shevchenko wrote:
> No, please spend your time first on learning the process. When sending
> patches like this, do not rush with the new versions, keep at least
> 24h distance between them.

Thank you for the guidance. I will follow the 24h interval before sending the next version.

> Also, drop the "staging:" prefix from the Subject.

Understood, I will remove the "staging:" prefix in v3.

Regards,
Debjeet Banerjee
