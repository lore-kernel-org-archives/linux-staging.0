Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7B626B2BF
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 12:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115935; cv=none; b=HhBXsStLi77nUb7IpGTFSA03iiSvEuTzYMUw4FWLfurVrsiE0SJfouU+CPDJs4oJRhn4RJBu995gHf2w6OjnJA8Jknb4j1GKVpG6/4gjShgGpXFaElD62Z/pj6aoVVxoKJqQt6MHoFZTKBjjODg0mI+Q2vl3fhv8VE26Ebo46t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115935; c=relaxed/simple;
	bh=NqYCaveDwpAIt1x2KdsDvs5kPnVeLmUlgF894FRLUGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7KjT4H2FJtJyJS61GRAua+ZwCuNmty9QpDYuTgbLL3TtOuO2TvFMGVTeEqvMP/MtuLaobxjUFzX0r08kCdRjpRQxirgWb8I17U9+9l6Mn0Dsk6MyOwc7hHe0bcNTZK6vEsNjvwF227SOQ2WIrlKIfqrbsxC3G5YsK25ux5bsXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G3oxR9i8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G3oxR9i8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so47868935e9.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 05:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744115932; x=1744720732; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rn9ss1yxmQwnJyUV95D+HSfB4HdDzPSaOZFKAw2K88k=;
        b=G3oxR9i8jNj/6w7/exoj8yn5Mjj78fmIcLzV7UFafuRy0Zm1NTTXu1k+jtZToeH1NC
         WCyQpE5F23al+X9MthJjFXiw4wMaabKapJcBiZIFv2ZjTXFWmMx0ulu5cn/OYBzQ38Nw
         0kFpqVoiH4yRyztftvrLGSJmGgFfVhjM8JY0ZmV3Lj3y7jHKFHiQ9z9AzfhponQzbXby
         P8NyUga1GyHL6yO2D1gQPbCJ2SHIRJ1v9dC1Zl11Ct0bpVnHwnXLi7MIEQeQJPq8uzDK
         xHRZmjuLO1tpXVpX5oUjtcmWOrpoGIbDVXvob+jHAxVFT2ONMRSwx0F6511uzU9wHi4i
         SfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744115932; x=1744720732;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn9ss1yxmQwnJyUV95D+HSfB4HdDzPSaOZFKAw2K88k=;
        b=Xptxq2gQsspDLK39tXnVfCe+Zx14pAXtCroeMcdAY6Y4MnwjQ9qVuopDGvG+qtgKz9
         b1WPnEQiLK5ZupKykL9nipThFX9YdYkP/kQyHRZgPaJ5aI9i5o7rggyuvgpaj4lNMMA1
         MvierIGeCb2padlXOq4s4NO6lhEOcKH92MyHqfeJUT4/Pjlqv8pO5FXZZ6x+S41tfQaz
         UPWm6lqfwmQgEZHSccprRbnZGIDToyR/gkjNCpHGQcLoCGJvATEsjU97bga51+1xyaV/
         RlB+Hz6fzSqicLxkJKT/WW/BpV/4QOwmYjpnudCSp3BjxjksuAdb923ZzCiNfwT3P0Vz
         PlsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+FMRaONJP7bKYSDPZkPNk8YPKcjEEkJN4C+Vks/MS+3VZ5YzzlFzViU2PovU666vlqFbjckScKHlNZdYX@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1sAN39utRdT2LofGY7wLAF8fz3MDjpwvgiskKkkgUXSCpRPEl
	2YT3+YuICeRfavwr/ruV8WJKn0GECLowpXmsVRUZZF1oz33Q6htVxCSgrgpwaEA=
X-Gm-Gg: ASbGncsD7YIl1HicdbTFjoI/6MjjE3c/w16QfUGWsytZgDtQDYtd844+ZVYLRxLBhhR
	g4UoSC4XlB6pmMXenghKW+orIlUELiq6FDgDLAJ1xhyZgrd8M+RXdyE90t81QB382qAeLeyq//k
	+euE4YRNiLJeIUrkxobbKQVJMaqbqJ0sV9oazoTX2Gca1QkUJgIwg022NR8Y1OvWLZ17uCws0IC
	/YCYJRysRdzyKVCu6PFmC+yt0t+bGjSlM3Yr6aXzMEx9ToBrWWBhHMsOUeBvwbdUWyGJtmIh6Oq
	FXgL6OA3+KazdcSHK9fujVt06ac/UCWQeWlVdu/x5Lbj2evo+mNP9a6TIs8q
X-Google-Smtp-Source: AGHT+IH0ezpsw6joFG5u0i+oleM2OUdvMTlCjJ+UKe9pO6svSA6q2+87K6uPXZPon+cGjtbHyWHtMw==
X-Received: by 2002:a05:600c:548d:b0:43c:fa24:873e with SMTP id 5b1f17b1804b1-43ee0640f37mr125138635e9.13.1744115932204;
        Tue, 08 Apr 2025 05:38:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec1630ddesm163278175e9.5.2025.04.08.05.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:38:51 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:38:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Samuel Abraham <abrahamadekunle50@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, outreachy@lists.linux.dev,
	gregkh@linuxfoundation.org, julia.lawall@inria.fr,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com
Subject: Re: [PATCH v6 1/2] staging: rtl8723bs: Add white spaces around
 binary operators
Message-ID: <7bcdd745-539a-436a-a0df-bb2cd8dc7340@stanley.mountain>
References: <cover.1744061673.git.abrahamadekunle50@gmail.com>
 <4ccdbfd3e8d74d99679927f294f71cfb694fcc6c.1744061673.git.abrahamadekunle50@gmail.com>
 <CAHp75Vfp8Je1fUavSwTDAM_5_rDaDfXETa2oM5f0CjL1mxWX_Q@mail.gmail.com>
 <CADYq+fbh=kG2JABmdF8FjjPiyigMpnJ7WhQh+faqRk6FJe4MBQ@mail.gmail.com>
 <Z_TtyXwkOBK1MXGy@smile.fi.intel.com>
 <b89c8837-4aa1-4073-bb09-f71f37b5dcc6@stanley.mountain>
 <CADYq+fZ-LmoyGrAFsEHBwM2WJthpqGYhPLmAJ3Ea0B=NvmC8aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADYq+fZ-LmoyGrAFsEHBwM2WJthpqGYhPLmAJ3Ea0B=NvmC8aw@mail.gmail.com>

On Tue, Apr 08, 2025 at 12:51:03PM +0100, Samuel Abraham wrote:
> On Tue, Apr 8, 2025 at 11:36 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Tue, Apr 08, 2025 at 12:35:05PM +0300, Andy Shevchenko wrote:
> > > On Tue, Apr 08, 2025 at 10:22:44AM +0100, Samuel Abraham wrote:
> > > > On Tue, Apr 8, 2025 at 8:20 AM Andy Shevchenko
> > > > <andy.shevchenko@gmail.com> wrote:
> > > > > On Tue, Apr 8, 2025 at 12:54 AM Abraham Samuel Adekunle
> > > > > <abrahamadekunle50@gmail.com> wrote:
> > >
> > > ...
> > >
> > > > > > -                                               psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
> > > > > > +                                               psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq + 1) & 0xfff;
> > > > >
> > > > > > -                                               psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
> > > > > > +                                               psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum + 1) & 0xfff;
> > > > >
> > > > > You mentioned Linux coding style, which also requires lines not to be
> > > > > so long. These lines are. That's why a few versions ago I suggested
> > > > > you to change these to be two lines each. I don't know how many times
> > > > > to repeat this (it's third one).
> > > >
> > > > Okay, sorry
> > > > I will add a third patch for a line break before the patch for %
> > > > operations since each patch should handle a single thing.
> > >
> > > I am not sure you need a third patch for that. It lies into category of space
> > > and indentation fix.
> > >
> >
> > Yeah.  Let's not go crazy.  Do the white space change as one patch.  The
> > rules are there to make reviewing easier.  Splitting it up into three
> > patches doesn't help anyone.
> 
> Okay thank you Dan. I have collapsed the spaces and linebreaks into one patch
> 
> >
> > In staging we say, "Fix one type of checkpatch warning at a time."
> > That's because it's a simple rule to explain and it stops people from
> > sending us huge patches that fix every checkpatch warning.  But this
> > patch is small and everything is related and it's easy to review.
> >
> Thank you very much for the clarity. I understand now.
> 
> I already asked Andy, but I would also like to seek your opinion on
> how I should version
> the next patch. I already made this current one v6. Do I send v7 with
> changes in the cover letter,

Yes.

> or changes in the individual patches?

Both?  Put yourself in Greg's shoes and do whatever is easiest for
Greg.

regards,
dan carpenter

