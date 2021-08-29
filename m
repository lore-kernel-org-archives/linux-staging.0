Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E41A72
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 17:13:55 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id s12so21669971ljg.0
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 10:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X3+Hge5VWCPxleA7QjQ9uJdJi5TXCLwleImqMNApEkI=;
        b=b9XXk5TcEVP5nklPH7fPEnLD9pWgNcZ5Yhx5UUR/PFUhm1m6N7k6QSm050VxqTFXLk
         je0jH7RFFDFKjdUCyaMUBI7pKf3v6VpE1Wn55cfI3WxiGveSr8tJSCNX77FmlOW1FlBf
         MVk1EFVvCVQVe6W4GnHsVMvJbun2843NRqMADbS9l0XplcFn2Rc4yeU4dW/xj75d9SWv
         W1t0Br8TUxliR1k+3JaEGARUPotYG2t0NdKbeMMnhY/dAM27T99nuILA4H1ylU8TJu8o
         bNSEMS2WycL8IjI4XwWDH27EA8XRYQ8d4WiO428jVXZolxdzvbuGbdPqzwV1iiDaPenG
         GsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X3+Hge5VWCPxleA7QjQ9uJdJi5TXCLwleImqMNApEkI=;
        b=nJzzj0VL0oUjtK5GlkC3w52cGeq9bUTI0Ia/t8xDKD5jyhWZ9x60HN4e4+3VbywDdN
         S+9ew0AMtueYzyQeYNXqbcwwcjVuVqptUYakro5Ss7kU9mXTj5i+vAnRAcFXKGRk4b1K
         keAeVLc1rB4M87J4hyb+R8uI5Pl1lUcA5qWn07eHk9VtZ1XffBHDTBYoWlinsCmMVW1z
         +PcIMpHJsQWhJ34YPHbo7aAqa75OoIQLYtCYhH4GzSbi5jsrU/5eC8J0EHxctL0xRLLk
         CTgumHLfe3dJGmuEYL5zjx4PJnu6TvjCyFCAl/i114NR7n3ooaSiEE/KnRyceKUTJHZ3
         btPQ==
X-Gm-Message-State: AOAM531jp/8lxx6BKtt3iUg1JfyTJh2l4PqbgcnGTCysEM1FqelhuBhT
	GRw19A/Wwr3UFmUapgFEaFA=
X-Google-Smtp-Source: ABdhPJy2H5bWSLCuOrDu2NMN5yvggl2SXiJ+2JQBVZb/zSks0gALPhVpqK3lolW8qs7MQ+BvRQgXIw==
X-Received: by 2002:a2e:90da:: with SMTP id o26mr16725947ljg.504.1630257233635;
        Sun, 29 Aug 2021 10:13:53 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id n15sm1131731lfq.270.2021.08.29.10.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 10:13:53 -0700 (PDT)
Date: Sun, 29 Aug 2021 20:13:51 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	straube.linux@gmail.com, ross.schm.dev@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	saurav.girepunje@hotmail.com
Subject: Re: [PATCH v4] staging: r8188eu: core: remove null check before vfree
Message-ID: <20210829171351.u63zoaqa3x5qfodt@kari-VirtualBox>
References: <YSu9GQa1A3s6FYQx@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSu9GQa1A3s6FYQx@user>

On Sun, Aug 29, 2021 at 10:30:09PM +0530, Saurav Girepunje wrote:
> Remove NULL check. NULL check before freeing function is not needed.
> Correct the indentation.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
> 
> ChangeLog V4:
> - Add Change log below --- line
> 
> ChangeLog V3:
> - Add change log.
> 
> ChangeLog V2:
> - Correct the indentation.

You need "---" here also. So everything what is between

---
here
---

will be ignored when you apply patch. This is good place to write
changelog, if you have tested this with real hardware, if you have any
guestions about your own implementation etc.

> 
>  drivers/staging/r8188eu/core/rtw_sta_mgt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_sta_mgt.c b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
> index f6dffed53a60..c3600cb1790a 100644
> --- a/drivers/staging/r8188eu/core/rtw_sta_mgt.c
> +++ b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
> @@ -155,9 +155,8 @@ u32	_rtw_free_sta_priv(struct	sta_priv *pstapriv)
>  		spin_unlock_bh(&pstapriv->sta_hash_lock);
>  		/*===============================*/
> 
> -		if (pstapriv->pallocated_stainfo_buf)
> -			vfree(pstapriv->pallocated_stainfo_buf);
> -		}
> +		vfree(pstapriv->pallocated_stainfo_buf);
> +	}
> 
>  	return _SUCCESS;
>  }
> --
> 2.32.0
> 
