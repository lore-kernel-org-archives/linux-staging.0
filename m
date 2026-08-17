Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A9C3F54B7
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 09:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960767; cv=none; b=KnBI7DR3MISVUnwDvSbbGRn5XZAXdP0mCpw5M+Qiro10FivCkc6tCM+ny/diy9euyLb+hVzskN0GuVS9DQwtEOaRxnRzcAfAf1FprS/uVPig+dZ7+i54CQ9K7mAp4VIi8IHmVIf117ZNh5gg2R+/uNQmusoVCywz3yANLdVSir4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960767; c=relaxed/simple;
	bh=CBhBOxKW9DXkHE6Vdw9XCfb+WTJBsS8SlILHHvnc8TI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=No+xOv7y/4L3Eya3wI6c04Ra+HdMwnD2LXCuQInaIs/ngcnRNsGbyxtJVznmDIwaulrioxWQAfyuK3jZP6P0DcjXfcCrkKnzcP8ynTOuKMBNSrhZgPzxAXd76J0UjQ7+U2swBtHnLRw/qZo9XxEM4nB9y4UEVpeM1wnYnohGUj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtxyUBTH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtxyUBTH"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495590dde14so39800265e9.0
        for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 02:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786960753; x=1787565553; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n63sUKQMdSKf2IRWefDfMPcW8wjg+n1z3lYjhlrIgr4=;
        b=BtxyUBTHKWvTMwo3oAh5dEGLOB/ZpIPY4G3fS9WpEVMhhH1QDKSivcvehuQpNmd79c
         9PDHxIh8KBcYGzYPVefO/chVohrIZcp3eU96I2k57/rVtDBAym+AujXA8HftD/rIUWJI
         okoM9ZecJfuBa6/d0SmOMnHN/9GuDkb4Y81dWOeqn2AgVbTXm9CKgym082YtTYDGtwbt
         euVBFRSNGIhpzFf9D++FW+JSCbTuBDAiEHMvyE0E33eFgRLS6d25lVqVLQRxAy9WfIQP
         srE5jCT0+uYZOAeQwdjTtDwUXWHloEWAI0cNqEOXF21ae9PAmnYr1DEqOIZnIlCcsJ30
         CbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786960753; x=1787565553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n63sUKQMdSKf2IRWefDfMPcW8wjg+n1z3lYjhlrIgr4=;
        b=H4qU9wcfuPu6cArChPNu2o8JGB70HB4bsaDsjZOT7PEcGGLFkWFx8Zn4C65SBnDzL7
         ZZw0t4IlVqzceGt8ErWIrbX6qgfSWpAJXrkvwVgI1t+qRBXvsCvXxLWRJQVdkhXhAUZY
         OQXXMeok++EUB8O/kFUlrlzPdda5FcPdZ8ExBJNmNc2wBJFiA4AWubkl3wJVNZSu/jXx
         7+atf2bH/5L+WIdtrdpvNw0fVb6sVO7VoS8NJh0yTYYPlj1CyPLuk2gePiuctpHQbP8X
         HRj/iO/RdXXIky/dk75ozR9ZzYFjRtXFU9Y6sxN9ggQLh8m+6btCbRoWV+hx1Qzq7Zy6
         dA/w==
X-Forwarded-Encrypted: i=1; AHgh+RocCe3PCwT8HqLHjaatDAVWPnwrNC/eYulTktVC+zFnjSRt7wULIMPl32Ltzr5IfJ68y5NSxE6qO1MEtNF6@lists.linux.dev
X-Gm-Message-State: AOJu0YyAQywqAxNwrz0Qr2O5kUCW/T8pihWaKdTIS+Bu8KYq1UFv5mZ4
	ekizRNmh6h4fqA/eHo3IFJ+dkDKe4rMdGjkGnnhO1BzYm/37lbOGI4Oz
X-Gm-Gg: AR+sD12OKLu2DSS1MS3zNA03PAdCgeZgW06aD3gk+lS7xHCbLJymyyfgaxIEBIaCuSo
	HxOxZXV7DFwCSe1QYlgElp74SpnFp1SDnAmJBObP4arSJnqwycQO/8juODE2bbhnR6/im7YAw3r
	J2wIkEpi3MPnjdV19nvs0DPdw7VjplR+/rfQvgQqeMrpg9oKt8E5zmjSS1Y0bQehIg3hoVFimcz
	0wecNA/becVIdeSxenYOMrxctVdjzMrFM7e+t71dQlrp4WcXBQiO+hJ0UB5fD678+afBbUNLGJx
	EBEh2TQFIUGxvWgSQHTRdji/TSNQvyILp5J44UL6cAMIXdaGS2IJwCYcDjuj1UYn/E1ER52yI2m
	XJl3PU9XpQE8alMWAn1sYKhq45rU4qWGk+O7lj5ENxBTI7+Bgq6sCm1t+zKJWbgar2YpSHIA0EG
	Tr7T4gPQYh9VQF3k7w0Ol/7iWt9igteStmvpuDpwuANWVWmwr+/HuGg92FKQ==
X-Received: by 2002:a05:600c:500d:b0:499:86f5:9e33 with SMTP id 5b1f17b1804b1-499879bc10emr392118895e9.18.1786960753464;
        Mon, 17 Aug 2026 02:59:13 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:9cf4:43df:e612:817b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b7cd38sm2863663f8f.32.2026.08.17.02.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:59:12 -0700 (PDT)
Date: Mon, 17 Aug 2026 12:59:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: moonafterrain@outlook.com
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: do not program the PLL from an
 uninitialized value
Message-ID: <aoLbbZ--FrkVN3SU@stanley.mountain>
References: <20260817-sm750-fixes-v1-1-978c617e5a20@outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817-sm750-fixes-v1-1-978c617e5a20@outlook.com>

On Mon, Aug 17, 2026 at 05:13:53PM +0800, Junrui Luo via B4 Relay wrote:
> From: Junrui Luo <moonafterrain@outlook.com>
> 
> sm750_calc_pll_value() writes pll->M, N, OD and POD only when its search
> loop finds a divider combination with 0 < M < 256, and returns 0 when
> there is none. ddk750_set_mode_timing() discards that return value and
> calls program_mode_registers() regardless, so sm750_format_pll_reg()
> reads the four members uninitialized and pokes them into PANEL_PLL_CTRL
> or CRT_PLL_CTRL. Nothing bounds var->pixclock on the way in, so a mode
> set can ask for a clock the loop cannot represent.
> 
> Consume the return value and reject the mode; hw_sm750_crtc_set_mode()
> already propagates a non-zero return. Initialize the structure as well:
> sm750_calc_pll_value() returns early for SM750LE without writing the
> members, and returns non-zero on that path.
> 
> Fixes: 81dee67e215b ("staging: sm750fb: add sm750 to staging")
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Assisted-by: Claude:claude-opus-5
> Cc: stable@vger.kernel.org
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> ---

Greg is not taking AI patches unless they can be tested.
https://lore.kernel.org/all/2026080354-skater-urgent-31b2@gregkh/

I kind of hate AI commit messages...  They are so verbose, confident
and reasonable sounding.  But they don't answer any of the real
questions I want to know.  How did Yuhao Jiang find this bug?  What
did the symptoms look like to a user?  Are there ways we could
improve our QC process to prevent this sort of bug in the future?

Probably the answer is that the bug was detected with AI and we
have no idea what the symptoms look like.  Everyone sane automatically
initializes variables to zero so probably there are no symptoms.

So the problem is that the user inputs invalid var->pixclock, and
it leads to an uninitialized variable usage.  This patch addresses
it by initializing he variable to zero and checking if
sm750_calc_pll_value() returns an error code.  Either approach on
its own would would fix the problem, hopefully right?  So it's a belt
and suspenders approach.  But isn't the real solution to reject
invalid pixclocks in lynxfb_ops_check_var()?

We're not going to apply this patch because it hasn't been tested.
Probably we should invent a new tag so we can create a TODO list
of rejected AI patches.

KTODO: investigate unintialized variables in sm750fb found by AI

regards,
dan carpenter

