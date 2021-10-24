Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E122C8B
	for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 18:43:49 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id a26so8582016edy.11
        for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 11:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PLo2wPZ3sr8u/YMmfsE81ITzb2gWI/ZlBw1GMaku9Tc=;
        b=CFKJXauMo5jd0vAv6qp4CeyWsOcWCS8QQp71I5fmYmWbzCK45jxRLlYq1Xf6evAl/c
         pHwQgGhuHqf6BR9Jtn2EvGxnb7IyZULt3r417XlD/3NSCZofHfHy0RQRlR41sr/QXCxf
         xNeb0vtjaAaWkgID5qa8K0Gr14IQr3KZV1GfmBgRYoDlCTsssuFgwLKtM56SHHTa2eHo
         GD67keayVQDfnsCGmLwGJ9s0hDQcE/gS4SN6bbPL4CiHUC++9lTJhZxHOFUtZH8eWVrI
         uSrMOF3niuSlsPszGKIURwqH9W7UERmSC0XHreHo2SdDDsIN9VtfS7BL0Lo+/sy8DEqO
         I9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PLo2wPZ3sr8u/YMmfsE81ITzb2gWI/ZlBw1GMaku9Tc=;
        b=3OFDrr0TBQjDH34VnSiUfIUt/qbBlCJ3l/6mPhy/egbtkWxNKLZuaBzuEWpGqmL8Nk
         YQVbkBbcklJKt6UR2MzdBpRbwqiww/r4ngaHjOND9W8yxWLELFtHtyFPdza9ow9yvp2O
         OOHrsEl8Jsu7nc5l0+tmA/mOUbscqVg/eOzJXq77Dgyq8qoZvh9hHGg6Apil+cWAayOX
         64UknTAk76PRyX3K/zZh0CpBh5a5Qz5wXMYEsQf4zRSobdhGtJd0DmecJUU7ppPHdz1h
         PcrgbLQ7vh9b0dGpNoWFKCnsbxGRMHa6aRGZV20o1Z5IEOmWPWaS8sRZKel4R3PlD7KF
         4WeA==
X-Gm-Message-State: AOAM533Mhwv1gJt0kt2p7CWW+kQNN2jvxS5bWGeaikjff+kEMfbRrzKx
	8IMHF4Rq0T3sOnU6Bm2DWiI=
X-Google-Smtp-Source: ABdhPJxMh0UwooY8Fhupl3FToFhxvOqdRLyjq0rnk44fZPEnTi9jNe8YhI0+AvhF9L6MdQDPZWrEdA==
X-Received: by 2002:a05:6402:1436:: with SMTP id c22mr19770675edx.153.1635101027553;
        Sun, 24 Oct 2021 11:43:47 -0700 (PDT)
Received: from tom-desktop (net-188-153-110-208.cust.vodafonedsl.it. [188.153.110.208])
        by smtp.gmail.com with ESMTPSA id qb15sm2106800ejc.108.2021.10.24.11.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 11:43:46 -0700 (PDT)
Date: Sun, 24 Oct 2021 20:43:45 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vt6655: fix camelcase byData in card.c
Message-ID: <20211024184345.GA7946@tom-desktop>
References: <20211018192124.8738-1-tomm.merciai@gmail.com>
 <YW5ceCLSIRl5zJIm@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YW5ceCLSIRl5zJIm@kroah.com>

On Tue, Oct 19, 2021 at 07:49:44AM +0200, Greg Kroah-Hartman wrote:
> On Mon, Oct 18, 2021 at 09:21:22PM +0200, Tommaso Merciai wrote:
> > Replace camelcase variable "byData" into linux kernel coding style
> > equivalent variable "data" in card.c.
> > "by" prefix in hungarian notation stands for byte or unsigned char
> > 
> > References:
> >  - https://www.cse.iitk.ac.in/users/dsrkg/cs245/html/Guide.htm
> 
> Don't provide web links in a changelog text, they might not endure.
> 
> >  - https://www.kernel.org/doc/html/v4.10/process/coding-style.html
> 
> Why the old and obsolete 4.10 kernel document?
> 
> thanks,
> 
> greg k-h

  Hi Greg,
  I'll update and resend.
  
  Thanks,
  Tommaso
