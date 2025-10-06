Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE92F510
	for <linux-staging@lists.linux.dev>; Mon,  6 Oct 2025 07:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759735847; cv=none; b=hnDHfS7HxLtxgWexTOXH7wwHACQV3KXz/gq1o+rCSxAPEcN8lEppkKbiYR01i8dpnnznoTbcVNCuf5+HsbCdGQVwMH4zeM/5yMWUS4Gld0EXFQOyr6EqZ+d8U0JvMAhZG3e7Eu+o35Vs16IUqz7nfmBqVMc+QBHacHx9sMQCM2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759735847; c=relaxed/simple;
	bh=TBDr1JkUT7j9KA90UWXW3NvfyrgaBEzv+GFyFGVZBkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEoOJPQwSZgucf6HPh+N++LMg7B/0zlFW/LBg7sbA1Yr5khrUFoBt0ZPI1mp4GO9GRp/Z2pQ6+lGnbJ8MoS1HXs14qvr9zNCQXtyUAW2MuUrFTsIe2K6Mkso9Y/K9xCeam5nnbPwNIJhjYLrIPfsde9qY0SMGtkENrnWKBFwmiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qv0nccmW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qv0nccmW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46b303f7469so28372055e9.1
        for <linux-staging@lists.linux.dev>; Mon, 06 Oct 2025 00:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759735844; x=1760340644; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W8kZL0MExGW8cJG6gQr/1Hyxz1bR5ca3a5nlWTrYorQ=;
        b=Qv0nccmWrYjvMKB+NNqOADeXuBaAk2RZPyvIONp3QL130bQBMLyFG1JXLrOV0UGehz
         eGpcRz/UpYaC51MnUsIXA4xKn4g0wSmrUlEXsK0WLBtMRcMgrKW4GCoK96LmYcwn75ov
         1BUPEO4PhOnC5CVSsZqE9lnNpgV4jc2rgBuKnlHO4mSVpivAYMEj8IMYW/XRU/ipegRl
         U1glNn6AyFCscHvL6/lcwD+EfRVM/CaVe2MSaVeib4VC6rkOjHYppIHz8VUG7GzsxpDq
         UZ/u56gkphW9l2rlVTKBoWA6qajLs1iKWChPy56TR4Le8T9Kc7UrORc8JjD6SPwPfdLZ
         ohxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759735844; x=1760340644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8kZL0MExGW8cJG6gQr/1Hyxz1bR5ca3a5nlWTrYorQ=;
        b=bir1s3eaKnG0A7YdW9HrJ5XIjl9p1QmP2uzttJgTqOgkIGU3vsRWRe1zUowsOHZ/tn
         bH9a9HFDnUuoChmSP0gtOG4/9b2LN9oGFPelHHQ6UI0Uzke7mhop7mmELAs4VXi/0PfZ
         yWKZAuDMfzpslWcUFQ1pi0Ei3abFbtYYFJpM2IHLlOk4GPU2Vd5je7+bqy9QWWIYIjKN
         1HnArfvzyCJBA4oNfQ/Dohr9QTSyoFEk1XG4gzNNyXJ7Tmu4mw6k+tt758xy1brCIkLT
         W3U+mkaHW92odrSjhunJ/LOzuHDX2ZrA1ZCc6UnHwL7suGJAmJWA1BJ3x06IWLl1RRyL
         ArfA==
X-Forwarded-Encrypted: i=1; AJvYcCV6tJ3AmFieZh1yuPinSv7qhM2EztcnbFNWJXx6Ihn1WJeHvGkqzovFeQHo9b3kITkrg0mhgJFN/1rZ4tim@lists.linux.dev
X-Gm-Message-State: AOJu0YyWsi8D9amVIPnVwK9bbgZZZC6G/mDWlf77Eil4/9ByqgmgILXv
	QEBinHOPp4fWlp3iNQqWTSxVHx1MRRtfX9sXojEqvGl8IUFbwbWf1l2MYAu27+fk92w=
X-Gm-Gg: ASbGncss09sFRlvDUfMNWxTaNxOdE7zCbYL+J5S6PKQNKHRXm3I/9Vr38ethFxObl3k
	mIVFy63ulu6Ift8f0GLM6yjbvpBbomGZZnriQeoAGcQmat1J5ELLgnAf0SlGf1JvZLK9LxQrsNp
	sl2BFPYkmw9ZF70dskuP3373EL0K/WRNQI3gJ8eCiE1b8aNkqn/70cv0nxtWEvxe6LKNfOaVay2
	gzPL/54oLz/A7CPkP1dSTvA+9/7+8fkRBIxBqUEicB2QJ0U0YFt2ZKEUzQUXhzHrJe+zvsNSneF
	Co8ZLq6BCqbMa87Ew3ULtfCdTEhx3vASwYuQEzRhMSmRS+AWQPNyynsuL+0qi125vavz9pnEiZ2
	nGl7Pd6URT3/iLMgR8zKuEXz0yN60HZjBbWXn0jbUB4aSpbWgfg2Y9GTy
X-Google-Smtp-Source: AGHT+IHlOl2o7J8oMg7owJ/UrBP+e3/x+xwXFkznLTXKMFB0/ZI65WuJDoEuRKi+Em58b6h4EIYQ3g==
X-Received: by 2002:a05:600c:8b42:b0:46d:3a07:73cd with SMTP id 5b1f17b1804b1-46e7113f6f4mr71678405e9.23.1759735843524;
        Mon, 06 Oct 2025 00:30:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e72374ac5sm161158365e9.18.2025.10.06.00.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 00:30:42 -0700 (PDT)
Date: Mon, 6 Oct 2025 10:30:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rohan Tripathi <trohan2000@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] staging: rtl8723bs: remove unnecessary blank lines
 in rtw_ap.c
Message-ID: <aONwHi09P9VDTd3G@stanley.mountain>
References: <20251005155920.381334-1-trohan2000@gmail.com>
 <20251005155920.381334-4-trohan2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005155920.381334-4-trohan2000@gmail.com>

On Sun, Oct 05, 2025 at 11:59:19AM -0400, Rohan Tripathi wrote:
> This patch removes superfluous blank lines and adds missing ones where
> appropriate to improve readability and match kernel coding style.
> 
> This is a coding style cleanup only. No functional changes.
> 
> Signed-off-by: Rohan Tripathi <trohan2000@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 2c906c1137bf..dddb02c0f683 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -438,7 +438,6 @@ void update_bmc_sta(struct adapter *padapter)
>  		spin_lock_bh(&psta->lock);
>  		psta->state = _FW_LINKED;
>  		spin_unlock_bh(&psta->lock);
> -
>  	}
>  }
>  
> @@ -1240,7 +1239,6 @@ void rtw_acl_remove_sta(struct adapter *padapter, u8 *addr)
>  	}
>  
>  	spin_unlock_bh(&pacl_node_q->lock);
> -
>  }
>  
>  u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
> @@ -1974,6 +1972,7 @@ void ap_sta_info_defer_update(struct adapter *padapter, struct sta_info *psta)
>  		add_RATid(padapter, psta, 0);/* DM_RATR_STA_INIT */
>  	}
>  }
> +

This is adding a blank line, not removing.

regards,
dan carpenter

>  /* restore hw setting from sw data structures */
>  void rtw_ap_restore_network(struct adapter *padapter)
>  {
> -- 
> 2.50.1
> 
