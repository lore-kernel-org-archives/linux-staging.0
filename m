Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56E4168BD
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 20:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729198274; cv=none; b=jUif3Gp6lR2ZqZzzo9NFFvDLVNuPdm2u5BEpbWTaNaa6GUIo0/MO6p5lWWJXNlW3hNLnN5j+blXBC6rEFDmUgT3GxFzFuZf7Gjo2N1zueNvtty4SAEXS31IsHnWKMVnRxa84QngECB3V8cwh6qUQfR05kv9btPrLZdYLHqU+ZXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729198274; c=relaxed/simple;
	bh=jpmnscegPQtDg0R2appqZlVJPqRTVSaO2arOzvBgLCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewuXnBnodR/8x101tUb4N4J30Vsh2f6b873dVSN9TYu3qxcB4UKltKa+KL/+Ks5ADxMAB3FVJCMSLJtDpGAuMCS9WWhGVNmRDlvbJtlRWr0fV9zhFVt8eYfbZNzvXUJuNv8WmMcqXBw3uUh1PJiedRtxp7EtjvuwOG+7RA7xzBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IF4gTshz; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IF4gTshz"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso205600866b.3
        for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 13:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729198267; x=1729803067; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dtX6wKalCBdW5mafQzljMEnnSBZvthcLP8cNsIvBle4=;
        b=IF4gTshzinxiMq+/wnfMUU1lgiiBXuIIIrxUSQPUPPBvUbZCez33qP5feCfuWEzp+y
         JyBLiHDZm9pewpnVrT9ihS3nmVtLYLN7SppSrqTFKFFFmWtQszpUFyY/uvXbTXDOnOMI
         1s9GRwfdedYIZAwIo9kKKMcnUJfkTw5GBQrA5Fgk9THDQ2Mk3mA0gzrgtKVRkDNV+YNK
         pyD9pxi8eMJ2hlgqb6oZL8d8vbCIPOGm+YvmnL5wYLGXfgtQ1LlbqxxlgJ1tDolSqdmY
         4hVGAhvIw80tDQBc/ULh8jIfDaqdRnRiencz+CWejeeQdM1TZveaoAU1pE38K97JmCZx
         /6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729198267; x=1729803067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtX6wKalCBdW5mafQzljMEnnSBZvthcLP8cNsIvBle4=;
        b=WaOgj4kCTVhiz912gBcND6P/vDHmlS+yjDqopqaW+7y4+y8HU0sTqjjRG2b4k358B3
         /e0dv7iscu7abBX/FfpoI9QtikX4e0GOBfKE7+xczP0VOo7oWtsRX0GA/ub9T24CmjJu
         qsTrUXE+QiTU8+9KFCc6/Z7WTiboUJvMd1Hwo5yygEVjat6If0+fJrLBPvZABP3j4GNr
         yUcuV+cl4ZLw7P10JDawpGMqN1mXL6pZtWS6Bs0xsTd1ZyhFuqWydm68KRuCHOy2xopV
         le1NDqx/ZsP1ksAB1/R0BqxZQ++kC2Ae2PnOgsH5WYJ1cn5RRzBSd0Uww6abhPVmLzbS
         8t4A==
X-Forwarded-Encrypted: i=1; AJvYcCXFcrA/YpCUDvnsDvA3hkpOU+fTOTil6Hm3aHSGMWOw8UmP4Tacbol34BCq1Df9vSkK0pjDtlw14eDrZA3r@lists.linux.dev
X-Gm-Message-State: AOJu0YyGJxS8bhe4L1owb8fXusbErT24FReZvtYaLTYxu61i5Kd1Sa7Y
	1823ZHIxIrEOXhbHxgVtp9Isi14n8iV8nC9SSs+rNLvoY4LMy9ockopJDA4kCdk=
X-Google-Smtp-Source: AGHT+IER1e95HvPNAzwj1EoiLukPbaPwMqzzAZpeLA3lForvATFiPEw2WYNzZrr0zKWxl4YHSQhCMw==
X-Received: by 2002:a17:907:96a1:b0:a9a:1165:1bb with SMTP id a640c23a62f3a-a9a69df5421mr6370466b.65.1729198267046;
        Thu, 17 Oct 2024 13:51:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68bc46fcsm11875166b.111.2024.10.17.13.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 13:51:06 -0700 (PDT)
Date: Thu, 17 Oct 2024 23:51:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Linux Staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: gpib: avoid unintended sign extension
Message-ID: <7ae5cfc6-2298-4895-8016-eddf57bab245@stanley.mountain>
References: <20241017195551.04E1D18DAFF@bout3.ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017195551.04E1D18DAFF@bout3.ijzerbout.nl>

On Thu, Oct 17, 2024 at 09:54:47PM +0200, Kees Bakker wrote:
> The code was basically like this (assuming size_t can be u64)
>     var_u64 |= var_u8 << 24
> var_u8 is first promoted to i32 and then the shift is done. Next, it is
> promoted to u64 by first signextending to 64 bits. This is very unlikely
> what was intended. So now it is first forced to u32.
>     var_u64 |= (u32)var_u8 << 24
> 
> Signed-off-by: Kees Bakker <kees@ijzerbout.nl>

Very good.  I'm trying to figure out the impact of this bug.  We'd have to write
more than INT_MAX bytes to hit this.  And I think we're pretty screwed either
way if we manage to do that...  Still, it probably deserves a Fixes tag.  Could
you add a Fixes tag and resend?

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


