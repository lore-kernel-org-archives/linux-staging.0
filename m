Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668D029B79B
	for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 06:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781331434; cv=none; b=YjxqLzxMWRIOdnOz0LtjLVNRFqzr4hbCx2ZWv4A59L2RmqdLmf/4fmpnjWU9F0/fa2UcNb0AT8fDcw+TSbERIXmITE6pK/xoM2RrebLpuxfxLj4GxtAP1UldkfWAvPyMGFewC+qakGQRvf/F9aF7jYqcX1iD9FktXOIltvUHZ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781331434; c=relaxed/simple;
	bh=IDfj46W7vKL/Gr+E9OsZVvwB3Rdme4iy8oJeC3brNdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HD1J6PLJ6lSwLuDpzNbDI7mgZu3X/kqZAcLD8/I5MDVP68kdlQLFwdRYqWq3j1Sf94PNO2B5PnLqNcnmhMWjDe0WQngQA/3AMKmQR+gOfmzi+qQ1XxFoOu8kYxqXxLiJMEwDBU4MS+8vCIsgGMqVJ8oqE7lMHIf9C5u/HXU9wWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2UJXinF; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2UJXinF"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8ce9e56f68cso13897626d6.2
        for <linux-staging@lists.linux.dev>; Fri, 12 Jun 2026 23:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781331432; x=1781936232; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1p3BAGZnV1gRRVE0W3J1YkAbfp6JIr+wulrSf/UbmkE=;
        b=U2UJXinFNsAbob1i1iXDXylctQ80Tq0dcDOK1DohKAcZygCS/uPDhYtOMGL5PaqMvB
         SGiUcOgPk7gtA6w8JIFso07WNrJgORLAJFQeO1+dcx92Anvf8I5ZwwXf2r33Im+rsvBo
         sEQJ9akI9tTpGxYUsQynpXz6FnHhj5FALCRXOdbzYa0c0aDERKmelgo44ZkwLWATDf0w
         Ps3/T9dK7LNmCjmppVwRK/5FmMn1OroXEFv/1bVWU5Ea9gD++5tJGC7G25OJVbgi7adX
         kuqpeBL6SP8bKua3ttUBHjGmmxrtU61KqkUFNLChOvucwde2M7rWG3SWE+6fl94+mGPz
         bBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781331432; x=1781936232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1p3BAGZnV1gRRVE0W3J1YkAbfp6JIr+wulrSf/UbmkE=;
        b=hnud7z0dKM/Mz4Osqz09iVZAKtPNKT/RAE5xLiWK+y/oAA17ootcPryI8erBMS7kJT
         kdBile4MIltelNN1aF+KyRJ1DO5zg1cXiimwXfy+z2Wlon8wHsiwnoKiQAAWmr3UYprj
         k8SECn4YGIYjfr+fk5ioXOzmzeYIJwIGjs/h3FBuFDsyYV4+2BAYWb1zypR0g0CrTCib
         nmBZJeeFmJVcV1de2dzdPCK9KVtdn3xSTw8XsMu/rWTvV7hnQkmmBb7vI+gnEtaAg50r
         l815em0zUGd7Nm+Zs5Gn+FdtkE2oXuNsST21gInhK24lWBC1tOlBx2nTM137YsB7RXNu
         auzw==
X-Forwarded-Encrypted: i=1; AFNElJ+oDTTeyVZ7jZYV4rqHHEYqMKtcXUVohJll3H2b3QwPQMdhSMxCoUN2FLNGzdJcAIbldryV8ROsoOSDO+S2@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+H3E+tUyY2i9t35qN/e+iujbfkf7qYav4R/u5WjMUqhco01Xe
	+An71VxE5FofPlE/+K0Q8oFDOqmFef+/JXeIIMyJYf6Na5c+HWUalVop
X-Gm-Gg: Acq92OFxskcmcRmRbUS9vdWLbXGFufqs2W4z+DQpCgbYJcqvLZGYLWkKU4hqh4eNuFH
	PHpnqTzXpI3jhKOEsLQcSCBZ6iv32LXdKEDLnLEZJOqz5daAWpzhoh1njm+fcZ8ID/HW9//v/Jt
	3E8eScDKhveJa1+SYDX0sa0n85L/b21s4Uf3GQeBZCej/43LZvP90nBiNIz4bqR2IkB5GNumIBm
	a6PscqgA3yKyM93izdbLoQHO8MEDfUL/bAXV7v4iJGvc0XXjjxniey92XAP7l+bu2KX9oAYtaPt
	75tG2WzIldLkY8RG8QtSrndRj747totZY9G6NVJY2UrvrBX2vjJjIm2ayQnxLlVDg2TFd17fLTv
	aiFpSXd5uCrpomssrotWBV46aOma7/SV+KZlzU58oJPoc+DgwqL9pvEweZSwx+t01LNwBWF8WAt
	1XY/pzSQlHsii/xI/f
X-Received: by 2002:a05:6214:d83:b0:8cc:ebc0:6ec7 with SMTP id 6a1803df08f44-8d32ebcf12bmr100315286d6.38.1781331432342;
        Fri, 12 Jun 2026 23:17:12 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d305134b20sm43615736d6.43.2026.06.12.23.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 23:17:11 -0700 (PDT)
Date: Sat, 13 Jun 2026 09:17:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Brock Haftner <brockhaftner@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: add missing newline to
 sysfs_emit formats
Message-ID: <aiz14CLCduz7996E@stanley.mountain>
References: <20260613014905.48458-1-brockhaftner@gmail.com>
 <aiz1bMmAN-gQnm9x@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiz1bMmAN-gQnm9x@stanley.mountain>

On Sat, Jun 13, 2026 at 09:15:08AM +0300, Dan Carpenter wrote:
> On Fri, Jun 12, 2026 at 06:49:05PM -0700, Brock Haftner wrote:
> > The sysfs_emit() function is used to format strings that are returned
> > to userspace. According to the sysfs documentation, these outputs
> > should include a newline character for visual clarity.
> > 
> > Fix the checkpatch.pl warnings by adding the missing '\n' to the
> > sysfs_emit() format strings inside several functions.
> > 
> > Signed-off-by: Brock Haftner <brockhaftner@gmail.com>
> 
> Please don't do this for existing code, only for new code.  There
> is a risck that user space relies on the old behavior.

We should delete this checkpatch warning really.  It could be a
sashiko rule which only applies for patches which introduce new
functions or something.

regards,
dan carpenter

