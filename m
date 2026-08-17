Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90422AF00
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 11:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786966076; cv=pass; b=gtppFMh4C0xPCwa0NCNpj4UCVbcVQDbZF5CSW7FWJYz6qM8fL/xOAn1r7gXbxyia8TVwFwxLeV/Agv5lg+QIMlWQ8mXxVZ2Oh2eWLTUYk1eWwN2UjSwOw60gmz87QBNw3nZkWe+F7XI3InM/LS2C7LLXQ7Bu+2GmRYOW17COQXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786966076; c=relaxed/simple;
	bh=/ebIgpNA+MjvXNkdAbOZa9K3g/95qLqHkMH2RA74dSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGdzhXX7OPT0Bz9BU+BcIbyRW+6o4m+9BypN6jkyMVOdE5/u218uBI6o1Ag/pxRRreKx4fmgddzgzsehwayRNmzEKmBl75Dd/8Cs9B89eJ/mCYRcykgDQT4t1B8ZtMRmRK5/YQN1ZtP8iXL1QNNEboZJsZCRjN7Hfz+pkVV5kBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHTPA26p; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHTPA26p"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3737363a91.2
        for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 04:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786966074; cv=none;
        d=google.com; s=arc-20260327;
        b=kHk1r32EY3jhSL+TW7T9FAvcxc59JAAC2JOJFbBgPgXMAs9EaukzYwh41xNTm34ZYj
         A7CN/poBQih0J7urzfJV61m/9nq2U8C1KgKH0p5Rj95+zQ1XytMDEJtv8/kBK/jGl1rN
         uL+Ggm8OjmObakJkdiFOAhdjD5Bm8jvYD3OAPkSBtYOC77l1xnxdqb1qj/mkAdcV60rz
         ieVomPB3sItTLGzNNoTWOa3vaXS7ElKxGMvhzJzMZB5mhO4hVSmaSkZeLKDdHhMv9jAJ
         xvHWmI+LKCOB5uQbvR+DWeWzW7uXkAKAdHUoGE9SI2IwByx+l+44OZGA1KOmrPSDg2sC
         IkzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FnWCUzpc2hGcsgmvu1JYUerITuSwcRRCsK5vmeDMJBA=;
        fh=hzGZ7IC6X2KHU7rhy5F9ugtah9H8rbVwdMX/VkGzBHY=;
        b=oKGCdkVJH8BNTt8OqFmRM+17ij8WExKZWcFu+08ze7JWQQtXoh+kkDFKDuD9hrqYCl
         N1ayWRofquEz5/N3ndMQ0cbXXwjseywzeXnDshFz37JPLaxHeaebOBKvE14hwJ0f5LOZ
         ps7lrbbtKgiQ8nHWaBiic16zNgADVbNpdHNyJvtjhhBWWf8gbncGNvPfncwPiolsP+Az
         hA9XB57rqI1STlfX1f84StJxhuufwcenKzOWj/qiEuoRqY2G4kY0S1gF+WIIsplWc8tn
         ZnwAjwUpYhLNnqHY1UmNgDuz2QevdnCK3l7jw7nDM7kPQ0fLeZ1AaYC7Lu0764ImK16A
         5Onw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786966074; x=1787570874; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FnWCUzpc2hGcsgmvu1JYUerITuSwcRRCsK5vmeDMJBA=;
        b=BHTPA26phsK164Fqmn92E+88aEhmfaV+8YskyJKarZt+t/6CYamF5HzhF0jp00JeuS
         omZ+UlhEtSHlb6txlZXiieKkXNg31fSzms4GZnq6veSrEg7bipmjyxX4Wn50dvSYo7kB
         shG3BWdJqgcV4F7nBpwFV710Rm0lqDXJsRHRJbcuzMqwbC+fJxCBauHsCVDwpxZ6o71Q
         O4W5VlZ5ZJtLLGR5C9QPw+MSt2o9tkw6Ur1irSfWiDgEKgqkFJ3cpi0xNZ/Rg5dNHSlO
         //uXfl4sY1JFyJDt7ASNGFfomebZ3aUtB6sGkBSZgyiLB7kO8BCZbIcyBwlGbYKk4bx6
         TgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786966074; x=1787570874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FnWCUzpc2hGcsgmvu1JYUerITuSwcRRCsK5vmeDMJBA=;
        b=kssZS0h1Ju2Ud8XsYFXKEbwFKfA4FhZCJF7FH4N8rZE8Eil1SAUWIalvp8SVTicwH9
         y1hLRUaW9fkObctSkjPgM8LDOQNoLk/UeuOB0qly04BePnTv351ADGGqO3MsyVz2myiU
         RKDOsSAzw/N6pwV/GejYOqj84MiRV/GH8EfF1iC2RpopTE+iI7xjnq01YMYFSo2FY4BH
         or2mne7WfFbg8YWK3SMpHO+rINd+EjL5lD+H6kA463qfa1edOplaDUQefhl1XGC3PijN
         PRwstj36sVgv8b3FdtLUy8RX8Jx7GdNyhHcY2zzC3j79y7rrVC0R1MEf3haXDxsV9hKS
         w06A==
X-Forwarded-Encrypted: i=1; AHgh+RpdS8Bc/GBFXr/Si0iAo3arQq3KLgYaKA07aHRT6mde1Re5enwuemboFQ9wJPUJySAAOIz+k8/mIzgGEATl@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5DvgujrbFFbSANw6Sd9FvDTq2afLecCY6vMQ2YHn04ogYZihl
	2rPtISH22HnjC/AF5KixslF/fnp6qM5Qddm4QVpH0Zw1ReKdhuAF7MvgUa5z736ClUmVtw2fePT
	VeKuQMfydJLXH6VCNfHnf/cMNZD1QzJQ=
X-Gm-Gg: AR+sD12WNbW11CitIdLAz+hObxpx20kLJRgZdovbXhy1qJwOLn0q2pWgMaEXYi88tbz
	FXo5eb0ScV29d8+IzzYtZs2AaOx7ALhc7SL9obn7bMcjlcF4toJ1eQUCPdffATQoBNKnhvE2dwG
	v5OwEPOh/+fZowN1uFfUKhrvrq2vc4Y0D3NQ6wwaz5LrXMsIASZz1+4SPe+NADz6M00ZF8WxeB2
	3tT4SabbOiSyJjsJqpIObX24IMC0aTHkV5EixEPxT0D6bmc7IdhNJGFGJLZM+mlAKGKRWgZJcJO
	f459gk+hY9hDZiY46qL7IsMlTizhHpGBt3oy5wx+vpBD08hLomxQV2EG17VTcMUYdeZv85SxQqZ
	o7g==
X-Received: by 2002:a05:6a20:748a:b0:3c3:a9e1:a819 with SMTP id
 adf61e73a8af0-3cc71fb5781mr27074633637.24.1786966074030; Mon, 17 Aug 2026
 04:27:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260817-sm750-fixes-v1-1-978c617e5a20@outlook.com>
 <aoLbbZ--FrkVN3SU@stanley.mountain> <CAHYQsXR1RS+kzFUQQ24YFyxxUJE39Yk=YfuFgAsvph1hKqqd9g@mail.gmail.com>
 <aoLs4RsoS7bB4v_2@stanley.mountain>
In-Reply-To: <aoLs4RsoS7bB4v_2@stanley.mountain>
From: Yuhao Jiang <danisjiang@gmail.com>
Date: Mon, 17 Aug 2026 06:27:41 -0500
X-Gm-Features: AcwNN1XuZgB0WlpMb9gXJ4QbT5QzpE2tg9p_k_kFF7jOhON2Dj5Hn65jFmOfAYs
Message-ID: <CAHYQsXRnCYkmVyjB8JbMH1M3yQY4durhVSjhYGOo93gHCeLDcQ@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: do not program the PLL from an
 uninitialized value
To: Dan Carpenter <error27@gmail.com>
Cc: moonafterrain@outlook.com, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
	Teddy Wang <teddy.wang@siliconmotion.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 6:13=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> On Mon, Aug 17, 2026 at 05:49:33AM -0500, Yuhao Jiang wrote:
> > On Mon, Aug 17, 2026 at 4:59=E2=80=AFAM Dan Carpenter <error27@gmail.co=
m> wrote:
> > >
> > > On Mon, Aug 17, 2026 at 05:13:53PM +0800, Junrui Luo via B4 Relay wro=
te:
> > > > From: Junrui Luo <moonafterrain@outlook.com>
> > > >
> > > > sm750_calc_pll_value() writes pll->M, N, OD and POD only when its s=
earch
> > > > loop finds a divider combination with 0 < M < 256, and returns 0 wh=
en
> > > > there is none. ddk750_set_mode_timing() discards that return value =
and
> > > > calls program_mode_registers() regardless, so sm750_format_pll_reg(=
)
> > > > reads the four members uninitialized and pokes them into PANEL_PLL_=
CTRL
> > > > or CRT_PLL_CTRL. Nothing bounds var->pixclock on the way in, so a m=
ode
> > > > set can ask for a clock the loop cannot represent.
> > > >
> > > > Consume the return value and reject the mode; hw_sm750_crtc_set_mod=
e()
> > > > already propagates a non-zero return. Initialize the structure as w=
ell:
> > > > sm750_calc_pll_value() returns early for SM750LE without writing th=
e
> > > > members, and returns non-zero on that path.
> > > >
> > > > Fixes: 81dee67e215b ("staging: sm750fb: add sm750 to staging")
> > > > Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> > > > Assisted-by: Claude:claude-opus-5
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> > > > ---
> > >
> > > Greg is not taking AI patches unless they can be tested.
> > > https://lore.kernel.org/all/2026080354-skater-urgent-31b2@gregkh/
> > >
> > > I kind of hate AI commit messages...  They are so verbose, confident
> > > and reasonable sounding.  But they don't answer any of the real
> > > questions I want to know.  How did Yuhao Jiang find this bug?  What
> >
> > We're working on an LLM-assisted system for vulnerability discovery,
> > and this bug was found by the system and checked by me.
> >
>
> I feel like this is always part of the story and should be told.
> Regardless the firm rule is that everyone agrees on if you can't test it,
> then that needs to be in the notes under the --- cut off.
>
> (I sometimes skip this, but I've been doing this for a long long time
> and everyone knows who I am.  I should follow the rules too.  #shame).
>
> regards,
> dan carpenter
>

Got it. We will follow this rule in the future. Thanks for the guidance.

--=20
Yuhao Jiang
