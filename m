Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4149419413C
	for <linux-staging@lists.linux.dev>; Tue, 29 Oct 2024 15:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730216176; cv=none; b=OHTm32I4H52wxlJtDtpDsw3whENu2Zt0Fj9NnVw3bgFsoZRSSlNqDfdS3JYG+2naH2aREuBDIyV+88dNQO7hF2ZloHE+V+kVfYCHypqakIwO4zG5nUBqmXiy3z3dyacxdmjUPd9zbvuiQkVpQWKEQGpny+5TXCrPXHCahKl2zlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730216176; c=relaxed/simple;
	bh=ZYikKo08DE87/S4tbKf8A80bYK39lHlprAydhKEBkcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBGQG5cUxJt9A0oKLm77zGFSYZczWSY6lj1i7IfBJ95ItGbLwCb51iiUyhj1ZTBLOteX7O9nGnyTjfe4hziWtGAVir1ZcsewelKz43pn+qF3/W+DQe17ygLdwrCISiK+LoYIpH6/rWEGsEonrT5NVRfi8ImtHgoOC4uHo2xCl8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ryZuMWn/; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ryZuMWn/"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9a2cdc6f0cso750728266b.2
        for <linux-staging@lists.linux.dev>; Tue, 29 Oct 2024 08:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730216172; x=1730820972; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Az9Dk7+EEGUZ6gjbi4dbeDEuHWYkO2/rkcRJveCLeXI=;
        b=ryZuMWn/NITaJAL0ys0gxuSC3jlt79zQDhmmH/Juddd5cT+4xDXvurfVK9aYwyuElS
         S4qEMdD8BGPjvhlLcRrS3gOiNzgzc6bU5yB9NjD725k0EzHWbH6ZAtOg+1w+E4L79MEw
         qmsp+XyOw4E7txxy+zipUpOCDSuv2Kb22Kv4+5z+bhuy/yiFxQXmYbYQG7Va4IHkQlgQ
         5u6ScnPqYFb/trT6OAUzzCpt28zw+ZcgCMKmZAWsu9mjqSCvuSzyeajdOtp4717JolhB
         giN3yot2qGEXsgOFCMsLOPjmdLWAMQr1hB9KupF/HriGQrTuzTlcdv6LQPKkUHgc+qr7
         7T7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730216172; x=1730820972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Az9Dk7+EEGUZ6gjbi4dbeDEuHWYkO2/rkcRJveCLeXI=;
        b=erUiNJs84IYDKXS9Nu6Y4MsCUYGC01XGAtpwt5SofrczXTAaSDS4+3nPlVbPtzyBgq
         oNvOhCVKUe+DsUOT8n+srCLkf6nbeuaFPdLc6BTMARgqWCzK3KVybHL8vt9PyMJKhb0E
         mRwi3RFcN8CIFyGpHa1Xiq5wnQ+UGhlQjoHeLcbK6VDlNcKo0yZlkUbLi40Tkuuj7nLd
         iFBhZih4JQ1pqvRmoQL8B5evNI1CXQLKpkSmzwrmyEN2PnmJxX/frwgtlHkAXtTlG29u
         /P1+VFY9xKgOLWdEpdPgJMW3FWr4BWhQrF0lAUhpGLGfE2kmeTB/skjm2iP71SpE5iAf
         N/aQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3R3c/LPHNAZQoaaYPjI8zSR+N+XYeSVYbTQ9p8OTN3/yTrCNxbmQ9D25AB+ajkNyEZsEpkeDRTQUPWV7N@lists.linux.dev
X-Gm-Message-State: AOJu0YzNyi7VVhNjUwEQxxB7k5gK3Rk3BwtVpwowH713cuxsiP244rsm
	wll1bqnA47+hBWukE/UVLjvSGDT6Z99i3p7CJi565PdQzrnY63c8HGW34IZTY9w=
X-Google-Smtp-Source: AGHT+IEU1iH/F5CZkTb1Q0OIRBjgpNI0NSgp7znzkrHlLRcaq2cgt2DVKxL54s9Ap1AXt+Hg3XFGdQ==
X-Received: by 2002:a17:906:dace:b0:a9a:38e6:2fdf with SMTP id a640c23a62f3a-a9de619bb45mr1212224866b.64.1730216172452;
        Tue, 29 Oct 2024 08:36:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f298319sm477938866b.105.2024.10.29.08.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 08:36:12 -0700 (PDT)
Date: Tue, 29 Oct 2024 18:36:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Elder <elder@ieee.org>
Cc: "yiyang (D)" <yiyang13@huawei.com>, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, ankov_svetlin@projectara.com,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	wangweiyang2@huawei.com
Subject: Re: [PATCH] staging: greybus: fix possible null-ptr-deref in
 gb_audio_manager_get_module()
Message-ID: <90038430-3ead-405b-8a1c-69dce59004b8@stanley.mountain>
References: <20241026081153.2649890-1-yiyang13@huawei.com>
 <9ada17f8-7b3a-4bf7-8fc8-f40bf67adb33@stanley.mountain>
 <a9cfb5e6-33f4-495c-b329-7e97f626d1a1@ieee.org>
 <541d16d3-ea2e-d956-5dd9-613ede430fe5@huawei.com>
 <01caa8c5-5d7e-449c-a00d-28c81f453e41@ieee.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01caa8c5-5d7e-449c-a00d-28c81f453e41@ieee.org>

On Tue, Oct 29, 2024 at 10:31:14AM -0500, Alex Elder wrote:
> If you can't find any callers, none exist.  It's fine to propose
> removing the function.  And if the maintainer accepts it, it's a
> good change.

Plus in this case specifically Alex is the maintainer so you can already be
pretty sure he'll accept it.  ;)

regards,
dan carpenter
