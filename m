Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F12A1C07F9
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 12:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729081746; cv=none; b=n2TAM/azlyKfbpgAVd52/28LhCFLkzbeh+FUsqikX9TbCYMXNdGCFzceab42aUwp98fCp7fHR92ahav5x05jYy4rounD8rIaszJ+qog9LfL4a/whICKMRxYGdduYe1aUqsazQ7Zi845aKDhgHux5b7xnnwdi0X9BdHeCtMhH/+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729081746; c=relaxed/simple;
	bh=KspREqt4KaeMO3yuVoFhoMugEprbEhTggHjXvlDeyWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7h1nWmit2+oK8dJ98SDaXtBkSrRuVPZHVyksYGkXHItmx02SZwH67rNG0G9f0pyk2hUnVwZh/Z4qqiR2ImGnZQFrDVp3B1/hnbMKNSXmCL2FMTQ0cXtq2taxII11c5b3/Y5oCt+TVr8/Y93fZoGpt44L/wL1MVpkXYwzXl/nFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcggdCyI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcggdCyI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d808ae924so1293613f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 05:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729081743; x=1729686543; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jqRq8K4hvaYqPN23feyTC2SjJloWN6BY1l6v0lnE3aw=;
        b=bcggdCyIYLDYptJM9pUYIZniEY6WN0hdcRbRVu0maM9cwPV57l0BSp39qRSGRkP49j
         wdXzksVvqjc1iX+ugOgvAKj8PIHQhSBELcwAgEPxp3WSP9+wuIJcFyr+YKl+tzNCvxLj
         tT9v/HFD6osmoHNmlGPPjtEDfRTIQtizEnABa/83Ua54ddoizgnLuTeb8vELFXxhZNW/
         8iGgoTohITsw//G+0vmmtBYnkw/KvWZ3ALlBldHCd5jKNnlQrmMvzEYFNtfXITstVe2u
         ndUm/YDgc2PgK1DX/o6MZ5Z1+2K++Op+PXUXNscjrXe1FbF2vwNsw+uB5EyZDinc89a+
         2EDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729081743; x=1729686543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqRq8K4hvaYqPN23feyTC2SjJloWN6BY1l6v0lnE3aw=;
        b=e5q5NuPElawLg8J80tKpMTwWGvMAnWHbwkbAuZnA8SdVv++svfTGeG79ecKpnlpYo5
         Tyxcia1YJXjyiH+Bytre1AkkadUXuQVDFGWJbaIbgBNdeNiBgtLC3KUY3ws1Wp8qv7dH
         KA41ID5HChtMT7ZY3T+ubYdGjLHq0GShWwFWRZ9zmGvJEhQ06NIVw3+6dpUgHVJ4Vf5J
         qSjwpSUtn8eyJiOvOumFwlblUrsBUx12KkWUnIUdj0ZbKe51frY315oBVds2Rstx/bKL
         xc+b7D++oS9ukNWk7LQmnPsM/5dPHbyLzdofGkidAOYnhIVvKTTf73CTibS4VFPzmuyY
         loHg==
X-Forwarded-Encrypted: i=1; AJvYcCVwkcT6MO0yYGBcCPfZgdTXwm4kDGlc74wrgLwUSMHZGWhWI5WuUJKZsQC7kjAmPFWPhZJ2m1z6qT9EQKVX@lists.linux.dev
X-Gm-Message-State: AOJu0YwWDsHoDAL8ttqAb5/U0yUbzMVeKro272lyuFQrTdMedF/6UwcT
	0sYiW5VDU/QpQwtGtoEE4B7sfdYf830q+8N0V+qra3eInIdPQfGP
X-Google-Smtp-Source: AGHT+IEQPsc5ucfJIMAR1q44dVYgDTDvroc8uy/5hf3QHqKN1OwsH+h3z3mltyjwdebTtVq7U427Rw==
X-Received: by 2002:a5d:4e0e:0:b0:374:c56e:1d44 with SMTP id ffacd0b85a97d-37d86d59a06mr2489037f8f.48.1729081742681;
        Wed, 16 Oct 2024 05:29:02 -0700 (PDT)
Received: from egonzo ([82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa90915sm4243400f8f.56.2024.10.16.05.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 05:29:01 -0700 (PDT)
Date: Wed, 16 Oct 2024 14:28:58 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Rohit Chavan <roheetchavan@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: gpib: Remove unneeded semicolon.
Message-ID: <Zw-xilwBCZoFea5x@egonzo>
References: <20241016113010.1619275-1-roheetchavan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016113010.1619275-1-roheetchavan@gmail.com>

On Wed, Oct 16, 2024 at 05:00:10PM +0530, Rohit Chavan wrote:
> This patch cleans up the GPIB driver by removing unneeded semicolons.
> 
> Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
> ---
> Changes since v1:
>  - Make commit message concise
> ---
>  drivers/staging/gpib/tms9914/tms9914.c | 4 ++--
>  drivers/staging/gpib/tnt4882/mite.c    | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> 
Reviewed-by: Dave Penkler <dpenkler@gmail.com>
