Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6E8423A65
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 13:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826087; cv=none; b=WlXHx4T0+y7R0wc62xM3s+uVba7PWmBxV/fvsggAyEtmOoLDM2W/WgeQPq4FEYPoXJ1KetNiMGFgY+FibnEmINsy0EXXAAHnzssLylRLcaSvkAT4oQSJG8TOcooEsV4JFXUV167y49UL5HTJT+KQxwh4B7uEcuQBVg62oQ5hPa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826087; c=relaxed/simple;
	bh=XC4U/RvjohytAMvYA3ZyJOjOfjBhi1bX8KkCsIJHQwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Je3VGWRZOVRRFQ5M30sL6D4plxZNEJaLt4Avf9Tc8rxvxokoeiAKneBGxfW7X6BWeLY4Q+E47YCvaTBCCrSZ0NAdrDRVtXnUP+VSoKXXFDdZiZilQQkduwP6MyJKyqfh1mqRe55nVU9WOM6kpCXZnKr8eKHP7+lfmpUl843+J0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YckK6fCY; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YckK6fCY"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-73770fd1b65so672171137.0
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 06:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782826084; x=1783430884; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=63L3nK7vrBcvN1li6echQyTJBc1iw1dvXuudNEEXZeY=;
        b=YckK6fCYmElMaQG/hUMXXEIJA9u5h+G7by7WokAtgleARmom86+VBwc3vs05T9GTwo
         sSTRllgFpI6/YD4OjwsFCtmpCLFurjQsdandMZGXVVQUQpEmDwS7Q2AdHF6/qUnkClsu
         NqfcabD6Rnn2gyfyf2EGYdK5tni7QD/6H12PdsdqB3oRGYK+UUd8Ls5yMI6qlkKptVzM
         u5N3djjPI+mH2/w6Tb2lk+AhrOaP5PN0IbVZ7/1ylczAcuH6MphB77Vyde0kYppzwz36
         lTRFAGbnQNmUQTPbYgrL5HUKPSew4q5skBwLdzCz2s2FV18hP4nLg3B4eA38WVy+irZ9
         mfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826084; x=1783430884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63L3nK7vrBcvN1li6echQyTJBc1iw1dvXuudNEEXZeY=;
        b=cHcqDGpfGI8JzdiHkaY6WYQ895UUJIy0M3wd6kD9nH0fKJQCS6z+JpzNlH9XxoA0gV
         M5dRM1TQ2XCIRYDdeLatoqDzP7H+jTWuPmEsr5OllxaxskSjmi1dobE8YnY8aVLAo/rZ
         zGS6kpMHIBXsuGqm0rbMwBPQfcxfVbtaeQfwrTR2k9nbfQU7b5G2TnpKjuQ+LkmjLLrr
         2oqT7Jb3WydsgohgYYMhlpgitgH/poxreWhdTRUZeA5nTzvi2cXKYPWY+Ki2zFeF/U8v
         WpTGUyha6tKuQ2Sf9S3yb7IeGtm53xuq0bUnLYY6GHw01yAYCA/b0HTeUk4h0Gs8l87D
         ignQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNodxKTJzcKkje3HahMK8JbI/kWYeJxfkX1z/IcIfQU5UQ1RjOe2rG43kFfjiH9aFPeYwih/pqrEZIeV2n@lists.linux.dev
X-Gm-Message-State: AOJu0YzgQrmrWh9B0ibUe+kBZKYxXQGNy9RmFfVydZA7kOQWUDVY5yFi
	fn2N+iLS7u7d3Gji9cxVDFGgBQSS+6/vLgT91KjcKUoWKsh05Y5JND7U
X-Gm-Gg: AfdE7cm1BbkFLqOLh2zWt1cpf0M3jy2bwU4iGdNIM7VJeDPG0as14GuARbSVlEzigIh
	p30huSIWVpkl4tN+TRCCQczlHCy1DPiNThnXlwCvrMKbI2KyqU4nD1sVxBFqCsdMJXsdlPvxknx
	1C9j7MdlYAAfl5rBj3BP80h7yCkSROqjVlFgoH5YHUj/b/nigblZqDqf8mkuHycYjaxH4VmjG9j
	QwTk8W6NB8KFu/iPuJ90ynDo6rX4ZOfXQutMHyi3jVgm/aFva34n7iELYlgFGyPOXRTM8cfkbjo
	OZyN9sEPt+EDYgDKUnruTktwls+PWgiI1IveAPaEvE297f5o2a3PnZ1cB9UYETjEEA4Zzn2wZJT
	eY1R9r3eBvD5ikKE8Y8OY5u7KGYM5NiJ+e0sLb+2WRlkxWjEPhXmXllxuPbLJba7CceFquBWBE7
	kUDUCg
X-Received: by 2002:a05:6102:a48:b0:73a:e9b:26ec with SMTP id ada2fe7eead31-73a37f2634fmr1452767137.16.1782826083923;
        Tue, 30 Jun 2026 06:28:03 -0700 (PDT)
Received: from localhost ([74.80.182.83])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96965e6fb4esm909719241.1.2026.06.30.06.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:28:02 -0700 (PDT)
Date: Tue, 30 Jun 2026 16:27:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>, lars@metafoo.de,
	Michael.Hennerich@analog.com, jic23@kernel.org,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
	gregkh@linuxfoundation.org, skhan@linuxfoundation.org,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: frequency: ad9832/ad9834: use div64_ul
 instead of do_div
Message-ID: <akPEXQ5JkmxYd35J@stanley.mountain>
References: <20260630032322.5805-1-raizudeen.kerneldev@gmail.com>
 <20260630093931.00006eca@gmail.com>
 <akOwOpTIBFmSvquX@ashevche-desk.local>
 <20260630150755.0000266f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630150755.0000266f@gmail.com>

On Tue, Jun 30, 2026 at 03:07:55PM +0200, Joshua Crofts wrote:
> On Tue, 30 Jun 2026 15:02:02 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > Since we are getting more "fixes" in the area, perhaps it's a time to add
> > a comment in the code summarizing the mentioned discussion?
> > 
> 
> Good idea. I'd also mention Coccinelle and its false positive in the comment
> since patches trying to fix this always mention it (my attempt included).

Generally, if the code is old then someone has already looked at the
static checker warnings and decided the original code is fine.  You
should look up old static checker warnings on lore before sending a
patch.

regards,
dan carpenter

