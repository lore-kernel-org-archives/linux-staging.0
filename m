Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83498A38
	for <linux-staging@lists.linux.dev>; Tue,  5 Sep 2023 09:39:02 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-501bd6f7d11so872114e87.1
        for <linux-staging@lists.linux.dev>; Tue, 05 Sep 2023 02:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693906740; x=1694511540; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i199O6KiKKQM7slulMeIIsZKZZFjKrLdAh5+q0Dt1H4=;
        b=rf0ONTFJbQccV7AijSyZIEHl/N45Ux+0ItHoAJY4zp4rWRAYs+vOCLyPwAkKe50CUQ
         +3bTKsPiQDZEbyM3M24uB09pDWw2XCFZwlEklLXkTqbzzIK7iEYKtpBkKBv7e+nSUR+l
         3DxZSB0nF16c8Q02ayPvjVslHZiD9ZgMmWmhXTlfLWUo1IDMB/7zSnDEC+oMOtwISQDm
         jDsNwBuEBRZCV6xU4vI44k3V5/2HV2Bf+WKLYvCaoNJF/CDHivbvg+CLxWAIj666Rq8b
         44kLwWMqKIW/GxQg3S9rYQ97olpUlwgvgpmCekNP/dRIMOXYPM0yg8iJq6iuRzyUiNdu
         k+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693906740; x=1694511540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i199O6KiKKQM7slulMeIIsZKZZFjKrLdAh5+q0Dt1H4=;
        b=LO6r9K3h9VfLibDGwQx/VyFcRxBSjUa+S7IXU6TYdUCj117pUvDLP9ZLvJpDrVV93K
         E7k98Y+pDhptfbSPjXL8NfaV/Zl5XkpzLwGnJBkrhjI5wfd3WPLe997gTmlKnCsncXTK
         a2kGE0ibAorWf5lbDdCmmu23x5JXSQaggSOGm0OeY3Ka7nEcmSYMt2Qd3eO9u/fV8ROI
         SicvwrOHuMIXUqYB1mZLaoZ/NIsJ3yFU/FuLzsFLg5N+US6/amhiBw+kr1sVG4thvL8H
         +qAB6XEn1Hm7zXwK9cn/lyYmfFkss/V3XAe52FeaYAK88XGbmF7p+Cl1hQeoxFtNhHlY
         y1xg==
X-Gm-Message-State: AOJu0Yx49P9N4obIjZL16H2PQ0K/xRKz4q0GWhdFXz3+m3tM5+GijN4p
	5yENsBvwXTGd1037e3+oJ8YWxw==
X-Google-Smtp-Source: AGHT+IHHn25rlu/t0c0vstO4j/XpuwapT2mw2oB/ChLqaG0B8v4X+GFfCmsaepyxblW51Jp99wh0hg==
X-Received: by 2002:a19:384a:0:b0:4f8:49a8:a0e2 with SMTP id d10-20020a19384a000000b004f849a8a0e2mr7254434lfj.16.1693906740044;
        Tue, 05 Sep 2023 02:39:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y8-20020adff148000000b00317c742ca9asm16707010wro.43.2023.09.05.02.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 02:38:59 -0700 (PDT)
Date: Tue, 5 Sep 2023 12:38:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Oliver Crumrine <ozlinux@hotmail.com>
Cc: gregkh@linuxfoundation.org, colin.i.king@gmail.com,
	sumitraartsy@gmail.com, u.kleine-koenig@pengutronix.de,
	geert@linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 0/6] staging: octeon: clean up the octeon ethernet
 driver
Message-ID: <88fdf861-91fa-4ab7-8f43-53d844e9bca5@kadam.mountain>
References: <PH7PR11MB76434E13489C9713CB562A74BCE1A@PH7PR11MB7643.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR11MB76434E13489C9713CB562A74BCE1A@PH7PR11MB7643.namprd11.prod.outlook.com>

On Sun, Aug 27, 2023 at 07:58:16PM -0400, Oliver Crumrine wrote:
> Make the octeon ethernet driver better adhere to the
> kernel coding standards
> 
> Oliver Crumrine (6):
>   staging: octeon: clean up the octeon ethernet driver
>   staging: octeon: clean up the octeon ethernet driver
>   staging: octeon: clean up the octeon ethernet driver
>   staging: octeon: clean up the octeon ethernet driver
>   staging: octeon: clean up the octeon ethernet driver
>   staging: octeon: clean up the octeon ethernet driver

You can't send more than one patch with the same subject.  These all
have the same subject.

Also you're resending v2 v3 v4 too quickly.  You should wait for a day.
Do some testing.  See if people have additional comments.  There is no
rush.

regards,
dan carpenter

