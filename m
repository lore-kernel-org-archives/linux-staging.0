Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746F1FC12
	for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 12:33:45 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-403012f27e1so21582885e9.1
        for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 05:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694781224; x=1695386024; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RUflmh4qQ8B/WFQpBNSKOdW/4uwxczL/Xulw2wdH1lQ=;
        b=CzZyP+oZQoMJx5eh0/WfQkiQBUXUoykE1GLWRwzhD9cWAZIHceWGkL/gT5g8FEup+b
         q8PVCDhByaxrLOiXA/u3S4sAOtN5gu8vQkrbFG2PnNSY6kiPw77Lxx25FuEqeSyPB8uu
         5q4RZI+d2q2gh9cGFjgN9ZV5Xe0A8jhwyIgp2JtJxjMJI5Ge2XKGL+cOLgf1QyAIm2Di
         fF54BrKFHj29tC0wAmqQq9yTEQLjXNe1HMyGEeXAjiGjSuWty4VXXndQI+qYdTo04kMv
         AK4Q6UEB4nqyrCfv3P0jdBJKsECuJmoSQIr5FulGG6qRMlgDL2ZMF0gkzBGEfSp0X82w
         hMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694781224; x=1695386024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUflmh4qQ8B/WFQpBNSKOdW/4uwxczL/Xulw2wdH1lQ=;
        b=YkfRryJ5JaOx2btf5sOLSvVP7OhbObBbMlIlhV8WgeN4I5XZeEMzoCpTee/pQ08ix6
         nGTm85geCEDO5jga6LnojwFG5fMLjUQ1rKJY5+GI14zvW65/QBKc9930J+XELiYn+xn7
         yf+r3r4U90LO9YL+1SqB7VkjtAs+tzE46YWWUCitHHKVWBA2Mm+lMijNhKVaPDf/exCw
         bCJ/mmMEhoRoSBRdey6bmVjPWN7hbvyKIP0eOZ5DlWscKM5F3000CSyZij4NJm/8ecnq
         kwVOPZsGQNmxfKQPi48D0doeXDiKE8MTfceNPPmlTOZ//hbSc+xmDIxLy/KgqIUWgxAb
         oS4Q==
X-Gm-Message-State: AOJu0YzcI6WaPsYx+Mp2l8VkgDeOdJLWEx/hWVAwNRMNyDx8PYUVrqey
	xBi6OcpG+LqcBfrgJjpC6QDdGg==
X-Google-Smtp-Source: AGHT+IEXJxeuznECg/KVhjt1QvjvR2Tw2XeeiZ/7QRi2IaCLCcMSwSMos+je8/bQAc+71y5qesI2Uw==
X-Received: by 2002:a05:600c:364f:b0:400:2dc5:2006 with SMTP id y15-20020a05600c364f00b004002dc52006mr1448236wmq.36.1694781223461;
        Fri, 15 Sep 2023 05:33:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x13-20020a1c7c0d000000b003fc0505be19sm4491795wmc.37.2023.09.15.05.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 05:33:43 -0700 (PDT)
Date: Fri, 15 Sep 2023 15:33:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ma Ke <make_ruc2021@163.com>
Cc: mripard@kernel.org, paul.kocialkowski@bootlin.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, wens@csie.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] media: cedrus: fix use after free bug in cedrus_remove
 due to race condition
Message-ID: <6ccc8fb2-4bd9-4df5-afe2-17868c4023f6@kadam.mountain>
References: <20230915114038.3407953-1-make_ruc2021@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915114038.3407953-1-make_ruc2021@163.com>

No, the code is okay.  The works is created in probe() and canceled in
remove().  You've added a new cancel in release() which is the wrong
place.  probe() pairs with remove().  open() pairs with release().

regards,
dan carpenter

