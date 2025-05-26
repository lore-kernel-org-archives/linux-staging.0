Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E23A256D
	for <linux-staging@lists.linux.dev>; Mon, 26 May 2025 08:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748246603; cv=none; b=pX1sZH77XnS3LmQXkctS7tdo/X5gKWduiw8qOsY7zoeJOYTdEYgkpqx0zAHvlJxqFqRwKJQdKf/M416hrbNkbqTVN3Xs0Ysr9OMz78dohFTYtZbveg3mE1tRclvtyO4Lv+2gf2ywEEL/LxU0ni//b94ZBAsjwooEeZckcFEO/QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748246603; c=relaxed/simple;
	bh=lVTcXDtD6g0a+NcnMtEyejIbZBedLWO3vOFVjaXJwR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qF/VY2m4B9sCsecMx8WivLZSPioG/UdrAse0z8WT8z0Oib/PdqRnm0KZxME2/qTsO/vPJOI1RD95ov3fWDXuz/TaW9RCdif1CcroUOC5xoaM741cyK1Jb3DKqhLaHL4si/Ww7Qp1Jou3KRDH0tHpZuqyABdLWhAT1vAnYH57eBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q2fnz5uM; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q2fnz5uM"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a36e090102so1065216f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 26 May 2025 01:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748246599; x=1748851399; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SPYtiJxPEj4NMJqNxT1zar3Wry/PsazM942gqJr3gSY=;
        b=q2fnz5uMDmedLDmfPTIVSWELM9xFDeXtfE13HcCpXkvO5Mfi7dibtJ9a+2jkhLOl5g
         aI486jgiyNFjeKx4fIisG/2RhvkCpuGtXWhVhqI7qny9qV60JLRzH6vN9NPsm+hIBCRM
         6HreLxrHezUy495vsP9dl+PgHqjY3DH0Zlns1S6lnhynjcLCDR4M+pUiKklb/ZXePrrh
         UZWeF7N6XX6wCSNjpbTFJ2r2N/+lbXg3OWlixmQGDAdfAlETL16kUd/ER7UX0Eyg0OwE
         o+qlXFscRWOqZIGPCugtKARTJLmVgCL51ciPtMOtT/Vwv7xH/zrEU8ig37LFptYWSozK
         zRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748246599; x=1748851399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPYtiJxPEj4NMJqNxT1zar3Wry/PsazM942gqJr3gSY=;
        b=dmqIuntX1XEaK6BuUYGcw+t4oc4mTL9K1ITpkWwzdPzv//4G1n6AqvJOpgHudhCcx1
         +E0cJr/E+2XLLnkz4caDSWTvQR4kxvmhxjLCW9HwkWPndsxc0VXYKZeBLuLDYynaLhKU
         M+Si9wqKXWcp/KXvIZXDgHkqt+Vd4gg2DXuRV39FAjSuGBtC40LCa7tLvgVOsOdQ3e/5
         x6LbdyEHczs+WWzMYHyKAZ3KAqtoAgZbWSUiUC+awDQ1A6f3rWQSzT8qOR91rDhoWZzi
         W3i0IrcqmG6+OU/iiplHJgBhwGeQAEfbM8kE9uun+3dVjTrujdwkdWZIghLX/RFk/5K1
         Au/g==
X-Forwarded-Encrypted: i=1; AJvYcCVyC/K8vHibBvJsw7JfVtOSBKD8DPlpuzrdM56BN9tqan+oH+zyk0jLER5pDiyUNsmVAfrk6BSbp+faCRxd@lists.linux.dev
X-Gm-Message-State: AOJu0Yw22vvKu1F+PHcZrrpZM3rwWaGO8LZrHiJiwIvehw/YLYDScDsz
	EXrlNrZj76G46qOAfcHyOYyaiYcp+7q03wQnea+XBcB0QIofZhm8BKL9lgQPsqrJOGY=
X-Gm-Gg: ASbGncuzAwZP+XO8D/Ex5gNexqBhmbMSGtv4Bda0YjgGAZ5Eyx192MhT9kZt1J2uQKq
	7Q1KgkKyKFx5sHPn62z4QcW/yKIOm2H0Ocg/sXXZzbGUUGMe1kqe8vl8QPWSKnEVn9mrAGcz48c
	iUbXO8ZCMEYHvGvGXHVOX6aRNbJlGFGfGH9AR9ZQAh9YReA/bwEp9MH3OGlR0Plcd3nBuWUIfHk
	n1cLPYFtRNqPgHlT5H/wf6h3ZctQFuAokdx4UhDbtZ5Z39hM5awBrCksaeArz09+TyDqqBMpDjS
	lo1AOKadg4y4Efr9ctp+Sv7bNVImYe2qcAyGYmBfli/uWpDsW5/rUz8V
X-Google-Smtp-Source: AGHT+IEMr0TmkUd9qX2Oy/Wo5X7vaanyihC1ehKQZ1EHSEnhJI+iGEHT6/vJgAx1HAnkKnJSZJINgQ==
X-Received: by 2002:a05:6000:2f88:b0:3a4:d0fe:42af with SMTP id ffacd0b85a97d-3a4d0fe4f10mr4548065f8f.33.1748246599461;
        Mon, 26 May 2025 01:03:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-447f6f04334sm224252025e9.10.2025.05.26.01.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 01:03:18 -0700 (PDT)
Date: Mon, 26 May 2025 11:03:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Donny Turizo <donnyturizo13@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] staging: rtl8723bs: rename _Read_EEPROM and other
 functions to snake_case
Message-ID: <aDQgQw9XZV_7BIf-@stanley.mountain>
References: <20250524173745.4907-1-donnyturizo13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524173745.4907-1-donnyturizo13@gmail.com>

On Sat, May 24, 2025 at 05:37:45PM +0000, Donny Turizo wrote:
> Renamed _Read_EEPROM and several other functions in rtw_cmd.c to follow
> the kernel coding style (snake_case). This fixes checkpatch warnings
> related to naming conventions.
> 
> Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>
> 
> ---
> v2: Initial patch rejected by the robot due to naming issues.
> 
> v3: Rebased the patch onto GregKH's staging branch for better integration.
> 
> v4: Changed the commit author to my name and renamed all remaining functions
>     to snake_case following kernel coding style.
> 
> v5: Renamed command _set_h2c_Lbk to _set_h2c_lbk to fix CamelCase issue.
> 
> v6: Actually fixed the misspelled name that was incorrectly stated as
>   fixed in v5.

Surely, this breaks the build?  You're not working against staging-next
so it's difficult for me to apply this and actually check.

regards,
dan carpenter

