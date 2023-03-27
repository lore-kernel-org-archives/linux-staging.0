Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A9A620;
	Mon, 27 Mar 2023 05:03:20 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id l12so7254727wrm.10;
        Sun, 26 Mar 2023 22:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679893399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y7YZc7+GXIQDusVUYqDOj5P6rOU9cQWWbR2WAwt/ZP8=;
        b=Au31X4bAiYNikzyau9Yfhg61ao8BTyae3kBdmWF7+w8cKS6x5kPmT6nu82vEZ0040a
         jvugcn6hzLwKsx3Dd1gMYUfYl38cfjFf8DbCugPyv6EMG8e/tu5l3FR29XUU3lKVHnr4
         wMy8rWT09dTWjJMvUtZy/Ka2MleRCb7igF8l3wfhwX4YhgMw1h8sNrI0del/xnLidaY4
         ljMQv2rRc9pX+hX4MU5kqFxEGSR2b/rSuffaK6xWXrQXlJlHgmrrtRPuxBd7Ru8vf9Jv
         056OoNcnN38e37ZrG4olglwyhHz9iM84vIqDU3OO9tKr5JFwng+jv0OzIhNoqzIxGN9m
         EtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679893399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7YZc7+GXIQDusVUYqDOj5P6rOU9cQWWbR2WAwt/ZP8=;
        b=Dw5FIVb35XKnqnO9NVOQGPAr/Dc3Os8J8JN/2aacCC9aYHzVtdSDhIHkU9K7XAhT7T
         g8Mu9pTjOtYFsxcWAbopvbdvZLNCFGQAJguEtfNRFauYm9T5+fIK1fYErw4aqUStKBx1
         TrmvX2rvWZ78qCY84F264xojXPwLwj5WoJQPUruEcVsCO7ZmYOmMTsVSImKeuu3lHAan
         QdAi2NdDOelt3RoXgokwejiDX5//PGkRc8szUkXArACt5M8KIwf2Eak+/DUqAWDSLtAv
         cj9hugp70p6hRqcKA9iQ4sjziXy46QEbVziz1khuoZFgPW+pTPuVKPRDOoKg2crSCiq6
         A+1g==
X-Gm-Message-State: AAQBX9cOo0suTLPzuKtVQ5csWIpvaMvObH+cb+tUsWL2sQWD+4iPzLfC
	LA7SwXGa1eyo7rS6nHC8zr4=
X-Google-Smtp-Source: AKy350aLBQR2xPYxawU6Rc6qi8vaKa9Q3oJfOb9xD9r02p7cdkbEIZyhOWFb6S3aQUxQIGPy8D0zAQ==
X-Received: by 2002:adf:ea09:0:b0:2d1:f705:a602 with SMTP id q9-20020adfea09000000b002d1f705a602mr7986169wrm.22.1679893398684;
        Sun, 26 Mar 2023 22:03:18 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n17-20020adff091000000b002c5534db60bsm24065337wro.71.2023.03.26.22.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 22:03:18 -0700 (PDT)
Date: Mon, 27 Mar 2023 08:03:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] staging: rtl8192u: reformat block comments
Message-ID: <32819686-cce9-40d2-8707-547bdb1a72f8@kili.mountain>
References: <cover.1679831899.git.kamrankhadijadj@gmail.com>
 <d49d15e620aa9239f3d68df1a5f8b600de77b536.1679831899.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d49d15e620aa9239f3d68df1a5f8b600de77b536.1679831899.git.kamrankhadijadj@gmail.com>

On Sun, Mar 26, 2023 at 05:18:27PM +0500, Khadija Kamran wrote:
> Linux kernel coding style for block comments uses a column of '*' on the
> left side and  uses '*/' on a separate line.
> 
> Fix block comments by adding '*' on subsequent lines and moving '*/' at
> the end of block comments on a separate line. These issues in block
> comments are reported by checkpatch.pl script.
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/rtl8192u/r8192U_dm.c | 38 +++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192u/r8192U_dm.c b/drivers/staging/rtl8192u/r8192U_dm.c
> index e5c0bece4bb4..99c38a4cf54c 100644
> --- a/drivers/staging/rtl8192u/r8192U_dm.c
> +++ b/drivers/staging/rtl8192u/r8192U_dm.c
> @@ -1,13 +1,14 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*++
> -Copyright-c Realtek Semiconductor Corp. All rights reserved.
> -
> -Module Name:
> -	r8192U_dm.c
> -
> -Abstract:
> -	HW dynamic mechanism.
> ---*/
> + *Copyright-c Realtek Semiconductor Corp. All rights reserved.

You need spaces after the '*' char.

/*
 * Copyright-c Realtek Semiconductor Corp. All rights reserved.
 *
 * Module Name:

> + *
> + *Module Name:
> + *	r8192U_dm.c
> + *
> + *Abstract:
> + *	HW dynamic mechanism.
> + *--
> + */
>  #include "r8192U.h"
>  #include "r8192U_dm.h"
>  #include "r8192U_hw.h"
> @@ -243,7 +244,8 @@ void init_rate_adaptive(struct net_device *dev)
>   * Output:		NONE
>   *
>   * Return:		NONE
> - *---------------------------------------------------------------------------*/
> + *---------------------------------------------------------------------------
> + */
>  static void dm_check_rate_adaptive(struct net_device *dev)

There is a proper kernel doc format for comment formats.  The format is
described in Documentation/doc-guide/kernel-doc.rst

(Change the function comments as a separate patch from the top of the
file changes).

regards,
dan carpenter

