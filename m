Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1027E
	for <linux-staging@lists.linux.dev>; Mon,  6 Mar 2023 09:12:38 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id cy23so35376634edb.12
        for <linux-staging@lists.linux.dev>; Mon, 06 Mar 2023 01:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678093957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4mTfGx0mp9/LWUdj2UvEsovJkAt+RFABCOqqYv14V70=;
        b=NdvnDywVIzQx5bVkpYvWuwCDxBJEtDr0Ft8ay2Ya8vmx1+sKT2IuSp+ovPnd6Lp2Ob
         Rlh1nNqfs2FwGSmfpgl/A7++KH4lmY8sqOzQkZGNnOZnyl8s0z5+r9GlgIgp2m1IGPCP
         CrZTc5n8a3XtQ3y+35LWFi8mz7dSgAVALC4F5/r+iHxq5G6DQrm+YBdr+0N/ZIOzB5VX
         9rvSubDB7XMapgeBtKatGvMDD+6enfhJ2D50rSvvzfyZ2qBcl9m3tFY0v6Hw861UrejV
         rTE0rf7632ZTmZnkNZne+vcoEAyiKwhNp4ZyQtavNHG/KUntcCxvQScBMAe1dlsn9eS4
         0awQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678093957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mTfGx0mp9/LWUdj2UvEsovJkAt+RFABCOqqYv14V70=;
        b=JMHDFt2CxlqNbfmsSGV95fmDYxcNYgGNwbCiiaRZkq5wL8Z2Qc4WoANJ98+EkqTYuh
         7Ka7b49jf0VUMsVLdKWzN7h8t7r1Lz8NiReaYBEkrkzUrcCzdw8iNxHABbq28NNWZZl/
         z2IQLUJlQGmzTUz8dvmg2Ikj0lUa29Ia3WyFk/OeiV6jYs8MrwEbhNVY6bBqHvOWN2BT
         +LqMwbc2xNQNbxwQBIIvVXSo7xgwLFP592i5HNs1r0Q2smgzFfw/vXUkai4EKdkKxori
         GLCrOG+JCIEWXu8Q46R5rZMC+stNUFdfFbFPdPmXSP/hFth6/n1F7FnPbUr74F3cE2Wy
         xF7Q==
X-Gm-Message-State: AO0yUKXTyw3CPeOKYGDj22W2gLTqULP6f6BYxoPD0qBZ4jB0MrZlsMd0
	iYyP6+yv8XE4IZeBdImFTxE=
X-Google-Smtp-Source: AK7set8+B/WkBbXW6QVxciYpO7XflUL7lhU5VYTsfbZ66mjsMs/p4NW1PHT7yRc+xC9MZYQwCHa89Q==
X-Received: by 2002:a17:906:af62:b0:8d9:383a:be39 with SMTP id os2-20020a170906af6200b008d9383abe39mr11790006ejb.41.1678093956822;
        Mon, 06 Mar 2023 01:12:36 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a170906081900b008eb2a1474d0sm4293780ejd.77.2023.03.06.01.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 01:12:36 -0800 (PST)
Date: Mon, 6 Mar 2023 12:12:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8192e: Remove empty Array
 Rtl8192PciERadioC_Array
Message-ID: <51b147e6-d502-461d-9c29-647ec67e0d38@kili.mountain>
References: <cover.1678051460.git.philipp.g.hortmann@gmail.com>
 <d8f0e8c7ee6dd820b56636db8d891012aa3ab263.1678051460.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8f0e8c7ee6dd820b56636db8d891012aa3ab263.1678051460.git.philipp.g.hortmann@gmail.com>

On Sun, Mar 05, 2023 at 11:33:05PM +0100, Philipp Hortmann wrote:
> Remove empty array Rtl8192PciERadioC_Array and the code where it is used
> because it is dead code.
> 
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> ---
>  drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 12 ------------
>  drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h |  2 --
>  drivers/staging/rtl8192e/rtl8192e/table.c      |  3 ---
>  drivers/staging/rtl8192e/rtl8192e/table.h      |  2 --
>  4 files changed, 19 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> index 35ca01ab65ff..fe0ef52c163a 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> @@ -649,18 +649,6 @@ u8 rtl92e_config_rf_path(struct net_device *dev, enum rf90_radio_path eRFPath)
>  					  bMask12Bits,
>  					  Rtl819XRadioB_Array[i+1]);
>  
> -		}
> -		break;
> -	case RF90_PATH_C:
> -		for (i = 0; i < RadioC_ArrayLength; i += 2) {
> -			if (Rtl819XRadioC_Array[i] == 0xfe) {
> -				msleep(100);
> -				continue;
> -			}
> -			rtl92e_set_rf_reg(dev, eRFPath, Rtl819XRadioC_Array[i],
> -					  bMask12Bits,
> -					  Rtl819XRadioC_Array[i+1]);
> -

Why is this dead code?  So far as I can see "== 0xfe" is always false
so this calls rtl92e_set_rf_reg() on every iteration through the loop.
It only does one iteration through the loop.

Is it dead code because case RF90_PATH_C is always false?  If so then
that needs to be explained in the commit message.

regards,
dan carpenter

