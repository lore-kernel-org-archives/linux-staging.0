Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14A5256C6C
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 05:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774936666; cv=none; b=oUSCsXspQjLkTCvbGbvBATfvwjuAuRBqqZ3xKwY4n6wydW3zlE92HU2Eiu3gOZQMR8+8fO1fNk8p59rrwFNpPmdWCHxYTHcSPtVQ+cZQcmOq58Qzow5tdv1e0rbxaat75eyr4pigsek3Y0CXiDe3FzXf+N5trdKs8pYJ3BWaMpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774936666; c=relaxed/simple;
	bh=MN19Dt2tgg7qpdSYdh0P0F3ljO5qjqclY2MWA50tjCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdpNpqvXHf7ETRo2gotJN8/egJl2M8bGSfunuKy06yYytuOp0onxEmu5YwZcXAif64ez7O6Uno8NE2MApKNs1IdDRai7G1/ecMJC4BUXq66YC+Ci3r6/trjZ0JE7jEJmZriAvtre/Y/tPq2sOlS0Vwn548AAM51ZJwN1Fc1nWSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlqfOc/P; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlqfOc/P"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cfb723698so1426693f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 22:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774936663; x=1775541463; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G58gU/Tx5GYmRFPwnfdaPc4pW0qhkafR56frkg81+YU=;
        b=TlqfOc/PmHHEMRqLNd0e4IhE2XqbFcfzruqA0634Uko7PLWdnv9dIKs75qiiUaiv7+
         vW/YY7XPPvoa9XznmlA7BvR6i4+puDg4smj5MS/aAToOlGTq7zpSFdLfTc61y0bgirEQ
         cZBB9QeOcUsnon1NcEOd8M5hsFzoDw9XIf6wAoE0mc0lGfFv09P5bmlDI7MSibQrAfjR
         aTgOMneqV7n/+fIIOnHjhAbSNpNxJ7Lv4s5g2+XWAWiMJbxxdxApPDWjqoFWB5JoC9Nh
         kIztQPPNaMGK/Nur6ujACe0romZix0aunvLXvQEr/DMByBvHonkwC5GnK0fswURSuPsf
         NVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774936663; x=1775541463;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G58gU/Tx5GYmRFPwnfdaPc4pW0qhkafR56frkg81+YU=;
        b=Y1xmh9Nf8zIdv5lo2Avqw6iJ1Dq+tPLRtlLLeuQIGoTuteJjAaLjcGRiYvc7JXTfOU
         6z/kPELQOHxtaSkkSobhXRhJhjAUwnfG/8OTiDTHw+ENR/tnZyNtjRc4jReRi2mUVTx7
         e0NE1JopWi1xF1qYJxEKXA5QTEonrJJ5ZPLFpLKPO7mX80UbfhZVPIjSULrrb/XyYWtb
         WIuZKA51KlDqb2Bkp99jg3dHbKDoeUkmYYS9ON24XDYtu80gbcGp9kzS2O0JTaCZRU55
         OJlDKv5zXC/vBQOpWaZxBvTgXDqgFqu4vApTXg05DUOo3HCwezjLxGeSUYkU1kk8TeWr
         hGzw==
X-Gm-Message-State: AOJu0YzsEpFIoMyQ41oJMnZ9EOsdovtyOq2PBzg9W0fuDRveoz9NL7R+
	+T8T2rkQffoFWoKJY74RcFDNKBGlX+fnB6EmKaCodYSMnGzxkmMhlg7x
X-Gm-Gg: ATEYQzxNiMwD+oZ03c9gBiAtr0nOj+Kn9r4pLwUMhYXkSxfKdoJQuJcGOERFQRpwC51
	K0HFP3NbpDj5PZkSybSjWW6ZjFxVHSpsa0o1n3KxNtZNEvrIK2I/nZvq6/8RyCa6Ljk5vcOPQWI
	MxSEp1R/yJcAwtSCdz/q9YZzXA51cYMIWHq1P4oYA1jJwJq1GdxocgwcAsXVLk1t7e3NzwS/j2H
	cQI29++CQErNaVMiYSch/KvMfXhqnnCNECmu8RT8YBzGKPUN4Hdh4x6fM+vd39Z6BWhJU1S54ZR
	8+1xAXiL7v4X6BUKdKjgiAkJqmFQHKuNA7hBtjY5MzzNYBSzUW18Z6VVMqPDM9SvtTAALlQQNWi
	e0SR2K77yJzSSaW9OearxQEI3fdQpt+fwvUJZF2Ln6bv3LMK45kFuNMH+wRzQnryZ0ujwrARgWB
	MoSPGpMizADVnTAlQvPgesqEl5fXpA7g==
X-Received: by 2002:a05:6000:4027:b0:43a:580:f60d with SMTP id ffacd0b85a97d-43b9ea4a5b4mr25852858f8f.35.1774936662981;
        Mon, 30 Mar 2026 22:57:42 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1882:1f28:c460:96ff:fea3:6e21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf90424fcsm19431092f8f.32.2026.03.30.22.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:57:42 -0700 (PDT)
Date: Tue, 31 Mar 2026 07:57:39 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alan Cox <alan@linux.intel.com>, azpijr@gmail.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] media: atomisp: fix potential NULL pointer
 dereference in configure_isp_from_args()
Message-ID: <actfdnYcTbqg0gvW@gmail.com>
References: <20260328192721.255493-1-azpijr@gmail.com>
 <20260328192721.255493-2-azpijr@gmail.com>
 <CAHp75VezSSid9b5qNzvMjUS7QTJaKtBhhVVnuS+-sjVe_a=CxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VezSSid9b5qNzvMjUS7QTJaKtBhhVVnuS+-sjVe_a=CxQ@mail.gmail.com>

On Mon, Mar 30, 2026 at 11:59:24AM +0300, Andy Shevchenko wrote:
> On Sat, Mar 28, 2026 at 9:27 PM Jose A. Perez de Azpillaga
> <azpijr@gmail.com> wrote:
> >
> > The function configure_isp_from_args() incorrectly dereferences
> > args->delay_frames[0] to configure cropping without checking if the
> > pointer is valid. However, as noted in a FIXME comment later in the
> > same function, delay_frames can be NULL in certain pipeline
> > configurations.
> >
> > Add defensive checks for both delay_frames and tnr_frames before passing
> > them to their respective configuration functions. This ensures that
> > optional frames are only processed if they were actually allocated,
> > preventing a kernel NULL pointer dereference.
>
> Have you experienced bugs IRL?
>

not really, I don't have the hardware, but while reading the code, I found
it to be logically inconsistent. imo, the comment is misplaced since
delay_frames can be null earlier.

> ...
>
> >         /*
> > -        * FIXME: args->delay_frames can be NULL here
> > -        *
> > -        * Somehow, the driver at the Intel Atom Yocto tree doesn't seem to
> > -        * suffer from the same issue.
> > -        *
> > -        * Anyway, the function below should now handle a NULL delay_frames
> > -        * without crashing, but the pipeline should likely be built without
> > -        * adding it at the first place (or there are a hidden bug somewhere)
> > +        * Safely handle pipelines built without delay_frames
> >          */
>
> This comment suggests something different. What the proposed change is
> doing is just skipping the invalid data without actual understanding
> of the root cause.
>


you are right here. I should've done a deeper analysis instead of focusing only
on that function. looking more closely at how the pipeline is built, I found that
these frames are intentionally skipped during allocation to save memory when a
specific feature isn't enabled.

the configuration path was just ignoring those enable flags and trying to use the frames
anyway. instead of a NULL check, maybe I should try gating these calls behind the actual
feature flags in the binary info.

if this is a better approach, I'll send a v2 with these changes. :)

...

regards,
jose a. p-a
