Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAD0640
	for <linux-staging@lists.linux.dev>; Mon, 27 Feb 2023 04:45:19 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id l25so4845156wrb.3
        for <linux-staging@lists.linux.dev>; Sun, 26 Feb 2023 20:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ef1eXKymSCJ8axKk34kHhc+GvKhotAKCjiYY25M70U=;
        b=FCeLmTH+FJtGqgCTAVRBa+KEIioqteBcqSog0UWZGRm7vpPObpjNkAhNKWVZ2q1R9a
         3Mna1gesKZpbcSPaqcSCbqt2YLvEpnYISnetOscUaUsr8c2yqcxRqpMrD0zGjDNY6ZOm
         PiFnquFkY7gKW5oq3sWf0eb66rvUKCgSgJy1fY3Uig8NJxoTQlWhkVREctqz0+KN4L08
         /lkpu9FMCztBvwcV3ueWGASJfwpmZSSLhjYBZGFXPvLaDFNbevP8b4df/SdIqC1Cuf8B
         pSXzymNBpDuVF58waUmrL+b39Gyv77621yxOoFvgzw46aWoExYpm/bL5qtQCFkBDwur/
         5bWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ef1eXKymSCJ8axKk34kHhc+GvKhotAKCjiYY25M70U=;
        b=7MdnzMpEboKmOmGGtkfUFLK2zU+IrpsDs8DO6DOqqtSf8bc39MhDku/4iLJCeFz7mb
         +ob9YllvPC7/c9d9bz2kAIoSjtjMUqbeByGVBKFRVobsTNfAkw2KnT3wOj0/EXx5hR8W
         txgFEdeqf57VDK+fGFWHWA42MpzIR+BA8z4XgkaFI7z7MjRXWMs0UxtmnRrWfDZjQq/c
         6KuPjp/t5GE2v9hJEHlO+ml1YuuY7uCA+fKn9GzmTsvQkUq3HUiU/LWhEUyHLwjW3nH5
         HAz+r3l5/0T1EJEu8k7sJTmHf+TdBxDs4gQSxbQEP2ZTzEpeZuzoGbTOuesvuon7ZBZq
         3YPw==
X-Gm-Message-State: AO0yUKW0ErESZD1eiEPLtfs6XY2bSLrhfBhlcrTxt21ywP22I/Z9Rh/5
	gAYJKD329785ue8HDDlochU=
X-Google-Smtp-Source: AK7set807VTcubdpYBl6vUB/jc7SWxpQeatjuPP1ahHjDC38EuBR7LcXS6VHHtGvKwpr+A2X6ZpCKA==
X-Received: by 2002:adf:ea07:0:b0:2c7:420:5d52 with SMTP id q7-20020adfea07000000b002c704205d52mr17648600wrm.62.1677473117292;
        Sun, 26 Feb 2023 20:45:17 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u9-20020a5d5149000000b002c54c92e125sm5944690wrt.46.2023.02.26.20.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 20:45:15 -0800 (PST)
Date: Mon, 27 Feb 2023 07:45:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shibo Li <zzutcyha@163.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: Fixes the problem of irregular
 indentation
Message-ID: <Y/w1V5cYwTfDVn5p@kadam>
References: <20230226122820.194074-1-zzutcyha@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230226122820.194074-1-zzutcyha@163.com>

On Sun, Feb 26, 2023 at 12:28:20PM +0000, Shibo Li wrote:
> This patch fixes the problem of irregular indentation
> 
> Signed-off-by: Shibo Li <zzutcyha@163.com>
> ---
>  drivers/staging/rtl8712/rtl871x_mlme.c | 182 ++++++++++++-------------
>  1 file changed, 91 insertions(+), 91 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_mlme.c b/drivers/staging/rtl8712/rtl871x_mlme.c
> index fccfa0915a02..d8af4f370060 100644
> --- a/drivers/staging/rtl8712/rtl871x_mlme.c
> +++ b/drivers/staging/rtl8712/rtl871x_mlme.c
> @@ -51,7 +51,7 @@ int r8712_init_mlme_priv(struct _adapter *padapter)
>  	set_scanned_network_val(pmlmepriv, 0);
>  	memset(&pmlmepriv->assoc_ssid, 0, sizeof(struct ndis_802_11_ssid));
>  	pbuf = kmalloc_array(MAX_BSS_CNT, sizeof(struct wlan_network),
> -			     GFP_ATOMIC);
> +				GFP_ATOMIC);

The original was correct and the new version is incorrect.  Checkpatch
will complain about the new version if you re-run checkpatch on the file
(not if you run it on the patch itself).

CHECK: Alignment should match open parenthesis
#54: FILE: drivers/staging/rtl8712/rtl871x_mlme.c:54:
+       pbuf = kmalloc_array(MAX_BSS_CNT, sizeof(struct wlan_network),
+                               GFP_ATOMIC);

regards,
dan carpenter

