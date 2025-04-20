Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A9D647;
	Sun, 20 Apr 2025 00:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745110372; cv=none; b=MinAk2gTFKy4mDRZuxNnx4XWbFD00Q7JAxawz8DAes8eqfA2VlsLsaKNS7QvkSJK7vPa2/MZnAfCFvAC3gKnMsMHtw7P5Tgg0ofS2FdmXGIUx9GU14P20onS4g/3+5ozUxNFCEjE9K1GcndPr5N3D6O2jDauP5GSkFy2bkHvxpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745110372; c=relaxed/simple;
	bh=CwlbY0fPd8cTaYgi4MJrB4MplljLJBVxwDgrw47Ao9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhEp1UpTnGLNPKMmnheCJS0UM8mgn3qgWG4HPZBJOVnkjsavj5LIc7Ue30l6rLEKYI/szzSlMOFDbL1HX3MmZ0OU3JByktCXnb8FPQfFiSv5eFbwcbBXClyyDSpxFfh1oAE14hkLja3l8XX5IdS5UI/2NrbdYR1Sw0b3BL+BirE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUfULJz/; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUfULJz/"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-227b828de00so30938385ad.1;
        Sat, 19 Apr 2025 17:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745110370; x=1745715170; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCEcEMEu0T58jlK4WSPJn1HU+qrJIQ5pWFvzDqCoZx0=;
        b=hUfULJz/Qb4Gaiz3vc13envW/xdXoAGM/qMIHvm/LwlqvF+FkW1Vno0Tzy4btYes4R
         5J54nkTDqa2a/WsANPG/GWRHS9yWInikmuTD1cbjeh3XUSY/efPHavSs/FLtFXK+vQBF
         vzgHka/cGJ4Ow/gIKQhzFEZYeoP2XWzZRmRdVmvmWZlLEC5F3nsjfJaYQvknGaGkDQrB
         RbXR+Y8PGO6+gJZ5uoLHQh3+j3g9CPUIx3SdJUwVbg8jfdMiQ71HMOr7VjQyWMFIDB2f
         KvwkQc0MryaTYIGqL4hcSjyT7mnpLFxHyHAcYLA6rxhWkPKmn2Zb6a4yhuA98tTzvSaK
         cLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745110370; x=1745715170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCEcEMEu0T58jlK4WSPJn1HU+qrJIQ5pWFvzDqCoZx0=;
        b=EHPN/VANDeT41d4TCVoZT7vsHNpjPL6hChOErClu3Xkm2ThOTfPzQjAyLrNe2lcP3N
         cyzeGhvkZZv6sVh9gxpoQSQItYQ+h+eAo4NDCWQvxL4x2cZIv51xZD8q+eC2GPdMoFq0
         d6TuXC0RagBgbGnWQJwWXi29lJwpb4CSudO3/Jt7wXIb56Kb298wlAQuDpGK3d+/Nrr7
         lMvCRWk/Y0pT3fNrWrg6XifzaLrlFSCl+5/fy8BU3TJ0QK0hMUVkzscdACpqlafiwJkK
         JEvgBV/t1P/0eKxpsABNQfN57q2HMraNQCAgWypVUViyUmD+1qQfnqQMG95L4pdkNSMs
         saJw==
X-Forwarded-Encrypted: i=1; AJvYcCXqnd9egNgWsLs3KuieM4Opa4MOyZ/dnDwV0P3ZcHa3n1vvwWkAKW64bChKa+0x7B+GDEaMYHNhO2U3LouqkEtNBHRjIw==@lists.linux.dev, AJvYcCXzuKVB8pyLP9+WNuxOrp9+gwGT1EnXOpEyEx8NRNwGGs5YdLesypImXzG+I1OnzMXjuabswhKqpwrXtTXdqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4nAE3HK8T46qnwrpkdTAJb1/RPAc8z8ttEOAHX9yFZwYCu5dY
	TmglD+6gBcBi+nhCR+Fe6JDYlwIYCMOGNiyM0SnTlcs41Taf3Q3uQVC10Mzsj7I=
X-Gm-Gg: ASbGnct4w/icqW0NCgM+ChtYAuK+sT4nya1L3/hbK2rlsoHI06NOf87y4b03xYgw5tM
	Vuuf3ZZ6ZSOfgP2twlJXEXropld4xCoZfH5aK/KY4TlclelZG1NEWYpsWeGR381yAw8CCpEfmy4
	E74P7DrHx82udTAsa80rHsx6YmKxQUBpPwG1S1SC7ENISNAUdd0ZizAtikNT/mnPayzzo1S+r0z
	AP+Aqn6uaZuI9Kt9wPFK1ngjEVFKckMM2d1mcriQvXY7gYKH4UC00D+jFV1VCSFIEIq85E/Wt/1
	hOGhotTSoF3dDeP7jjywpa+RiStRWTYfe4rxd9xIEOxWgxw=
X-Google-Smtp-Source: AGHT+IEKuOjMisIHnkcON6V5W+EQxT7CT/sccCGEABpJ9C2IGfj8njkW9qdh/ZaY13cBUxDKtNkxhw==
X-Received: by 2002:a17:903:250:b0:224:1ec0:8a0c with SMTP id d9443c01a7336-22c535acd5cmr113719415ad.29.1745110369690;
        Sat, 19 Apr 2025 17:52:49 -0700 (PDT)
Received: from localhost ([2804:30c:90e:1e00:5265:5254:2e32:7e5])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22c50fdf1f1sm39487585ad.237.2025.04.19.17.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 17:52:48 -0700 (PDT)
Date: Sat, 19 Apr 2025 21:54:00 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] staging: iio: ad5933: Correct settling cycles
 encoding per datasheet
Message-ID: <aARFqG--oRuwhUmR@debian-BULLSEYE-live-builder-AMD64>
References: <20250420003000.842747-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420003000.842747-1-gshahrouzi@gmail.com>

On 04/19, Gabriel Shahrouzi wrote:
> Implement the settling cycles encoding as specified in the AD5933
> datasheet, Table 13 ("Number of Settling Times Cycles Register"). The
> previous logic did not correctly translate the user-requested effective
> cycle count into the required 9-bit base + 2-bit multiplier format
> (D10..D0) for values exceeding 511.
Hmm, the above description should probably go on the refactoring patch I think.
Otherwise looks good.

Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

> 
> Clamp the user input for out_altvoltage0_settling_cycles to the
> maximum effective value of 2044 cycles (511 * 4x multiplier).
> 
> Fixes: f94aa354d676 ("iio: impedance-analyzer: New driver for AD5933/4 Impedance Converter, Network Analyzer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
> Changes in v3:
> 	- Only include fix (remove refactoring which will be its own
> 	  separate patch).
> Changes in v2:
>         - Fix spacing in comment around '+'.
>         - Define mask and values for settling cycle multipliers.
> ---
