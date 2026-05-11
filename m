Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E33537268D
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499996; cv=none; b=gJuX4tM8qC2l7GJo2bB753+kgQ0KOX4IcTftlxF4vCJ8AQSD7jMBFCgP1mbpUQwYB5pw3aITByhYKPYe+ejNpp28rBi4MUjzUizEr6yYTjFgchH5cqrX3aOW+J8HHyn+xEM8CJHOo2dgYvXrMHxzsR8ONV/0t5dDrJsTM7LNIp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499996; c=relaxed/simple;
	bh=pUAYSYUeKdjCjhBlXPieorkg7yLpWil/XC1QJ/SvyK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWQyMLACvYm0JFMSKN9w7d3D+7zfWKzOUYMZ8MOW+0645ky4sN9C62d88Bw47HHTGpwvGKAEOlIvy2J/TJLqPDrzSevH8At2AxvbzaMXsU2WU/UARESRL88nNmHlB51EQO05kiTdIVRx5NyG3EXkNp6LwZVwLbbsjbKlzQ9cX/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eljp05Xr; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eljp05Xr"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-956849ae1efso1217155241.2
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 04:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778499994; x=1779104794; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OO1IEzTaFF0ZAn9uDb8SVLUtUYQAq1Vq135ZbGyORw4=;
        b=Eljp05XrJcrTgoZvtKFh2x2FcQmPgDzmC2bnj2dXSp4hCkV9ldsPeDy/i+hU3nq0e4
         bT0GXz2bRvW7eqVNa4NwCYZmtTI6qX4dUapAXHwveTCsrWdeJkQIhZXLxv98yxU3HeXL
         Qwxy62pE2YAyj6QnemOmJ5+UxW6H66YOjM0NnLtCD78y8wn9NSjHLwTm3bjCicph7yf+
         v4BQ6hP2d5DW+F64F7+kRHmLbDj/zuuFuXfyyk3eymXl/ZD+IfdjpGPFIAoXfbuE9vDj
         yAyRPq9wLJzxWHC4rB6f788mRCFd3thO8kiip+QTvEMKq+35iCViU+kKWe6NA6BZSkSj
         ezpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778499994; x=1779104794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OO1IEzTaFF0ZAn9uDb8SVLUtUYQAq1Vq135ZbGyORw4=;
        b=qaImlUJUouuVrtSdqEeXdxrxReXKv2oOl+SQvqEdxulVxuOWU17UwaO62R+0wxoVdG
         yYqpNWaf1bbPZQEc3NI2k4ywwF445FKnLkGMkdajqLSSfZw4lwkR7UJF+2I170J3ooLA
         7rQ+eMRhauKQSDEFUG0nOLOH7VFZPdab04OnjPITKKYn+fgsqx0dgnXSJUspjPwUGC1m
         ILXEAw1fyeo1G3rF7h7G7BRg8luNEXV2Yuynr4+ks9vudHBWDe2fXbnnSiQjQceHanWF
         ejwzpUMxmBz6EdsqRRFNaSYNVmuUh5GRDtYS+F7cQy5iD7bgnTyB37SUQoiyHYHZN6n9
         rtYg==
X-Forwarded-Encrypted: i=1; AFNElJ+sd+oZA0NKtqaAKVT/qL5mpOK8x+YcmYjZQAwcuGvR6nB5Eqs13pRkukhd4CR47I4edPV9udmL96dzKjhU@lists.linux.dev
X-Gm-Message-State: AOJu0YzfqtvBEKr1j+AE2KSYXCtePQot36NsLeGqbLM5ow19s2UP65gQ
	p8MIRqHLUEC1EkQOzT1I0uWiDsowMBfpXyUK+ClGZFEnq2+TuyDOx4xC
X-Gm-Gg: Acq92OEg88kWIuwXxosCJX36sxkHO0RG7SJLEyL+XmBEhnZbjyKFyriKosCmGldl8BA
	s1MKT9qu3Qkq4ev3zgVRzAC7HUHnEmxWmvcLKur/PNvc2eb6UArvrgXPhodGYnQuJWO2HJHk22Y
	BviLOI85L9yU9j41GbjkO+v4SjBJQHsImpxm6oktIBMBFNCIWRM3boLt1vNqU1hQF00iQRY4qeA
	wmW9EBuaF2R6mhIZxewG1xgaMWjNhAJPTbMZga4eHLX8gsbkQlx+NIzbfa7JVVShQI0sqoa5Y4q
	UHxKSINiDKAdYPP0PTNhaa9dxu3cXLELywYiK00TK4+z65+3cRAJguWgFINobT4/RD+dvn+2kXL
	dI0lxm9fEczycXNy+cMr8pvJ3N+VCuk1I2ejJLp1xdWwo0OZhVnSRTlgh5st3LdRnGb/O+laCd/
	vKKJn58B82a6XtnO6HEVZZmvxZ/yvJ
X-Received: by 2002:a67:e7c5:0:b0:631:487a:23ab with SMTP id ada2fe7eead31-631487a27f2mr5386588137.5.1778499994324;
        Mon, 11 May 2026 04:46:34 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6314005a6acsm5701621137.5.2026.05.11.04.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:46:33 -0700 (PDT)
Date: Mon, 11 May 2026 14:46:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Harshit Shaw <shawharshit116@gmail.com>
Cc: deller@gmx.de, tzimmermann@suse.de, chintanlike@gmail.com,
	andriy.shevchenko@intel.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: check return value of
 device_create_file()
Message-ID: <agHBlP9Z1NVQMQ3W@stanley.mountain>
References: <20260511100140.4794-1-shawharshit116@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511100140.4794-1-shawharshit116@gmail.com>

On Mon, May 11, 2026 at 10:01:40AM +0000, Harshit Shaw wrote:
> device_create_file() can fail but its return value was being
> ignored in fbtft_sysfs_init(). Check the return value and
> emit a warning if sysfs file creation fails.
> 
> Signed-off-by: Harshit Shaw <shawharshit116@gmail.com>
> ---

What's the point of this though?  How is your warning message more
informative than the warning messages printed out by
device_create_file()?

regards,
dan carpenter

