Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF381946CA
	for <linux-staging@lists.linux.dev>; Wed,  5 Jun 2024 10:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717583543; cv=none; b=Ztln9UfEwZt/4wpy2W4apBoEdPhM4rWGhKL2StaHG309XJT3gt0Q3d/EPHPKdZYtK4X8orbiPdYfF0DtB7lji+Py3IkPaIJ0vU45UUI624vPMVGSC04cq8fLlAbnsuWioxxjM4Xbru31cQqonW1zaohzD5wopxsd/jnql99pBFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717583543; c=relaxed/simple;
	bh=rpv+v6BGuG8h14BKusbaBSepHwenUFtsZO8htbvtgCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgOO5NIo4o33uhCpt9ToRlTnvA3pnt3IC+8271OgflImC7dEs80zJCV3bUzvXOV1areDyyGv2kkKue8lT8NXfHQ1kxTcM+xPDt+IJO5Or/Sz+efIIGsvoyQlfxoOlinJgHoXoDFxESVXhcv5GgUnUyFb+xB+JJ+5EVd77yUHiUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hzRlouHq; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hzRlouHq"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57a6fcb823fso3079695a12.3
        for <linux-staging@lists.linux.dev>; Wed, 05 Jun 2024 03:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717583540; x=1718188340; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=14OlGt8Jnqqh5jh8mSf78VUVrAMyfOuM7SbGIzTFHYs=;
        b=hzRlouHqWySfYTwYWNhTIptLa4233+nSC3M19wNk2ELBngZPg/zvKBNdSlkckCed2u
         gRcOGwBppAk5YEd2xBffpfNPr4mmy0/oTYK3sxgiIVLI9iUrVSN4XWT9grAfBsBCv7st
         G8X8T1WwtQjzjcm42hqB6EUus200Hc8knsuiWjcQ29EwxRUSCqueNiQsL5+y9ZvGLznw
         3ixOdpTxuz/+6OzQDIpMyD4cwz0ilTQx7oIKlbUjmFQTZtZU4wlYn8+ujrJjtjzHfKGI
         6Bru2IJkC/C3dmsSmygUN59H8igZoPNuu0eGVqarW6p4Fz5zBTwK1h9oJpUWjdQnNeZ8
         cFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717583540; x=1718188340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14OlGt8Jnqqh5jh8mSf78VUVrAMyfOuM7SbGIzTFHYs=;
        b=ogkbHU0bCJm2s4Nv3jUGfh8xsB5OAapuKaTzeXVxjA57TPmN5BrVY6PCizBd21WfTO
         hdhxXBufsllvUqp2UrWN5rHKeHXjsEJ0aNdYOdxWnHcTyfWgZ89Z4kDXj6hOhfYEMcRE
         IB16t9QiswbcVcvziCoXBJ304OfbQ9ztzILl0THN1QEcq4k5GVgms8TrlUJv3hM+zFAO
         MGJn4rmidNVDb46u9a3ldw9pBkh6PhP3L9DRvkGsW1xEustHoNnSHPrwBCohvwrn3yKE
         3xhYIXMYzn7v6TRONeBspxNrrglaGCz1gX9CgaAQmEVU7tw88baF9FuStvggb3cgUOcT
         gxSA==
X-Forwarded-Encrypted: i=1; AJvYcCValCswRxjuzNzwMg/NNIlOx5jEdE6wvsxvg1z3r8tdj9CwJZCEgsBfmQLpGUnGqRDVNp0JdaeFWvpKEkrpPQ8oObh28DFSzKuDSdj40w==
X-Gm-Message-State: AOJu0Yw1U3C1hAlmiMAJMBg2NgDU48vdxLN69aubprPrNmSUK4ir7cve
	jUwd1WDdaNyaOuXEitH1EG3RA8l7SbPX09AqfwktrrEq7/DdUU3Bl4oaKAqdQBA=
X-Google-Smtp-Source: AGHT+IFe3Q10FSXk3Tzzxx+TR5FNs5YzTlM/XiJIwPkemUsXzAUPZ02n59MXlY6SMuY/0pVr7eJH+Q==
X-Received: by 2002:a17:906:2f92:b0:a5c:df6b:a9b5 with SMTP id a640c23a62f3a-a69a002e5e2mr135455366b.59.1717583539808;
        Wed, 05 Jun 2024 03:32:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a690dccc0c6sm411120966b.77.2024.06.05.03.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 03:32:19 -0700 (PDT)
Date: Wed, 5 Jun 2024 13:32:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/11] staging: vchiq_arm: Drop obsolete comment
Message-ID: <79d85826-254b-4224-8c67-a14b1ce80c4a@moroto.mountain>
References: <20240604172904.61613-1-wahrenst@gmx.net>
 <20240604172904.61613-3-wahrenst@gmx.net>
 <20240605065253.GD879@pendragon.ideasonboard.com>
 <d780ef1e-a712-4e83-aa0d-72c123b2e654@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d780ef1e-a712-4e83-aa0d-72c123b2e654@gmx.net>

On Wed, Jun 05, 2024 at 12:02:40PM +0200, Stefan Wahren wrote:
> Hi Laurent,
> 
> Am 05.06.24 um 08:52 schrieb Laurent Pinchart:
> > Hi Stefan,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Jun 04, 2024 at 07:28:55PM +0200, Stefan Wahren wrote:
> > > The BUG_ON has been replaced with WARN_ON. So we can drop the
> > > comment.
> > Note https://lwn.net/Articles/969923/ :-)
> > 
> > This being said, I think the comment can be dropped, regardless of
> > whether or not we drop the WARN_ON() later.
> thanks i wasn't aware of that article. I think, we can address this in a
> separate series and try to replace WARN_ON() with dev_warn() in cases it
> makes sense.

I looked at the callers and it does look like a user could trigger these
via the VCHIQ_IOC_RELEASE_SERVICE ioctl so it should be dev_warn(), yes.
It's not necessarily in use at the time.


regards,
dan carpenter

