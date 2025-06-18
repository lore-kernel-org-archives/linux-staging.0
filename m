Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1281C2153D8
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 20:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278942; cv=none; b=mikmS88o14d3UIU0/uziaQFZYk7q7qQUNrrYCyTvOBELnMVZQ2XAzU2REc9MyWQBW4A/o8JRc+62isRPDhixIPRQdOTrEG/MqRSieQXmC4Essrs/RYgnOUJAi2Gu7larwuRJXVLk8VwaYlXC8EWfBMAfJrbQwIv7tnzrTjV28bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278942; c=relaxed/simple;
	bh=tdp5QLiOHOlbEuOqjEnrUJUC9ruma8uLiofFcPaxxr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQaGVVD/HANNeDGBBboeAJSPR+xI0bL1BKxA6t5sCCNfgfIBJLglaX4VDLSOi1jHwuqsIRhq8giFXPRM6/PYC8+LoLTiKA34hX7RZKd6o2ksvlKidiYiM29REfjV9QpoGNrg3VzvWV0pxLDf0U7SBDEDsWwo/1biADtAAsUvmjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lNUNwL+O; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lNUNwL+O"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6021e3daeabso42297eaf.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 13:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750278940; x=1750883740; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pwz6CXNC/ugKSGzRSaUzyFgubl0Bnw6BYLYgHCUjaIs=;
        b=lNUNwL+Ol2ONBtwiXvsJnYjiQsMRELcG/vEimNPePHGIj4y1AXLSo2d2VGXNxnfT73
         HZ5R6o9A9lOVoAJuIgDKcUAOChG5a0yb22Aif1uitUjpQGVgvVgjiPfSPjbnF3COOa97
         agF9c8A4a3hDgIvY4QOmPXTQUeMgjV7nQpEkcwq6ZEsbPKc+lrAfGqizKgvfntLe+XwY
         2XBeGyI6ILZ9Gv9fPrL9sWpQnr7NMRImV3Cp+mU6o4HRFbYn8LMCjBqfD1rhiW7aGpa/
         /hOMnb6gWV+Gua6VRMW6QuM9u9NWwXhHsdihyun6dRsefN4bmHFHmj/396yu0fL3KM9f
         62hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278940; x=1750883740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pwz6CXNC/ugKSGzRSaUzyFgubl0Bnw6BYLYgHCUjaIs=;
        b=Z8Y9MYG1JQU34JeYDO/QaaRPe2YWyyTR5vu6rYy3IU6jZ/XkDppyEypLbGPDRJuKke
         zIrMlA6wUT2DvdZkuVWo88fDbODLgp3o0x7UCXD9G4HyxN+3sUPvv7erHG8ojxNot6Jz
         fIXHnDoWltyUSPJhlTS5Jn5BnUeYKGRZag0ebHXjq/TXpOt8GHm/Y1ZnHmLh3qcOd5Ze
         /wDDfeJ59ztxDkqQ9EHWpslJeQFBiIGKDw8FglOSHR1uYrveasEEfSKxba0hE9fPYpYz
         T0lZW9mnff84onw/EIUa6p3UeAvxMf40RrNTugAODtTUf2dIdAffhYo/7Ce7CrFkPfZ0
         iFNw==
X-Forwarded-Encrypted: i=1; AJvYcCVsWcMLKdBghdectUwj8VCjp9BTgRt9tHHVab5YqLqEGT0MUrrzyroTY8YMNQLwdhdp2mBYhFk8s+Q85Abg@lists.linux.dev
X-Gm-Message-State: AOJu0YyJKoRsRLGX26t6fqOrivP5SbvX5LOLArKhqp8iD0hSWi7jYhMT
	/PADpAqum3xFvSdYFKKBEbbK+D3fzrP2JFwaP0EEUj418OgLm3AHWH81qQcSM5BwHEsLhBNq6o8
	HRbm6
X-Gm-Gg: ASbGncs5fJZvWcslslAeRuAgXvONsgyDCxILrUUwPQD7w8YzrcwK/p5YRHae0y6bhYp
	JIp0nSGsMyUkYfWrIy6V0GfoGiOqb7Z22vUkMblUJP9cmVT1rvpuJ+ajVZlonW5vGgtFc2UyKrU
	AtqGTwZRd9DIKpGlIu6JeE9UZdSdf4jPFnfAfP4eJgGriwgQgsI63urNsKUQ0g+c4Q3fg5QhLJV
	7uPAZTAaUWHqWJxKMkifA47uWMC9L73v5lYALHhFWG1l85U330aQTvMJzJLSMDC4GqMyprVePG8
	loOGZ4C+Jb9Cmq3aEICb2TODUZVt3bly2yFEHlebGQhD8FvUcOAODDx8MZ21xONf709v4Q==
X-Google-Smtp-Source: AGHT+IGRCmNb//Da94sttc1weAAS9cWSvAcRjNV3ZWYi9u1xEdpXbwT3dLO6ss01/8BbJ7B/FZfsBA==
X-Received: by 2002:a05:6820:2f03:b0:611:11a3:7cd7 with SMTP id 006d021491bc7-61111a37e53mr7441793eaf.4.1750278940022;
        Wed, 18 Jun 2025 13:35:40 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108d73d80sm1440150eaf.4.2025.06.18.13.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:35:38 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:35:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: hansg@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 4/5] Staging: media: atomisp: i2c: struct definition style
Message-ID: <e9b65715-7ea6-460f-9749-16e07844d3a2@suswa.mountain>
References: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
 <20250615231143.1558392-4-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615231143.1558392-4-thomas.andreatta2000@gmail.com>

On Mon, Jun 16, 2025 at 01:11:42AM +0200, Thomas Andreatta wrote:
> >From `static struct gc2235_reg const` to `static const struct gc2235_reg`

The patch is probably fine, but this sentence is weird.  Please
re-write the commit message.

regards,
dan carpenter

