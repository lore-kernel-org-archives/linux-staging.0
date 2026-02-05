Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F02B35294C
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 06:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770272799; cv=pass; b=f2UzGPvDN+izHO1VX+Ix1RpOMk7sUYluSAFeCrne7nU0yZSXr8zWIT8QSPOjNVap1ru8vGWMT/2V37WPl97pSCtG6XoiiLXJqOUmjO5Pk5fV4unAMYkgfCEhPzqqnHXxScAg94gGIHBpHQuSYhrtqU9Iy4L/kH8WCbFoGgPXpe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770272799; c=relaxed/simple;
	bh=HOndQQwWNEw2QRo4yx4D5ZgI/DczJrA9y1fkZPDQ/gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VnGNs+a7QD3bhEadAeyELjNRePLfzVUqLKdFIRUABfMdQVQt/fs+WG4BcxgXFjA69KvAyZOGOZs7++u8nScCjQXsRsCRDcsu9bEUE8fqReqiAHOoA8+0krQYpRaUSsT7xpzTZ2o43iOttVPV7auBzlYbl2S8gYYl+dl23txtyJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8qYug2E; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8qYug2E"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-658b7d13f09so977148a12.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 22:26:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770272798; cv=none;
        d=google.com; s=arc-20240605;
        b=E00CDQaL+cUJ+9OvsCqaMxxuA7+VHCydiQ7mNkwV3L8N280cVmS1wRrtwO+oQm66D/
         WvZxhpwVHWSvrXv8K+dT99zjgMrb3fUtgdqQyVlBgwyc0sQ1Y8PG7A/tILMn+w23r8aS
         b+4wPe3jolDKBw500q2CTWKb1ijPtUGLw3dQCjXjgEwlXPMFbvSLKSJPXkPv54jfXHMB
         choIr+Wkegax3yPPBoIvCImQg+KahAngBcOJSMrMSHJ83wn7baVW8zENZo7DIYD5oHea
         /hK+5QbXxMSh91PZb5SbLHodsuoadOVqSwRIRov+e7W9xzwoF1RKMfUZNt44W8u1iOoE
         KLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HOndQQwWNEw2QRo4yx4D5ZgI/DczJrA9y1fkZPDQ/gc=;
        fh=wlShwc2R8RokHmJOhfWzI5WCq2wgcRlgR0lO5WoU37M=;
        b=CIATaO/T/6X88gfqJCxTR0RVl8/LmAoG6pScXR6LiyLo+QL99rP+51+hJpOtglLgiQ
         g7w0rT9/kt/MD/BLn6HhmSICFU0ncrH/i3s8iqys4L5jdg3HArBv2AjHFCZ5187K4Ekx
         yPAOIrs+EqfF1e00bb2sn85fjSJLBWqi7lCBNjdy7PeoEgJ/FTytDZuedxHM0u5allhE
         DzZHG5V2+2NTUT8qOGe3QupUQ8qgHCq8WRfTVVOH6gYZtK6W2qbwJmK359nLleGurMjB
         T9KqIOUmDJ64TgOIfE/JXexD+F8OarbSeiM21VlEH119Wh3vzHqAHCJiycAoksPcZTkS
         F91w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770272798; x=1770877598; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOndQQwWNEw2QRo4yx4D5ZgI/DczJrA9y1fkZPDQ/gc=;
        b=K8qYug2EKhAXBRS7gCouhxr8zSxKoN46bc/XB0nck/a/m1IURH7uzC6oS+DCnp+ylG
         Lu5yzVm/rpa8x94KdKJ9J5ZMHJzEG27KlZm2Gq3Mvlm9ocH4VcbdF13exR6uz67Xivcb
         Zgkz/5w+ZrdPkCsKPpqEtDmlhepJtQSz145Zza42mcsotXS2W60okTW5ZpGCUB8HtkmH
         K4z4UZ75uQVs6djZp8GCBLd/OnfRojXKO++oLrhltK4t/7KRNyybTqEI7sULcHVkQKnS
         HiOkwXIzyimAbazr4kxdVLQAFEtw+JpblYY8TX85ItMS+sfqOYlx6ndXHLV7qjIb5LX7
         kyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770272798; x=1770877598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HOndQQwWNEw2QRo4yx4D5ZgI/DczJrA9y1fkZPDQ/gc=;
        b=Iopnza+lanPjmVBZRTkEOiEAhyQY55NbvHIyxvSLedke/ra0D6v9kpICD7f0w+Ax1U
         QaGrLrefxSjV2J7eAKaxSkd3sMAyfoDcRiWW9UePzRkq/N/eOZNkSXNxZVtoslqGpZIN
         WBMkU/8cHQ8Ioaw7Dp6IC7lpGpWJaBspBXMka/BXsqRwxA/YGhcneHF0ZTCNfB6YQAB1
         YmGhGUrKjh0Kne9gG1f2Cmui91uaxf1/7VX9yxoO+qcnTDeknsKI3d61zOkfeCBWVMrU
         KwE2UsvAWlb6Ic5csaGu3jNWqyAY2hEPo0L0hQeR/28liTNmuZFEJ05U8qSEI/v1DxMp
         d0AA==
X-Forwarded-Encrypted: i=1; AJvYcCWM73mt/GrQVFKJXYUgAZ2m+NAd7bmqahonmSoBX+YEu46MFlGNaZKg3NenjdwgFGTo6ybYBCUN41LpEX6+@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0n+i92XmBK7SF5bGIh/tJ6lRi8IVjGqSznwJ4+PBBsMOGphk/
	YVcUraye3HVZ86PcFKUtQEoIK5x7cMx3bFT/HHJzlGCayU83JgT/Wp0z8uDft4J5ul4vjBlUzJS
	SXMUxL0Og/gp3P+fFRVj2IkySkNHD37M=
X-Gm-Gg: AZuq6aKSYbTtt5TRzfPdpQ3ZHxfXha4SHB53CqR0ChXlaOc98J1gH3Wui8uNF4n5lF1
	0btuVnHdAPeWTFhIPSQnjyQhAIexMSXytDDI+Y/zOYPQtlbAAoA7+pOm9cre91xsIp6pD3dtzDS
	oDVsOAC9xu8Pt1Pb5kA9ImlHWs2wN+9ueR1gpV+gKUkZbT3gtuzg3DgfFlLFz0SNArM/R/5qzLh
	ObYFENGAcCUSDGlyrH/syYpaFiDEL5k7OReZlcO6cDdVmZ2R+LYCMLHqXXIbYvNbVmEJnJqE//O
	zn2bvRMMJyk6AVCE61fRtd2hQPIG7CicjumReVEZlLcI7updVY5vaScE/kYTR3mvf7661fw=
X-Received: by 2002:a17:907:6d27:b0:b88:5e32:5357 with SMTP id
 a640c23a62f3a-b8e9f44745cmr277107466b.59.1770272797599; Wed, 04 Feb 2026
 22:26:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260205043730.3856488-1-n7l8m4@u.northwestern.edu>
In-Reply-To: <20260205043730.3856488-1-n7l8m4@u.northwestern.edu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Feb 2026 08:26:00 +0200
X-Gm-Features: AZwV_Qh4fqgQBhD-a4ZBOtLRrBeE7suJVrHRnVxUPxw0CPhZS7AhJABPuyuGGaA
Message-ID: <CAHp75VcU+pm-6LHBWB=ieJcy4yKDfo=us6TAGp2kGJhRLsm_-Q@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: add missing mutex in atomisp_vidioc_default()
To: Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 6:37=E2=80=AFAM Ziyi Guo <n7l8m4@u.northwestern.edu>=
 wrote:
>
> atomisp_vidioc_default() calls atomisp_exp_id_unlock(),
> atomisp_exp_id_capture(), and atomisp_inject_a_fake_event() without
> holding isp->mutex. However, all three functions have
> lockdep_assert_held(&isp->mutex) indicating callers must hold this lock.

Did you get a splat on real HW?

> Other ioctl handlers in the same driver (e.g., atomisp_start_streaming)
> properly acquire the mutex before operating on ISP state.
>
> Add mutex_lock()/mutex_unlock() around these three ioctl cases to fix the
> missing lock protection.

How did you find the issue?

--=20
With Best Regards,
Andy Shevchenko
