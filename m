Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C042D3A7C
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 16:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782749997; cv=none; b=o7Fn7Y3p/Nn13aVZp3XO/VkLbb/eTvF2fQO0BoyMIvSe7rJ6wfNqZ20U1au1KUAmZhXXpKe39xvvYPU2wy8GZ/LXHoAb8IChiOP+FwDqSIm+i9l5YpfbRbtkOqtlPhlWw/I9Fw8AouHlDFkBXqZ7Di5ay1eg65Oz/pSnxGzLGsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782749997; c=relaxed/simple;
	bh=8kJlmWX0DcPls/y5kYXSMMtb2vwTKbR1/3EaOhL0E2M=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=pQYLpottop4ChglYihpk+maADJYBihX3Nz3CgDN8UnI4hR9ZJnlqDpadXqhPGuQU9fhrfRk5RmgF4dNtxi/4N8HuJwHOaOasBUTCrpLEGfr+iLsDLBXwsS5OCmttkFB6cZHp1v15Ee/kbJfcudY129FVv431JZbu21crylPGERY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3YFCVJs; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3YFCVJs"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-13810b63a1aso7910036c88.1
        for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 09:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782749995; x=1783354795; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kJlmWX0DcPls/y5kYXSMMtb2vwTKbR1/3EaOhL0E2M=;
        b=h3YFCVJslIc0nIawRHZur73LG4CLoYpZRcYXO0KqigyshQLDwhpCjHh0skGon0mPIh
         4yvYoE5oqFKTFdXhqPK2WZ13aPZGwuT9ggL/eLSGWT+bbY9es4b5Q0+H2iu8Wl22qqll
         NpWW7uCqMYLoH/0tPXIpHV0Th8p2aMhdeV9akTXRxJ4LSsISw6GLRPAfgSIcgsuSbM/2
         P7t+P1itu1OvLXOdYThdxV93xWtzwG5p5r6TxqaHHoYjdFDy6CPMdaY7/3EgG8xGNUhD
         zdS9al+uV4YZI7jGmOSxJWwAAo5JIZmPnMqooAGjzwoZiV4LxV/SVzRv2fSHFjJDbNJc
         idrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782749995; x=1783354795;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8kJlmWX0DcPls/y5kYXSMMtb2vwTKbR1/3EaOhL0E2M=;
        b=Reec7SEpJ5tWrMi7au3B/S1c0Pekq/p9nA2RKGSUpKC71D1PrhMern5ntW82Nt1a6e
         s5UKxaL16Xn8hr9NSdwZ1PuPj30pPTvJFY09Y4Nr1q5VVOljtFd+RvGHvU4qlKe0WGnY
         UZbK/zrhggJ8x66l+dE8arr6vmoSvbss6/Qm1mil8QXAXLh9+3/Sjn+vE6kSHpAZuj4v
         wULyNm2vY2K3/Ut947o3yKv1pbgFUbeXSSjaJFxUogzdGQ8EIAQUaKvBoclq/KT2LX5t
         qnuHaPYJomCce6x/G3okxX4bMUydAGUpIUFVdGW7gGmIi5JRWr+/Wsk0zsWDIXmqkzsV
         f7Ug==
X-Forwarded-Encrypted: i=1; AFNElJ9eNrnIyBfhU9S7FanAOrslCDP+4zfZx2CuVYynxvmbG7IfJstiS0JA+xmqwvLFBjRiwns7u+9z3FMAyXJv@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1ASc4IQNRLPLplKBFptNq+LmWggr9n/sVQ1UgPwSjCi+YzZL0
	KrNIVBuc0AMl3OdKJsbHEZt78tyD333Zha4RgebePnWsVacxU55WSKvz
X-Gm-Gg: AfdE7ckAGYDE6R2QacLKv4zoF5QPcpaWnXrdrY0D2Dg3fExV0a+NTShziUlPbBWhpjs
	bHANrec88NvMP/LRME+vNGhAIZjnIBM6D4ZUhx/z/xfmRJtwIOfTbBtXcx4VkVOliuX0giAi5SU
	ub6dFBwne+lAB1P5/OSLi8PZcJqTjlOD8Hu2dXsrs6Dil8+igBXs5XPJxLXQ1H0psUQnmfJfyJu
	yRzVRox/2UbvzO1hzUtBnludaUX26m2wJEXFBn8Cu5DMh9tnda2m2Yu0T9G9r5DnhJBUCYnvDT8
	ydClKehsr47hQCy/gedQsSK1ifIU92klQcbpT5zFE3mnU8XqdMK1VuueZ739f5+01jXn80FQ6Eh
	eXhsQJuZQv+Pay0mUPcEJftJE9uV3enXkvF6A3OTdYwWeMRISno/Ccqq+mOgTVpCuN5i3+Cy4L9
	GipK4u0qitIlxli6/BnNOgfnbbQZIrH/c7BLhw2WDfKqXdagdw0VAVo8dk9rJ0mziG8pItl7JOq
	v4b
X-Received: by 2002:a05:7022:41a4:b0:139:819b:f5b7 with SMTP id a92af1059eb24-13b2a1ac2bfmr68831c88.29.1782749995408;
        Mon, 29 Jun 2026 09:19:55 -0700 (PDT)
Received: from localhost ([45.64.226.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13a00324b3dsm9730982c88.1.2026.06.29.09.19.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 09:19:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 21:49:49 +0530
Message-Id: <DJLO4N0H5YYF.1GOPQDJ9QVG4A@gmail.com>
From: "Prashant Rahul" <prashantrahul23@gmail.com>
To: "Dan Carpenter" <error27@gmail.com>, "Prashant Rahul"
 <prashantrahul23@gmail.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Shuah Khan"
 <shuah@kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] staging: octeon: handle rx/tx initialization
 failures in probe
X-Mailer: aerc 0.21.0
References: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com> <20260628-staging-driver-octeon-panic-v1-4-fe8c34989254@gmail.com> <akIiVWOOfjbdM_G-@stanley.mountain>
In-Reply-To: <akIiVWOOfjbdM_G-@stanley.mountain>

On Mon Jun 29, 2026 at 1:14 PM IST, Dan Carpenter wrote:
> cvmx_pko_shutdown() has a built in call to
> cvmx_pko_disable() so why are we calling that separately?

Didn't realize cvmx_pko_shutdown did that. Will remove that. Also, Should
I remove the cvmx_pko_disable() call in the remove function in this patch
series? Or should I do that in a new patch?

> Also I feel like probe() should fail if alloc_netdev() fails
> or register_netdev(), but that's not introduced by this patch
> either.

My main goal with the patch series was to get rid of panic() calls in
some of the initialization error paths. I will look into properly handling
alloc_etherdev and register_netdev errors but in new patch(es).

regards,
Prashant Rahul
