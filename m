Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E8E8F58;
	Wed, 22 Mar 2023 18:06:12 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id n19so1824912wms.0;
        Wed, 22 Mar 2023 11:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679508370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lQlkTrDUMyIzoKUTa4EB/7B9v75JQsqp1RH/FF8jnII=;
        b=Jv/yvvCIK9N/w4adbeYydlyMQukdDjPsjhHiWZML0YgwHCbjb3oWOXkMDFxGyqMis8
         Y9heDgxww1MEfpFHUHbwP0+f5jLcaW+lya3SGPkHXFDVCkSUmtPUWislMayCeqMO30XH
         lhtp92ZYe8zWEcMgnIa7he4GgyY0BNZlnTviZo+Mx/QgMI5nOlfPk3RQ5+Krm1+xz2p5
         KNChmEF2+Z2rtzSv1qxpfsv1gjGaZN+4SRWEJG/Tjqy54RjC5lPCIbFdaVrhhFyWn8Jz
         Seel55pLxPkZwgva2ld/t+h7CzF9tf24k1sfrvuLA+0jSGj16Z0X6bhLzfzOkV8PvCW1
         VxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679508370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQlkTrDUMyIzoKUTa4EB/7B9v75JQsqp1RH/FF8jnII=;
        b=EEtuo0pwvS4cnDfMvLR5xWSxnWQdmXDN+dzdpz+GmAEdGMw5DH59uRBigoWSouc8Mt
         oy/LbvlIt0gmGz8TnZGkkTkNkxYCZGlv77qh6nEcHWr95z6ft5bRM1c3YY0XTc9GP338
         EdJG1P2oH3KWWOTzYGWrvVlJiLwaW0Dsw2cjS0oddG8O+LjEEbR2Elj981+94OYXHwjE
         UjVSOSuF0G9n7YZaWXiKUoAuzlsEr21LKsJcRI6ANNOqlRph5VhEhq4BKm6g1JybPB4B
         pIpzyUzvBpCaQbuo+6GaNlj6cIPOzumpeNQacpmn2EIUYMpYv9/2LmRI9j6DEi5Jsoiv
         I+Zw==
X-Gm-Message-State: AO0yUKURuMMexSsfzYG+fAyW2HWZmOktj8hhEU3hzb1KXN7E0pTaVu30
	6d57d88j4IjeTpmVgomAIL0=
X-Google-Smtp-Source: AK7set9PvLALfTOZlyrn4wUsytwFilchVUKkUSnU6OXEoe2fBm9qiDZfKWrdnLEWV8TmcajiZO9Urw==
X-Received: by 2002:a7b:c3d9:0:b0:3ee:42fd:7768 with SMTP id t25-20020a7bc3d9000000b003ee42fd7768mr372051wmj.1.1679508370151;
        Wed, 22 Mar 2023 11:06:10 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id j10-20020a5d464a000000b002cea8f07813sm14452324wrs.81.2023.03.22.11.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 11:06:09 -0700 (PDT)
Date: Wed, 22 Mar 2023 23:06:07 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: outreachy@lists.linux.dev,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: most: fix line ending with '('
Message-ID: <ZBtDj/sRJCiOhsRD@khadija-virtual-machine>
References: <ZBsYYAc1Ue/JnUAm@khadija-virtual-machine>
 <8064a4ee-665b-417e-a1e2-7e7dd32ec1f0@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8064a4ee-665b-417e-a1e2-7e7dd32ec1f0@kili.mountain>

On Wed, Mar 22, 2023 at 06:09:50PM +0300, Dan Carpenter wrote:
> On Wed, Mar 22, 2023 at 08:01:52PM +0500, Khadija Kamran wrote:
> > Splitting function header to multiple lines because of 80 characters per
> > line limit, results in ending the function call line with '('.
> > This leads to CHECK reported by checkpatch.pl
> > 
> > Move the function parameters right after the '(' in the function call
> > line. Align the rest of the parameters to the opening parenthesis.
> > 
> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> > 
> > Changes in v2:
> >  - Changed the description
> > 
> 
> No one replied to the v1 of this patch so it's not clear which of the
> patches should be ignored.
>

Hey Dan!

I created a patch revision without any feedback. My bad. I thought the
description in the previous patch was misleading, so I wanted to change
it.

> Also you have a couple patches with the same subject and that's against
> the rules.
>

I am sorry about that. Kindly guide me here. 
Both patches are for same driver i.e. staging/most, but for different
files. Would it be fine to add file names in the subject to
differentiate them?

Regards,
Khadija

> regards,
> dan carpenter
> 
