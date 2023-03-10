Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE6E7B;
	Fri, 10 Mar 2023 04:07:52 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id l25so3859132wrb.3;
        Thu, 09 Mar 2023 20:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678421270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6qoxD73xYpg5xt33PC4c+C04eewyFCfIAb6qdXDdS5o=;
        b=Z3PBhObeqzKlcIdwD0Ep7KeEkGc2w5v4bvt+AxKBWb/ApLgQ7AphG1LukcJFaRAzJN
         arjynRyxq/97KDktL4N8jfbw948/eLx3pL0nNqQsOAkJMdRpcGjfaioX/NsyGbMEy7yg
         n7Cy77P/oJNgCAKchioq4ve1aczTOjhy4mUe27lAxrMyKMfgN04hon/hFNhTl8gj7PjX
         oh1YqqkbdMmsL20f9Q5GvbT8lPv1+PxEITBeXkw+P07vUxe6Bklcso4RhXO5tN38Xs9P
         lhB4UEC/286MyOffv7rjCUvE96BBL6EnFoO+v3Phnynu+iZs68nmU7rUai51pf6JB1XZ
         1vzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678421270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qoxD73xYpg5xt33PC4c+C04eewyFCfIAb6qdXDdS5o=;
        b=e5xp+Xs2Q6taUZCmW3oTRSHxXxPuue+QfRJVfbXiPVu4OUkTkHw3ESkc7+gEVhYU3s
         VaNrdXSv7q3/owUDp/KVHOcJd4m9pam2381bnuWQKff+2+qCHzT1dvXgRVMQ7nlf+6DE
         pQ0L+Zg2CapzgfPeQuBCQ7b2jlQywHB/rDIA2zbxkz2FagCpBPVWdeRN8PbRLp8+6f4B
         8Xbu8mvBVPM4zk1cJK4cb22zZLl2bqn2F2k19OMiSt7OGpApc1BB0iEJxHFt4q2h+wE7
         fnOMry8Qd6y54FiAUnmFG+6SbCAgHTZYirqmMAN9pmJ4RMS/FnjtZoDfpVOnaQxp9Upm
         32/g==
X-Gm-Message-State: AO0yUKUXVWvZrZfgiuB2WsLn+O2AdsL61bsnpfG08Qtj1B6p+GpxlBdI
	bfaLNOeM+J7/oU+ivlLDSCBsQGXqT38=
X-Google-Smtp-Source: AK7set9Cj4berzzp6cYQ3zlYMopGLoPWkkWQrMKdtIA2bykvF59yHvX5EmIDBVqCS3VS6+i2s2o2hA==
X-Received: by 2002:a05:6000:1043:b0:2bf:d937:3589 with SMTP id c3-20020a056000104300b002bfd9373589mr781767wrx.14.1678421270408;
        Thu, 09 Mar 2023 20:07:50 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q14-20020adff94e000000b002c559626a50sm955261wrr.13.2023.03.09.20.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 20:07:49 -0800 (PST)
Date: Fri, 10 Mar 2023 07:07:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kloudifold <cloudifold.3125@gmail.com>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fixes alignment should match open
 parenthesis
Message-ID: <e9022276-9dbc-497b-8803-7ec7bf87414f@kili.mountain>
References: <ZAqrkWn22Q1eXjCL@CloudiRingWorld>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAqrkWn22Q1eXjCL@CloudiRingWorld>

On Fri, Mar 10, 2023 at 12:01:21PM +0800, Kloudifold wrote:
> This patch fixes the checks reported by checkpatch.pl
> for alignment should match open parenthesis
> 
> Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>
> ---
>  drivers/staging/fbtft/fb_tinylcd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
> index 9469248f2..7d4741c47 100644
> --- a/drivers/staging/fbtft/fb_tinylcd.c
> +++ b/drivers/staging/fbtft/fb_tinylcd.c
> @@ -37,8 +37,8 @@ static int init_display(struct fbtft_par *par)
>  	write_reg(par, 0xB3, 0x00);
>  	write_reg(par, 0xE5, 0x00);
>  	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
> -	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
> -		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
> +	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00,
> +		  0x00, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
>  	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);

The original was obviously deliberate.  Just leave it as-is.  Checkpatch
is not the king of the world.

regards,
dan carpenter

