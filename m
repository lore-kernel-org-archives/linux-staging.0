Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D43628EA65
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 18:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752689192; cv=none; b=tv8p3XZ+fTHI5bhcQuVURwWIqCNmQUMQYUfl8Fz6/KqbcQs+zhsNMUI4k5ExYx5d0hp6e/2cq1Yi/ygf8/X+jybHe9i/ZFVH3g7rhyUzEiO1ZmwsRHXNTZdow+jlxyBx5c7UJixgQD2sai8/xrWayKNcWk+a8hxtlnzXzBvmupM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752689192; c=relaxed/simple;
	bh=Fb+bnhXC+g6roplVTzekjUs516fCfZaKp1oOjyn/PVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvjVb+i0BhuAg7HT+OLU4OBaK3E2yhJPGEk9KRKK3tarbtz1bwjh84mW0hN+wPyO675i5lslsIyagAMaH1GciKGZIDrK/tsIQvpuZkXC6dKZ8ddr721z3jH2+4DHz5k3RVjBNr/WA7Jf5/RAD4TC3We/snExkJA0C4mSGvpw1cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jzbwuXAy; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jzbwuXAy"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-73e65c09828so63646a34.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 11:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752689190; x=1753293990; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NbzAcHruNJwTdpqKOtcLFLtqVXw02YHMFwghN9dfHVY=;
        b=jzbwuXAyI3oFKg+m6/Nlf6eb5KpZPmxb/Aq4ZiaJISrb6Q7DeqT0BeE/wfuOJMGP3s
         b3VJq5znSCcEK5Fns7SEjytKcofPTjWW0QU/9hODdYLR4flfiI3HBEgFVSvEKCcCW+VQ
         4po6MnmHCbm2js1x2oeUcaDDfRexopgfcFlp+Go5JqKFln0Um3vmmiN3vj6luZEI+cym
         ZfQRHLcBRBhERf9GyW9PrZdHJ9ldM/YubR4ZJqZrL/dV7A5IEDx2DnyVCJjORxtrgREt
         Utqj40UVr7zzWwuC0Qmo2iVUqIhrCGbCb8gvO6YfuATbyrcdd+spXdCkhnEboUmPNIQg
         uHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752689190; x=1753293990;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NbzAcHruNJwTdpqKOtcLFLtqVXw02YHMFwghN9dfHVY=;
        b=YQsmn331x/97aD0pKZMTuzoHBXagrRtLicR/nMcLSncDwxr8W3PKUuP4mVK4lJMeHH
         QoLE/PQsLHOxR4Z+kCdIMs2zFVEzTFwaOg6rruAYQm7c3/m4CFvQ9P9RA4tDU8J8gMDx
         r6o2O8M3FzixSvSPkhzUL6Z5l67GwlGYHWZim3loL2SeopEkRGKtjcNgXoWn9pgExdlF
         6v8T91Cxb4sjJu5FwDcpt7YdgyFgVh1BrxbgL92XSTO6ONQjYORo0HXK7mOr+toGDM0i
         V886rhHJhs1ECdf02Sq7Vlt8C2U+p+oCA1lvAFDRp50WiJOFLN1Wno7j9Vdo84koYdGF
         5ZsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgEP3TNsTSEtM8z+p9tXGS4/ll5bYXmcpJBz24l8ZRSzebluQRSP36OPU7xKm+pNIq2GjulsReOwRGu9Bi@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4y1PunI70leISt0J6i35mUD+I6I9LroqhsHCQOA66ZMDkYRXG
	bKz9uOifKVisTR2sE7jpxb1EKSe1e5BPjN164WFqVWSi9AkqxqJ87czJishH3u+e+P4=
X-Gm-Gg: ASbGncupK03WApHHPBQgAjHls5+UJQCv4PP9adqtQFytmQlpoXnq4k076r8bwFRrgUi
	fQhHbxz1mEztmqdq4vgD0+QZuENFuqSzQZixEOv0/UW/oJeVCwmQmreENf4iM9dPYdwCzKopXHy
	4CsSRsGeIRWvAfv9bWxI8dN3hB3WcI8tI23DpivA1wtrQdcbV8YbrI95grWAeehyfdEAiy+zICa
	K9Z4R51NmcVh88Ft+fdRaCk407c0FoqchnUgVtOc91IfynT4ea6slNVzwkmlBflsd4zT8aNuWqD
	k7JD1vel+WN8Uvz/FJorN159T6qtQRMDOIN8enDmjM9IsiD9C0XLHzg7evlPwjrWYBKDl09f5cI
	XfdLthfNotX9DQUMUqErtYPztMSgZtOwUyiCXKfM=
X-Google-Smtp-Source: AGHT+IF9xZbeYqDiot91JRV7cu/R4VDA3yZh61kEDTkfEXwyF9ofsHIVyZ1eYQMghCfkgVBUXI53hw==
X-Received: by 2002:a05:6830:7311:b0:72b:9bb3:67cd with SMTP id 46e09a7af769-73e64a8bf13mr3689995a34.12.1752689190161;
        Wed, 16 Jul 2025 11:06:30 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2564:68a3:7d6:cb7d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e63b94769sm1008181a34.21.2025.07.16.11.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 11:06:29 -0700 (PDT)
Date: Wed, 16 Jul 2025 21:06:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5] staging: sm750fb: fix CamelCase variable naming
Message-ID: <983c5b34-f422-423c-aa21-c2f688d37b04@suswa.mountain>
References: <20250716175100.81482-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716175100.81482-1-ignacio.pena87@gmail.com>

On Wed, Jul 16, 2025 at 01:51:00PM -0400, Ignacio Peña wrote:
> From: Ignacio Pena <ignacio.pena87@gmail.com>
> 
> Replace CamelCase variable 'Bpp' with lowercase 'bpp' to fix
> checkpatch warnings about improper variable naming convention.
> 
> Note: This patch depends on the alignment fix patch that was already
> accepted into staging-testing.
> 

Don't put these kinds of notes in the permanent git log.  Put them
under the --- line.  But really the note is unnecessary because if the
other patch was already accepted then there is nothing to do.

You'll need to send a v6.

regards,
dan carpenter

