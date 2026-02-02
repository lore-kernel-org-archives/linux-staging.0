Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4DE36AB57
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 13:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040328; cv=none; b=ZvIhgivGHQ7OENRvUz0lCgdrx9YjWfd1jxnHPf937Og9GuABc4w/fVbi4P06q9Zms2MN8mpJfVZn1SJvFuTtLbhp5tAaQPiUt51w/7FG+HvYy7GOxhjejSCAc8/DZJqxEo33UUDM0hB6uIxorc8XQbqRukdK1BP4SZXF4EUKLE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040328; c=relaxed/simple;
	bh=HCtMxubw7BhDcvcWkntQkqQSnpEHdh+MzEDG8CCKr14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=klymi44031fHKin5viN+GUB6whFgGorcbLs6y1X6VBm+O8+u3RtjSb828fr0YWfPK3BysiL9Atp2LiB6kYYKBjV7P/EUJWjLWFqor3nrSbyNZUSmWJPRppkPsgdBRv7sWn/3w/Cy05R10dwomVsCqiKX2xRFvlFMzO3y/alKMYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CkZ9c/6v; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CkZ9c/6v"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-655af782859so8040925a12.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 05:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770040324; x=1770645124; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0t0CcGWr8Ro6wXIQpLKhmDLtrZbR/mwX4OOSLNob2uY=;
        b=CkZ9c/6vh+mCOfW5iBDtfy+1I3KTy+YF+DLS45goHk9WiR/RujiJ1QOq90EttAzgFi
         pu+tm7c8PgD73LLbL5EdvpRau+NelII2x2QE1XRIWv/xo/rS653FLdvjMgFNCLiwpIQA
         vkKdkfzA92lbTvPOf1Z46/53vHWO+s4/saOGbW0oKGocFR+WkEtJqM1OrsVwcJIhL/IN
         6fyeMHJjdGzINR+otihd2InRSC/e2S0uw0zgIQ0q52HBAsX8ijuyQfp/G5txYzFH/q1w
         HIWAkGkqwlMhoegXIiUXjP3S88YTenG1LGlUEbtHCCXkEYbc7554ZNBx4/Sk3iH+NrL+
         c4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770040324; x=1770645124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0t0CcGWr8Ro6wXIQpLKhmDLtrZbR/mwX4OOSLNob2uY=;
        b=bkE6Zsioc77luc90ENpwk0xdf4i8Xdj/xwSnG+s4tdlA7xX8l3W9WevlVu7pULUp2E
         eJxnbHzpJYdJcNtcnqPoS3+bLoq1Kuz6fYQiDM25W+WrixBAdgIXui0ZtFVpWFH54+B1
         vFUpA9eIy7VMki8y1m4NY7ga7llRSDC36K0cl48v2QKEbc/Lbpp8Db1guI42NQ+GR5XW
         BnCdWbyGaDMWx1vcgUWVIkD05LHeSvoqUfwZOKyxvLTp3P3z5cxM044LtUhuboXDkw1c
         n+9b6ILPR1oqBOBSP9xS0rCEWXq4RpILGpn1CSbVrAba0XQs1Xli96LCcwpXUSpJeVQj
         6+FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxegU2Aj3sc415SPa6pGi90vdSKk0+EArY6/VEn24KMBeQFJG0AcjgbACxpC/DdCCMjqRzjvqmac7b4FjL@lists.linux.dev
X-Gm-Message-State: AOJu0Yxg8Z4Z2+x49+qKWodD/mIFJoAyi2Qg3RhSnYlmdXZmKIptEQaw
	SAErKBHnwgZuXcgKhGf/Pl2tbPyDrKkWwAMynmT/WRc8w1eDVUplxHL2YSGv9cjp+mk=
X-Gm-Gg: AZuq6aJD1nQ4kOT4kmrTXF98zRCwzPODxhvOg6Bgwv0td530YAFnykq3cBdl8kY1TVz
	1lILHZ0nqNeEEA9EMJFgS+c2Z5+IV6+6gx0QN8xB3ky/3oUz0P5GR+7dg5fZcod7LeSNl/7a1zp
	kGq2w0dSkfmezXrS3PBahK3glzlV8rb6VN+nML9gRBceq9oZpi7qOrVfMndOFaynw241HGMWyUl
	Kr13/ifR69jjg13RHbvGD/K4DVGaoxw1aIhvK34irZNTlORDtcghcgFvmQTDVO0/iEPnM3KEqhi
	S7XU1jVAsN/q38gEZaLT6T6gf0nu0GdKxQCO88KI+IxMmzJRMdg8+JrWqhu5O79TFDesWJVQQtd
	dn4vw9Cl1rRTB2T6Cw9d+JTijAHVcol1feQhhWKyemurkSbSKYdtzBDq4sWYl+R0SkuxZUCi3jZ
	UsOWttHc46tcAnbGRA
X-Received: by 2002:a17:907:c09:b0:b87:2780:1b1e with SMTP id a640c23a62f3a-b8dff6680aemr718792666b.41.1770040323606;
        Mon, 02 Feb 2026 05:52:03 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm884201766b.46.2026.02.02.05.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:52:03 -0800 (PST)
Date: Mon, 2 Feb 2026 16:51:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: make _action_public_str const
Message-ID: <aYCr_1sbBtbupRI9@stanley.mountain>
References: <20260202131649.161215-2-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202131649.161215-2-giorgitchankvetadze1997@gmail.com>

On Mon, Feb 02, 2026 at 05:16:50PM +0400, Giorgi Tchankvetadze wrote:
> The _action_public_str array is never modified at runtime and 
> serves as a lookup table. Mark it 'static const char * const' 
> to allow the compiler to put it in the read-only data section.
> 
> This fixes a checkpatch warning:
> WARNING: static const char * array should probably be static const char * const
> 
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---
> v2: add blank line before Signed-off-by (suggested by Dan Carpenter)

Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

