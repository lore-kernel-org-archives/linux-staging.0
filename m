Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928CF210F56
	for <linux-staging@lists.linux.dev>; Wed, 11 Dec 2024 20:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733947311; cv=none; b=hdwhkRDj0AuJgEQ4bgIFwtTTxSMKw+VXchje4DOI5kdr87qvm5oE+DqFoO1o6q55SpddKkf50IuYlkpiNdKXfpJWeiQIH6WmyCoPWZMvFYd6SCThGV5hq6kMCIz7UbtrWvXvpqeqjRjYZraDumpUMsV3NxNcGhD8V4h/662Ma4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733947311; c=relaxed/simple;
	bh=jvNr/mm/KISVeWk0aeIVt8GN7pPxb3OnVWvrYZ/AUP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NyveCLdklAMbuhNww2v+aVajcdbuMI9MOcxxopL1pzHWTpRaCf8P9lzAKEKQnt8+71G4hQuRgZqO0KIcBtf/FNVxsXwl5PBsHo0/T9ra6U7E9W5ULfuEwfDCtG9L1PWl5dxwHU4pEmchm7FVWnql16q/lvsntCf3FI8zst8mSVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w5bF3aqC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w5bF3aqC"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434a1fe2b43so71350385e9.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Dec 2024 12:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733947308; x=1734552108; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xy0r5zhlEBX198RCSafsNFSDYJdvGKEyDvKJy8g2liM=;
        b=w5bF3aqC9asMsWN+hp1MyW0HccAKehGD+R5mIGQ1BO1zJmzjlzKNCc8C6e57ftgCuU
         ROfZH/UeT1RXEdFp6aI1A9JMBdY/NhM92CmVbrC95pzQMqAvdw+l/xl38zxKW56YOrcq
         r7vw0mwHZ/0KW8bvx68o+jZgIuO0IZs+OYKySnWGxuLjGSqSJbk0472Z8UMioaV89v/C
         f8SKamld1Tw4KYXTz59YW2ugSLHS2KQnOEb0f8a/MTYVOKTINnnUI62gKiBE6zH1SF/3
         nrXo3ZGlTa05i2XM0qOqgJGS+0g0Dtywk7WMW156J4wZrpfMRoQ+h48oC1Z0ffxdZprQ
         nnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733947308; x=1734552108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy0r5zhlEBX198RCSafsNFSDYJdvGKEyDvKJy8g2liM=;
        b=m+vMCyxij37pG/cfpD4lYDWLY1zaej6pw3f9neYTAsmaMXiB9seOOp73H3056Rg4ik
         mKam9b8t3tx+F81AxD3+IxprSauYTHQAwaHgp3Da54JJ9fWRllssdBKhViodE0R5OUpi
         ihpwkG/u/YlZvnz6VYrmVHcqE/CRMMDxcysi6LvS0RCXG6Jp1IK6vrwxYUqmtGQMZZPh
         S6Hxo7oADlZLGw6A5uJgzZiz5DZWBYLUeQ7ywp9HHKptiZ9piJzpT9HgSPgsg93bP9ge
         D14NHyReY5So1unKptsw9x1M4+L4Hm0dlPaSD5vBjCGXa/HkCj2Ih8+/Q4uoQrUV+7xu
         aTmA==
X-Forwarded-Encrypted: i=1; AJvYcCUk94wDbolp0+pxbejDhniW2TXK852tFcxIJ1idMrGBBvMvgloPqX+ADJW4AtzgF2GzKw/Q4tTKK3h18cFe@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy/KdYtXMyfgPrQRFf41+y2gj9cJtwmbFjnM/URCTdIog97PSQ
	YOM8JXev1ObQtsMsNxgmXjWiXjRavGtTAEVPJr1l9FWmhKHVzz8dY9JarwDpok0=
X-Gm-Gg: ASbGnct1fO0xVfuWr0wey7WjIe+jvvT8/Yh9ECgx308sOoWPjPPFegqrFYUUQU0OgAG
	hFKDzrr9piYc76NtxRmFyZCHqmtt2zf/4L9kOCmoNDjRenknM3SnTV4VSbelArCnZH3GHOMI4dX
	bo5B3rmgytZYB3nMAIlsOwxhhv8xeGiCRiICXTYhqQSqt2COsVluSppj9Pld+Ww5v7Frk3T17OO
	RuOcE91DQcqyPXdut8OSymTgWqP00h7Za1UelLyHbSrJx35TyPxQuU/Pxk=
X-Google-Smtp-Source: AGHT+IEOphev5W0KGJg+nO81TIAt1Rqh9pfXsnfrArp+4ViyI3T7Wf3ChJSDYoItEG2a8bgxut2RoQ==
X-Received: by 2002:a05:6000:186b:b0:386:4a24:1916 with SMTP id ffacd0b85a97d-387877c2690mr705067f8f.55.1733947307320;
        Wed, 11 Dec 2024 12:01:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824bf19dsm1966698f8f.53.2024.12.11.12.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 12:01:46 -0800 (PST)
Date: Wed, 11 Dec 2024 23:01:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: eisantosh95@gmail.com
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rohit Chavan <roheetchavan@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Wrapped macro in parentheses to ensure
 the correct evaluation order
Message-ID: <292b38bb-6dc7-4ea0-889c-deefadc1b3f6@stanley.mountain>
References: <20241211192209.22493-1-eisantosh95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211192209.22493-1-eisantosh95@gmail.com>

On Thu, Dec 12, 2024 at 12:52:04AM +0530, eisantosh95@gmail.com wrote:
> From: Santosh Mahto <eisantosh95@gmail.com>
> 
> ERROR found by checkpatch.pl script
> 
> Signed-off-by: Santosh Mahto <eisantosh95@gmail.com>
> ---

Checkpatch isn't always right.  Adding parentheses breaks the build.

regards,
dan carpenter

