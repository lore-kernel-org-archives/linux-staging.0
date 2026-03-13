Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A369D30100D
	for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 03:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773372035; cv=none; b=r2A7cBa8ohyN2vk9Vcq9F6RiaWllQCv1NUIDfVfkHMHCN1h0NUidHDIlOFQ+KKmRxIDUoEd0/oMfL1p8W7bPh2yoIoyI0Ox/BqnVonEezIvIfJSO9U2oFRicBu6BdHgBjMNls23L9CI2E9HJGTeMneXxbNR6Cloz7gLW3hI58mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773372035; c=relaxed/simple;
	bh=CxJ1+EklHmj6DaIwp7jy42WmPH5dFEOEZ7jC4vFb+S8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ZSwqOUSKbN3g6kcIK36v3vfRaSbS+l22SUllbKNRAR8DRJbAAeuhk4o7RAsfj7jrYysqfKNiTwESllPwlgN9o1OKKpSBvvfTWRLRFxoTjfBwE4/w3OpfGgiQ6B7DuSX0z/KSC97aiFlGuVoaP3gpJiu2pjwwni8AvXtjzIA4VIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCtc+y51; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCtc+y51"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-793fdbb8d3aso18119467b3.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 20:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773372034; x=1773976834; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxJ1+EklHmj6DaIwp7jy42WmPH5dFEOEZ7jC4vFb+S8=;
        b=aCtc+y514wyRLPUxl0+dkPTVw/r9KSMuvgIqpS5dN+waDCgJu4cF3HFutqBJG58wZF
         xKb+xKmI4IegU4aXRjKxdnl8lkfolwysOntYnV6oifKoz2v1DYqTI9wbZbfCA3eA/NP2
         GIsiJVe4fYy1KTBgx7iNyprTJmDTj8mMXC267FPhh8EEAtsjBRNRNSJcc7th+ceKsIoe
         f1Y7540cCozZfF7hxeDmNL9ohjDlgT+VII7FCsq+LzG7HSz0Mq0fTneY12ysv408gbtC
         W3d6JcD44p8BijJaKx+j14PxX2ImvMrse2HFvDATrgeKV3idapVkgSe9bCXV8yZgvhHu
         ASzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773372034; x=1773976834;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CxJ1+EklHmj6DaIwp7jy42WmPH5dFEOEZ7jC4vFb+S8=;
        b=N7OwflO0EBFphLMmLGzk+Dbt5mxKEqAXcffANLejUV2dmJk7n5WVoKw/I9EifvA7JB
         ffxSjY2Otsf5G7SAbavjvPyCMBuRB/GsiTcYW+RGxX06oIdSYaHNuk8LYJ60oMCB3fkI
         ZbQI2R8eGTSkbM6c+aNcKvg+zZmHBAc1WL95POecq61EGMwjJTbtrAFCo6zCkGQLRQ81
         dihrlvxaigWI2IakTWzTCdsWYU++MMFPVz9bfUMg52Dv8BJUp9QdKbXlga4ug9CJwAlZ
         mbu42IduF5+ZjaG+ZCOCBPOab4+KzE988hiKbE9bFQkRX/PyeLlzM6GmigeqAkuQfdMp
         ZEJA==
X-Forwarded-Encrypted: i=1; AJvYcCVgsgvlq8zaejNKBVVzoRigNRCiVDUzdymT1iXV14UJIqT8aSc8lRFMHyRthmtqPaYrYpqEbRaGMXtzKFEM@lists.linux.dev
X-Gm-Message-State: AOJu0YzrlwdQJSm4kNYzH/vNWSdNz4lrxhdb0tw3YcHGo+pxDjBzWoNn
	Whrtf5sIgzCkiQVcTAMms1pXiF3O1EhokX1Z1SY9saISyW2HTT/5+mwa
X-Gm-Gg: ATEYQzxV3p7j7mtjVjuk7KLCxMcuCMvL5jgMedq0H0FXEQpvNcrs3E89KZ39ao/MEN4
	dqOFst6UF7Ld5rE7YwzoGaaPxT/LP90EqR5R4ZNG/+SRm3MrTgsojc/ncoGjHapOfrRZIxO7ABv
	42cpShHZWmo+LFTIMMfQ+myF2QKAg+fM1IoZ6CZlQGmS8/yii8xhwbCNYgw68dCLjtqK7O2FOH1
	EVrCiSKc1P3J+XLBUbn+bAT1/RaMuJEZ+K7tCpPLY5CNBzenKB6Gw+XQJXoi44GFMOX0J0rNfhl
	iqT/oyef6PYUBR7ZNvrUyhhEDY823WEuJhsUO7x7spn0gqOH6Fhkb4lpIOxsR+xI4fzqk7KWmQi
	4xmaNa32FNctxQA3HQQdOh+m49mTyH3pxRmUeZm0aSeyhvTidYsF6JAlStceuDF3m81bQpvKl8y
	z//19LMGMANFBLFQGG8tCn/x7M7IGWXI/c5vFo0YTGvFYgpun84hE0zqXio92YKJMBmJH2wS4hK
	S6D5Qdh94hkeII6SC2QLKCK3UQFt+YKn1ER69FkCnjrzlKOiOPG3N3Q7YSyIqknit7hFweMi+8=
X-Received: by 2002:a05:690c:958:b0:798:6a34:74c3 with SMTP id 00721157ae682-79a1c08d583mr16918007b3.8.1773372033709;
        Thu, 12 Mar 2026 20:20:33 -0700 (PDT)
Received: from localhost ([2600:1005:b11d:678c:f9d3:787a:e3f1:8262])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65b63601sm379000d50.18.2026.03.12.20.20.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 20:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 22:20:31 -0500
Message-Id: <DH1BX4JYF52G.22KZT2T2AXSHX@gmail.com>
Cc: <straube.linux@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: add blank lines after variable
 declarations
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Oskar Ray-Frayssinet" <rayfraytech@gmail.com>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260312194112.1876-1-rayfraytech@gmail.com>
In-Reply-To: <20260312194112.1876-1-rayfraytech@gmail.com>

On Thu Mar 12, 2026 at 2:41 PM CDT, Oskar Ray-Frayssinet wrote:
> Add missing blank lines after variable declarations throughout the
> rtl8723bs driver to comply with kernel coding style.
>
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---

This doesn't apply to staging-next.

Thanks,

ET
