Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFD759151
	for <linux-staging@lists.linux.dev>; Tue, 12 Dec 2023 09:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U7qNjGis"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-54c77e0835bso7750469a12.2
        for <linux-staging@lists.linux.dev>; Tue, 12 Dec 2023 01:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702374295; x=1702979095; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=94p+UQZSMr4vzrhrrlgBDh7qA10Ar2gYNehd9t2N1t8=;
        b=U7qNjGis0xidp9LVuDNk+pDEi1C2Cm8p6AY4+KywkhYUWBaCfmkp+X/Ni6M6DlXJOA
         58DXNnRGHUAQeaMS7tZqxsO12kVn08oSUeXYCT5gMCXL8ZZk6uJFuxbYRL6+BrKovfGd
         igCFGwyD3qTqfaK1NnPAt1z+RmHQTGrjEEl2Y8+Xkdatnim9QjkpEFCwq34GopSRk6av
         FY0Rks7xO8SMM+CDwbcSu8MRRAwV+7+Ap/wdyd4RqFltqL/DNXD/lz0q5NbJahoXt5Bp
         9F1TKDhg8X/pkeZbSdqauvc/5h/ShztVW/EuNJEelkkFtluBdN4V8p2Bn06QsVPFLM8v
         eqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702374295; x=1702979095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94p+UQZSMr4vzrhrrlgBDh7qA10Ar2gYNehd9t2N1t8=;
        b=wrLgcFC6LZAU26/EF6LwKgPFUWBaKGWKwMTQLmwOfUpUSRfVmnBXCOZu7aTY+X6vZw
         CRelgxbyIVDG1AKhQlEEkIL0Oq3rMB7KsUSAzkNugIfIiEXA/uuHW9Ix1g/6OgPcVPvH
         3Cj3r2UMYPvh0KNWRGocjkL3iPmOzEfGavYtUiHwX4Mfpfns++OsdHChi63Zm93aBIof
         eAkB/vINkYfmXilz1ynrXXdv/gOUVJQZc7I1/7+aGZc6LPauk0SsFo/2ZDEqrPJFc7bL
         UpUVa/AY3vSI0461qO4YiFQD6/GLKKgyH0+jnlOF6ZzmX5BWOGvmmnxsaopqiS7gSKdQ
         CYaA==
X-Gm-Message-State: AOJu0YwOJVE2EYNL78F2yG7qxEj4iy93nR9t1NBmaHKVzWvMLyeSTITq
	4RFR/4dLD6rD2psK0LH/JUpimA==
X-Google-Smtp-Source: AGHT+IFh/ureGGq9zRE3/B5cuAd0U9ijHRArtKFWf6PNYbErUOfGEruQxIQQasSQPm0NyCnkVOWYOg==
X-Received: by 2002:a50:cbc1:0:b0:54c:ac4d:f4b7 with SMTP id l1-20020a50cbc1000000b0054cac4df4b7mr3111551edi.1.1702374295419;
        Tue, 12 Dec 2023 01:44:55 -0800 (PST)
Received: from localhost (h1f2c.n1.ips.mtn.co.ug. [41.210.159.44])
        by smtp.gmail.com with ESMTPSA id o29-20020a509b1d000000b0054ca1d90410sm4773417edi.85.2023.12.12.01.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 01:44:55 -0800 (PST)
Date: Tue, 12 Dec 2023 12:44:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
	anjan@momi.ca, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] Staging: rtl8192e: Remove variable bFirstSeg
Message-ID: <347fe54e-d8fe-438e-a1ec-37900ca41f51@suswa.mountain>
References: <20231210193705.2131807-1-tdavies@darkphysics.net>
 <20231210193705.2131807-2-tdavies@darkphysics.net>
 <2cdb678d-b784-411e-8913-eb7666e08ccc@suswa.mountain>
 <20793387-da59-4192-bb86-b20aeb127a65@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20793387-da59-4192-bb86-b20aeb127a65@gmail.com>

The struct talks about firmware and it has reserved bits so that's what
confused me.

You know this code better than I do so since you're fine with it, then
I'm fine with it.

regards,
dan carpenter
 
