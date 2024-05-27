Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A32D5787B
	for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716799900; cv=none; b=sX7o3tsKwGyhfL8LHzz6W3eYGzQ5wK4dhx6ikpxDT/kCcTOohQr2Na8ud610nY2IelvijLyI+sKHIpCgelKRs1wBCy4d0qnajslv1ipHmpsfFXAtlj+h0U4sEzSD/bvSYIHI1yDV5SGViA6OZKQ+CNFG1pljDllL+SN19XYa+hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716799900; c=relaxed/simple;
	bh=9HUeoIxJVed2oXzn8k+z1lp95CXmZkk8jYnTEeuKwZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfMBldCroHcZlDQlKm2FLEsIf9HaVRL/dz7tKy7L4IJikNWNmWpwRuK9QF1xpEogtlkfvmwQtzU/w32zvxBhFc8senkkfYTK9hclhJVJIwTEWMxIRTUv4ueQq+ECqxKY5t5AGiNZ4LNCGeQV5Z5QbcuFqsHo0A7gUitbGV2YfJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AJUMBaPC; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AJUMBaPC"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6302bdb54aso53517966b.0
        for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 01:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716799898; x=1717404698; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KMXCYLp7PnphXFH4ZP3dDuwhlXaSPog9pjAwXo0KeQQ=;
        b=AJUMBaPCZqGhqHVrGU5TIndFjK1kHzhpnGJmAvRTpZUg4N6z1lOtZCUbNEBlCeP56i
         E9yeucYUoli8pxqB3TKZP6bm77+dkq6cA0WNPaaBtg4d6pce3e9lOvcGarVcsDQDVuXS
         ztF6Vp73+E5l/aC+VsBF6VMhZuZB1PK8yMgt/I2bCByLsQzj8pFGA2hrUcXFQWw2/MXE
         S3VmuPVXtgAjLqfNyR0OOmWlryISI6hNtMRZkCEiKvaK0oIcJ0ROZblQIfEJttAL15Rf
         +Bp1c97ze5GbVKjL0xHuyzZTGRB3mkhy8MLDmFsiFN5/D9IR7Uj8shzB4rKfzfO1UZoJ
         ow/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716799898; x=1717404698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMXCYLp7PnphXFH4ZP3dDuwhlXaSPog9pjAwXo0KeQQ=;
        b=rkUo539vnwZmgo40fgYxChQ+sgnY/VGisYq+yI4Su8uUfyXCOegHh2dPxfO+4vPPpf
         WpIWILKK/paInVEfojG8K8BltOiYtDnw6Z9pg99c4/FRGNOfme3UnlE3TjkXS0GVnsVd
         LHOtjlzJsB+Mk9b9V/YSNJ2xjmSZqISmbNz6I6B7b3IIsiUfXEURO92DZkIrD/FzLngi
         3K7Wj7bZqYMansqqgezLvySP56V+Eh/VEKktFlEfY3Ay3zy8nBueg5K/qsAkxB7q/sGI
         /xozII+9df0vNjpKc2fIDoCwMiEVbfrKFbqcPWDQVuKnFJyuBDBFsoWA18VMGX7fQJmX
         Attg==
X-Forwarded-Encrypted: i=1; AJvYcCUyR8MfX5895r9QcPLa/PWu1tmYUBUyO3BYKUzjvRtiQWExYe+XX0EkU42Pf4xdmLhO1hsQeqQFk7H5W+rIjsG3GX38DcRZY6gCM0uBXA==
X-Gm-Message-State: AOJu0YyHp5iYXsQBAAoLosKUBIh0ZZFUuq+MbNNG1vEMUV2CvJ91IcO7
	Iq9ROlYv0JTxCpePftmkkJlcDXc9GGDB01Ezho9b6Rdn2wGK204BBcGri3+BeLk=
X-Google-Smtp-Source: AGHT+IERvbG5ixvm82wd+6mm+v/y4ttE7uUn9cqPTV8DsrXmE3OajQ5DWcpp6JlL8Ys1RITrP3uNLw==
X-Received: by 2002:a17:906:c20e:b0:a5a:1871:e2a1 with SMTP id a640c23a62f3a-a62649bcfebmr627437966b.33.1716799897660;
        Mon, 27 May 2024 01:51:37 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c817a98sm469249266b.37.2024.05.27.01.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:51:37 -0700 (PDT)
Date: Mon, 27 May 2024 11:51:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Nam Cao <namcao@linutronix.de>, gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: rtl8192e: remove dead code
Message-ID: <fd953272-5dd7-4d5b-9938-1e1c68e73b18@moroto.mountain>
References: <20240526111928.14574-1-straube.linux@gmail.com>
 <20240526111928.14574-4-straube.linux@gmail.com>
 <20240526143100.FmVupNWq@linutronix.de>
 <e25831a9-9913-43da-831b-d37bdc4d9dd3@gmail.com>
 <9802cc9e-5962-44a1-a384-3e5ee226cbcb@moroto.mountain>
 <2d1dab52-72ab-4f4d-8f77-ae54f16b9b4a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d1dab52-72ab-4f4d-8f77-ae54f16b9b4a@gmail.com>

On Mon, May 27, 2024 at 10:34:41AM +0200, Michael Straube wrote:
> Am 27.05.24 um 09:39 schrieb Dan Carpenter:
> > This patch doesn't affect behavior at all, but to me the original
> > author wrote the do nothing case for readability, and I don't have a
> > problem with that.  In fact, I applaud the author for caring about
> > readability at all which is not a given in staging code.  :P
> 
> Then I think it's better to leave it as is. :)
> Should I send a v2 with this patched removed or will Greg just apply
> the first two patches and ignore this one?

Resend with Nam's reviewed-by tags.

regards,
dan carpenter

