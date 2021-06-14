Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8561672
	for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 16:33:58 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id og14so17699758ejc.5
        for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 09:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nfu4nv6LBNkbaTAdOZHKFPKz7o/TG3/iGSzZwfR0Tx8=;
        b=EFtFE07aEB2N5Ppdo5JcurTgb5qsnoQbYucDBtK9tZtJ677zWbu0QelOtEwDdYTY2w
         ZIkTVYvVZnaoDy28fCUkfuB6MXEwmykavTAgo+2ECA+H7vhPqA5REwo0Prjgpd7K2TSh
         f9jACPyo5awhnQdxn42eZs9sNrgAKHDIUfe6BNuIWeDtSUe6WOrk+JQ9eNdrSkYkQK1c
         7NjiFzRxFH3ImrTWSvnfmYn2cluMRjpJXAUcgfloeGKulcccZ1zRt5j+qKLVrWe4Qf4m
         XER7AcfenZHUAWN6LkmbUaypJEN73RsLPZ7AdP/3YNV+LJP0EMuq2KaLgwBbpMxaGirw
         2/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nfu4nv6LBNkbaTAdOZHKFPKz7o/TG3/iGSzZwfR0Tx8=;
        b=W9bHXHnCRyCEZVkCuC+PfiZmknPpQLUboQypRpu66uThKd8J52yMnBh66SI+KzQMLs
         rUtVg/+Vnsv6PrkUDSsfHcsJfnq9D9g9+lZkCkQI+LWMeNJlkVk+irfgCpmT8f6IiPbm
         2U63OkIyOJYuzjZ2BvHTL6ICUCkuQjs1f+CpzPgXcBt1thf1Bi33k9SUz94VeFLW+rEx
         ZeQryOksUr7n4jx5U/s0LGOZtsysFVxQCxlu31j8TYvEQGwl46eA+qM4Cd0UhK/yXUNc
         FP38xalFdrp+QXgJi89OEl+Vng06GeNo6MzcKp+AIwHeX3YStmheiB/KfOmWI/Z6GZpX
         Po4g==
X-Gm-Message-State: AOAM531VfGRUt2XnKfMwfyxz1dStSnrjZy3i2/CxyTOdDdtEESqNcKng
	yB/7O2X9dO5qtDIOK0frX34=
X-Google-Smtp-Source: ABdhPJz8IvzNUfCeTD8DWODwct88HeFY/KSo04uXGOEKRbTDLvVj/K+xHtjLsIhQqDekmWcgNht4MQ==
X-Received: by 2002:a17:906:7c10:: with SMTP id t16mr15465408ejo.204.1623688437076;
        Mon, 14 Jun 2021 09:33:57 -0700 (PDT)
Received: from linux.local (host-82-59-55-132.retail.telecomitalia.it. [82.59.55.132])
        by smtp.gmail.com with ESMTPSA id h23sm9111805eds.73.2021.06.14.09.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 09:33:56 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Remove unnecessary tests and cast before kfree/kvfree
Date: Mon, 14 Jun 2021 18:33:55 +0200
Message-ID: <3355688.ByQz1z8koQ@linux.local>
In-Reply-To: <20210605020855.1065-1-fmdefrancesco@gmail.com>
References: <20210605020855.1065-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi All,

I've seen that some patches of mine, more recent the following ones, have 
already been applied. In the past I had noticed that the patches are 
(usually?) placed in a time of submission ordered FIFO, unless they are 
rejected.

I'm wondering if I should re-send them or if I am missing some details about 
the specific workflow of staging/media.

Thanks,

Fabio

On Saturday, June 5, 2021 4:08:53 AM CEST Fabio M. De Francesco wrote:
> (1/2) Removed unnecessary test of pointers != NULL before passing them to
> kfree() and kvfree().
> (2/2) Removed an unnecessary (void *) cast for an argument passed to 
kfree().
> 
> v1 -> v2: Added patch 2/2.
> 
> Fabio M. De Francesco (2):
>   staging: media: atomisp: pci: Remove checks before kfree/kvfree
>   staging: media: atomisp: pci: Remove unnecessary (void *) cast
> 
>  drivers/staging/media/atomisp/pci/sh_css_firmware.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)




