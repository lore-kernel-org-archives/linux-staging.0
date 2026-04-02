Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2F13E5561
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135376; cv=none; b=ZiPad1uMSiGY7R7Oigj+/nNIYMwtISArouBC8GZngbvnbz3OvORq82yivdf3bbafmzBOuBaum9Y30/0Rl3J8Kjrrog2wkpsznK1LBnFHSILpIts8y8KIXIzftTyEj+gVu5F9tJyS67aMHERubdzipEAaRyYfsHzn5ZxR6pxvRII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135376; c=relaxed/simple;
	bh=YzIB4Lu+zX+IE4ZJ+/9khtZjX6XzKpii2qvc0U32c3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A314MpQACrUlUh4XY784T3DyxQn1QgecmDiXdbhS51ppvJNV684G08Y0Asjy/ycjGMRw6ScVW69mWa6ZWIw1eudpRLhTr/l3WAPT3brBafrs16yuJDqK9pv0IxtEICHQyTBJVHnENPOfrWa3zssUFysm1AWN1P7ClaJmOK+7rw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cfl+ekIZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cfl+ekIZ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488879b2e6aso7627435e9.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 06:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775135371; x=1775740171; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LBHNBVUFUCJBpW5DUWaq2VhnmG86vXoZK/pVSYZwtz0=;
        b=Cfl+ekIZfaZDPIm7ZXLBLOhQzFlJTzn/4WtWBl2YvA+NTzr8/Dcu5M763jla4uNUvZ
         Nq7ks6PTTvJiCGFO3ZQNP8BfbA5zdpZ/A6Lmf8pitD+m9R7idVDv/rMhvCB4JUNquBRO
         mx7sk3mTMi2ncPXPr8coq51NRb1L/X8qE5cox8+loKo6QFOj1Y37FRbhuTlE0kVsFye9
         4XaXyfLVWgqqSUWiSJjP/zTZivzBjdWrlUplB5MhO4N4N84wFCvgtPW0Fo+FsUZU2aIn
         7F7JJuD93Q8ZYkq7kuVxzrpKaN/8savFk5lPKFK8OYkEeTC6BvOKdCrkL0NBJl8oWaFM
         cQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775135371; x=1775740171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBHNBVUFUCJBpW5DUWaq2VhnmG86vXoZK/pVSYZwtz0=;
        b=VZZY6GStPYklqiQGKVBQoqiowDbrBNV2lIAcxxKUe5jMLc23gL5EhYwaHDP9ehro0D
         r96COahYI1inQJjm88/Eva1zHQdRUEDir0RVmK5WUGdPWwVkdFZLee/rp3ZnLbCGRv9r
         +/D46A7a/TJs+bd/i5GK0endhUBPPCJwCZedGluuio5WARiGTJssJ6kWW3Q3GDTWEHw0
         mRwFgF0Ri5GjkNthmDUdbIn8qsXRsnjn4yY5pTla5NKRQj08fGHrmrprNFEvh5gmpFmw
         VpEJVQWHziu14rUKWRjMLTkiDkJOwlGaKwfMxP2EkJ0i9BdNL9FUukm8ZMtJQjc/fJd4
         aX4A==
X-Forwarded-Encrypted: i=1; AJvYcCUY7TKn1zMhZwIziM9+ZbY2f1g9cC2yvIMaWddr5BtTmzsbNs5nF9JZhX7m9EBjhKyYhp9UkyF7Z9S8IgPD@lists.linux.dev
X-Gm-Message-State: AOJu0YxY3GRILLDSYZd9wTmmFxnjUbOYtJrYNnrzodyoVnEZ+L7e4yUo
	oA+lzSe47AyBrJJOReEIvf/D9fPejx41E9gfAk7mRDuQxuO2D8jjwqWA
X-Gm-Gg: ATEYQzzl6lJof7IHMw9pp6nz2R3W1ZWyseRcys8sZwn67aNsWFc2Jwup2ba+FvDUu8V
	U28wiX5Gzly5QjoNuG3IPVd0lKNFSfVeC6iERMSzN8p0dxEI0IXU/Rzld5kRS6tvyD4SDtUhDuv
	hcXnqYZr5d7JNRQ3dxm69w9GnzLgvwopiwyaH9h0dyJo/hxqRf52zYUua+xgbzsZUYM5iBhcP7J
	PaGg4PlnS2G2XYNM68NKg+sFsBzNuoIEYk5OT+RrSjgB1PcdONI+ASkzVo+KPCnBx1lWR35iR5b
	RRYSCNILpFkSSDRVEcpWMU4LDwcUniyzND5Wk2wbHdkNpKnTaZP/TLH48if0yNibzj3cSm1vW6R
	jBSvGrJ7qJWui8V51nJTbXnCoVplBWUV1E8TgGW74U3ePyKPVujCujzMxar4ZYliLitYSyyWZWU
	Me3dv9zUJdqCAD8gHPfBU=
X-Received: by 2002:a05:600d:11:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-4888355df72mr134713795e9.1.1775135371137;
        Thu, 02 Apr 2026 06:09:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e829c43sm175553955e9.5.2026.04.02.06.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:09:30 -0700 (PDT)
Date: Thu, 2 Apr 2026 16:09:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: cedrus: Fix missing cleanup in error path
Message-ID: <ac5qhwdZLNe628eW@stanley.mountain>
References: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>

On Wed, Apr 01, 2026 at 10:14:40PM +0300, Andrey Skvortsov wrote:
> From: Samuel Holland <samuel@sholland.org>
> 
> From: Samuel Holland <samuel@sholland.org>
> 
> According to the documentation struct v4l2_fh has to be cleaned up with
> v4l2_fh_exit() before being freed. [1]
> 
> 1. https://docs.kernel.org/driver-api/media/v4l2-fh.html
> 

I wish the commit message would say what the use visible effect of the
bug is.  I looked at it and I don't think this patch hurts but I also
didn't necessarily see a that the original code had a user visible bug.

I read the documentation but it wasn't as unambiguous as I'd prefer.

But I'm not a subsystem expert.

regards,
dan carpenter

