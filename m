Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0C7882C;
	Fri, 10 Mar 2023 16:01:29 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id m25-20020a7bcb99000000b003e7842b75f2so3759115wmi.3;
        Fri, 10 Mar 2023 08:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678464088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jCSTFN7mHgYxqSe921dWL62i2uQGD0s88NiYVgn9G08=;
        b=osPTfAiC5HcnDd9ph3ekTh6WI1G27RKdxywNkX5VeLNk24rrwgmPDg1zfL+HAhSc6W
         RHAdS6C9Or3N5+xLYOQ0t75d+rkQMXZGMovBiFEoCfUa4tL39re7+ShvJVhJIZ/Ye2/M
         ZOPsq+ucc7Emp7FHits70eOi7L5/Jjlz+2iaBnX8wOMCTKVzNojEgvyb+auP4shpEngu
         RDp+dtBuDF5+jo7Vx89OJBo90bI6zybcjyTgegMTM9tiiD+mO2pjhanLiqBaOGBnEQk/
         NHFp4b1qSuXM+Dsmn4nsecC9jPc8CimhdjwXrQnDgJZEzGY/kD6ePnDb2NHuWCg+B8Uh
         9W9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678464088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCSTFN7mHgYxqSe921dWL62i2uQGD0s88NiYVgn9G08=;
        b=X1qmgTFVOtnImnFO5dJKfE710mw4mqmxtWYe1ZsQsn4h2XBM5pCsoY25ymX7scAa59
         5CSzW7dLHuWU2HVrI5XU9jZfJJrw1010Mg8LoSfrTEGCeXBq2Sbi5ZJs9Nwsj7A7v5wq
         JcL5fcPk2IdOPM+P3howu/jXpiTmxN6+7W7xMgpkpdqU4RF6w1ZlRsG1OqCda9N2bU/s
         pGmvOdb0VnzdaG4kgMdd3fxoBhzQQXohb7XM7sE7UvLhFqtK5Obxq3DBXjF3RG58RNRi
         m5qzUeRj6WzsdYY3OAsH51EeNFPVSwRA6WFeRKlYUc667COdex/gN2LR1WRZTDbBAf7W
         bTVw==
X-Gm-Message-State: AO0yUKWG45cIfC986sVbRjNpxqOrgCdhuvaUFGN34ftxadjSDCNgdfvH
	a6IBmPF0yPyaDPeTxR3uDyKYXVDE2aZdBlEt
X-Google-Smtp-Source: AK7set+ScHzGOVj25/070zjmtWV+caFfAtH10FVf+Rg4IsndE27XAGe7wxc7BiNXhzYLuUjVk5Lzlw==
X-Received: by 2002:a05:600c:1c28:b0:3de:1d31:1042 with SMTP id j40-20020a05600c1c2800b003de1d311042mr3132413wms.23.1678464087576;
        Fri, 10 Mar 2023 08:01:27 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c444700b003e204fdb160sm360234wmn.3.2023.03.10.08.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 08:01:27 -0800 (PST)
Date: Fri, 10 Mar 2023 21:01:24 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: alignment should match opening
 parenthesis in axis-fifo.c
Message-ID: <ZAtUVBbyMw7ine2e@khadija-virtual-machine>
References: <ZAZSmPpB6fcozGa4@khadija-virtual-machine>
 <alpine.DEB.2.22.394.2303062202500.3050@hadrien>
 <CACcTnM5GR0ZM5WBaL+BDEK_0QJGr6h2t4tnsnjerHta_nq6Tmg@mail.gmail.com>
 <ab0fd80-22c-d982-2f4-6fa5f43f858@inria.fr>
 <CACcTnM4OHFiGrEez6dMzd4jO4YuQZzqpUK86UBMzhd+nFDWezA@mail.gmail.com>
 <e06f57e6-2a3a-7fde-742d-9d5dd8dd49b0@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e06f57e6-2a3a-7fde-742d-9d5dd8dd49b0@inria.fr>

On Tue, Mar 07, 2023 at 09:13:49AM +0100, Julia Lawall wrote:
> There are actually two similar issues in axis-fifo.c.  You could fix them
> both at once.

Hey Julia!
I have a question. Should I send the two fixes as a patchset of two
patches, and should I send it as [PATCH v2]?
Thank you.

