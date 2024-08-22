Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D086516DECB
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724317816; cv=none; b=KYL50SGPS4VnQfZagM+g15YZmfUx9y98C24SxuLEOroO8X7HyU769Q73deQebLV3DsySN+mJOHef5C47eduIGAVgPiBqmiHsLYGDGMz1286u1zP2eDp/M/CH+W2s4T8ioW/MO0FGoIVpWf+1FgYG4b/MHDP2ARHooHC2LgW2qh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724317816; c=relaxed/simple;
	bh=ybYsApgZOEJ6/pRfYb7q8UaGc2q2F6iYlqXG5jCYmBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h/gFNDiqvSuwFs4tPMaJ/szerTf0OqnAmMFzkjl2PAfEP7FwhOau+Iwgp/BOCGHWR4IMbbkbhVSnIjXG/WWXFQgaZeN3j8M4Zxi6rvG2w1d/UeXu76SBM1faduVbXce23aayYuWjK/fq3Z+mXJABQU5Pe0VIVucSJlLAG4BWd+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e7VdmDqM; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e7VdmDqM"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7ab5fc975dso69245766b.1
        for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724317813; x=1724922613; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bVgTFyhpmaqbY35qFp/vECjvrQaEI0rbaPZeEBcTPdQ=;
        b=e7VdmDqM4Fe2o20SUiZ3AKlQMRupcv4FtnaIgHFwVir7NQCEJz0USPQTyOL9HtdA9k
         qxqsn0gZNG7+LRuAy+3ZBoexXbz/muwbDimM+1vouli2jk6sLbNMXnYRpF0hBvChbM+z
         +bw++Mw5xklVjdhq4M7IhBGiYZqGjy4Gh7xHCtvwg1HWuKw5zoHOa0nudMrxJw+Nptp5
         b8itBAc+uWvKbkfMLRFj4nC+gsMevDP9gnGOJAxoi2PvfxTwCRreQqPC1UlvW9EOnYvr
         5lFZuNLdnKNpjbrDeYYZMAfGfMM5tN0prfyYqjJe1ZaBELuZF/uOJLfWAC7n9RtCYEba
         3lPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724317813; x=1724922613;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bVgTFyhpmaqbY35qFp/vECjvrQaEI0rbaPZeEBcTPdQ=;
        b=AVaPowxFoldwjXn4zQtpc186ZBN6AsgedUMxNB+wvM9F5LR6HTt/F7fuYp62IQ13Xk
         xiWDhhZegxm9R9YtGzglm2CgqoQ3scAWhKoIyM5ZKCz5iG5pmkMm0pmDrgYoTAe4qHsV
         3Ez0TgAWHEAedGNYobjRx5FIkuP9zTey7X4MFsWBCwxu760tP1Ryob8ebm+BJoJ7jfAA
         D+bQOdy7Qlg3AOEGlgOBoNP31S3fbwV92KE1k3dK4jPsBc6lL+JWZ3WGFLiublQeLpxC
         TwpEJ3/GBSSxYYPRJqhG3e4I1qRT35c9UDgmz/spons2yjYNrmSdKvH9kPReU+MhTU+a
         Tabw==
X-Forwarded-Encrypted: i=1; AJvYcCXn9usSaqJ6dBnkpR6Xq5EJeyTP5umoVJs0Ff/ImQHbIa4LjvQ5BR/qx4xZZe538PdyFBn3b429hc4PRO7J@lists.linux.dev
X-Gm-Message-State: AOJu0YyV3SSgEDcs51Bw8nFmymas4PU9ArU/YZAeR6nGqeJYO1gVMScC
	5sUvkllWyj3OCval+TdnlhwDKkKnyy6K4jjaUsFEQQxwVVxctiCOVD2gYsKdU9Y=
X-Google-Smtp-Source: AGHT+IFZpd8+DzI4eocGXYV3wUHZIouiGyT0tqq1w47dUnX5foSQWpVUu2xqvsqykfxZn/J6YbC4HQ==
X-Received: by 2002:a17:907:1b21:b0:a80:f81c:fd75 with SMTP id a640c23a62f3a-a866ee6f3fdmr425070666b.0.1724317813051;
        Thu, 22 Aug 2024 02:10:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4360c0sm88330566b.108.2024.08.22.02.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:10:10 -0700 (PDT)
Date: Thu, 22 Aug 2024 12:10:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: ~lkcamp/patches@lists.sr.ht
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8192e: Fix parenthesis alignment
Message-ID: <263d9471-0bcf-404d-be14-9dcf9b55efdf@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi people,

I didn't know who to email because about a hundred and fifty people sent a patch
with the above subject.  The subjects need to be unique.  ;)

regards,
dan carpenter
