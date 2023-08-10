Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14178EBD
	for <linux-staging@lists.linux.dev>; Thu, 10 Aug 2023 04:59:19 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-317c1845a07so492506f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 09 Aug 2023 21:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691643558; x=1692248358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=euAie5sbhK9BZf83ob1dTMY0SFdxl8s8/ookcEMMCEs=;
        b=I+PAaO+y1JB40rnflIsP6qBHBb7+RnISJLYhNDdFx/8rkwSCvoaZCc9WUcfgKVmo9O
         36xL2Axim6NdRpTxC7LOXn+MCe57LcPQwiKMaGU+6b5iQDiFueAJ3QkN8pfTcz40G4eV
         mBtdYd4xjLoyp3tiS3Mgdvsvy2gRrYYdComQMx9D1KHS598qJomyTYFKrnlkXN0paRfQ
         uSP2N5O6ucvbMYPUubns+lOLKg6xDYOJmDenW29Kwd2dFUDo5SHyXLTi1CXoVtXQ04TM
         mMYdyq9+lWKvOljC/jKm7kODtA5Nh8Svg+YsXwgjEbaZYjxfW4qCOqXUmVoOtsp5CIRE
         TDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691643558; x=1692248358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euAie5sbhK9BZf83ob1dTMY0SFdxl8s8/ookcEMMCEs=;
        b=TzieWECdM7CVjO+9G20pBuk1eUeYpIApz785s6mVUD5WPGoMVJOlY7AqBhNyCII3lC
         1LvvLviWQlXyoPhJRQWRhRGSUNMdCZ7zOgjjY93LSD73FYhcKjSQkHsB9DtoER7+i/gX
         K67lM8WoEXJcDi+N0U6Rq43b2yg8rxB+rsx643FO4pCobFq5mxoVpn+6dEjYT/SJ13qS
         lvACj3oy4xkzgrPl5VD8ZHwcKUSRgFtzQ4A0BGxPKpWGn4RgchK2aSgzoKghBWxotBCD
         RN7AsK+VuPoz/pvrB5sXCXhwziCRd8Z6pYG0utvvnquezYz1zcTmp7hWjp6QqXf9IUby
         bxpw==
X-Gm-Message-State: AOJu0Yx87o2XLWWiaLx4NktaTC/0CMRL/Dy9OioGCqhbKEKYvhSoXdPj
	RIsUzKEguuKSni6S9+DLrpQsFw==
X-Google-Smtp-Source: AGHT+IE3qMjYxsryjuXtRo6j6co1x8mQdJoIMUPhdqd9mvnf9/A15YHII3zIiOejSOGEayfI8ONtNg==
X-Received: by 2002:adf:d0c2:0:b0:315:a043:5e0a with SMTP id z2-20020adfd0c2000000b00315a0435e0amr1029294wrh.56.1691643558126;
        Wed, 09 Aug 2023 21:59:18 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i8-20020a5d4388000000b0030647449730sm779008wrq.74.2023.08.09.21.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 21:59:17 -0700 (PDT)
Date: Thu, 10 Aug 2023 07:59:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrei Coardos <aboutphysycs@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org, ac100@lists.launchpad.net,
	gregkh@linuxfoundation.org, marvin24@gmx.de, alex@shruggie.ro
Subject: Re: [PATCH] staging: nvec: paz00: remove unneeded call to
 platform_set_drvdata()
Message-ID: <fb1cc561-926e-478d-a6ce-9d97fa0dd0e1@kadam.mountain>
References: <20230809154211.15741-1-aboutphysycs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809154211.15741-1-aboutphysycs@gmail.com>

On Wed, Aug 09, 2023 at 06:42:11PM +0300, Andrei Coardos wrote:
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Also,
> the private data is defined in this driver, so there is no risk of it being
> accessed outside of this driver file.
> 
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> ---

I think you are right, but why are we doing this?  That one line is
hardly a huge eyesore.  It's all risk and no reward.

Have you tested this change on real hardware?

regards,
dan carpenter

