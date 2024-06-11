Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FE98C04
	for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 05:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718083091; cv=none; b=RQuz8rOlE+eiQvr/JPvMqnNEWnxkfyl3TPHFA7fp5OdRApcD81h38Y0fbJrVzIfQywtw86NbEazNKZf6CXEEcXpgzG20mguJ8Dd/iidLuW9XwZQQdcTgAPNOSaq/aL/yOfjcGtOByPNiMMUSB9RISKQVhwlQdCRJ7zXY1uWAlk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718083091; c=relaxed/simple;
	bh=6OTUcRUUrdspohxppwdQEu0HKCFgNJDqHInYXkSTd+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NE1NedAW+91JWQhaDdeSI4rED9J81VWxaJf5vPN9ie00TG0xzpgATGsFz4c2glJq6PTWhqwnEct5reez582UqQbImS1T06o8Fcc9rDTplmUuH7tIM6ua+rnY6FPi7XvNdapCECeVTrhNU3XptIPDBsH7S0UII9qLHez9+rHEByI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DL6rh39b; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DL6rh39b"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-354f3f6c3b1so4185330f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 22:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718083088; x=1718687888; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YmU4ffLX3V4eUudJDevCe7/zEPmQFBgv5tDr195a2UA=;
        b=DL6rh39bCsseLtpiOYWQyvb02JwPjmjCCwYKYoBNUENIZYFQEDJjWwQSTMoSyb/zzN
         y3Iy4ISZPVEmAmYeeRE4vEfdFEv25ZWJ3EYhf0MNMespg3mfrL/ZvK/2E9selBfM3h+y
         z8tvAkqGJhixyV/hoMod5I+3nWsT67VSnRwYx2xGMdrMe15yLNwHkJcO3JP3ljI9dHMl
         cZnJAckX8j6j6QbavC24V9GoM1q5QlDMYM0UNAC4irMwSwVX0z+42B7dZtHfzNviGq7Z
         wbxsUOoKqS0oTPmzh93X/WE/DuoX1MXiSeL5xx5nofDPvK3beNf6Oy3taC0lCkVNV3VO
         jy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718083088; x=1718687888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmU4ffLX3V4eUudJDevCe7/zEPmQFBgv5tDr195a2UA=;
        b=qaviYsFUsZcoLHKNXGyelKIr5lEOSRb5wqJA5tEIOlHzXUXSOrd67wv8mEmERSmitF
         bZ53VblUjvA0iLszyA/qG6qAr9gt/3/j/op/KLPP97UltykNyVINEVtlURbsNOPA15zb
         0XJMoLtrB8BS9mxMeGImJ7tqKTsR+8578XYvhRn1YB7DdKsb/NWkMytIzWXtCYh/L96u
         Q5h8yR05cP0+OeypjTwYkqdd7gEgLQaKm2GRPiE+jOPL2ccJibehcVArx45kjeTQu8BN
         BmysXXhDueDNvz0YiZk02ySc2f5zwr5HGLXKe3ON8f9yX021HH1oC8/zE7RGMzS1AXvH
         s4yA==
X-Forwarded-Encrypted: i=1; AJvYcCW78NVMiEikOkeEnHfZYAVwD4DBf0m0034oFQC/jTXDwaJHPAKaOXZrgtYjFLybhQVcqqrPtKygkWS+VPd5hQ5t7n15OC26Bs87Q7hF/A==
X-Gm-Message-State: AOJu0YyO2QW3USpN/3Y6Hw8kl6a3Re9UUKTWn0oQCI/G2jKv3q8CoLxi
	PY88dFe8GngL89DnlXzgSfuuVMYo3ZiAgrhBq9Y7dJUwQbSrDNtfFY0rcrbRDPQ=
X-Google-Smtp-Source: AGHT+IHwP2sXbnp5s72//FcHfUYCa9pMOUptw2DRVkkSYdcOQGPFYeC0WUlKVB3MWVQURanv1ZPO1Q==
X-Received: by 2002:a05:6000:2c1:b0:35f:231e:ef87 with SMTP id ffacd0b85a97d-35f231eefc8mr4729600f8f.29.1718083088259;
        Mon, 10 Jun 2024 22:18:08 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f24c7a9c8sm4294926f8f.78.2024.06.10.22.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 22:18:07 -0700 (PDT)
Date: Tue, 11 Jun 2024 08:18:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "<Tree Davies" <tdavies@darkphysics.net>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com, anjan@momi.ca,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/24] Staging: rtl8192e: Rename variable bforced_tx20Mhz
Message-ID: <a3049efc-b69f-427f-9de5-7e18c22e30b8@moroto.mountain>
References: <20240610054449.71316-1-tdavies@darkphysics.net>
 <20240610054449.71316-10-tdavies@darkphysics.net>
 <5ccfa433-f1be-45f6-9138-348cb4093866@moroto.mountain>
 <ZmezV4UvCEImxMBX@lunchbox.darkphysics>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmezV4UvCEImxMBX@lunchbox.darkphysics>

On Mon, Jun 10, 2024 at 07:15:51PM -0700, <Tree Davies wrote:
> On Mon, Jun 10, 2024 at 09:08:03AM +0300, Dan Carpenter wrote:
> > On Sun, Jun 09, 2024 at 10:44:34PM -0700, Tree Davies wrote:
> > > Rename variable bforced_tx20Mhz to forced_tx_20mhz
> > > to fix checkpatch warning Avoid CamelCase.
> > 
> > The correct capitalization for megahertz is MHz.  So the original is
> > wrong but the new name is not correct either.
> > 
> > regards,
> > dan carpenter
> > 
> 
> Thanks Dan,
> So... I guess just spell it out as 'forced_tx_20_megahertz' ?

No, just write it as "forced_tx_20MHz".  Don't bow down to checkpatch.

regards,
dan carpenter

