Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C3C72
	for <linux-staging@lists.linux.dev>; Fri, 26 Nov 2021 07:36:09 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id y13so34948072edd.13
        for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 23:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=elJioYNUbOzp4AX6n16wfmeroXlPwEb1AcJcD/HfIlo=;
        b=cuYI5lX/w13XGoVbijkOcO0Df4iXXCO1KO1DxzVauzOtOpZ0r0mFw6GSEMYZO/MhCk
         C+fYevTdEUz6ikNlEUUntAM1UVhHtIRY7L9oQpVQd0vSsa1uVTnJTnoKX6zjd2q1Vjhb
         6qQx+JTKIEl/UW7oDydJaJ+S2NWWVFnbuTVDyLaEZBH2YTP9P3SG6bFp1r2k0QsEQUl8
         jgIRKNdHqIXML1bZP0VzKqxE9tUWPZcNyD1lv6LWBCjcAjUDloHEA86g5QrPKgtKrpLD
         M8/G+zxvjWHcHUUQ30sg6gJdilMsshmSs/p6DCcKC+XBJB4s/OX+uZ/a0gjzJtyJ6Dz5
         Yj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=elJioYNUbOzp4AX6n16wfmeroXlPwEb1AcJcD/HfIlo=;
        b=MS8FRlMpP+JQuFqG0gBM3GWBiH9o9xEzur6JcSoz2Sm6mf4Z7FfXEqWr7mQUjjq/Ql
         ECAWmsMLVpeC27EhNCPdkZwOGXTDpZzCD7Dxe4BNJMuI5TbsfGeW4jKWR3+7DEG75rg1
         MtaSm+ebzkuuGeimkjJ/FnXWEUckfNP7M44vAaQuaUTHBcI2fXuR0Vc9RWxFiuq+E0dH
         +H3qKCcGzwzZpNTU6kGP8B8Qod4/hBl377SvPjlalCDXRTTXwWz56fRF7kEL7xE/AZlv
         b2e9F9RuRi1O1VYEg2Zd8DKZDxsm2RWB8dBTHc1kKfm7aeDTkxZ2WzUV23L71TqfrENe
         dTHw==
X-Gm-Message-State: AOAM531CmLWAr/IJFmrrVKgSN2LK+OwAFWiSplFI6+DwV4xnL6uPJ+tQ
	vHo+8g7aANbT0wL+UOpVAi0=
X-Google-Smtp-Source: ABdhPJziieAYsblkX51ypxlNpIpLASnQWiqy4Ol2QSm24dq/SP/qvVTPJVxq7n6D39x3WcD7zizgOw==
X-Received: by 2002:a17:907:608f:: with SMTP id ht15mr1635858ejc.300.1637912167916;
        Thu, 25 Nov 2021 23:36:07 -0800 (PST)
Received: from alb3rt0-VirtualBox ([151.22.100.250])
        by smtp.gmail.com with ESMTPSA id k21sm3169110edo.87.2021.11.25.23.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 23:36:07 -0800 (PST)
Date: Fri, 26 Nov 2021 08:36:05 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: joe@perches.com, forest@alittletooquiet.net, karolinadrobnik@gmail.com,
	lucas.henneman@linaro.org, dan.carpenter@oracle.com,
	tomm.merciai@gmail.com, eantoranz@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5] staging: vt6655: refactor camelcase uCurrRSSI to
 current_rssi
Message-ID: <20211126073605.GA4537@alb3rt0-VirtualBox>
References: <20211118211128.GA156436@t470p>
 <YZ+9yDiG1SoWrWED@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZ+9yDiG1SoWrWED@kroah.com>


> I'm totally lost, sorry.
I did a bit confusion, I'm lost too... :P

> Please resend this again and properly set the version number.
Sure, I will.

Thanks,
Alberto


