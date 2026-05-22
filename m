Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C253A5437
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 05:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779428892; cv=none; b=RYRNHa3Ma77Xy9/PyxLWpV0LFQiN/39gvkwNl08EO3J7bNBu4Hu9sI5qrV0lbCV7NiQkHvTKhqW8oXBrjiClOYIJWSs4bWnU1ndl6VqQwKPxrttu6LQrV0Bz+GvYEM9NRlBrPQWIzm1XW9HyPNr+iv5qGXbWJ0WIP94vWOb2mCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779428892; c=relaxed/simple;
	bh=9ulQDbiIvRwZgHhsYmeIqqNalcE0cf+QoA19iblnOfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASqNhT7VqLSslcqZa00B1pfuj8LLs2ypl4m3XRHyuqhZVXAXPKvbD3DTDk937oHZqtRosPoO1s2oVRfE8Cn/O17vILBD2auNs7Kh32gXekGlaeMiWykL9OVi7eGF9XQm6VPQiaBMktSVNW2g9YvuwAYyV685fmBHgV8d1sKyp7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nir0Ao5F; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nir0Ao5F"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44a14580111so5262837f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 22:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779428889; x=1780033689; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2VIcFwkUvvhEg+b3dulAtTYD3SofwiVWj8VypVSXMvI=;
        b=nir0Ao5FOZY0niD/CdkWztHlypZ8LNj3KwJb/u+wnsKM7aX8DD1bCXkGvvSO2vXfdA
         tvxl1hTiaJyOdcS7D+6s9rBteuNdYuyBFI0/4fhz4xn/LuszBs+vEK9JaJ2ePZoKCmnp
         RyoCC9dYCpZ4ItUS67qtxR37knmKYYck3xkCFIDsXEUvMhEQlRzFIf81rxjIeCm8sLw6
         MwH/2BbZD6p02AQqIS+W95M7jqAmaLvEk4Bj7ADwo4rcbH0ukCpAvQkamGqmGKK06Bez
         XZ/9yDPhSUVNEwTjevQx7CeihrzQMwB5zOlrqoby05peaLVdWkc/d1FuqihsHxlOtZqp
         uF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779428889; x=1780033689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2VIcFwkUvvhEg+b3dulAtTYD3SofwiVWj8VypVSXMvI=;
        b=PU5pKHbHPwTX4f1G16GiWtORMizXgWky53Gt5xqldPWFodGzXRImC1N/eT6qqo7GF5
         aB2yP7aB0vhU7uW+NnQrmo6oF4mN11YLofipImQiN9r+gJaQEyc7H9PoVBwXuLYwRO5Y
         oCvAIWRXNjdspWjf8PTnHtaJIk+dIPgQ8EE0v4tblJrZ/i2SKKke6dy0us80zgylv9I5
         P9AnAWYfqHM0CuRk8praV2RgFwaGc3SAnyMBHZVZo5U5fJHHuF7UFaxNXBzxy2ATj0JO
         6QwGJR8y+K6VXqyJVSx5xPjEcVrE222mbQY4CAmEV41TCXiRRpd/w1xPAhWAcSHc9DwV
         JKOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NKZPmhx8Z3q/u+1bEs9ewjltZHFeeRnBfMiH3XO5ERnjOI9dT6DxZYELD9G1guxjMo3+7cwlVTWQtgtmn@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5m1xAMwCwhnRNeuKSCWZY3G+KUv9umfVN3EFDpTRO79vwM5oP
	cI7Y5pMXuZnxGR/4jwpzNWlsoWlFs+18kC9Oi74YncYAfq6IuR3YuNfL
X-Gm-Gg: Acq92OF6IeldHSWUG1X3g/bY/ltFc8+Y99wlXIeKtl8nZJ/5C6y2d2rZuF0gd7VFopU
	8rQFxF/gKFb1+WzHPhutqCByQoShBMaOK5vpE1E3KY/eXZilR0xTG5DOCeN8rTTcVmC6zzZqcv8
	l21BbF+FThn7tImpE2+mg0AzUjAWs7wYqz+St/DA6EUw0XXFM3Ci/mfL+L+inpqCXROFlNlPQ5+
	RlsNKOADY9wJZ5flXN/wtPQDjajxapVAWOzwVpG0MO1445pNmR+gOieiCH1+IPLnlBX8/oiUER6
	QjJi0b4WglMCIXPuBVP0Z/GQYfp3PzOJO172sshDY39ctRw87CB5M8hsyynN7R7wAmKaCYPvJ3z
	SU6sBackfG5cehLVpzWEQN79OEcSCGG/l3ZGW/618Rx4L/8IJqmp91Xl4whVpF/8KI/SyL5++LG
	NxHjNAuydN1es7q0iUSqOAZDo=
X-Received: by 2002:a05:6000:2888:b0:43d:d037:d59c with SMTP id ffacd0b85a97d-45eb3697a48mr2607736f8f.16.1779428889014;
        Thu, 21 May 2026 22:48:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5ed84sm1266980f8f.31.2026.05.21.22.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:48:08 -0700 (PDT)
Date: Fri, 22 May 2026 08:48:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Diego Fernando Mancera =?iso-8859-1?Q?G=F3mez?= <diegomancera.dev@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	m.steinmoetzger@gmail.com, guojy.bj@gmail.com,
	straube.linux@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: clean up if-else logic in
 odm_HWConfig.c
Message-ID: <ag_uFaC_XLr9d4wB@stanley.mountain>
References: <20260522054624.190256-1-diegomancera.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522054624.190256-1-diegomancera.dev@gmail.com>

On Thu, May 21, 2026 at 11:46:24PM -0600, Diego Fernando Mancera Gómez wrote:
> Refactored redundant if-else blocks to a cleaner else-if structure in
> odm_HWConfig.c and fixed indentation to use tabs as required by the
> kernel coding style.
> 
> Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
> ---

Please slow down.  Wait a day between resends.

regards,
dan carpenter

