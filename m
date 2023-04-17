Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191FD1101
	for <linux-staging@lists.linux.dev>; Mon, 17 Apr 2023 08:37:41 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id hg25-20020a05600c539900b003f05a99a841so20621435wmb.3
        for <linux-staging@lists.linux.dev>; Mon, 17 Apr 2023 01:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681720659; x=1684312659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1TS0efwUAAd7nlMdFggdSRaEYHBszL5PVl2VfDfaNHg=;
        b=nVVXDYKM7dS4sxRa/jMCyNcxKoWwzHPzKRS0iVd6JdsLC4Yvf7HqH5uJYkZn6sPUaL
         iCcJorJ9taEkn5S/3hZFlnNfdUXK8M9QZR9HeG/ElesAuSQ0SxIH3lplS8Z3IVQJ9tK2
         8nfGLoQaiJgUbrvKa5++zjHL1JtK9vMOCOZ11G2mGaYsJtcN5AdMBQp7Mcy5E43bRwMA
         4JUppzGWq8k1kaih4oTsHrEuznAt4v1Njjmr+1B2RtULOASeBzU5CCLFl18qC2Y5VYBW
         jmlQ0p3MbMsR+GEyRUnpskMp+fYdwMXusiBhofFYKAd271MjGcWIR3P5YhGhFIQ8ZPBQ
         jo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681720659; x=1684312659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TS0efwUAAd7nlMdFggdSRaEYHBszL5PVl2VfDfaNHg=;
        b=VOwPDGTSTQ/wcgnBIQ6Uz4NwocAc/oHszYwu45x9i2R7xBjYQGtmLRWRXNNbHNh4bs
         guj/wEqewbc2LimOU3by0QnmV9vA4bCc7OcmWWwJTCnpsHru8Wqfy9mqe6ZgrguEo2zp
         kPlcrb64RbqjuLHfuuBN1sgRA2Ru3LWAikzRnIhKAoDs5E37Lx8EHM5fJ8CUhfttQmcH
         feaTS4qqdnleTifSkvpuiJ2OwC4cVdT//TpSvTQur0CZmwL8ePSSP0GzTq2aYABu0xyE
         EQVrdJ7YA63qDk1zxzaQ9i9u98oFpG6bZz44fupspph+vBwZpkzfPviJYLoUHNhK4lY6
         QRxA==
X-Gm-Message-State: AAQBX9e36lEBxAIpk1o49pn/3c0w2gRUnyrrPaesluheG5HuWBV3jKH8
	ncqmjZKCIjuLl90q5Imy27w=
X-Google-Smtp-Source: AKy350alSXGGOxruHJRLZ27Qv5gwxhcs5eIGFX7ZpE88yZEtv4l1XpzjXc4my9iIW8NDRUQO5YYFsQ==
X-Received: by 2002:a05:600c:1e0f:b0:3f1:7510:62e8 with SMTP id ay15-20020a05600c1e0f00b003f1751062e8mr763946wmb.3.1681720659317;
        Mon, 17 Apr 2023 01:37:39 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t12-20020a5d460c000000b002c561805a4csm9943079wrq.45.2023.04.17.01.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 01:37:38 -0700 (PDT)
Date: Mon, 17 Apr 2023 11:37:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ladislav Michl <oss-lists@triops.cz>, linux-staging@lists.linux.dev,
	netdev@vger.kernel.org, linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH 2/3] staging: octeon: avoid needless device allocation
Message-ID: <26dd05e9-befa-4190-ac3c-bf31d58a5f1e@kili.mountain>
References: <ZDgNexVTEfyGo77d@lenoch>
 <ZDgOLHw1IkmWVU79@lenoch>
 <543bfbb6-af60-4b5d-abf8-0274ab0b713f@lunn.ch>
 <ZDgxPet9RIDC9Oz1@lenoch>
 <e2f5462d-5573-483c-9428-5f2b052cf939@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2f5462d-5573-483c-9428-5f2b052cf939@lunn.ch>

On Thu, Apr 13, 2023 at 07:20:08PM +0200, Andrew Lunn wrote:
> > I was asking this question myself and then came to this:
> > Converting driver to phylink makes separating different macs easier as
> > this driver is splitted between staging and arch/mips/cavium-octeon/executive/
> > However I'll provide changes spotted previously as separate preparational
> > patches. Would that work for you?
> 
> Is you end goal to get this out of staging? phylib vs phylink is not a
> reason to keep it in staging.
> 
> It just seems odd to be adding new features to a staging driver. As a
> bit of a "carrot and stick" maybe we should say you cannot add new
> features until it is ready to move out of staging?

We already have that rule.  But I don't know anything about phy vs
phylink...

regards,
dan carpenter

