Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F20BA41
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 14:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710340577; cv=none; b=AyC1DOYyzGyW4KLnb7glZOJHSAAV+TLLuGCZ3G5h+dy8VcVGEhhs+yyJJoBDLnqulgx+FuL4PNhe3qwJZKUbKAz84F2f+WUGcXXyyf7fbeUPT/XQab/tAUTa8WEb9WGzADMXnkkdYmNbxzJPuzUw+OC5ZYsvetJCfDkFuAwuHVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710340577; c=relaxed/simple;
	bh=WBtDlLFwjr6a2gQKftAx1qOjLB+FqxnGKwhOZqeQ0jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LipXP7a6PBe0Nwb3qgiDlB796hAzWZexMwxNBwBCgEWvgDTqW5pAK0IjTZSK/X7KVTlPNY1pK37GZzFRqt9777WxhZCV/PpGBOYQaYgYaAvTFQBiZnur67zj28YDPeV1PWxs/wOMtVRzN02xH3Sg4ab6wkhznFj99hkbqRGYJag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UC/ACbIA; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UC/ACbIA"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a46692ec303so12151166b.1
        for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 07:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710340573; x=1710945373; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+VNUI98uGBbk7n2ey+cvrGu4esT/FnUUpds3abi4QF0=;
        b=UC/ACbIAYtCvyeayyOWwtFsSaW11OufWsFt5R82Q46vkd0QcPAGUOULmnWRLCo5yK4
         IgY8D9qztQzXx2/8mAd4utKOsJcMbaQ8k8uP5uLyethi4mlipW5JZUmk8xi56wCrgaui
         YDBbByfy5eN2NWmsWZKHH2KMfCGjMSMZTwMALDAiCZR+2EiqVUjLGY59iPQRg7FhO72+
         j0sjAbGmcBAKvIAX1XAvDyu3nYKw58rtQYeivGE9p49/5wcda3mgO/BPxnV6PrCwp7ZR
         tAG5fMWNMzjtk4nr0NyY8w/i+zoXYkpnKnHKDYmD0YEx9OKdXlJhG+fpqG47G9CIFynm
         B9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710340573; x=1710945373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VNUI98uGBbk7n2ey+cvrGu4esT/FnUUpds3abi4QF0=;
        b=mhgB83NW3j3fhJe2sAsJBtGit9I63my8HZKIP9i7eb6WDwaA/CtPm5l9j9lhmZmgZt
         EbdnhdStqE9mQD8t46tZZASdkFpXxejuF4Ys9fRRKGjwegfCeyULwIjyfyqvC8mgolpQ
         x9VainE5sRs+JGWRNJy6cvOycDNkFs2vdk9TeHHyoOZ91ddlvunOjAlkDGJxq+dwHhSR
         9d/6RqhJrvfQ4ZhgWq6mZr8WKDmBYXkmN8clmLVMK2ojDVkbuN1odSWX9+zzwTcm1QFC
         tRBUTlF0GtGXTUGmERD11EiWQm1fUraSz04wWKp3zjT4WRH6/gSJRL2nHyastKqTdsMt
         QNxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIO3G4ceNYMO71ROAcu9lncRg5gubMtF8VpQwUQsuRLfGFjl9QnN2zWGMw3sPP1xr9C0YlKsaMZorGhObiX5WIzH4EfNlMMO4J5UI2FQ==
X-Gm-Message-State: AOJu0YzAyr+daNFfjoQ99y4cMqt/ntns4439QEdwiYwTTIyPv+ASS1nY
	3c39kr6XyvAslEwR4ahIvWn+eWBNH8zQS9YbFopd2NEWi8L0FT+Skp0//l0jny8=
X-Google-Smtp-Source: AGHT+IFCa7DFbtK3UHRnTZLgXaB5cqtF2pyYFRenSdXtbOB2+Qa8CNuq+x9/Pi/H+Tmk36J9EbvdjA==
X-Received: by 2002:a17:906:ba87:b0:a45:c1a0:5c03 with SMTP id cu7-20020a170906ba8700b00a45c1a05c03mr9938948ejd.47.1710340572593;
        Wed, 13 Mar 2024 07:36:12 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709064a8a00b00a45c9ea48e3sm4895099eju.193.2024.03.13.07.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 07:36:12 -0700 (PDT)
Date: Wed, 13 Mar 2024 17:36:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Felix N. Kimbu" <felixkimbu1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: wlan-ng: Rename 'wlan_unsetup' to
 'wlan_teardown'
Message-ID: <089411e2-50fc-4a66-bd07-f76c5aa2788e@moroto.mountain>
References: <ZfGG093fyjI4G/ci@MOLeToid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfGG093fyjI4G/ci@MOLeToid>

On Wed, Mar 13, 2024 at 11:58:27AM +0100, Felix N. Kimbu wrote:
> Rename function identifier 'wlan_unsetup' to 'wlan_teardown' in files
> p80211netdev.c, p80211netdev.h and prism2usb.c, a pairing function for
> 'wlan_setup' to match common kernel coding style.
> 
> Signed-off-by: Felix N. Kimbu <felixkimbu1@gmail.com>

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

We're probably going to delete the wlan-ng driver soon though...

regards,
dan carpenter
