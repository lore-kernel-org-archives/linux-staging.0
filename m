Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3992393DD4
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 15:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772205153; cv=none; b=KxMMhFwrowSTVQYqUcTdvhJ0Eg+doWj1asItQSzhLAtld2LWm8HS/u/6lNnXSjDoR6EjyKwdAbTbINF9M7Kp05wdRi0dpGLPwGBfLu/UyIl9SMmX+Ap32OrdVkGmsvxSSGS32hu0TMJooxiMDWw9k7+NgGPfG1s+g7tGeC8dpAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772205153; c=relaxed/simple;
	bh=GBBkV8bu+I6h4BqPqfvoZgo1xACXj99VWvBi4PHzK9A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hU4nxhM8STLrravAvhEj3oYAA2QdQte8fqkxSe+X0OHvA3aV2g+8S56EmeydNPDLrqutHsnOgus0YrCwUkrIUoxCqOyvJLVUvkzsWJfZkPFJ5Nw1HeOXuyuvGwQF2hIGyaDq1BA73wZDFjOByiGhyNm6d6YZP2F0vBGR6EXP16o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1vihPYg; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1vihPYg"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64937edbc9eso1989857d50.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 07:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772205151; x=1772809951; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MO9cPCVCCePdE3t0jkdiABb6AY8+DqQ96RWqTyHdRy4=;
        b=g1vihPYgOEceOvVFPW/oPjpt9v+JEhzedQyTJhbgrZ9MVfZBpfOz6RC/Z9V0SN2cxf
         56SXV0P+h1ebiNf7Gzc5JbwQTuxGR7IXoMq0sZ+n5I7RTlNVk69iydSc5qIVDFBthJRW
         L9RTM66QzUDXcjl6u3CA+RDt3hn71s0MlMBqMbBbBZBhS4GUVq7QpWO/BzejfnTkkoUu
         yjyLlcy91R6vKZw9/c2xDkssJb+PIDkb+khts6ns5GySIlpepOVWzOKcWEeDCpaILYZ+
         15W2OfqG7VdrmDfljWlDsF1RLuIKnJEDH3EDMHydiKWFIOhC8N0WvwCxqOu9C4s6zm5r
         7JPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772205151; x=1772809951;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MO9cPCVCCePdE3t0jkdiABb6AY8+DqQ96RWqTyHdRy4=;
        b=wAj0aIkze5qDtwmhcFA3kfWMu33KSn+eaFu+OlGWx6919RJtxZ2H+CCkBa8WDB9XMM
         hSpbRmoxv7BC9KUA5aTrn+RkrSzUEeTisMI/pLZd/ypEKjGT1jNfQwty/VShWyp0Z3fG
         jhrgE7jM/xYiWACZXFqeE/Hdi+1CXcV2Lssvsfj7ZsQPCIZXfKihcYlXkRc+neE16klr
         sXpNYK0SGvawfHkfdtfSj0TTJTKOAbWRlPih9hpy4YTlDNE4dIpYu9IZ9/qO0+qCrBH8
         3WzVi6FB30iDGcPuBnTUReSdVF8F7x0nAkZTbCuKqzFUAFFio4QSXc6LNODBjhCALrhb
         AtHA==
X-Forwarded-Encrypted: i=1; AJvYcCXaow2xFxgmYc/AJ9h7+jRwy8+eXre6GjBY0RZXYbwP8mn1pBdSxhJYhCPeoymeLY8vq1+JiLUF0Rx9J6P5@lists.linux.dev
X-Gm-Message-State: AOJu0YzJgHKOQ4u81/oJv14vvDaYGCmzYXE2uxpkA4BUZDnqZHLCSKyR
	7gPSaonRjkSv+TCk6EJAoVsc6NPKOuT7DUYxZGH8aDvS3TIZxmnPXoyk
X-Gm-Gg: ATEYQzyXM+ETLAgumMl+m3bitKKigdo5tZkRs1EDYiO55S0m2KtT9zLy3U2MBVHpwLU
	/FCvTsBafyj9IMbuhOWNU7pLF8QcykXr/uXAohV8B8L3VmDDk+lFlNtAaJbuD/LN4OuwXPAEe1V
	ZHDlTgt2D1Ih04Igq0BXvcSq/4ml7tf/SumUzmfvOYX4jT3HaTSaXWtIpPImBQWt1OEXJGgALGq
	Qy8Hdr5iCEnTZgnIFn8y2maZwwDEee69psplwy4/8aWllEieXVB1YyW8Hw0AGp/5VG8n1oSqsk7
	VohEgUn9NsS3A5GUetywRR//xJxHFuDiezNSpsMzVAs5vPYj4HgL3YsH6ZIGY7iYuelDvt/+2N9
	42AvubnnsX+yhsdPVxUEUvFbx6l4QqH6iuW0hKWklDMbVTprwu3MngumQLduZbgz2wa6STZhCOY
	uvyR3NNJnVr9Jtp0SFjQXs9KdMpef5WuJmH0gTPbyCJnhD7i50mY748mcMxqZqWQfTrjHA1Hr9b
	E7JkoiTaAd3hzVsU7mJz0/l/z0TFIDy
X-Received: by 2002:a53:d20d:0:b0:64a:e648:b7f8 with SMTP id 956f58d0204a3-64cc218fa70mr2028748d50.36.1772205150709;
        Fri, 27 Feb 2026 07:12:30 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb7626e49sm2374903d50.11.2026.02.27.07.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 07:12:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 09:12:12 -0600
Message-Id: <DGPUAEKP8SCX.3AUUXG0PMXF8H@gmail.com>
Cc: "Mariyam Shahid" <mariyam.shahid135@gmail.com>,
 <gregkh@linuxfoundation.org>, <ethan.tidmore@gmail.com>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: Fix logical continuation placement
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Dan Carpenter" <dan.carpenter@linaro.org>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226093811.30659-1-mariyam.shahid135@gmail.com>
 <DGPCU2QHDJOL.3NM7ITZRM1O1W@gmail.com> <aaFD7mluUSq9PfWE@stanley.mountain>
In-Reply-To: <aaFD7mluUSq9PfWE@stanley.mountain>

On Fri Feb 27, 2026 at 1:12 AM CST, Dan Carpenter wrote:
> On Thu, Feb 26, 2026 at 07:31:34PM -0600, Ethan Tidmore wrote:
>> On Thu Feb 26, 2026 at 3:38 AM CST, Mariyam Shahid wrote:
>> > Move logical operators to the end of the previous line
>> > to fix checkpatch warnings.
>> >
>> > Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>

...


> Ideally, it would be aligned.
>
> 	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT) &&
> 	    pmlmepriv->num_sta_ht_no_gf) {
>
> [tab][space * 4]pmlmepriv->num_sta_ht_no_gf) {

That's what I meant I guess my email client mangled it? I'll just
demonstrate it like you did here for now on.

Thanks,

ET
