Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AF720F18;
	Wed, 23 Aug 2023 13:08:57 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-68a3082c771so2651671b3a.0;
        Wed, 23 Aug 2023 06:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692796137; x=1693400937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qf4G25XaAsD/bFVHzR33gk1moFWId2eULxYKt6rsK5A=;
        b=X0oEopZ67vZ521E3wtTlBhVphVkOlbEjB96po7Mjw3+RPZNFohwK2JhQ4lwLUwls/n
         69IB7hknFGKnFZn9eEbcgPiZlTuB+iZhzBE10sBpCR4NB/VPxTp0vVsdOBEfKcV9S+SN
         dfqC1A3ry9C+h7K1jvjplvekVDI6DSadWGkYYYoX1LtO7GyJOFILc8pf3V4OPfMJ0r/X
         pRZLCoBhhI4wnKmIvuNqcbEIdR3nOysYYpdUei4Fq4tVhSSos/0dWu2mUwBuvDS/RBkd
         kUsyZMvdu92ENrEcJNCgeLLmgmTtxVzYRNLV7E5lJQXS/8z2eE6G5g2F2c8+rSwFyvX+
         QlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692796137; x=1693400937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qf4G25XaAsD/bFVHzR33gk1moFWId2eULxYKt6rsK5A=;
        b=f1zWJbMEnYvxmrdAnaDpRW4eASV1URCfOM9h65SQu1ygl1n4bu28EGwGTQmt8kFLf5
         K51Bp+C20u0SpXLbMTmFKWYF8EP+jdvPfZY/ttyRRE6lHfUeaZPLLV5I/hQlGZX2YgV/
         t93o59ni8IFXE6OU4X3bjgLFlxxnog/DW8Cnmj3pD5ra0J0YPXurlr6Oj/HvV0D98XGk
         2J+6Tj5w0oOLnCvkwNxIbhMf4Wiltw6oX6A8/R6vQx2pxEQ56W+vZfQB/LYQhNZaygem
         ckgWjsa2aJJc4bDO6mSsL7kTBtcHF/eSqc6W3yTqCmvfnX7Pb3py0dO09ACPy98jWpgX
         vh0Q==
X-Gm-Message-State: AOJu0YyrU/3mH+wClcoGS8/QTvthTH6M8pDLTrOGBkN5u0VsSwineAsu
	jK/3SVh6OTdxSAIC6d36nZlvMpKlU3k=
X-Google-Smtp-Source: AGHT+IEhZg97xgWmxGmje8X6eRI20mOdZfA/gtCn7BWIkRhmlu6tUPcPIcZWGe1nuUS6je1oDprjow==
X-Received: by 2002:a05:6a00:1a15:b0:68a:5937:eaa2 with SMTP id g21-20020a056a001a1500b0068a5937eaa2mr9500711pfv.12.1692796136883;
        Wed, 23 Aug 2023 06:08:56 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([122.162.51.13])
        by smtp.gmail.com with ESMTPSA id a24-20020a62e218000000b0068bdb0be6bdsm1226466pfi.191.2023.08.23.06.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 06:08:56 -0700 (PDT)
Date: Wed, 23 Aug 2023 18:38:52 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: replace camel case by snake case
Message-ID: <ZOYE5DI+AjRlRUnd@ubuntu.myguest.virtualbox.org>
References: <ZOTUCRICU6lSYfdn@ubuntu.myguest.virtualbox.org>
 <e5eb5935-5219-4d43-892b-96a03f8eb755@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5eb5935-5219-4d43-892b-96a03f8eb755@gmail.com>

On Tue, Aug 22, 2023 at 07:31:21PM +0200, Philipp Hortmann wrote:
> On 8/22/23 17:28, Pavan Bobba wrote:
> > Replace formal arguments of few functions and local variables of camel case by snake case.
> > Issue found by checkpatch
> > 
> > Signed-off-by: Pavan Bobba<opensource206@gmail.com>
> 
> Hi,
> 
> please find a unique subject so that we see it is something new.
> 
> Thanks
> 
> Bye Philipp
Thank you Philipp.i have updated my patch description in next patch
