Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4D534A767
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 21:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770585698; cv=none; b=aG49Ke5hGJna/6bF8cWYOtqm0qKCPG/Fk7PWAA/gx5LTTs9zNapg4jE8wattf1EI/fcxJpfnS0GYXb1l2DluAER/8KW+68eUw6VE1ovEoA7dJJvDWKLBU1wH0jwkL7S1AxBXxuaJ9sFzKfN3VSUQuCNjuS49NFHGgWaQxn9zdOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770585698; c=relaxed/simple;
	bh=g1+NURf+tNqqLHlGaruK0lwTAo/f2LFxheOtr/yYF84=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=L5MQ5EKDAdBeptzd+8wpu5NNuHhRDWVDGg9roy9NwPhzldSQgOs3Sz6CHo/c+g0ty4j6+mZJ7T6MX4skJFsEhNumQewSpw+c9l0mrmZ9FcrE3Z20m6xXBR4mpagSW9uNRJ8vm/spK51bDbv7i6dkIhHoZfeLFMRCm7urqUZVIac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4098XZe; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4098XZe"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d44b2df00aso1197989a34.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Feb 2026 13:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770585697; x=1771190497; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1+NURf+tNqqLHlGaruK0lwTAo/f2LFxheOtr/yYF84=;
        b=G4098XZe8FA+9gRC35q/q3eZbyktwS/GJ2ho3vFAmsA55tDGKZCS2cnf/U14IykjoP
         g8MDqeDBPJch4HTk1KZjJOQpBciY7oP9lF5raBps7JAa2KB3Ri6Co3BXSXnKw3eRo0XP
         rm4FNOdVxSIOIsBLrEbuCkSRyUSOPA/G7KJFf97dXtaPKer/rVRs9srqw7O5CL05oXq8
         r6ZbCtEzEStXSGvaOPBzxH3njK0a0w5UgRHyIxtWu7t8XOsauMIGJeCZ0EgzHO261cUo
         id4kiO8HEuXTfpy+1Qfo/chutJkJ39nQtO8eRVwq/ncBrc5q3WeY0LSH9P8UfJov9h63
         AZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770585697; x=1771190497;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g1+NURf+tNqqLHlGaruK0lwTAo/f2LFxheOtr/yYF84=;
        b=aXl/yNgVcdHkKTnMRmy76S4ETJmxKhFq8tgJ+cZerBop4Mp1blHfn9ZyWwSXxPaU8S
         oN3rjUJ69hPVZwUaYDH/1csafJ2graZNYJwUxtxHvO21BXpDCmTPzfooadUUkVA7ld3K
         CpPIhg+rtVPh1Qhu4yqY2Vo1kO39G4tn0aQo2orELUS9WFqm/iCony58kouD6h0f3Nhk
         osJ5IVGVIjQ+3WPcyNJsfPcKoKN2PtXKvOi4doUrywkY4smsBB4cdglRfBVqlmWiv+le
         33bmbwGQAXoVFDsYpjcW4zLPjPiaAt48veE+bItYZHvCSUy9UGks10wfD9q1vseGgl8Z
         1Hjg==
X-Forwarded-Encrypted: i=1; AJvYcCUTOH/XYHrVKnY9ibOj+IKEoRyZQvhXI1332q82t2LAngFVYjtHg0E847EWK5sfj8DiWUW+7Q5ILMYZqMSc@lists.linux.dev
X-Gm-Message-State: AOJu0YzkZk1lAjJxjifc76ovNJaVi5D44zD1sGvu4xa24o4itmx/488O
	7KGRX4de5BQt2ZWCkwL+SBdSyi/pnY8chjPPRRfoAjH3aoVnrT1Lm5cO
X-Gm-Gg: AZuq6aLuF7bbLjAXmnPgDWH2gr7NaOHCGBGTa8QjPCuCKL4IOBXGwEXWCLy9vk+loX1
	RCDSV/X9RysPHXiLlEsZeeiTJlwXsyijNx8O8zO5k/oLMvEt/9cEOViXu2fKMRvIcp0EeFQF995
	SHVIkXDIDCTLBejyP/Pa0Ba3K7o99qVvRbZf8STqPvqhQD8Bo5BuZTWHb+OuPnJY/gY2k2GqAOx
	ArIzzmS/C8Kz13xvFe0/RDGBuYrkIxLs/aPBe0/ia1D1HISP1qLRtWciHYe2q6EygAeh2g30LHS
	WPjX5nlECJIXVnDVcF7pM2h3yXFRcsXi50EXazuQYDp1YyLh6qzO9LHE9naeS7gVs/vFkuVTEai
	GeR3DnYyyOUX/BBhp3ncJaT6qXhwV/21f283pBkOJtFpc9t44uvC9uGbsrzAxEOyET9VzyebT2s
	/ON9xqHRvV5TefbkQ1ooyz9tfBtgByyu/LJlxYHQAacAZ/IHzFnFm9xHZ0fucjvyMwkmARHtlAZ
	xClEdMacGSqpClXWKsmcn9IMNsbC1xW+4eGvoKt78qgHUfxnmMcxuWiXQ==
X-Received: by 2002:a05:6830:7002:b0:7c7:5770:d2bd with SMTP id 46e09a7af769-7d46440fb4emr5245807a34.12.1770585696911;
        Sun, 08 Feb 2026 13:21:36 -0800 (PST)
Received: from localhost ([2600:100d:b16d:c41f:7439:3a18:1e56:a313])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d46470df08sm6742500a34.8.2026.02.08.13.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 13:21:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Feb 2026 15:21:35 -0600
Message-Id: <DG9W8VCTXV88.2TWUDGUEPIE47@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Azamat Rakhim" <azamatrakhim8@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <karanja99erick@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: simplify boolean test in
 rtw_btcoex_MediaStatusNotify
X-Mailer: aerc 0.21.0
References: <20260208175120.15717-1-azamatrakhim8@gmail.com>
In-Reply-To: <20260208175120.15717-1-azamatrakhim8@gmail.com>

On Sun Feb 8, 2026 at 11:51 AM CST, Azamat Rakhim wrote:
> Remove unnecessary comparison to true and move logical operator
> to the end of the previous line.
>
> Signed-off-by: Azamat Rakhim <azamatrakhim8@gmail.com>

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
