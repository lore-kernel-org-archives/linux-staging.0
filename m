Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC83B2E62DF
	for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 17:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750786352; cv=none; b=EP5viAv1IoTm9aLynb5uGcgsPsUiHXcZRwUTuwIj0ABAu6IyLWSS1JiquWkWPmCfaCfiNHKVcwdIkIObA28c07sWpfLbi1KxOzcPdZq17L4tUfHi/qe1RpYZYCIe260hkE/gcMhRZe2ns+czUHeNLOiq5qPlt1it4ZPhX6YjNPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750786352; c=relaxed/simple;
	bh=5zXOGQHtuzqMdDTdTVm99Sp0hUHS0qO9OFTXoiOPRec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUarCzNXDGib8P2QhyzjLPgY5QFtA5lDk71ozdVnMckM8vyGg5/Z6Vtr7VVoPVbFVQXZx/AGyltHsczHaV+TlwINwlmX/nbGRdklVITKiZyhaZqwiouL7BBtMraeCV1vCc45HGDiqMqJdabVDm+gTPafyYTI/kKkGRohUpobCXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ty6YIBi7; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ty6YIBi7"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-610d86b3da9so180622eaf.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 10:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750786349; x=1751391149; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dSGDqT2il9ocDCmHC7EaO2CWRkrvX38ACbyIKYy82e8=;
        b=Ty6YIBi7+KohQa4ArJIia4J27NA0Q2/Ku9LHI+P4O+bqUHDMf813juLEgWn2fBHoSp
         HbgkIeQYA6eII/BhO81lUNy+J1WU7XDTmdtfYDcn6rv92Y531gOtwcwPiqG3+37D70xG
         zYXOewKM5aYVYd85m4kfGPZ4wYR09P4bLd50M2p93lc6wVQ2q+N9lvvnJ+CYa5EaSWTg
         CtJjfwOzWnmIt5UuyMN+WnUfJqNaAx9p6ywWl5Tg7u/q9f6V62t8ExtHr7wazbgkO5h2
         sObBDcHzmeEFMJX2dbYBjdjsGQrnWT5KvXp8qEiT2M8PT55XTdEIKx8Hm2+MoJZibeCb
         pzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750786349; x=1751391149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSGDqT2il9ocDCmHC7EaO2CWRkrvX38ACbyIKYy82e8=;
        b=sZzbFWLkb/5HBHBN0JP3cWN5w61rDD9SBlFIsystuqdjVFhmbrGYUkinxbnkuxNx+Y
         34QKK9GRqQFe/wpceeJg1mojzY5JVLtnZl0xN4ok7UrMqhF6o16j7VkKgE52UxuQti/M
         Jr2OHONsKctySJ6nBUTPCRB5QKmDqFx5MFA9bkhWBSPWCHFH2rosBI0N+Lo5imCcJd9A
         mnCAnv9nVDBDo5HqfbiuinE4vBM93Y7sFCYao9VNc9wugRP4RIgnsSj5zergzDVI8bwc
         ib8NC4Qveqp/7zUEDnYFKQhQTLFAQZ9PAx7hFkx3jen4zoK5vT1zw1u+OHTCRrVlgrsE
         qXfg==
X-Forwarded-Encrypted: i=1; AJvYcCWIf7/joKvg/8dXuQ5gZnA/EgTXEoz5z82qWI69E2IBk7IlXNDgP2KwGIt65hmaxIeKUWCUBULFWppXnhzM@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt7wWhjUdtllBFTPmbM2FpDmHqA1ZsfWaE042vTidSLti3zzAC
	q9q7aNePElykFAU8g1Pp1YEqUbx1I+An8hWESlgjbsTmr7tL84EUd4cJsTYsPFnSID0=
X-Gm-Gg: ASbGnctaAMc3UWWwmKrmFV7I9VAm03WmW57Top2J2sbFzsrNKl4gtEQkXwd5aaTOkjs
	Q7oP37Zf0C2rz+tRB2/PGtxP5HtccqM9UivhLgvwQ252g+URag6dS8GO5wpt4UQHcdm0PXf86FR
	aualnLRA1sTpNgnZPtgwrrelx1raVzD/eNrl7fT2B8NEon2CNDYeim3P7cgJ2Ov6mAo3UAnGb99
	pOlZ+llEUOK6siuDaRjytFIuJFGpPE9PFapRhODB7qD9eR1Cu+YQTpSUTcTdPUcdZREszn9N/Ju
	64ZaQdYmFb5HwpX5OSQYgT66cxNAQsWEyaEnM0WFtY6GPYPOzL5kVUHntuNuIewvmsW+pwsxFWc
	KqoGe
X-Google-Smtp-Source: AGHT+IHP57I2IEpZSZTYdkWPLpjlVv9dwCTYMhHj4ANtmM8o/tFTjl/Qtb1NAxmUKgDIueYRW8AITA==
X-Received: by 2002:a05:6820:1b05:b0:611:5853:3ecb with SMTP id 006d021491bc7-6115b734ecfmr11470941eaf.0.1750786348746;
        Tue, 24 Jun 2025 10:32:28 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6115b7f76e9sm1317795eaf.39.2025.06.24.10.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:32:28 -0700 (PDT)
Date: Tue, 24 Jun 2025 20:32:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <5ce9dac3-0b7a-45d1-8313-2f65165b50e7@suswa.mountain>
References: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>
 <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain>
 <CAGn2d8ML8eTcN2G18B7FYkapROnOeAKJir5fJvOXDdXTLY43aQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGn2d8ML8eTcN2G18B7FYkapROnOeAKJir5fJvOXDdXTLY43aQ@mail.gmail.com>

On Tue, Jun 24, 2025 at 07:51:10PM +0300, Abdelrahman Fekry wrote:
> On Tue, Jun 24, 2025 at 7:31 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Tue, Jun 24, 2025 at 05:49:43PM +0300, Abdelrahman Fekry wrote:
> > >  int hmm_init(void)
> > >  {
> > >       int ret;
> > > @@ -130,14 +48,6 @@ int hmm_init(void)
> > >        */
> > >       dummy_ptr = hmm_alloc(1);
> > >
> > > -     if (!ret) {
> > > -             ret = sysfs_create_group(&atomisp_dev->kobj,
> > > -                                      atomisp_attribute_group);
> > > -             if (ret)
> > > -                     dev_err(atomisp_dev,
> > > -                             "%s Failed to create sysfs\n", __func__);
> > > -     }
> > > -
> > >       return ret;
> >
> >
> > It's really unclear how this "return ret;" is supposed to work.  Was
> > that part of the sysfs_create_group()?
> >
> yes , but still it can be set by hmm_bo_device_init so even after removing
> sysfs_create_group , ret value depends on another function.
> 

You're in too big of a hurry.  Wait for a day between resending patches.
I have looked at this some more and it turns out that nothing checks the
error code so the "return ret;" doesn't work.  What do you think we
should do?

regards,
dan carpenter

