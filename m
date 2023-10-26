Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BC8E54E
	for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 07:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YTWB/6Ha"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40907b82ab9so9712695e9.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 00:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698304157; x=1698908957; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6BILS8KUyc8CYNIz97erkh2z34zcJnlmkNV4IJqyOsA=;
        b=YTWB/6Ha62c6cjXkSTztcGAKpcbW9VI+nVADaY/Sejhla+ATqsZl3EoiRk6HW1nNsk
         rjicvFTkVs36mz8rJ3jDx2YSYpiuoTxg2eZioI0Oa2mR3rD6sEWZXXb8ZLAwNqjslhVL
         jmoUuSRYEbVuFTtSPyTPE9YIr+72s+3jxLjbNpGo/4gei+eNB43+vrHTFAJurZexoSRk
         6jJa2T7dbr7gsKSbdR8fKlbPcF+E9hDJK3QTpQawBxUJgUeEBJYRd5BLD5OlaRzoxHyl
         ifCg2zVLFaCMtrJN+Qyjga24YK5oeuh4ZdLurAosHwLq8emr46EjQhEi4VgAGQAKcmci
         FTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698304157; x=1698908957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BILS8KUyc8CYNIz97erkh2z34zcJnlmkNV4IJqyOsA=;
        b=nziU7ZPwo+ZxC/xDSDSoPATnlHeG1xrzs64jMo9zeAxSQ7zQuL8IpIHMiGqYnv9Ufa
         zPaA7stFSXXs6LH9FGTIv3Tetfml26ji+qlWQg7PqheQDZMSzHvV5qO9FDfimtumQOLT
         jEzLESGtShCG3k3gYmDKudY5N5AhcjpRSXaC+NL3nGz4ZB5aMZnBy8TWwWi/0gm09fY8
         cDi7FruppyIbV2szhwHA5fIGCrLimh5cxuCm+mnnHwXFIUxkw6vMsPisGHpaI9QvJhCd
         CQZp3GQPhzy5QZS0c9hfkDaVMsDvm2Qh04uP1cJyqG22Dg5IPaxCYkXX3j1wqKuTLNcN
         3wLg==
X-Gm-Message-State: AOJu0Yy1UUS9Cs0jwp9nEyj1ywmIOkcVT6bOzR+yt4r92bdPSa8dI3SL
	9TPTUyIDZVAbw1rpU0wp2dZkgg==
X-Google-Smtp-Source: AGHT+IF7MbGTwUiJqzSxkrn8fd143j0rcKtNnGGuZdmy8GATP+kEKFS5l//fd1cA96eKTnbS85SP2w==
X-Received: by 2002:a05:600c:3b03:b0:3fe:d67d:5040 with SMTP id m3-20020a05600c3b0300b003fed67d5040mr1980143wms.5.1698304156614;
        Thu, 26 Oct 2023 00:09:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v3-20020a05600c428300b0040596352951sm1698897wmc.5.2023.10.26.00.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 00:09:16 -0700 (PDT)
Date: Thu, 26 Oct 2023 10:09:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/10] staging: rtl8192e: Convert array rx_idx[] to
 variable rx_idx
Message-ID: <008844f2-4cc6-46ee-be7c-50446ef11290@kadam.mountain>
References: <cover.1698295861.git.philipp.g.hortmann@gmail.com>
 <f9e3ee95cdc2de810687a9c71f1a9f8d8fdbeac1.1698295861.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9e3ee95cdc2de810687a9c71f1a9f8d8fdbeac1.1698295861.git.philipp.g.hortmann@gmail.com>

On Thu, Oct 26, 2023 at 07:44:24AM +0200, Philipp Hortmann wrote:
> @@ -1614,7 +1610,7 @@ static void _rtl92e_rx_normal(struct net_device *dev)
>  		skb = new_skb;
>  		skb->dev = dev;
>  
> -		priv->rx_buf[priv->rx_idx[rx_queue_idx]] =
> +		priv->rx_buf[priv->rx_idx] =
>  								 skb;

I really like how you split these patches up.  Like there was a bunch
of different ways to do that and you chose one which made it so easy to
review.  You made the right choice to avoid touching unrelated white
space issues.

But could you send a follow on patch to move this lonely skb back with
his friends?

regards,
dan carpenter

