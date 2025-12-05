Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51860355050
	for <linux-staging@lists.linux.dev>; Fri,  5 Dec 2025 07:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764919650; cv=none; b=gJZ9JuOgi3xSHPip5IMqv7sHNmkyf58tzzhe2FDNPiGmmXWoYT8cVRhtW2hfSYxUM3xg2d7p7QApJ2MNykMXsvSjwmyJmihrhNFgEygOGETHM/T/bU26wqmC2be4W4RppeslCz8rSHyWxvlvjEZdN1Ji/YwnPpA7TN0Du68iOxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764919650; c=relaxed/simple;
	bh=CZILDV4rp3fLc54B2oxY0hTvE2X2XCFxhFLW4l/1SRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJKTjYK3nOZn5QqhYZ3TAmw0EIfrKDU2+YDyNglQZ3M7pdKmvmTJh9W7TCLZzLE1QCTLAZpa63NEWspK2hXfoMralhQvk3zRctjhKyPIVoAPghy02zYqvfgAlSf3Tc1m6hJK3+CRTfT3pGrCnuHbPrtvRO3lA6DO0OQbzIXOcLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hJq0p89r; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hJq0p89r"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42e29739ff1so757701f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 04 Dec 2025 23:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764919630; x=1765524430; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cmdMp8pUxPj98ZnQAz0LAJJcQfL1Jq/MIx9tUtAqMG0=;
        b=hJq0p89rSV8TdjZQKaz88xAofCPFusars2+bDCDAilzsRuKbe8hatL2x+OZQ7dEdJr
         anHRx3dqvTtE96O2507SXJg1uGJ1OGKCsY5TetHRYMEprgUg59j5HWgEBmSLB+2uuJh2
         7LF+o5OO+n+Hy9xkRa8M3OeOB1jmgMyewAPj4T0Pzv5iwC/qyEFNpAjTq2TZZnh4d5a3
         43u6rlj+VD80IeeEn0t6jhJY34K53z76FQGhgThw1Iw938WVt7xljtTBAaFNg+1e+yyX
         v75xBciPaPUoOY7JPdfnPYc5e7AJLJRUPvFCe1Gur2uBym6N1lnLLvHgqA09RjA2/q0V
         FXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764919630; x=1765524430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmdMp8pUxPj98ZnQAz0LAJJcQfL1Jq/MIx9tUtAqMG0=;
        b=CwzDvweyut58NQB8S7HJfEqkwmF3admoJVFRYf8pfmuTyQzWj1tJTxh+QkEkONGbxe
         81V0ofMLZYhPR5aT4SwRZyeThYwmchkXMFN2nD5aVQhBy4Mt1bpinXhDsr01AL0UZ3Y/
         8yKIfNYYzvBfwAEO0Feoy5p8bwNYzmIo7yQ8MqNy5TFHB2cu+P1sCGWM5OHz7QUQtUH8
         Z4cyja4tuHFygl09vtNyw6CrWJjDIVEfI4lBc4Ihc8jUtFP0fv0o2cK8v/fkJrBvuhjj
         9eZDTGTzzUzhQKvGwLLbS/jhXlHnk+qbAs1UmRpKgqrKpErLWEuMsZuIaW6rLklC2lbb
         k5dw==
X-Forwarded-Encrypted: i=1; AJvYcCVWpnZTsN1K8R9BlWXakyyrWgCdhmrdoLJ45izRpJ8OEYXig+gXDbZe9MsabPirml/bRGU3p3SKy8XhocJo@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2ZtiKIz7qF6AIUc+g3BvBmnFI5vDZ+PqgQ3RXOerx3mi/vXCx
	dPuK8ok5gPThSGBZH8EYd2FTRMjcAS83pHvGSm1rQ9NLsL/AIfZ4VNkS4WswHYCti4A=
X-Gm-Gg: ASbGncuMY6HRJWCOCW3YYmsItb/Y6ZdP5Ey5cWXqUBTLe9E52aBMiFYNjlduJ9Aln4t
	d04tANg7Sw43T02ygnFtF/LkDsNkiREd8Xd6L4E/fRPGXVev9WdaeNGS3AJGwcauEDbTFurP1d+
	XjEcl1S0PPQ4+rmttLJ+2f3EBFEdhcbFxwifoLT8N9tw2R32NJ6XwY6XTvmDUgrKGhaeFK6Qa79
	7zdyPifbe3mGxnUrbzrztKFbPp1S4kY9cGcSYBeiqRvLPBvThNKIRRHYu3G/34LiqxEw56RsnOn
	IGbDEeFp+YZsWs4cUMCmvqa0rjNHEXs9r26WbXJpiy+UplFHVano2+kW9LBxvB0LzbszUrzws5+
	cLWwQ2H5eE7xgQt7GO5Ew4lwQObDiYQNp7QKDl/OvzqC0jPvzuxOCfOxNzEDTKV/K7LsMkpITDe
	tr8OB0wkc/r2KRaP3/
X-Google-Smtp-Source: AGHT+IFBK31HtXZveFNyUwIRCfd9avIi+htsMbaBgOkfxItSOeqhFcRvaUxPxjnEtb200nCr3ZDiJg==
X-Received: by 2002:a05:6000:608:b0:3e7:6424:1b47 with SMTP id ffacd0b85a97d-42f7875f62dmr6797375f8f.6.1764919629821;
        Thu, 04 Dec 2025 23:27:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7d3319ccsm7010344f8f.34.2025.12.04.23.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 23:27:09 -0800 (PST)
Date: Fri, 5 Dec 2025 10:27:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julioccps <julio191096@gmail.com>
Cc: hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: greybus: arche-apb-ctrl: switch to
 device_property_read_bool
Message-ID: <aTKJSmE_FdT9AUpq@stanley.mountain>
References: <20251204231753.66229-1-julio191096@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204231753.66229-1-julio191096@gmail.com>

On Thu, Dec 04, 2025 at 08:17:53PM -0300, Julioccps wrote:
> Switch from the deprecated of_property_read_bool() to the common
> device_property_read_bool() API. This makes the driver agnostic to
> the underlying firmware interface (DT or ACPI) and simplifies the
> logic.
> 
> Since the driver is no longer strictly dependent on Device Tree,
> include <linux/mod_devicetable.h> directly for the struct
> of_device_id definition, instead of relying on implicit inclusion
> via <linux/of_irq.h>, which has been removed as it is unused.
> 
> Also rename apb_ctrl_get_devtree_data() to apb_ctrl_get_fw_data()
> to better reflect the agnostic nature of the new implementation.
> 
> Signed-off-by: Julio Cesar Carvalho de Paula Souza <julio191096@gmail.com>
> ---

Same comments as v3.

regards,
dan carpenter

