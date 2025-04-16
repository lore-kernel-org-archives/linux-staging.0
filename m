Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD7F1A9B53;
	Wed, 16 Apr 2025 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812755; cv=none; b=i+gB2Jl4G+owvv9PYzVKBbxDX1a7bhen544/v1dW5XRwJxNLqdYw+ygdFkEgW3IZzNMp/wfx+dMn0rF7eltB6K07o0K18Vm2qe/ofLehUGE94mO8BhRa3FFlRavz1Ti4klwGD5zrkg/h5m3TmyEwR/GcpONcQ/tiNPxPm4FuH4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812755; c=relaxed/simple;
	bh=O6zyxYqY9ABY4J5KB2RPicAWgwov0p+XC5dH4lJh6s8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OUSAy+WHV5lRVrsNXQiPZ9w3+nNrWTUCOoCQ/ADXRmb0fMge1Am6Sav0vDWSaS92YGt0VMvUXSPAqutaL9on2v4yOBzfjZbMp30XVYYAupCPDCUW1D122E/noAEgIkgXz4KA6IjT/1BNaW4yC+1jYfSAeECsdL8tfEnoFZyZepk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVZpY/qa; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVZpY/qa"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso12630226a12.3;
        Wed, 16 Apr 2025 07:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744812752; x=1745417552; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DDvCm+Mlaej8nwLZ4oHulSSCMq/G+lv697dlOtDNcnE=;
        b=cVZpY/qamzNIl2aFJiOZnUC2eSYmUcjnX0tynQsTVUYbyUL9thllchHZCub73x6Jlu
         V9arb9tdsMIMvic6YiqEbk5ZaLSgZLziR5FBLRooqDlmhYxj8Nq+YpXuY6lbsuOddy5L
         0F0OyVpnZnGsy4vWBZZ9gYPj1ASkauFoa6R19Ghs/YJW35dwKevQen6k7A0rtliV07X7
         r0I1zwaCbVC5k8G/EYcoJl4ZXVGjpr5Ehg4ujac4Hru6ZHvArAqkzq7evp+JnWFrEl14
         4HMU1d9vUEMLZ83p42xWUsNZYf6D6lErb0h+Pc4IcsdlwjPoti7NG/q9sWHgCdUAHTwS
         ORFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744812752; x=1745417552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDvCm+Mlaej8nwLZ4oHulSSCMq/G+lv697dlOtDNcnE=;
        b=QQLP323l+GzpesDtX4IkPofXNPE6ob7AmgZOD6RM8TwNuM/Y/+7wISc0NwkDbH8xnx
         ehBC+V2Txzg7hG6BGUqs+FAeh8PF9y4HdUpcRQSlIxN+8Xe+5H4tlJsBJNO3dqRJo9bb
         ls7+rwSkQPfAP4ah+zY5OG+lUN565loMxdHEALUizR128xjqJcTFH/HlUI05v5t6f0Z2
         PlDgOFWbQ1iaZNWBeWzTRfOo5kX9jqvAQ7a0lCAPlix6250u3r/wMaCxJINfjTX6Dme4
         c44kfj03P6YGn/W7kdc3XSapWdLe9lqBAVPrLv2JGs1UzT+kHnCFjvLCpupaJtI9VixB
         XtKA==
X-Forwarded-Encrypted: i=1; AJvYcCWAfO075oAHOIFUuVuwN0mfN4MiM3mZKY5cHHuhY+ynH1beEk9jP5xdiXLzLEplzR+4IcShH3s8OOuU@lists.linux.dev, AJvYcCXU6hZxLUbM0litScyYpcR2uDUhxbD+ZKpWdDJOjLhCb5qAThQVswtuI0K/Z478fUuJhtlxZ0iJhMOR4e60@lists.linux.dev
X-Gm-Message-State: AOJu0YzOqa8zbK8/lNj/N6M6KWwPIobayrdCm9sHwuOoEHaXgiZBBs3k
	1L+T6ZvBGtcmjuPgAya8DuLyJ1qnfS4XKuEBC3aV+yQgh6a2paWF
X-Gm-Gg: ASbGncuo20gQxMJJDl6i5AEB6yGCR1OpyItC2KlO1kzhuJv5tXNiZgp4Cvrg/heTSEJ
	FaX83LBCVW9CrWCI8s7lt6EXNDmICISXVimu351UCGV77QIGlvgUL/V88u2YEeYshaFm4QvQkIb
	8goOJykO99TOMGmDQQeR8gxGdJNwg2WgNTSeUNaqmfywwYIA5ddqPjvOU7sREqHIIyLgx9TW+2Y
	Cp5A0gfXUt6dBjfNnTRXU9HqCY0AC4UpyZp3krVahkIJl7aQ57LaHUcwQRIU3BLVpjm03tsVrlY
	ajNrCNsq4dCsdkoU1C6fR5Dsy/r+vshliiGK7devaCSmKTlw9CUQkrdh
X-Google-Smtp-Source: AGHT+IGTlbsUDIxwR3FnJN+VHJxH2XZ8CyxkRGIafIbQ02s4NvSPzpXYWAuDYU8kMQVWM4cAPTU45g==
X-Received: by 2002:a05:6402:4602:20b0:5f4:c5bd:90d7 with SMTP id 4fb4d7f45d1cf-5f4c5bd9599mr705364a12.27.1744812751738;
        Wed, 16 Apr 2025 07:12:31 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f52a4aasm8639580a12.78.2025.04.16.07.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 07:12:31 -0700 (PDT)
Date: Wed, 16 Apr 2025 16:12:12 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Rujra Bhatt <braker.noob.kernel@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [FIRST-PATCH] staging : gpib : agilent_82350b : agilent_82350b.c
 : fixes checks on the file
Message-ID: <Z_-6vAXbsveDqzKK@egonzo>
References: <Z_-nR5Vt2A5kvbro@brak3rDesk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_-nR5Vt2A5kvbro@brak3rDesk>

On Wed, Apr 16, 2025 at 06:19:11PM +0530, Rujra Bhatt wrote:
> It has recommended to
> Prefer kzalloc(sizeof(*board->private_data)...)
> over kzalloc(sizeof(struct agilent_82350b_priv)...)
> 
> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
> ---
>  drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> index 445b9380ff98..956e21886eb6 100644
> --- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> +++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> @@ -479,7 +479,7 @@ static void agilent_82350b_return_to_local(struct gpib_board *board)
>  
>  static int agilent_82350b_allocate_private(struct gpib_board *board)
>  {
> -	board->private_data = kzalloc(sizeof(struct agilent_82350b_priv), GFP_KERNEL);
> +	board->private_data = kzalloc(sizeof(struct * board->private_data), GFP_KERNEL);
>  	if (!board->private_data)
>  		return -ENOMEM;
>  	return 0;
> -- 
> 2.43.0
> 
This will not work and the recommendation in this case is also wrong:
kzalloc(sizeof(*board->private_data)...) only allocates space
for a void *, not enough to hold the agilent_82350b_priv struct.
cheers,
-dave
