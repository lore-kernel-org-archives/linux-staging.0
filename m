Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98801D6DBC
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 09:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744191727; cv=none; b=J7mU0AHh3tCAiDQBqiXmuncf5lrilOw0tDT3FK/fy4zXc+sz/WuIr/CzexxutTh5yx/lXvZwvvi3W2bdYI8JvEG62Gvb2HQ/oY1xUrm63YP6xWlqNQ/mwMhUmNThEAh/ZAEk3REAul0kUbsn47zEm1Vr6By1q8uq2iS2ewAkg+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744191727; c=relaxed/simple;
	bh=rVApkUNk3ff/3p71dYO+SIQak76jrVvMcnZW8PkseQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQiiUtaSZY/Hs0N991LZCT93Z1aBHOw91gFSWste+NuuT4pf11gfqCvxDRf3BG2tJDHuer/ZBSRahPYes1QIHTEjO3iISYWZhSBjoWHdlmq4lYX1NTXQT3hLzLulFPG8SxjK4P5dw5J4aJXhqECYMHR7GMexjKPZmLI+n4cwo0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L7F4wjzi; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L7F4wjzi"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso4739478f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 02:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744191724; x=1744796524; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XEOTBvrqUCulvlJbZj69guEZEEt1iBZChDyWd5PNGmk=;
        b=L7F4wjzid5qF26aKHtSIC7k70agE4k6C29rcDRRdLD9Kb3g+/9Rluj3s91iftsWchK
         Kz6qQZvgpWL27FmPKk8Qvw5oirAWYCF+C9z6/kohfbYR7ia3suQ3sQA4gQz+OLSkAdk4
         OEHJ1LfO6IscKwcSRSDSecuMF+0ADeSdbxrhF4ZC9hVcgHHqF/TZRmJ41nLBUXNkXMrY
         bF5BRhGLgDygrHE+aVZ18vHLR1cPDaHuEPS9RbcKcq2iRQH2jHOhocCvEMrdIaOnUbNe
         4RZ0uzox6g+NUqx3zvNTeoee7jGXi/dyNZPX9apZCorEIB4Phdf8ci08joFnbTbnm6i4
         J2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744191724; x=1744796524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEOTBvrqUCulvlJbZj69guEZEEt1iBZChDyWd5PNGmk=;
        b=stMaMpJEKT1fzsEZTantv/SqfYV/vpcppY4RwKbN7/0486nLpmo43FyQpVc9u+VTJf
         a5TdT252ZePBrbpo0Pm/9bp2vvQgISGfz7mNRDg3xVDJQ8lsA7YDQ+2MMvzs1r3cwkFf
         /S9+cbAnpHLDy2TeQ3fj9wq2zKB/v1W9lSfLC0NhVrevEDlWVeLG3TN6/jyIIaiIlcg9
         B1ibtd0LgiCgNJHse59+pU5Z6HEwq76XMV7Fu5yNN1peZQ1nfPa/6mRftM+6rnNWzF3D
         8q0PAIvX2pG48DxiH36h2AJERCF4fEE69ecbm+vfM4URwR6C0STL/gvoTXjQGdhe0p11
         9iQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe3ybBBZtI1TvfhDbyQ+v56yp3WIQ+L9SzarAO58od2ucfNLHoYzg2spHQUIKE2C9t9jRnjkto882rB7Xx@lists.linux.dev
X-Gm-Message-State: AOJu0YzDDlh5o6HrBjCgKsdtYJR+9NWFf7/btoQawmQFIBL7WrNQiqRZ
	sIgx5HNfbEkbMRHwXEJVqv6FlBxM+bLzm9jdS1Q7dyUb6tovgJ7CXJlNMz5JH5I=
X-Gm-Gg: ASbGncuT0nIlf+yIeVEIslNy5GkSmMu6giGNxWPS2LW8W5IWGDeFnhS1GBd4WJCLDOx
	mpGtlZZj3xXu/GdYfSdbOorJdNlxnjt58NFsm5DnXsOEJYmeixXmypCvXfR9sIWqEzJl7ZpqmLL
	fQiObriQ8EoIAYLppdxkm9E24gWDanOKSnkLQPsNLnlhgtKwLgtahh+Hg0JyRUxhPf/DcoFIHQs
	34vDf8P5c3o4znYrYzk3R+g07qmyrgZuwOqAw3DLEjLPmwpFDP8Xwln3pqUDU57aWs0HJUxxkK8
	/EEhKh5xQEFvE+ZdCPvvChZ/RZM8e+ExS3X4iohGaZB2mA==
X-Google-Smtp-Source: AGHT+IGeeONB2K9xJ7mtZWOdimUjyHkmilumfVTBSGcYo8gSJBzT+FbL5fXTjFM/KfA+Pb7P8yClKg==
X-Received: by 2002:a05:6000:250d:b0:39c:12ce:1054 with SMTP id ffacd0b85a97d-39d87aa8367mr1929008f8f.8.1744191724142;
        Wed, 09 Apr 2025 02:42:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f206264a1sm14438905e9.9.2025.04.09.02.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 02:42:03 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:42:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: Michael Rubin <matchstick@neverthere.org>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Patch v1 01/21] staging: gpib: Using struct
 gpib_board_type_ioctl
Message-ID: <ff353ebf-a1c4-4f4f-8cbb-b6c62e70151f@stanley.mountain>
References: <20250409055903.321438-1-matchstick@neverthere.org>
 <20250409055903.321438-2-matchstick@neverthere.org>
 <23dec5fd-5abc-40f9-9b13-0f873ffc4242@stanley.mountain>
 <Z_Y2Sg1tDok_MX6u@egonzo>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_Y2Sg1tDok_MX6u@egonzo>

On Wed, Apr 09, 2025 at 10:56:42AM +0200, Dave Penkler wrote:
> On Wed, Apr 09, 2025 at 11:10:41AM +0300, Dan Carpenter wrote:
> > On Wed, Apr 09, 2025 at 05:58:43AM +0000, Michael Rubin wrote:
> > > diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
> > > index 6202865278ea..4ddcbc2a81b0 100644
> > > --- a/drivers/staging/gpib/uapi/gpib_ioctl.h
> > > +++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
> > > @@ -12,9 +12,9 @@
> > >  
> > >  #define GPIB_CODE 160
> > >  
> > > -typedef struct {
> > > +struct gpib_board_type_ioctl {
> > >  	char name[100];
> > > -} board_type_ioctl_t;
> > > +};
> > 
> > This breaks user API so now user space can't compile.  I don't think
> > any of these 21 patches can be applied.
> >
> > regards,
> > dan carpenter
> > 
>  
> These patches are OK. I will make a new release of the userspace libraries
> with a compat include that defines the typedefs.

Ah that's fine then.  Thanks.

regards,
dan carpenter
