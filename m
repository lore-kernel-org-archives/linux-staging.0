Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B44D3FC5
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 10:50:54 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id c10so16012870qko.11
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 03:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lr/rxe0F4pP7z7/1Nek4bY/iz1JjEH11EDO8B9nTHfU=;
        b=fsLpa3dW9LHO7KjhUNgNE2SAnBDyCfbLO5DapWvDF8qq7DEA1gX+CGGOHJHHrrBsR8
         NnnHjsji5N3abSxNMbLhCHqQY9jbCQupaDalIuA68QgN0+Cr6z7M/J3oob//yVrl30NY
         BaVmXYsUPEB6HmzEphgaM8Ox66YZHim1IS0kScnokljDcIceyBn5zCitlmSe9hwZaHEz
         daNxGvo3jfgguSea8cowyxwogeyEwNXedMEZuf/uET54E6XVPQqOwHn7NBdWjoaxIyBK
         7bNCn6XGVmNRz8pTgOVkzqPWZaYF/oZq9Yml9yE9eNY0/c8VdNnt3t7H0B8U0g3U3h3S
         gFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lr/rxe0F4pP7z7/1Nek4bY/iz1JjEH11EDO8B9nTHfU=;
        b=VnESVn0BtjQDpaPeAcGx+4HAC2+cvRBW58wxIs/Yet7kfvbGd3Z/GfKHXB0A5swYa/
         LN/P8dhTsVGsoC8HAkpuElEkm+krLn5n4BCzhlw+2/gvY6kPb8gBYj5pjqjdabA2KH1x
         BBX8CKg/afN4Ev9NEL1dlN7RjZD76x+pTM4v5w+jMhIVfntu/um4EIRLPsmjS74SDBWI
         Iy416jYeKtfZ1YM/LYk4l+u1GjyHAZGGVCPrw5SoiwK56PPSSw33Z2sPF+5VqSq9S714
         dgXF/YThhT+mQ+JRipePN4f6l3Oo6M7qByXj1N6ANLX6JqAkP+jAWkwQ4ys0xaNCFRkA
         UM2w==
X-Gm-Message-State: AOAM533l0bhqFw6KeJtLqEk9K1MK8b6t/nTnJlM5UeJLfAJen4/GT94j
	NLa4dxPm1ZRlisw2vE8xokI=
X-Google-Smtp-Source: ABdhPJwImGd1QblVTK6YLe7DTUbEBnlgRTgZUMS89QTl704Xh+3B8SU6mZoipO0ozRfWMpI3nNM8TQ==
X-Received: by 2002:a05:620a:11ab:: with SMTP id c11mr9825812qkk.169.1631875853341;
        Fri, 17 Sep 2021 03:50:53 -0700 (PDT)
Received: from localhost.localdomain ([181.23.76.84])
        by smtp.gmail.com with ESMTPSA id x19sm4380072qkm.115.2021.09.17.03.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 03:50:52 -0700 (PDT)
Date: Fri, 17 Sep 2021 07:50:33 -0300
From: Gaston Gonzalez <gascoar@gmail.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
	nsaenz@kernel.org, arnd@arndb.de, dan.carpenter@oracle.com,
	ojaswin98@gmail.com, amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: Re: [PATCH 1/7] staging: vchiq_arm: cleanup code alignment issues
Message-ID: <YURy+YwGwAVola65@localhost.localdomain>
References: <20210915201824.413202-1-gascoar@gmail.com>
 <025d76f9-69ca-ee12-cc98-023a2ac2714d@i2se.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <025d76f9-69ca-ee12-cc98-023a2ac2714d@i2se.com>

Hi Stefan,

On Thu, Sep 16, 2021 at 12:54:20PM +0200, Stefan Wahren wrote:
> Hi Gaston,
> 
> Am 15.09.21 um 22:18 schrieb Gaston Gonzalez:
> > Fix code alignment issues.
> >
> > Reported by checkpatch.pl
> >
> > Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
> 
> please:
> 
> - use a version for your patch series
> - add a cover letter with version changes
> - try to give reviewers more time before sending a new version
> - try to avoid multiple patch series for the same driver at the same time
> 

Sure, will do. In fact, I was hesitant about some of the points you
listed.

Sorry for the noise.

Regards,

Gaston

> Regards
> 
> 
