Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1727194A65
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 15:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722354105; cv=none; b=Nb3mdepEWqTF6mqvCuGR9Z/FQRi7XWSmgOixjihHCEkYLG7TMH4jxcGQsauVD7Mk73r7H7jxWPLZjL2e86xM6/dk7/Y4vILHwSH2ZVIsRXqQuz7+mClMPdw2jiHoirwSdS5hGeahLdb2rbtyZrx/LbLnVnejDgHOMb8+JYL1KDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722354105; c=relaxed/simple;
	bh=6S1+m+RU5TP0WJO+ATrG36zohR9UGzfg3bpcYcZuyIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4jrnkr6pzxCdzEPN85u4GHAMsTEIheMmHp9pgwbu7HxrOAO0s+oEAmgjagfVKxEHiQmdN+V5kLq1BhU+RUcC6hozqYxBwH+cAiNIxkbyn1BXgY4IndjXMcFKsBnb8tDgm1JvNwbRYwOztTwEfvQJBQEfkBJBHTuFliQqQNqq/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ILbsytNz; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ILbsytNz"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-260f863108fso2824277fac.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 08:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722354103; x=1722958903; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QOYhoQjLh01grFeGpfGAtgBAV8l3EXt2trNxBAoFc2Y=;
        b=ILbsytNzB2xwCQynjfSDJsSgGJRdL+W+p+JuWrotmeo8mC2n9Qirf9ycroPx/rogXv
         iMz+7elPdE2M5A1GBBt45HGnk26kcm/pUAJq0PrK9wrA8C0Yne7YKATl9NxQ9RVFUvqf
         cj9BZS30j6niqRHa64RbC+chHg6jwov/oU3sSPrLY7RNX5G0KwUEmPIgwOOdtRetBUZT
         BFGzR9O6ZXQsZPulwUBTLu19AYpDP/zSaBF3Awm0ndWbVy+jY5yiJOlSO8Cus8ASMn6H
         yGwTwZZ9iYxkmJs9y9sY/egslZCMEPT6RU15R/PBJkoLaZDAl81DWA3ekvG5BzxVCnzF
         +0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722354103; x=1722958903;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QOYhoQjLh01grFeGpfGAtgBAV8l3EXt2trNxBAoFc2Y=;
        b=oe9m8IggfwHVmqD1JmKQMoYCUz8b6Qrct5d8W5T0CqNEUp/FCe5cZUwwSscU8sGZhf
         e3mTsVbg+gqYEcRHoeHPDwOA/E2pANrnQDs1ubAw0UG4xxgCi9QkiTduuwIU81Hc4ocW
         RS3YDBGuAclSsdFGWbZNNj7bDOpChO/BktbOz0Bcg2TUPEnwec9iLjDQjg6cG71+IJtA
         wQX8e1UE8Z75jhO6HjtOmYi26aqL7FwecDNZ+zJUCL2gr1RLICx22lSvICpzFqRTkG9s
         ibsow4hH0s1jU3PnYfYSkdAREJ8uYd/QgLNJWFcps/5wwtlHkWphWkfexJif8midJUfJ
         RHdw==
X-Forwarded-Encrypted: i=1; AJvYcCWrj0OeutvTB+SIRhnmBGHdsL29IGU1V+Fdmh/8Ih66mzFck3G/v2FucD/PUi7HpZ4BFLrj3L6MvNvlinx/vV8I7Dcmr4NiYBAs4sXkhA==
X-Gm-Message-State: AOJu0Yy+oTeglWHXLrjjI0s1j3kkYl54DOd5ne6S+5WsCweCLbqCp/KI
	loV6U2eDDtYo7URpt3KRIJfiXBIwlMvpZ9S4mJfvo2UJbKOlF2gCDKjFyrv5WgM=
X-Google-Smtp-Source: AGHT+IGqePBFhhpk8DQstbQ3a2wmKNDOtmsTlHz8YGGpoYP/ywMn8gIPcKM/fxeJ8kWYjggfjSyb2Q==
X-Received: by 2002:a05:6870:519:b0:25d:dea:456f with SMTP id 586e51a60fabf-267d4f36803mr13457664fac.42.1722354103139;
        Tue, 30 Jul 2024 08:41:43 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7095ad4e936sm428038a34.7.2024.07.30.08.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 08:41:42 -0700 (PDT)
Date: Tue, 30 Jul 2024 10:41:40 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Santiago Ruano =?iso-8859-1?Q?Rinc=F3n?= <santiagorr@riseup.net>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, helen.koike@collabora.com,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v2 1/2] staging: media: sdis: move open brace to a new
 line
Message-ID: <e7fb44cc-1a48-4486-b9b6-e505fa1a4e73@suswa.mountain>
References: <20240730080628.991297-1-santiagorr@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240730080628.991297-1-santiagorr@riseup.net>

On Tue, Jul 30, 2024 at 05:06:27PM +0900, Santiago Ruano Rincón wrote:
> Fix checkpatch error "ERROR: open brace '{' following function
> definitions go on the next line" in sdis_1.0/ia_css_sdis.host.c:239.
> 
> Signed-off-by: Santiago Ruano Rincón <santiagorr@riseup.net>
> 
> ---
> This is one of my first patches. Could you please tell me if is there
> anything wrong with it? Thank you.

v2 patches need to say what changed since v1.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

