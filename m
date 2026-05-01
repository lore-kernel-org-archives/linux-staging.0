Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE831A6814
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 16:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777653986; cv=pass; b=TAjLgwW7cvN/HhD+Fa5jWYeGbzFhJ7ZRgIlR1LWI7vbJ5bw8UHTEtMat+wOVwWrih4nkSUnK4GQ5XmW5LyygQKFdZsTeVgzQPmWa6YQdJn2nLmfc2He7Ae8Su/JdAg0LQKLLFe0JNu4rbR3ErVet7/ASp7D4XEPMovxLxx6WOEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777653986; c=relaxed/simple;
	bh=UXHHFreHFO4FZPo/mLdO1Bk9i7x2o4FNWOox9e9dDtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAsPNaAemcODOu57A/jnxDiYJGU8aSqAFfSLD3g4Y8i2Wwwy67pL1OJzcQ/R3SpK6Jo0jxtK85pe5tsNpdvV7JeCAc0uYij2XzddKoCTIyVxrpH9n0xvoZ+jZxukLfL5NvwQAF0Jl0QYGoJmvLPHm1kRzqfRBG9yhxl8yX0glA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHMUPeyr; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHMUPeyr"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d70b3e159so1023991f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 09:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777653970; cv=none;
        d=google.com; s=arc-20240605;
        b=ZvAeMtP7EVaCkgfuOamzsjUTHWGwCLX492EgzqGjdVwcDw4WSl16q/k8Co9IePXHuz
         AUxMUNpRxfNyw9rxQQQlp3vd5U2khf9avUm6oKR38vE+f855xcW8i8eNYGJzApDLRMZn
         66827SXQ8g60H7VDVmej79u0P7LkZlXsQ2VnPmnUnpblvU9INGaP3C6X1t0DFeHqiGmK
         HBeP4Badm+QYXEQa1ZQN+fW9CDXyI7SFEUVvEUyHaZBMy+oWFXwuWA3ZQlH/gZbQ212x
         8Pt40jwwj69/4eK3e8Wtlmx6bssLWWnPsa6Hl+8qXzcGs4uDDZNsms2su61MwySyTAzr
         VHwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UXHHFreHFO4FZPo/mLdO1Bk9i7x2o4FNWOox9e9dDtU=;
        fh=ujQiortSvJb+VeS4c8tqnE6Xtv6F8Ik0P/Etu5ZpdXw=;
        b=ZOsd1ww/uOFlS7+pO8PP/zOi8ovCZJ9bbuDpyhD22fiTMHcBjOPUClMCr0sRe43HMV
         SDgKwCTz7DZ8f1cOrAiU8cfKVVfXikgfJ7yKZlRh3P9AJYb9/E8ckRbkxA84p4YEt9bq
         3XyUQpcZOIDdX3PSmrFUjEpVxrkCzIiBvtSSQRbl9qH8yw/9W5ito4Pu0BLk3CGSv1Sp
         6jPG8IzcEn7epCJtSls6CflvQcx14QpZhFbVVURMGkeJE3YY0wIezp3tE9T8D0c21lJZ
         Fx39sP71ROooGs7ipqsEk22Og9zkXNtVhLzu0MIWUyDJk7ZdWI41PyOeWVs5zyQw1RKr
         vW4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777653970; x=1778258770; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UXHHFreHFO4FZPo/mLdO1Bk9i7x2o4FNWOox9e9dDtU=;
        b=BHMUPeyrJlAmvgvIHNbIBf13Lf4qUuATycE70oiKTk72qqKif3JRg6rbtTmr+7b0Ko
         rE8bs51Py8DgWaaEwUbzHBikwi5+vd76vNMCjOov4Vn1tFomwu6q9aIZ473PPoP5M92Y
         WMdGjIE2eaMXUS45wkrcRJGWw6l6CNGUdqDc/JdYfGHbOQqfi9iwvdjEhx5BCvwZsDE2
         kthk8abXDjO3wbT//vK5W5/ndnivaI7wzW5s7qRJ2PJwgDkXWqfZ2imUELidG690kU5+
         GGKcNhSq9qb6WXWVzS7yrTy3ieITKnD6qgY7z701BZ96SNGGRyeBMfFLnHnRbXrq9A7k
         fBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777653970; x=1778258770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXHHFreHFO4FZPo/mLdO1Bk9i7x2o4FNWOox9e9dDtU=;
        b=VlwB8Mj59xZmp29Tslj5WorH0lpF0Y5bOh7ubIHw6HZrLhwTmlIjiqqmCVQcpMoeEm
         QEkllyN9IcOrVeXTT7gXHTWhWC9XmGCxhGFY4zhth6Q+1FOhssm8IWYx02Us1tg331fd
         kqX8Tp+IBRXPg8pGDfJTHmu6oGgZSJNt90/6ZIiPxjBLPegR8UrMr+67Isy1HK0CWoAy
         61mNu4Ce9QVKubpnLwXb2t0vUkmDgIUmwt+o1TZQRmrkP9a87XgF+QsgOVomh020DuDA
         TVksbMWhVmpbk/T15B5GJZkSgesw1ATLaX172+rf/IrKcvnhnK0grMzOjLNbIc9hP1/K
         tbsw==
X-Forwarded-Encrypted: i=1; AFNElJ9YzXZKadyzD96fupsFKZyCbCkojziNl1xzizc4gatqwZvcYKLsGNUXvC7xcjdS1o9T2/GCf/aSou9zfrsr@lists.linux.dev
X-Gm-Message-State: AOJu0YyNqdyq9IiBIQxZ9h6pCYfpNuFa5dS4gKfSuolTK0Bd6IoDUET+
	gODu6EQUQsKbkryn8YA+sQRr/WVr34D0TvwrsbuSAi2TU1MF1VsueiI0aelNowlmA57ULJusvIa
	upSpBwM8FXOP9zwHjA8Y0WJSt4QGF7EY=
X-Gm-Gg: AeBDies5ay4QClbPVqMyhiAH3FclJlJlZglHzbkqcqLTmOccdjgaUKgPK4Co6X0FAN8
	Q48/ctgZtnzmUKhEPx3R+4eCzL++nv0zd57i4pH90wDRABN7ihuHz8LPULj9ZPqoB85bfzXFrfW
	+grnQF8HS8e8zTtNe1zoO9/jKyxn7jc3H0NTsZ4Ha/hv0U1d1A9jr4W0YtpFm6avxRbCe7Z1tPF
	ER/Q5jdnGzBlhfFf9PMqvomir/MkLxP9omQBI40xI1LVuxHQzGWuLfo9gz9N2doJmGkZeeAOxG0
	rQ7pGxjmCYj1HJIHbJR/
X-Received: by 2002:a05:6000:2c05:b0:43d:50c:6f18 with SMTP id
 ffacd0b85a97d-44bb32fcde4mr326857f8f.11.1777653969901; Fri, 01 May 2026
 09:46:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260501144207.25211-2-shyamsunderreddypadira@gmail.com> <afTQZHlmMkTZDP2H@stanley.mountain>
In-Reply-To: <afTQZHlmMkTZDP2H@stanley.mountain>
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Date: Fri, 1 May 2026 22:15:57 +0530
X-Gm-Features: AVHnY4JSqeJoxbab_SXuuBIl1KV49DQVjFIS99H8JSV6tpKtX8p8ZMz-3U8mLiA
Message-ID: <CALx+fbZ=WyQxinsX+rggvg=rAK32LQuYTFc9c0w7U92e8Uiiww@mail.gmail.com>
Subject: Re: [PATCH v2] staging: greybus:add missing newline in sysfs show() output
To: Dan Carpenter <error27@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, mgreer@animalcreek.com, johan@kernel.org, 
	elder@kernel.org, Greg KH <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan Carpenter

I have not been able to test this on hardware. I based this change on
the standard sysfs formatting requirement as documented in
Documentation/filesystems/sysfs.rst.
If there is a concern that specific Greybus userspace tools are
sensitive to the trailing newline, I can withdraw the patch. However,
this change aligns the driver with the standard sysfs formatting used
across the kernel.

Best Regards
Shyam


On Fri, 1 May 2026 at 21:40, Dan Carpenter <error27@gmail.com> wrote:
>
> On Fri, May 01, 2026 at 08:12:08PM +0530, Shyam Sunder Reddy Padira wrote:
> > Sysfs show() functions should return newline-terminated
> > strings.Add missing newline to sysfs_emit() format string.
> >
> > Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
> > ----
> > v2:
> > -Remove "no functional changes" from the description as per
> > Greg's feedback.
>
> How do you know this doesn't break anything?
>
> regards,
> dan carpenter
>
