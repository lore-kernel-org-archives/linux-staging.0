Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C4A1925A2
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 17:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744221175; cv=none; b=u7ry0W6sG/8P9ACS1v8Vs8IqiM9QcCMkBE/3Prz7A8h0w5ubcrg0M9ABFyae+TuBeBVciECMu0Jn2IkV9GW5kuAyJl0lim7Vp3oq2B0xcUjuU1NOrwy7YzrQZAxM/vpFJzHZh4B+I11JSokjPPbOB1x41JmEKU1ltVdobQ3DAkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744221175; c=relaxed/simple;
	bh=xxz5KqATeXvK0rPshTPqd/LzAl4MBvLp2I5+wyXay+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xm5Kp30oiKc/mo43SwTHNLYxA3E5A+OLRbSlfALKou7opbb02d4vFiFzu3Ks1t96XJFatj+jN/EV9yYlSQwpEmjuDkGecvCfATJC8aM9qmgPCzIGa/i5xwXTE49Mj9jlRoTNRXF8sVBdTKrxh+1YxREcPmdb4HG/G8jrQoXvzes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=D/fIv0+K; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="D/fIv0+K"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-af51596da56so14489a12.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 10:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744221173; x=1744825973; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AOSlYEtzUARQCpLt8Pf7yETuTbwsnbf1Vd4MCQ3wcqE=;
        b=D/fIv0+KSgsD4et7dGOFgN672r9x3VKyNtJCxBu1OLy1Lnls7U07YbVMXB6nqrkUyO
         cI7gMjbIo9FCE/xDqJ9oD8fPsQH6+oP5Z7y+ioWZoAB52zVxiTU/ODceSFWSBGJVcD3F
         5RuA6VKtTsWOeKzcZQIhVw5Cf6lmCniIFYTpGbOhqLWhK4WXjUc2XkNKE74llC/iQ6W7
         FsxLilSt7uGFd8p1bShaIRYQ1KODwDakNTxZczQJanuK8kVfgR2bDnxSTZK26B4jG/G/
         8xvT9KzjwtKthSga1YGFuaC5SBmEAbcN+ZXtSa3Odhy7fWUZqL5MYf9O833fvMChDWME
         4SKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744221173; x=1744825973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOSlYEtzUARQCpLt8Pf7yETuTbwsnbf1Vd4MCQ3wcqE=;
        b=E/RPdyqgTJp3m5TsigNYAALciur3/CBt33xIiKBzdwBUwga0UtSRw1RVeea1efgl5h
         PkezoHY9LzVsqWDCNQ0Ms2DCHS5uodEO/waR9RE4wG+ST6rXzFiGq7iKIaEe610hpK8o
         dVQ0MR95SjPp0XfzMwq63T3VEeCfMSXu7tyjumnLD3v3Tjvbr8KZtGo+vBW6fsl9XMZS
         m77SbVH4Aio3qn+j3Qw+zOs9A3ccGd43j23p0sOoD/JMVymOtfeoguPrK93wtJD0vlo4
         m145WoDq+zxwdc837dxuPIDysI8JWHcABwwoe3sMRyHhA35wyrmJOPG+qItEOragreB5
         mokA==
X-Forwarded-Encrypted: i=1; AJvYcCX+iKxXV+9FTrC8GlCZhWao88j1HqWtUNmB1P4rjoy64tn3Bi2giPDAkOFxsGZW11C82pvPP8xr2zCK9Ark@lists.linux.dev
X-Gm-Message-State: AOJu0Yw78my0I+nzLW9Z+koWvMYgepb3Ej9Yi6ypY9bPEfRGkOD+CYKq
	p4KzTobE7Mwq0x9tT5rKznujLba0syXH1BNhMt3ge3hsDPZPSPa18HaTPgSW+g==
X-Gm-Gg: ASbGnctpIA3I+xTlnxe76iqXHeox7BU52y8MCfEBgj6Hs/njdPGgGz4SAcrvM/pwi4d
	j534CcbdamWoje/Dx1ks63OEkvVY3f/ekipaIFjG3lROHZc1y6/pi1ok/0O0trYQUKn0PqLsjKp
	rb3PsTOJvWdLyDIpzVRuQBM/QW5y+cou8HyMN1/0bWiQ9AYIxuoDSosruFLGUdQgJmRny5YVfWL
	vX1ebV1cS4IUwGiWhTyum8yMU4M7m7a9R+fz0qOgwesJuvGiXPoCNjOvZb+vu/XGB6RS9EjCk4A
	kLyVa0rUEemROfJi+opLFf+gdcXxVcQYc5hHobXHEPai4owqBhQ36Jf953pBQsy5SCVARWoP6L7
	6bl2ASQ==
X-Google-Smtp-Source: AGHT+IGdLmkkp9tpjERm9n8TBOHAnBJqup1C5boiLMSKzNsOMaTJmy7hjzGOka/L9KC5316Ew1+GRQ==
X-Received: by 2002:a17:90b:2d0d:b0:2ef:67c2:4030 with SMTP id 98e67ed59e1d1-306dbc29805mr5321752a91.27.1744221173370;
        Wed, 09 Apr 2025 10:52:53 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df4011dbsm1938065a91.46.2025.04.09.10.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:52:53 -0700 (PDT)
Date: Wed, 9 Apr 2025 17:52:51 +0000
From: Michael Rubin <matchstick@neverthere.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, dpenkler@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 01/18] staging: gpib: struct typing for gpib_interface
Message-ID: <Z_az87Yx-NJvGASJ@tiamat>
References: <20250408222504.186992-1-matchstick@neverthere.org>
 <20250408222504.186992-2-matchstick@neverthere.org>
 <804eaa0e-e1ce-4ee2-8ad4-f56bedd6d14f@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <804eaa0e-e1ce-4ee2-8ad4-f56bedd6d14f@stanley.mountain>

On Wed, Apr 09, 2025 at 11:26:41AM +0300, Dan Carpenter wrote:
> On Tue, Apr 08, 2025 at 10:24:47PM +0000, Michael Rubin wrote:
> > Using Linux code style for gpib_interface struct in .h to allow drivers to
> > migrate.
> > 
> > Adhering to Linux code style.
> > 
> > In general, a pointer, or a struct that has elements that can reasonably be
> > directly accessed should never be a typedef.
> > 
> > Reported by CheckPatch
> > 
> > WARNING: do not add new typedefs
> > 
> 
> This commit message is quite long but it's totally unrelated to what the
> patch does.
> 
> This commit message should just say "Having the word "_struct" in the
> name of the struct doesn't add any information so rename struct
> gpib_interface_struct to struct gpib_interface."

Thank you for the input. New commit marked v2 sent to the list.

Michael Rubin
