Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F3B20E4
	for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 11:14:18 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso4151048wmp.3
        for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 03:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mqoyOu7/doMbawBslte+XDlNAkCkcAPqaTX4lXOdCJ8=;
        b=l1jaAzLRIkj07Y3PD4oxyAymy82JNXoBDyGbEMVFlROz7SvEezIk97Tn6/Ur+faVuP
         EUyl4cgx3Ar+W9/abmYKajFJvUOwX+pYD+asjyJg6wKl4M/3BfGon304x9Te2ubM3jm3
         PqRsLzscYItyi38euczA9sTev7KzZ5HYKgG1eU3LedM6CZD1Kxar9pv7bdKdqT9HShCN
         hd/U4JrnqqDGIDroRFjiQhqaChnYuyvW07KbflmQw0OT5RZqI6zopk9UJHO82StV64W0
         h0+zcTPbdsZcllbYx6NMAHgqt3+Y5KuDc40MFZKHqhWuLafkBHCzMzF5jyCUxlkdzFZA
         7GOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqoyOu7/doMbawBslte+XDlNAkCkcAPqaTX4lXOdCJ8=;
        b=52VfJsjSVmLExC12AL6LAIyXly5Uzp5MXFN9BX9KNPI4GfBcAXe8e/fOwau1GV4gA1
         IJlCKkJtFu+5RpTU8J7CLNZjRyez8tbTafe11kxVn86+EkRo3lNJnL27S8H3fLAqnzcY
         EGz5x8wTE3Cpy9pmh/Fp5g1FZbUSmXcZmUHmLwtHDfsi0xVaolUzO3YUssDYCOtcwOJE
         mo4Vba0FnC8W6XLfU1yZmNz265cK/14Lv3GOhQe2WClcya6kb8PRjvqmV8h4XZ5UKCBh
         h5sQG8owd9RijnKxNieyL981k1ewtUfkg1V1r5YR+OHEN8NR+S7U2i1uJt9WRmU+29Jj
         JmRw==
X-Gm-Message-State: AFqh2koKY91hIxun1Db5yULl+GX42uiJ3M4vEeqoFxgwYPJLgWm1armf
	Ug9TP3W/t/eFSKSuR07tn4U=
X-Google-Smtp-Source: AMrXdXsiss8SOWuIw5bzdHIyEFiuKHAR+r2eqZXtGWormMk4zSRfupW+b2bxCC871JoMn9YBYIEPSA==
X-Received: by 2002:a05:600c:6011:b0:3cf:85f7:bbc4 with SMTP id az17-20020a05600c601100b003cf85f7bbc4mr52071876wmb.2.1675163656498;
        Tue, 31 Jan 2023 03:14:16 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n6-20020adff086000000b002bdbead763csm14854668wro.95.2023.01.31.03.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 03:14:16 -0800 (PST)
Date: Tue, 31 Jan 2023 14:14:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: modify bit_rate from u16 to u32
Message-ID: <Y9j4BI3/ybsaLCfw@kadam>
References: <Y9h42l/8EcPqn63x@combine-ThinkPad-S1-Yoga>
 <Y9ilj812USHrSXe+@kroah.com>
 <Y9jrOKMGl7ITKxhP@combine-ThinkPad-S1-Yoga>
 <Y9jwcdYcFQ9f8+mR@kroah.com>
 <Y9jy+f5JpD1NrbZn@combine-ThinkPad-S1-Yoga>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9jy+f5JpD1NrbZn@combine-ThinkPad-S1-Yoga>

On Tue, Jan 31, 2023 at 11:52:41AM +0100, Guru Mehar Rachaputi wrote:

> I would like to know, if it is mentioned in the TODO, why is it
> so?
> 

If it were as simple as just changing the type, they would have done
that instead of adding it to the TODO.  :P

But in fairness the TODO entry is sort of vague and useless.  It should
say that this configuration stuff needs to be moved to sysfs instead of
being done through an IOCTL.  The we would need to port the userspace
tools to use sysfs instead of the IOCTL.  Then we would delete the
IOCTL.

https://lore.kernel.org/all/20220118135902.GH1951@kadam/

If you want to send a patch to update the TODO then you can do that.

regards,
dan carpenter

