Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA1239FC1
	for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 07:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716795591; cv=none; b=pfiEO+cSkt6qvx/TvGMwWk+fBLelJnTNiivppjFBWrKbVuuj+vT7AUrGK2z6U2euVmfUZkK4QwwI/EjI3m1ii5dmJaC6H+zqFLw4UATA1xEaCnwxT/8nue1W/DtYroET+BTD75lal3QR8Y2sAgQFYY2aqsl3Jp+V9G9m8KFKikg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716795591; c=relaxed/simple;
	bh=04u4dQCtGcXS38Akhe0zrrj/sbwxvvlprltkYuVA5Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otEofjsq+YrPTAGVKh2zW+4XMjUCoMtjMv3W1sXK4zVpMiHE/X65YwJWSFPH3iEI1jtyhO7jFsJIXxaIVSvWec0kP0UiQDWxKxto5Cr0hvpDYyo/RypFYALsIyD+KzQjyAYWzgPqab4vlQ1K/lj+bI8BP5wI7u4oYf3g3iGiVM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ul0UClQd; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ul0UClQd"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a620a28e95cso718819166b.3
        for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 00:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716795588; x=1717400388; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xz0VrIh5WbRJv1JirmWuslt3IpDSba63xN+Qyimt8p0=;
        b=Ul0UClQd/OOYM8Tbmu3qO/BfSzHnFzE/d65mCwnYpH1qlIkVuu5u0OzOc7hdhix5PJ
         fVUjSJwb/hRz0RwI2tIneGEW/a13OGitcDURRV9hgQe8UZgq5gRrqVeLu0DKhGpQX+fA
         gfN7urusjMQhMbq/8y0pHdyHHbrcyVSR3Y48EIGI0BgfNnJ/O+eHvkFo48UACXXhmW2u
         TWRHYjz7Sb9lGc/T6AiRgJ85cY+zpCWXO78yQW+ePcUQuGnNquaHjqoYWIBP90kQ81j1
         Tdicoonu+h+46h9fotwZ7N83kT9nff9EyUvzF/7hhXB3vHDe2I0QZKXY5l2AeerHEsNJ
         12SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716795588; x=1717400388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xz0VrIh5WbRJv1JirmWuslt3IpDSba63xN+Qyimt8p0=;
        b=IAH6YHDhyS8KLR/EWpqr/HorXLc1BZV5GJnkf78id/xOnWWk1UcaKO8E6N6t0d3TB6
         fVtjBu9xEoxNlBHuOI1hqOR09X8pDDRTQIOKoTPrQL4CgI6Id2jIo4myddlUUIlsc64V
         2oeqhZwUhKs67Eqh17IVKnviQKEdcf44EuPjeuUG0LfYxTukVvqq4TmXVomMDvcd80Ya
         zJyiYAX/QEWvyPZkpN6cjyCDLZLnOjncAx29Edw2qERzMobSeziiiM8C3bdARcI4r/Vw
         3/JzR7BHCy+A5sEcBPNTRGr2L6xECmW+7YS+fNvItii//M3PFZo0XPUsg66LvpOHTShu
         nDCw==
X-Forwarded-Encrypted: i=1; AJvYcCWys4KHDScAydtOjN6Kk2Lx+PJmniNEXOgOUCipfcRtlS6dj1Ze4sEx2eYS75PkhAbhhmHwCeV90PwYU/EuUN/3k1PcFLOm7r70K4PI6Q==
X-Gm-Message-State: AOJu0Yzvp69JuPsPcXgTSjfhxitSTvTU/XsE2c8dutJR/HddadMBGY4c
	05lskfD/S8FiA/GThIuScLIKAc2lNthJ/9GnYv+OwWjKggTb9b0Ih7sbvFmdbJU=
X-Google-Smtp-Source: AGHT+IG/HLXyHbW6yeseNbj0NSVOG4AOMaoKaf0CmG6jhGtq2IkEwO6pSd2/za8ScxvEWTGn9C3Xhg==
X-Received: by 2002:a17:906:55d1:b0:a59:c319:f1db with SMTP id a640c23a62f3a-a62640779b9mr555490366b.1.1716795587600;
        Mon, 27 May 2024 00:39:47 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda6cdcsm459010666b.209.2024.05.27.00.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 00:39:47 -0700 (PDT)
Date: Mon, 27 May 2024 10:39:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Nam Cao <namcao@linutronix.de>, gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: rtl8192e: remove dead code
Message-ID: <9802cc9e-5962-44a1-a384-3e5ee226cbcb@moroto.mountain>
References: <20240526111928.14574-1-straube.linux@gmail.com>
 <20240526111928.14574-4-straube.linux@gmail.com>
 <20240526143100.FmVupNWq@linutronix.de>
 <e25831a9-9913-43da-831b-d37bdc4d9dd3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e25831a9-9913-43da-831b-d37bdc4d9dd3@gmail.com>

This patch doesn't affect behavior at all, but to me the original
author wrote the do nothing case for readability, and I don't have a
problem with that.  In fact, I applaud the author for caring about
readability at all which is not a given in staging code.  :P

regards,
dan carpenter

