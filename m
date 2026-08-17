Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14C43F99FE
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 11:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965236; cv=none; b=ZLz+mw2OKorMoN/w58pFHa2pwvMNql/mmJ8sjePjG6ZUgzerxNQhTko32fplFGGfETyw7eUMmP/slVLotfAtv/UMoYJhi2eWNCZHSxVPYTzSG4Axm5YpWuwcoj6IVKxyV8Cf1OynxyUTDEovyoUkh3Cj1ioIiNxh7gv7MZo9220=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965236; c=relaxed/simple;
	bh=yP5Z0Zw9/7oyNxvKw0EGDkO5COXnnpYOwO9TLA5kajc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4Akc5rGN+F2Ui+flXfkCaLFckzvmg+ysLMlii+u9Zu40//eBrg56hc3O0J08gFFX3iAvtcq1XVi/mTR7rJi8IGqO7eZi66zjZ9KA1EEcn9FgNSCw8sdtquqd6WlTCnCpMxQzfaVQPiPT0O0fWJvfooagyR1bziUU4OwHH48RwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=at8i2veg; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="at8i2veg"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f7027ca11so1981747f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 04:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786965233; x=1787570033; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hCAG987424i5Op1rCNWT0rT5ZiBWCiG0rVbJNv0+R6s=;
        b=at8i2vegW5nBe4VTgUT95z0qgtb2GUfboWav39sy99X0Ju6P9ibztjN2N8NZMeFW+n
         aRFTgezJPx9eutXSBndGGvrNaY2kSfKicPZsWRYWqMCJd65CCfF1rczCs15uoy3A4f7J
         hvDxBr4H2ocSGVQcmbQ3r8NjyQSdIU3P9bO+qx6NO1NVKcAmkonk9Owxx6PYiW/SzXla
         u/3+fVhVPYWgu126LJ4yH9YBC3JvzJpfRTI13SPOyVqRGyVczKVToNZQJFPz8/HEbg4t
         IzVXOBk5AzKZZjXvQxG4AhWiM/dpqdoRWbImRkOxZO+lNK5z/WSJ9tLDWqw5WYquSM7M
         fe6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786965233; x=1787570033;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hCAG987424i5Op1rCNWT0rT5ZiBWCiG0rVbJNv0+R6s=;
        b=k/bs2KJkpCoVm72H+/6kTuHuMMzJJ86vQs+aNa1+Wdx3keSTvUhn71sx0wSA7c7Ffi
         oxH4UyxD7ktBmiwLD/El939hfFInIn6ohJvDrbJA8eoS69tpYb2+RdLy+5OEhBTy3ouQ
         FXGIZRAsMbUlZPmeghpzTFTWcN+IFPYRZWEuV1kgwUMWPYsWTwcKlxx9La+bIzZ9tzRV
         vmK2NIdxto3Z3HhfFeYLtCFBj+mN+kGdWa919vkQ+edvik4w4QciT77cKL7JPL9ZMYVh
         oN6br3A3PFARcgdLousWm+1wAToYsqSpSBmvmrUpTH4W2BU8AXFAS8AdJcnBKFsJCRKi
         r93Q==
X-Forwarded-Encrypted: i=1; AHgh+RoOSEN+LUv0Pwmk/lKakzyAOOqxlGw+v+sLagtWLC+IyUzBCx/MwUGL5xvZOzpsCmMSIPl5ME7eroLjWra1@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk4+UivNeVpnFkIAp3KmHvomxKGs0sHvh5MuT3s+vm/ZMsWkGo
	VbT0L+cprZH8zmGXuiqzqPOAJjVzk7EoZ6bd+4OH7ujtJF7ow4a5/fyQ
X-Gm-Gg: AR+sD108FJfWZV6xHMi2FgnCtCEy5BTorHR4VcP3Zkamny3/VSSw/mu6Ww41FlWwXTg
	8cpR3xWy+afUhsB0GPce/7lVwAweSOPCmyxZb4KtzPRINewpIPz/sKSixYgzDWgY7gLrFf1Xbwo
	MVbkWKAXjyu66W9bwzH4Mt6Jntp1n1iuAnMw7wTTgeMWD9C1IAJ9G/Usib7qP9UxaH2xShnPJfg
	yvW7JTBlHkW+oDW+trlJE7I2IcvzmzGWxfX8JDlPeox+25XAU+GI+ytaRRY/5bpuwtn4yYvSpaR
	esW5VgmNw7qbfAhrw3GySM1Qxb28dqTN6SOwocwSj/aZfqKYZIj5P+jxvVm0IJ5l0AOx5FDJdLB
	FixMnbiZ+vbuHSv4nTHVHgge0aMYuYX5HrQukgsS2K8tygsTo2a2raAiKu4Ct6jtwuLb6W9iuwg
	2vUJw0pDhskgcirF7NJWI4hS63+F/t+QM98kC91BMlC/HkJxIuAhNxuG/y3Ee1wgQ6E/TJ
X-Received: by 2002:a5d:5449:0:b0:47f:5369:bba with SMTP id ffacd0b85a97d-48160782d05mr34547608f8f.15.1786965232687;
        Mon, 17 Aug 2026 04:13:52 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:9cf4:43df:e612:817b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a315bfsm3270339f8f.1.2026.08.17.04.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:13:52 -0700 (PDT)
Date: Mon, 17 Aug 2026 14:13:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yuhao Jiang <danisjiang@gmail.com>
Cc: moonafterrain@outlook.com, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: do not program the PLL from an
 uninitialized value
Message-ID: <aoLs4RsoS7bB4v_2@stanley.mountain>
References: <20260817-sm750-fixes-v1-1-978c617e5a20@outlook.com>
 <aoLbbZ--FrkVN3SU@stanley.mountain>
 <CAHYQsXR1RS+kzFUQQ24YFyxxUJE39Yk=YfuFgAsvph1hKqqd9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHYQsXR1RS+kzFUQQ24YFyxxUJE39Yk=YfuFgAsvph1hKqqd9g@mail.gmail.com>

On Mon, Aug 17, 2026 at 05:49:33AM -0500, Yuhao Jiang wrote:
> On Mon, Aug 17, 2026 at 4:59 AM Dan Carpenter <error27@gmail.com> wrote:
> >
> > On Mon, Aug 17, 2026 at 05:13:53PM +0800, Junrui Luo via B4 Relay wrote:
> > > From: Junrui Luo <moonafterrain@outlook.com>
> > >
> > > sm750_calc_pll_value() writes pll->M, N, OD and POD only when its search
> > > loop finds a divider combination with 0 < M < 256, and returns 0 when
> > > there is none. ddk750_set_mode_timing() discards that return value and
> > > calls program_mode_registers() regardless, so sm750_format_pll_reg()
> > > reads the four members uninitialized and pokes them into PANEL_PLL_CTRL
> > > or CRT_PLL_CTRL. Nothing bounds var->pixclock on the way in, so a mode
> > > set can ask for a clock the loop cannot represent.
> > >
> > > Consume the return value and reject the mode; hw_sm750_crtc_set_mode()
> > > already propagates a non-zero return. Initialize the structure as well:
> > > sm750_calc_pll_value() returns early for SM750LE without writing the
> > > members, and returns non-zero on that path.
> > >
> > > Fixes: 81dee67e215b ("staging: sm750fb: add sm750 to staging")
> > > Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> > > Assisted-by: Claude:claude-opus-5
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> > > ---
> >
> > Greg is not taking AI patches unless they can be tested.
> > https://lore.kernel.org/all/2026080354-skater-urgent-31b2@gregkh/
> >
> > I kind of hate AI commit messages...  They are so verbose, confident
> > and reasonable sounding.  But they don't answer any of the real
> > questions I want to know.  How did Yuhao Jiang find this bug?  What
> 
> We're working on an LLM-assisted system for vulnerability discovery,
> and this bug was found by the system and checked by me.
> 

I feel like this is always part of the story and should be told.
Regardless the firm rule is that everyone agrees on if you can't test it,
then that needs to be in the notes under the --- cut off.

(I sometimes skip this, but I've been doing this for a long long time
and everyone knows who I am.  I should follow the rules too.  #shame).

regards,
dan carpenter

