Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AA51420DD
	for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 12:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728821659; cv=none; b=L93vGMab33nGantLHHOry777lUamdW9FwXnisSMFYUfbrkCHieJJP7Dj2dIRZs21WryJmdezDd4aD2qWTrc2BmtSwEYokFySCyhCByDn1QRPK+fcGJPXF8rn/o5hCpdxCCM8NwjhynPFZsXV0Xpm6LTAcg86JHP0lsSquGH39QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728821659; c=relaxed/simple;
	bh=MbejCc5hRLf8rMuzNW5QpgAw/2tY6vM/eCBlBn5yaFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GAgH94IkeGroCm+lO9iwAECztXMpGLsrh6bN//r4M08SkZpbh88C7alsUZgrGiG89bVBeFuaBPm9WVbHiCS7HC9Zvbf51Ko9ay3TWCX0wwCwygDaAzIhjWzCr249cW50yhmVg87aj7zBp1tHrtbgmO81gBxdMLypvn/UGZpfTAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cvbvqCyy; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cvbvqCyy"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c9362c26d8so5662151a12.1
        for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 05:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728821656; x=1729426456; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gQUUMKlVY4eZTQQcYg7iR5pm4AMRonESTNN0Nj2BU+g=;
        b=cvbvqCyyS25JOQ2wQscax0p/pLRBP7BDxoGBPQovsCa9YoIVAEoxfvbO/d9c6YoTZ3
         UtPDiCMWGayftljBAbspXLAsJWs0CnE5uv1MxJZWdqg93uMf2lXS9UIaNBLm/rlqiyeh
         Q8Sw9PkzQjsnZNa0bffuW9vVEoCybPQ3otWB1b9Ns8Nrf217PpyCYSQCnBjk+LfNvljs
         7h7twebvg05shnj80j4utd4xAVH8wkqyKAfaQXxwuUm2g4C5v3a2b+hgHqWz7cphrH2Z
         zDvmMJdKFKhdAEW9noeflfGymHlPg/vFsmHwUzl/vq2du99mvEtvHdBtIXXAXs3c6C4r
         gwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728821656; x=1729426456;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQUUMKlVY4eZTQQcYg7iR5pm4AMRonESTNN0Nj2BU+g=;
        b=gto+hvEVIWbb41JuQjivA5ktiYiw/oy5bLYWgntAxOsNZ1wg/x1GmEReg+8tgdLj8j
         WaPR00QPnf0xCUi9BneFYbLJ3W1E3ZMETPdpBOMmUQX4hVo5NLGgByETlAjJepRox5nC
         Xk/3Gbbr1vCpBPdww/rQQNqz4Y6CDs99C4UdzPZ6paWKU9mFrpa6FTsyf8nadcLqoGvD
         62jedEFQvXJZBNwTeOzDZ8rZXoZQqxByK8RL7WSToyJl3Jl9jQsjravU3wxYYoPmk9O9
         8pbTymGwFQ8QHK4OQ03cwx8w+fkj0XhWICj2V0TBlJdCk831WRf7MpTzcwqv2cT6QB6v
         1FvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSxueajJTnparQCjs5Lz6Bwdx8bayoS+TfkF5L4jr8HmCKtWPTw0DbX4XGEmgyzcTaYGQ/MniqVaD6Kn3t@lists.linux.dev
X-Gm-Message-State: AOJu0YzXIkRW88Zm46F+R8GU+RYGLeqyQOWDhy5wqC4ZPeH0i25cAmst
	m7l+JBuPFcX+NcmddryHkc+oDBU0w7n3QWfny1xj4BPu+VeXLlnODwPfNyKYeCI=
X-Google-Smtp-Source: AGHT+IFrfUH5RSr8HHsWDqdFSVlm12Hr8nsnTD7QsUaesw0R98HoNpp1TV24+inCdQdpEJjuhmyJ5w==
X-Received: by 2002:a05:6402:d0b:b0:5c2:5f31:8888 with SMTP id 4fb4d7f45d1cf-5c933577e0fmr11248624a12.15.1728821655821;
        Sun, 13 Oct 2024 05:14:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937260735sm3657831a12.72.2024.10.13.05.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 05:14:15 -0700 (PDT)
Date: Sun, 13 Oct 2024 15:14:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	kernel-list@raspberrypi.com, Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v3 4/6] staging: vchiq_core: Refactor notify_bulks()
Message-ID: <2f4e2139-3570-403c-aac1-c31c2b21b014@stanley.mountain>
References: <20241012185652.316172-1-umang.jain@ideasonboard.com>
 <20241012185652.316172-5-umang.jain@ideasonboard.com>
 <172880414537.1925926.9488617715642757683@ping.linuxembedded.co.uk>
 <14912c78-32c4-4c61-97db-c9f6dbbd3bb1@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14912c78-32c4-4c61-97db-c9f6dbbd3bb1@ideasonboard.com>

On Sun, Oct 13, 2024 at 01:03:45PM +0530, Umang Jain wrote:
> > > +               spin_unlock(&service->state->bulk_waiter_spinlock);
> > > +
> > > +               status = 0;
> > This just looks odd here. If it weren't for this I'd have probably been
> > fine with the initialisation of status
> > 
> > > +       } else if (bulk->mode == VCHIQ_BULK_MODE_CALLBACK) {
> > > +               enum vchiq_reason reason = get_bulk_reason(bulk);
> > > +               status = make_service_callback(service, reason, NULL,
> > > +                                              bulk->userdata);
> > I think I would probably just drop the int status altogether and make this
> > 
> > 		return make_service_callback(service, reason, NULL,
> > 					     bulk->userdata);
> > 
> > > +       }
> > > +
> > > +       return status;
> > And return 0 here. Then we get rid of the awkward initialisation and
> > usages above.
> 
> I usually have the tendency to minimise return  statements in a routine and
> ideally target for single return statement at the end.

I feel like the "one return per function" style rule is an anti-pattern.  I
feel like it's better to handle errors right away.  Then the code which is
indented one tab is the success path and the code which is indented more is
the edge cases.

> 
>  But I do agree on the awkward initialisation of status = 0

I sent my email and then I thought.  Actually the solution here is to do:

		status = make_service_callback(service, reason, NULL,
					       bulk->userdata);
		if (status)
			return status;
	}

	return 0;

This handles the error right away and avoids mixing the error paths with the
success paths.  Plus I like a big "return 0;" at the end of my functions.

I like Kieran's approach as well.

But, I see now that I have misread the function.  I'm not sure what is the most
readable way to write it.  Maybe:

	int status = 0;

	if (bulk->mode == VCHIQ_BULK_MODE_BLOCKING) {
		...
	} else if (bulk->mode == VCHIQ_BULK_MODE_CALLBACK) {
		...
		status = make_service_callback();
	} else {
		status = -EINVAL;
	}

	return status;

Probably whatever you decide is fine.  You care more about this code than I do
for sure.

regards,
dan carpenter

