Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8046AD531
	for <linux-staging@lists.linux.dev>; Mon,  7 Nov 2022 15:38:40 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id bs21so16828163wrb.4
        for <linux-staging@lists.linux.dev>; Mon, 07 Nov 2022 07:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oPAYTOGqtJ5XNV/1AT7caGCJRWNvYtUi2mlJFlDAdFo=;
        b=abAkHaHp92Z2vtzOj1SozYZLRTomRw3rmtSms/q6U5bxMks3IC1kG7T1Jj4coIvsix
         tRZ9kGDrhxY2WOBrqZ+srAh5EIXZeZZJu8Nw9C0e+XWMxLvKW+GszXbLWi4Zuu1oDmsY
         C3w27S4X2EkcCE9alBkubM8pg6EYA0ATRKTF2b6HAgkRSRRp8U0fq2y75zHN2JoBgaOP
         UR5BramKRFnMm+wjf/Wx0Ii3mOE6drzHT/JySGDZA2yeSBtjdejVQReg9OBVH6nBzhs2
         PPL6fT0xAnExUe9uKeBMQ9K0QV8nNEfAY4MTG22q1++GvoL6Dd6asO5aL+b5v2S9S/Uu
         HEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPAYTOGqtJ5XNV/1AT7caGCJRWNvYtUi2mlJFlDAdFo=;
        b=4itrQAZ/RKCo+OngKgta2oRnn9ARGxINWY/3D+b4JZeTNRj55mEgoL8YjIUWL93MOq
         4885PrOjTjGaU9W/xg+QpV/npWaSjC9UE0o82gDhkLGgWW0IhxPKHWT9uk+aF2P6WGvK
         BnWjTvA4eVXWZGyRfQOoYuEjh9W689WSER8B1mRAYaoEnRIUaDqhancqueklUx6qUWO8
         fx1IZMksj7W4TB8RzSTBaAq1xyWrcVfpjnyBgmuubRxvHkS5RyhF22kYJyrdI4t8su9y
         v8mWIxKapJ9TUyA9dIwlU2nFz0hQ8eUCpvqjDZIni9s8w88KC3bspsD1nIY2Y41C+xsp
         4ZHw==
X-Gm-Message-State: ACrzQf2jK3v1bfwtrpdM5A4JenVWeXAu05PJmNFoNyFFq1swvRtQFr4m
	Lt3SuL23uwQk0ZxuTrUqDmA=
X-Google-Smtp-Source: AMsMyM6ogAqWyRekdBf34FVtsdxyzLUCwPGo0tD7wXyPyPl0rvifJ3bdaOFSULsXiP7FU2+hhTrvXg==
X-Received: by 2002:a05:6000:18d:b0:236:8f9d:6d41 with SMTP id p13-20020a056000018d00b002368f9d6d41mr33498809wrx.658.1667835518709;
        Mon, 07 Nov 2022 07:38:38 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r17-20020a05600c35d100b003c6cd82596esm12778680wmq.43.2022.11.07.07.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:38:38 -0800 (PST)
Date: Mon, 7 Nov 2022 18:38:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Deepak R Varma <drv@mailo.com>, Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: meter: use min() for comparison and
 assignment
Message-ID: <Y2kme/FDg/4K2VW5@kadam>
References: <Y2iFGA3A1w+XMlYU@qemulion>
 <Y2kDTxE38epBN368@kadam>
 <41a43f3865f3c86c6c2d1fbf3d82c42b685c7041.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41a43f3865f3c86c6c2d1fbf3d82c42b685c7041.camel@perches.com>

On Mon, Nov 07, 2022 at 07:22:24AM -0800, Joe Perches wrote:
> > In terms of run time, this patch is fine but in terms of reading the
> > code using min() makes it less readable.
> 
> It's not a runtime question, either should compile to the same object
> code.  It's definitely a readabiity and standardization issue.
> 
> In this case, IMO it'd be better to use the much more common
> 
> 	if (ret < 0)
> 		return ret;
> 
> 	return 0;

I also prefer this format.

But at the same time, I can't advise Deepak to go around changing
existing code where the author like ternaries.

regards,
dan carpenter
