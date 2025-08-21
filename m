Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1FF2869E
	for <linux-staging@lists.linux.dev>; Thu, 21 Aug 2025 12:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755779348; cv=none; b=gt7H2r4JJ2J+TwB0rZzDTWD22auOtOqXkD2bSBX3Dj/RMUceuInyLSWhrX36BcGenkPpXXnG7/bMrBi5sfPnBGSy/yUcJbhia373dpKIuQHDb/ABRFHy4EqlxiLZRUi4NQIl81EjrOhYldPiy4ir3Fqt2YgQWHDET5ZtJ+eA664=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755779348; c=relaxed/simple;
	bh=ipyvJjqvXQZXiCECZcXAcXKFk38PARAX3ClkU4503z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WejPwNjLQ3fKs9hI2PYodCqQ9V8WbcklCQQjeTmO2PzlrbghnGljWSObgqJm4AsR36RWmi2T+DAL6DosQcyIB3UkO3Cx/GLRZ9z5RFbNBJClnq/mPgyQpMnAXZAS9PUeARA3tFoXKjRzfMN/GiFwAEgRJXshPeY/0IhlfzHfz4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LCvXuGAT; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LCvXuGAT"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b4a25ccceso5291805e9.3
        for <linux-staging@lists.linux.dev>; Thu, 21 Aug 2025 05:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755779346; x=1756384146; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uk+Gw1wsKmJ7CUTVerhhurDygK4Wa2zZgqD1NupOrg8=;
        b=LCvXuGATeXwnSntQdfRSHpyTi5EIWdwOZ7IumYaWXs0mXKhFPvZLz2LY01kjpfzzu8
         xfIV0PL0OnnqnqBROb11At51P0eg5Ec0XwUe4ojQNUx1bm7/7ja8WimUYlhsIcTo4MTN
         o1tLfV9zE51z/x4wxqN0mjN0Figvo4l6Lsx0zB9Bh5+UlgYfJ8K/TChvJaxp0rybE6FG
         /Y3W/XB0JlKKyIOL5PF7fwkAuNmGyHzWe2srKx3sobxAL0CSuxwjA7gcqvz+qf535PpR
         zDyKlpR4vmOXkxgYluZ+za3bRCFiF1+fDhrsAjSHJ5FB3Ya54uh9V2iFXLgC9YnslwmV
         5U9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755779346; x=1756384146;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uk+Gw1wsKmJ7CUTVerhhurDygK4Wa2zZgqD1NupOrg8=;
        b=X7vkxrBzmV8XjgYbvtcs68DVj9IAQJE4MA3TjntEJmEUrqDmHfa90lfYDURCmShu0M
         RiVJciWo5eAzR/pW/6e+tVuu3RvMFuKDqTMQ/BcGbGCLIOP6o2/R2lb5wsWuOs2pIhRH
         vNuvkylIFwjwyKmVkbg2WJxtU3WeliotjNmmXUMs7TowNDkYLR/vJXP1PLKarELH8XCK
         LAQN6ZWWPZbIApqIbPrf+e1VIhlz5QKo5niAM0hfmD5RmnSV/dp0459eQj+jZicLgFLn
         SAZF+1ne6p+hZfrpxXAArnaZ0upMQSaWxVYVrOfmnZfFF0L2eXKWUk54c3nPsZvbWiWE
         NDeA==
X-Forwarded-Encrypted: i=1; AJvYcCUcmnDLr3BuNrq9V/Tm+j+nG+TdpIcePBw1hxnsjJ8DGCgZpOl4uxJOAurwFbpAYRDtqH6+J1OieBjDN6wv@lists.linux.dev
X-Gm-Message-State: AOJu0YyWq2KcaWIdOSxpu37sgk2MaBU6IEWmADjafLTt5xkM/AuIOJnG
	TgGSZOtzbyrTrVGmqB/AaMQXM6EkSizeOCDL4GaOxya36AgTH58JzyqS9v2KDXUybYY=
X-Gm-Gg: ASbGncuovf5HSVvVvFrS8+1ZaPEHu6Of2F40Af/NcamfQr4H3VUi6mYXn6AQCbbhVj8
	OSfKMOo24el8beVd6R+4tS4bNMZv1xff+gzuaBNAjKKgxExVjGFHhX5nPUlevVk8GcSi5EwF6lB
	qaONfrWYGZMBB0r+N9eczM1r7B6hWAvoosFo61ch0V2FleHWXwEOche0N6n+nOeABEEpVqzLGtJ
	HUGkalZBgfJA6S4RlCv4wNOSwoZJBp4c/w6Xk6LV/RQG6QfFRzLG91DNJJ1BXMMYZaci/C8Q1SF
	1ejSWz5481uxkiRU7G5ts9y0Gt6014cOEeo6eiETbZluw65UWx5tvVQnxGvykUkjmSwq5HGGCay
	C9Wlb/xxMhC8R5XeNp4OILMu3ttuFoD0FMUfkHw==
X-Google-Smtp-Source: AGHT+IGJrYKPC9BNmSR70F39FVaCXjHhbs3ESqGZ+t90Sf0UFy3gTnptWt8uEhlEoOhqqmoO/zvgsA==
X-Received: by 2002:a05:600c:4743:b0:459:d6a6:77c with SMTP id 5b1f17b1804b1-45b4d85db41mr19889845e9.33.1755779345665;
        Thu, 21 Aug 2025 05:29:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4dc25b04sm26193375e9.22.2025.08.21.05.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 05:29:05 -0700 (PDT)
Date: Thu, 21 Aug 2025 15:29:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/3] staging: media: atomisp: Remove unnecessary
 inline declaration in gdc.c
Message-ID: <aKcRDWlRQ1gughvQ@stanley.mountain>
References: <20250821070130.2581766-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821070130.2581766-1-abarnas@google.com>

On Thu, Aug 21, 2025 at 07:01:28AM +0000, Adrian Barnaś wrote:
> Get rid of gdc_reg_store() forward declaration because it brings no value

The subject should say "forward" instead of "inline".  Also add a period
to the end of your sentences.

regards,
dan carpenter

