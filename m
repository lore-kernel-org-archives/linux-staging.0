Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7A01D5147
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 14:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769868362; cv=pass; b=IX2dTM0cn4CtLyqV74kqE64uQtN3hGfRufP8zE4kZfOl2nmgTcVAGa6LapHmnPfxwiViQb6kClI3D8HZMY5MR7i6qZ4uF653Anjy36kc9acWXaq5mCAqALsVUv0pRLf79pGXWlbDUks9iGcvhjHCGRLennRVOrLvWCORqQp0O04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769868362; c=relaxed/simple;
	bh=O01vyWXUUu1Yv68Jh/s7exjfCI89nosK02fEh+diIHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fk82FoMSjma3mEW+LmPjQ2YAw41ibNkg9SucZQFC0eVZdTE3yKBBiK5IZjVOgTdw6iAz49kuLyNPlqSWdpYCH4I5urknV27oTQcTQz118FQx75kbZ2nlBCQDBXJ4E/GP6QRYVOTZyvAbv47UBohnS5azkYGWQRgiD/+vBXTm/Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/GaLSFs; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/GaLSFs"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-352dda4a34eso1235306a91.1
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 06:06:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769868361; cv=none;
        d=google.com; s=arc-20240605;
        b=ZuebuGFLlzsvOi8sPfNhjHAf2tBYJXLLV3XwAnO0EGll9Hdym8o1WgXLSIZ4G8/sag
         Boh08vs0XflNhtDI7pmu9nUgqDAv69TXAECOTzN2vV/mJScRaM+/krZxFAk6c34eMW75
         7D3gGbR/yOmDUfSEZHE3u9D1HXZGPV6RtusOC8/QLkLy9lyjtbc7a1PRpgyaxVmnM1QF
         /c5C9ESyD8vtundtf7zEtrVIS2LLbYlYmBG5oIMGfg+lO2HGO2HLjJjpKydSbvpxXJdS
         WwricQmbrAqY6Moewz1aKlme+ODKXdDGm+pPRjJLVTMs4EXbn+HEpU678ii9OPzWm3TN
         +LYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O01vyWXUUu1Yv68Jh/s7exjfCI89nosK02fEh+diIHc=;
        fh=/CLQUMSkHyxCPQY3r3fxAX0lv5J8YKnr5JtACHlk6/M=;
        b=STdFxWVKoWri3tSHvjpaT0xLMKdZelUau6XCo3Nbl1uDRsCoikhsAnT6K4uIb6DCnZ
         q/3Pee0oospEBVpbEb++v3JCc/PhIJlQQbHhk6UOUbM3ziCujfFp9EspqDCTLTtw9NME
         2UOE2piZ2gZqN+wgPdFYaImf7jd6fHGknvquQ4gvViZbo/XgVULfDkMPerrCaBPu1MYb
         XR+e5m1L2pe1c+doJCaaDPw0fCCP9H6tlVVadB1N6UXhOtlvMJS5bj9cxnkY8LuCy+8X
         GVN04UNOIPoW7xoEmG4xvFvFoQUhh1C6uLfPVfvQ4gfL4mLa4QP3wYSIff8COTlRprlv
         JePg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769868361; x=1770473161; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O01vyWXUUu1Yv68Jh/s7exjfCI89nosK02fEh+diIHc=;
        b=h/GaLSFsQwCKY2nVABkhNm1KfSPStWU0Pt2pKTDsXoZn9XXwgy2GnbmXKEnfXfMuno
         jTvVYwsGp2JL3iHgBdPqtcPDT7BFDpG3XN4Bd3b32GYeVWFIQyr0tvArcilF4EloRQGp
         Tro0Gsy+W7TS7EZrFkNUOrYcOa4cRjEmM4bW8h8UUCy/tW2Ty7HpbU6vg8Q1xeyq5FwE
         9kPYmdPPsyVGltHZXxFOpuQ6uj/WNgWA8nx+lD0Q/Y9bY7lu2WRHP2lDRa7r/mzS38pY
         vqAEvjTIMa9BbBK8SRqMivuArutFQ1XwTk7ec4oRiZcQjmXMAFXeupAupVBlk7poqr1T
         SUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769868361; x=1770473161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O01vyWXUUu1Yv68Jh/s7exjfCI89nosK02fEh+diIHc=;
        b=ZnG3+nE9CQx+xVIyhBAy+JDS615ZWiHZE9HnaMdRNVwKQkpH4zsw6GN+A2PzrU7Qom
         TcXx3q61gr5V3abIG5kTf4gSWRwWA5+8BqAvJR4WuIeJfQ1yKg2/kGqOtgskdGUTetez
         vEf8MmfozJQTyP8MQQB+uH8xVcQK4dZ3bFpiPBTCl67jJgGwHvkjS189qelsW/uF7n8Z
         1D9lekatWI9UHXBk/1ORL8xKWfQicFrh9zlAFvFiRMTkYvq5ZSFqvQ/XlPuKuoOMKJZt
         T2BT+OchxOAufysld1GTTNdmzbNIc77FoqF0Ywwn9UqJJ40NQBszUEb7X+s4L8yKVG3o
         dqzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9LutnE0upFc4Y+c4mRGPY3THWkESEs0xow6lhKgCD9VrkvV8HN9oIX6q0sFEl0ax8Off2FX3FTGiMGuQQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3qN1EONgCFNSDvqjaEp7uWPY/zMUwzwkd/GRLKLeQCcbcutPm
	JwJwlZqhJ7Fq79dOWHj2XEBlGOW/FAxC6/5OMPLJn4nx3bPGKZQQdwxupV+8/nQzJX5WtnWkLib
	xo49qFGB+eHaq6/x9DKqec19fLJK/FA==
X-Gm-Gg: AZuq6aJKiMeJ387bbx7E47NmHaosazeg9mdlzG4x6AwRE13Syx1rXZHnNrxAkgAsz0M
	6NjD0QyRmyQ6sIxpLjFeaR4CvhpJs9Acs4MmfFwHglXrusCSAFnKU4DrXNJBkCMxuhptKab89ns
	8/qwsAk/C2By1ZbDOkcyYFXykNmZTzGa42bJPievyKGV+W944J7HNdrKD/7oZkxNprZBdXvUUeo
	n4oP/WWDX8p1Cm84Tk/K8zoof6Eye4pnaC+BMaIFHWp/wrUvbnctHJ3aPqA30BfbGI5X9hD9VQq
	iTFsMoBefDYArXx06DYlXaaZ8Qk5w5ulM4UQHjv2cTKb6imAFs+P
X-Received: by 2002:a17:90b:2e8e:b0:34a:b8fc:f1d1 with SMTP id
 98e67ed59e1d1-3543b3ae4b3mr6576276a91.24.1769868360852; Sat, 31 Jan 2026
 06:06:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130181620.199152-1-lukagejak5@gmail.com> <aX3-9zMnUBVUKP1L@stanley.mountain>
 <aX4KMi5SKkFwBPtR@stanley.mountain>
In-Reply-To: <aX4KMi5SKkFwBPtR@stanley.mountain>
From: Luka Gejak <lukagejak5@gmail.com>
Date: Sat, 31 Jan 2026 15:05:48 +0100
X-Gm-Features: AZwV_QgWsjku8jnY8Q1hLOcED2pZEAUanLOxj6tFAejgFyjV6RemNMnqWL9OS8s
Message-ID: <CADRnA92tVga7g4Cva8XTUiU1EFeor5Ng=8Cwk-GHSgZeXTrz=g@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] staging: rtl8723bs: fix OOB read and perform
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,
Thank you for the review and for recommending the v6 series to Greg.
I really appreciate the guidance!

Best regards,
Luka

On Sat, Jan 31, 2026 at 2:57=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Sat, Jan 31, 2026 at 04:09:11PM +0300, Dan Carpenter wrote:
> > On Fri, Jan 30, 2026 at 07:16:15PM +0100, Luka Gejak wrote:
> > > Changes in v5:
> > > - Corrected commit message line wrapping to 72 characters.
> > > - Removed blank lines between tags in the Signed-off-by block.
> > > - Removed "Security:" prefix from subject lines.
> >
> > Looks okay.
> >
> > Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> >
>
> Or we could apply v6 with the tweaked subjects.
>
> regards,
> dan carpenter
