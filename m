Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03271CDFA8
	for <linux-staging@lists.linux.dev>; Wed,  2 Oct 2024 13:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727874154; cv=none; b=roYcFKhVu6brFVwCybSuN2/p5dDmFw3ZnmlpBziNBkRRb6dk/UxkVg/19PvO3XlvPO8H5Z3ETRvcWLtzNOQYG0uYVFUYjhKtvHr+XOhliJ+CUKu3pPXqkSIdFP9gPbB3jbxdgDoYLernwr4NPlQWx4pnBQj/YZtLSQfgC0u4+gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727874154; c=relaxed/simple;
	bh=SaGx1GdhB/+cQFThb4TF9eDAGIdoFqYrG1PO8YaBRBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sa7EE0hs0xhnMAUXhY29ZGNKa6SiVitzZzea1IlcMeaDCP2FCn/Tx5zkE1IkoJfibgi1rC1pMxXnI8r+W/KuVxqXq/DlptC92hgnkswPVFmebhbmCzRfglPx/ap8CgL6N975khehfB9gWQ4WlYO02IPRR4XA6FuXmCVs3tiFDMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kNeJv8QZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kNeJv8QZ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cbc38a997so5319685e9.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Oct 2024 06:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727874151; x=1728478951; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MRdEMpb3P4AfeWlV/F/t1Wfo5VDpiOTTekBJOd+V3gc=;
        b=kNeJv8QZ9gtl1+1DtssJA9kEuEyiiX5/OXNq172jiR64BMK9+N1kAe+xiX+p8ASQ0q
         n7fxKs50ynEf8b+EEXhMCo/l0kKZN0BkiLaYIa48wdobNyoHu0FFUrdePm4umbwVM54i
         /BUYd1u4DGXKZOQJ2sqvygclvYbErmnFLUKv9bvZEmnMdKVP92h+Z/Ab11Kpfwi3djnS
         UrwjxDOO5yXw41rpL9f4VMY7GWIBaM4xa1nRhzPYHmtXKia0JTbRCNKIywn0TgATCnn5
         Z1Cy5S+np3muvZ8XiAJy4TU/fvsWVIsyfvpNwxaZWpqH4rIbQhK4njZpRNjNW5bJz/pG
         ddNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874151; x=1728478951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRdEMpb3P4AfeWlV/F/t1Wfo5VDpiOTTekBJOd+V3gc=;
        b=dEkIx0CIOSAvHc6HdDUQ4oUpqh051SjAYP5iVSIKshRzxL8KpC0+lDiFuwxiJ4KoHx
         5TtNUKX6O7yqr3DFz97w6o4qqzWbyOZrkZby8mLkpxnb+zXfASdDf/JJDzR9UzJjuz43
         Ie3b32KhSBvOIV1nmSs3Cvz2ji/ndJKkG5y56Gqiad1+GnNmFGoMEU5x5ZUoLPfYbm82
         WepR/JEArxLo5w8KZNa6kl5dXlBAG4e0rzFjbt7QJq3NR5c4MJ2ZygJHeNlMk//CUiia
         TvNQCRdIR8yaiOFiB/a835Yfota7PeyKgI3h9Q7b5vqOOMUIkxfxoxvCmwBlgKKm2P+J
         mD8w==
X-Forwarded-Encrypted: i=1; AJvYcCWNgED8Ou3sl39mDu+vqLtTE6NljTgm1isF8MgTuqbGc7UhYMB7fc4w/SLs4nQa7YSLC77aN/AXtW/1MU0L@lists.linux.dev
X-Gm-Message-State: AOJu0Yye/1NFJe3iHEJ/Z5He1b7IR2rQ2pD/+CeOAyBtxLPvGnbb73GP
	+ANb2f4j+5QZfAhaukjreUOwjGaMzyPvx7NPJx1K2IYKztxZ4zVZqU0R/UelQAE=
X-Google-Smtp-Source: AGHT+IGISZ8UcZWKdTj4ER9q1eUecjB1xz1bXx+pdmXID3SSnIj5uWSuHrzdnFb5v9gFQnoyAqIenA==
X-Received: by 2002:a05:600c:512a:b0:42c:b332:1619 with SMTP id 5b1f17b1804b1-42f71306febmr40360025e9.2.1727874151209;
        Wed, 02 Oct 2024 06:02:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79d8d1fasm18291635e9.10.2024.10.02.06.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:02:28 -0700 (PDT)
Date: Wed, 2 Oct 2024 16:02:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hridesh MG <hridesh699@gmail.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] staging: media: fix spelling mistakes
Message-ID: <bfc3e170-7949-4f92-b434-8cf5d08f6e58@stanley.mountain>
References: <20241002101106.56658-1-hridesh699@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002101106.56658-1-hridesh699@gmail.com>

On Wed, Oct 02, 2024 at 03:41:04PM +0530, Hridesh MG wrote:
> fix two minor spelling/grammar issues
> 
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>
> ---
> Fixes:
> 	chunck -> chunk
> 	procotol -> protocol

The other thing which changed it "follow -> following".  Put this information in
the commit message instead of the meta notes.  Probably avoid Using "Fixes:"
like that because it's not an English sentence and it looks like a Fixes: tag.

Fix three minor spelling/grammar issues:
	chunck -> chunk
	follow -> following
	procotol -> protocol

regards,
dan carpenter

