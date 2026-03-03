Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2572E37A4A1
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 07:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772523975; cv=none; b=Axf5efHp+629Pm1Ku01F7+LpXyNpSJ/EhnmoqOd1Ka4xM7etDPuh+ExYVgBSfAN5c8o5PvwHfenis+owKM0qQQZEpW75x9OSWu2o1xYHOLEUL6WN/osUkVu84bV+InGqY8mgKbEKXAEvctveD5N1OlZYTNBt4FiNAekLKZmgjiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772523975; c=relaxed/simple;
	bh=XUgXWPf3SyUgvCnzVhMK2d++T0WXAdPoyRVh+ENnBQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+KtHToSM8Vx8eLF1/tSrlPDGpkwpJiyZ6Fb5D0V7A7cVARbuReVepGryjzKsctw2SGCccrBuKJeHt6ZAO3FW+n6o8E2TLS+DAzKG4Cq6JT5mz9e1SBH6sg8bVXmBT+51TdNiwLBCtJoDvV1fZSi9mCWvcjG9C5U2laU123rLrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GMMaaf9z; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GMMaaf9z"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439b5d78592so1702433f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 23:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772523972; x=1773128772; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uQI0TrqhD3HkBPBxyRgMJInVbj1cCdFEqR/BsY7T8gM=;
        b=GMMaaf9zLiyKUMKAtqQ1Spvkkoz023F/hRAPJhFoFaeRXRWQspN82XkTQ1/98wJkAP
         JCRtMnq80kSFLdtJhIDaa1w4vGmeEfho4Qp4zDZOIVRuDT6E5owS4IVAzvht6thV+9cn
         NXW0ox9dOWNhD30WCF5jvoZZuXVtASS/GMYgjjxMBNmt9/orcuWXyNMDU/eaZ/bvqfCE
         vb8IW+9LLIaUlCXnWDnK0AUlnoSYzhOOPCC9puMONwx48hwBVvhWIakRt6ETsvluQYzj
         l/EpB/K1eYysD2s9I8EJIGqRnmi3tJDb4fIcaFY9XAmf0Qe/rrneppI/koIBiGsviD73
         QlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772523972; x=1773128772;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uQI0TrqhD3HkBPBxyRgMJInVbj1cCdFEqR/BsY7T8gM=;
        b=N2WyZDotcS36IhO8ehV+fwm2UaO62Dn4bpoIx/bpwTGKn4z8LFyj9x/8ejVwdz7cUY
         rrJIOc8EQIapp1mVl8VD5gA1g+afzFKSl0Rlb0CQGMT6wsv+klH5IApQtyAjsSUJbiKU
         blTBym8li33V7uWNtA3+VioZFNZXoJlrbt4L22uRDKqSuNGk/XkkhNpey5VNl0EtU9jH
         iONouLQEvYLZ7lsbs2cjOMdCqpEvelpY0X2kZ0adtnSnjDddyAbdAkaIXt/MpbcQeVJV
         WmO0rQA0QQ/Y/C0BA1nu098RFw8Znye25Pgz3DLXsK4QM5x9HjzfivUbA0PsR/+j2ITN
         Gp1w==
X-Forwarded-Encrypted: i=1; AJvYcCWUil755ljtKg/vlQpGyhbFp5OJ80T0DhXTr+QGMKCNUKKjKCqHuzjFOL1LT+IEpyvl9A7hGU/qXnmzZQxq@lists.linux.dev
X-Gm-Message-State: AOJu0YyUNaakIIzRt0triLuMfubjxYyWcL0EG3HBVw+ldl3ffWRRFVrj
	680SbbdqlMKEysD0uwMLt5bibBqHMWyM6GjoiO/5oSN/X6o7TuxXjHe7VQjrMWZ6enY=
X-Gm-Gg: ATEYQzxXAYs+KbGbtmCcpziqYxfzWc3KE4zzC3H69ajiAF8fnpP2giw2Jp0s/rTZrC+
	MZoWe2907PKOQT/d0DYXSutlKA2lnvvy/P6v/gNgGuYXNF0fE17GGX8Bqf5f8zakS6nF9fmbRIz
	P0m+7oIboS7bK2+0V7LmlBDVLoTUGZat4+04BP3tcWIr2Db9jFlEorrAMa6f2RDPVMGBUm1bFJx
	KLBZKlKobS27B9s4BrIRCoS4ZlWh8SJKCSIj4L/K9Pm7FWg56SV/z1pVTt7VLIvd8qfqbCprZbs
	2BXmNbvi9nApkSETWAX166cuZxNQZbaL0EHuNhX6rRMTXVGOgts+BBVqBRBjVdNMiRWOboiWAVy
	fOfy6KhT2DQ5mcAxB2IteDiVhwvJvaRJiGambIQ3cuOaK3NdkjHtHmQNSXhKBxQXuNb2RBsClaL
	brn+0cCzVG4xMz8INYnrpA/XJ7TnlH
X-Received: by 2002:a05:6000:1447:b0:435:9e32:2b78 with SMTP id ffacd0b85a97d-4399dddbbb3mr25659593f8f.1.1772523972398;
        Mon, 02 Mar 2026 23:46:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b03db76bsm18080299f8f.18.2026.03.02.23.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 23:46:11 -0800 (PST)
Date: Tue, 3 Mar 2026 10:46:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Josh Law <hlcj1234567@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: Re: [PATCH v2 05/10] staging: axis-fifo: improve IRQ handler
Message-ID: <aaaRwNJ8lIOqVGEe@stanley.mountain>
References: <20260301214815.2628942-1-objecting@objecting.org>
 <20260301214815.2628942-5-objecting@objecting.org>
 <aaVEsCIacXl-kuxa@stanley.mountain>
 <f8772114-a495-409b-a590-a9b1d8ed1d41@gmail.com>
 <aaZ7QfW7cFAJ4m0R@stanley.mountain>
 <239a788f-7ed4-4bd2-8ad7-8d0783bcdaf1@gmail.com>
 <aaaNZ99qFZ-1nB6I@stanley.mountain>
 <9fc10794-0ffc-49fc-a220-bd911390bc59@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9fc10794-0ffc-49fc-a220-bd911390bc59@gmail.com>

On Tue, Mar 03, 2026 at 07:30:30AM +0000, Josh Law wrote:
> 3 Mar 2026 07:27:39 Dan Carpenter <dan.carpenter@linaro.org>:
> 
> > On Tue, Mar 03, 2026 at 07:02:19AM +0000, Josh Law wrote:
> >>
> >> Lol, are you gonna approve ANY of my patches haha
> >>
> >
> > The life of a kernel developer is full of heart-ache.  I recently had
> > to redo a v5 patchset because there was a O vs 0 typo in the
> > documentation.
> >
> > I believe you resent all your patchse in this set, right?  But the first
> > patch is obviously auto-NAKed for not having a commit message so that
> > kills the whole thing.
> >
> > regards,
> > dan carpenter
> 
> If you tell me the patch number I can do a commit message

Heh.

I mean you sent this patchset as a lot of individual patches and I replied
to those as well so the discussion is all spread out.  I can't find all the
things I said.

regards,
dan carpenter

