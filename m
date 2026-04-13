Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3008930BF4F
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 05:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776058867; cv=none; b=HrHOqUY7DZ7xPMXgIB4twhK1F1M076FYWs0brMeKj1/pXcZGxEQePkKeJjGI+GVszescVVxFmv5YmM7euGcPZTgWDZ86Kgh/8MIePLdlesdH/BmXkr13e41bTknoNbF/riDoIqQFQ3fVf22dhNMunlvrwxWdfYTjXSF3BKwjvpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776058867; c=relaxed/simple;
	bh=Q5Tj0+w254xGVsd/KRBlCvPQGjOgCDtEhBKlkvmXyCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t48J+KmWe8EwlmHQ5r5gaP4Pu5FbqdJKbLlYrtnXSmzyJx+3kJOvAJeQeUyj1PyH6csf9NLgSR6GmCUnJbV6L6Hs79axql5O0W7/mzwb7dXU1+3PAj0gc2hAgDooCz+pu8EsamT6No8RsC2ILQAMnAenIUafVWtP/85XzVCczAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzBsg2HQ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzBsg2HQ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso36918295e9.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 22:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776058864; x=1776663664; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dTmkbvlJt8h/jC4UkITQGkJt+uVKbvg0FZKUsmv0G2M=;
        b=HzBsg2HQw0D2+EQtjuODv4LyVyFTrr1S1XV1hAiRHgaXfh47wojKQm4hxKdmy7UgMk
         DCOgvTYblakuVlBZ4rcrkg+aCElYU864H2ux0/fjwpGO3FN183yFJuP4Cz86er77ioAF
         I/rTWmnL31zXvBgnayU0giOdoSPCodxMQhjX6iL4Z84gWuYHmro0O+oUkq93cd7PblFB
         Cgx9UiKSBMKJzG/12NIsML6kcurPqWOEn7NFCLNNrYKDv5MLZmg+mDS+M4hwY3iWC4W7
         0S/kRFiLbU61hxo+GcC9bYCqTz35FMVuFz2+gMD3jDhWrvSSHrl3gXYgfHiXW52aO0Fr
         /lbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776058864; x=1776663664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dTmkbvlJt8h/jC4UkITQGkJt+uVKbvg0FZKUsmv0G2M=;
        b=DAnsp1m9o46/p5U5K2eqX9LuNENlRTSzUM4ATUqAHuD7VNJTezI3O2GKslZANfTyqS
         StGeQhfqxtffsdrLnc2d36esgnn0jYJUFX2uoBFETQnFjnnkcD3nbT8/8XcwQU1DMJhB
         WV91asNT+yfAQ6ts8SwWcjYY7Jhf5wfAsIIGmj+8DVOdfVhftIUsbvBJR4QtakJPuW7I
         iAHo+iHZqni4Qi3QuYesnYso74uBwbwSbTCwhvldIpwSaYsF0GjQ67eT/TBVjdbuAxum
         IVkAk92Lplr2/+Mr+ojto6PYPqOCGfABQoLsflQv8h8xq8b8+GSpmt9gkyme8w4EVBEw
         +ThQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5Qox22Y5/8i923lY+X+vdulv9rXVL4H/pulINyiF0xdFwRrMl1oRamawvSo2RnAl+jCD/ZPxjtloVld6u@lists.linux.dev
X-Gm-Message-State: AOJu0YxcrMbfaUjGhsBTaS66KhO62LwmXLM3CASuaq+jnmPg6vjlwWa9
	nfabeUIp/iqB5GSJD92QkofQiFcTWgaa6y0b9WIebFetgHcUIWn4cz6+
X-Gm-Gg: AeBDies0A1y5Hi2gXVF8nabQPsrT+c9cZ0sLBcA4nrAI69RgDE3b90mhUhZs4Ruxsq6
	TpycW3o0OBb4azkP0eEfdi8ZQGiGs1tyIKhUIgy6uc0L693GH83fkg2xFDcIye3+goSQRTycL2c
	/4/X7sMnqgJ+MpZ2NLvOMmprPinOFQL+qGxipr++7qiZ1iBCjKZlx0KrXnOyOeA7+NsBdnjUtTu
	SLSMYZxWsh19Vax9Anv7pZwz2b29fMcYlzmRnvf/qxeGDwOqTRwrRMcyk5xcs43COALaqNFmice
	TPlApYTlVFrvkERc0L2+7J3DN0PmZug3xWL67TzIxJVOWDWh17M52Tat+0fbOL1Wu1vTxb6fGGZ
	mfg7UpkR3eG+gjWBS48lBvOzL1rNS1elsnoD6o/qKFh/hosIut0dTMZaRwtIpUuEkTWVFkwbrp+
	QXdPeamxInGEojGBB2LjY=
X-Received: by 2002:a05:600c:474c:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-488d68101edmr147475565e9.10.1776058864358;
        Sun, 12 Apr 2026 22:41:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488e4d0ed99sm79266295e9.12.2026.04.12.22.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 22:41:03 -0700 (PDT)
Date: Mon, 13 Apr 2026 08:41:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: Adith Joshua <adithalex29@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, straube.linux@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: replace magic numbers with named
 constants
Message-ID: <adyB7AAjC9m5so0d@stanley.mountain>
References: <20260411052817.354594-1-adithalex29@gmail.com>
 <adoBQ8skQ7aRXKNr@stanley.mountain>
 <CAFvcH2CjS=HMxt_Dd04eMAELQtxdB5LYmLa_1TLnJeEuKvR6=Q@mail.gmail.com>
 <aduW10V3CweT7Dcf@stanley.mountain>
 <CAFvcH2DQJtB6B9L+SMgg_aPXGe96hw2i6+C1N0uhapHvJQHd2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFvcH2DQJtB6B9L+SMgg_aPXGe96hw2i6+C1N0uhapHvJQHd2w@mail.gmail.com>

On Mon, Apr 13, 2026 at 10:51:16AM +0530, Adith Joshua wrote:
> Hi Dan, Luka,
> 
> Thanks for the review.
> 
> Made some careless errors there... sorry about that
> 
> Looking at it again, I see that the BCNTCFG field mapping in my patch is
> wrong (I swapped AIFS and CW in the naming). The TBTT_PROHIBIT suffix was
> also an assumption based on a vague comment, which I shouldn’t have relied
> on.
> 
> I was looking at:
> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/drivers/staging/rtl8188eu/include/rtl8188e_spec.h#296
> 
> and also cross-referencing with rtw88:
> drivers/net/wireless/realtek/rtw88/reg.h
> 
> And no, this wasn’t AI generated 🙂(I know the choice of emoji could be
> better)
> 
> I'll send a v2 with these corrections.
> 

Please don't bother.

This explanation is again far too vague to be checked.  I would
prefer to leave it as-is until we are more sure that the information
is correct.  Misleading documentation is worse than having none.

regards,
dan carpenter

