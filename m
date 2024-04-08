Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6903E146595
	for <linux-staging@lists.linux.dev>; Mon,  8 Apr 2024 20:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712608109; cv=none; b=D5eYt+UFRJaYLumesUdZ/ZbXNwXMp1sB+rr0qABMVXGwRIUox7WeLU+0YtKl5wTK4h1aeG/LrSme60nI0IMVh3SCzinaU9sTVcX8Z25W3gA4+6X4tr4l74rX4Jh+guIyLXgXPZu0d4FLHcBzLLqonVD24lWnswerBTqwkWNxn7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712608109; c=relaxed/simple;
	bh=pGwspNNQBRAnBw9TeuWds6iJ0wMzGbfaAQXYhsJEudo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l02ZYWoabsH/vQZlmFmIdqyXf8a5HB4wQjoZ0kr2bx6JhHRft+qd1cPwT1peJO7jB17pm0OnUIGc3BS/EzdHCNSW1LnI7Vg7zf3VeI9q8LMznKcQcbhrrpTHQ0QoSkpKkECsRoqj1HAsT0ra1Q1EaqKyVjHNBR2Y8cvZjmn4y4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gIPhvGDQ; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gIPhvGDQ"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7d5f90dfdaaso37692239f.0
        for <linux-staging@lists.linux.dev>; Mon, 08 Apr 2024 13:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712608106; x=1713212906; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=moQrw458UIrB0C/FS7KDVMJwIciBd7TguCfGXuFSIMQ=;
        b=gIPhvGDQwpL2/5eff85hhnao4HhKS7CkpEgfNigcL1kTzVjA8ozI/+freNG6cchiyp
         BgduChYd+6H6ygZTZPdU4IVWsK3ivAEejXLx5j4tR6sR5igOrvkJfw6Zdz238r1zy2zp
         khaTjv+rB/JjxsR3i0jehD6KHhE5f6GtFDMkf6gM859SN8YIGMmVVemA04bdX8vkMvXm
         RpKHd5uWwP/+rbGmZzP5ZFcN8zCviIPuSjlYy5ZthyTo2RJmsPypbMnG8kWc1n6C+jgi
         IiU6NBW3H7iGcME05+yUzphMy124g+9bVreQnsPpplxC94ygNTrzHODfyt5smjh7lhZf
         JWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712608106; x=1713212906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moQrw458UIrB0C/FS7KDVMJwIciBd7TguCfGXuFSIMQ=;
        b=K/R2uMjyfi96r8Glr35Hb+jcXv7T6D3ukodVIjfas/LEXVUWheENlPY1+uq7U3UVzu
         WxUW2CBA5LsYC+LsOAK9QETRz/CJaoFJl9oiRDMPsJXGgHE1N2OTyK94QmOXFQkh+aEm
         OC13QspoFPwsArTXlsXlCuDS+HNAMl4nIVmw6KSYwZ0u8xXP23X9j35fobVm2beC+5mu
         M75iJhFV1zgQt+xhRjJFwoOXoB2zROJl9B3+Tong3h1YoYIIhYZDp1VNwm5uaNcwhggf
         aSoSGqc0mfLr2M15kaPjre+HY4kK4eZtDAbZihFGUsX6dS8n0C0lqR4vc+4UvR34JpLL
         66FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV5I1ZLIfHZllmklyO59TXfUDLfy5uUXkEQIGNMuHmF/WQ8vMGvPA+erJqCYcKfjv8tEkLu8P5TwfBcxdIXyZpgVf26aWOgSC0r2fsUQ==
X-Gm-Message-State: AOJu0YyN2NQM/kEpzpZ69Yk5Ioo7fMA9xKRZpgR2qUWOkSYRLvTYDS7/
	Zl8ONunj2aiKJ+BI+0eI+pO3DP47zSyuybKESDp0sFeu49/yu2C8Alm3kxTEzA==
X-Google-Smtp-Source: AGHT+IEi+zQk9NHUGC5d8RML8yoINv3x6x1TBoWUm8X+CGwzfnVnH1lv+x3XDo71lciSEBs5bqtDKQ==
X-Received: by 2002:a05:6602:488d:b0:7d6:aa:8a64 with SMTP id ee13-20020a056602488d00b007d600aa8a64mr2450544iob.18.1712608106586;
        Mon, 08 Apr 2024 13:28:26 -0700 (PDT)
Received: from google.com (30.64.135.34.bc.googleusercontent.com. [34.135.64.30])
        by smtp.gmail.com with ESMTPSA id kz9-20020a056638948900b004828b1e39absm1344628jab.89.2024.04.08.13.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 13:28:25 -0700 (PDT)
Date: Mon, 8 Apr 2024 20:28:19 +0000
From: Justin Stitt <justinstitt@google.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] [v2] staging: rts5208: replace weird strncpy() with
 memcpy()
Message-ID: <wb5h2syqmxpoxmajwiiyqvlkyojjsjql5xpfmris6djegtqzya@6xfio4dmqjdp>
References: <20240408194821.3183462-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240408194821.3183462-1-arnd@kernel.org>

Hi,

On Mon, Apr 08, 2024 at 09:48:09PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When -Wstringop-truncation is enabled, gcc finds a function that
> always does a short copy:
> 
> In function 'inquiry',
>     inlined from 'rtsx_scsi_handler' at drivers/staging/rts5208/rtsx_scsi.c:3210:12:
> drivers/staging/rts5208/rtsx_scsi.c:526:17: error: 'strncpy' output truncated copying between 1 and 28 bytes from a string of length 28 [-Werror=stringop-truncation]
>   526 |                 strncpy(buf + 8, inquiry_string, sendbytes - 8);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The code originally had a memcpy() that would overread the source string,
> and commit 88a5b39b69ab ("staging/rts5208: Fix read overflow in memcpy")
> fixed this but introduced the warning about truncation in the process.
> 
> As Dan points out, the final space in the inquiry_string always gets
> cut off, so remove it here for clarity, leaving exactly the 28 non-NUL
> characters that can get copied into the output. In the 'pro_formatter_flag'
> this is followed by another 20 bytes from the 'formatter_inquiry_str'
> array, but there the output never contains a NUL-termination, and the
> length is known, so memcpy() is the more logical choice.
> 
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> Link: https://lore.kernel.org/lkml/695be581-548f-4e5e-a211-5f3b95568e77@moroto.mountain/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: remove unneeded space byte from input string for clarity,
>     rework changelog text
> ---
>  drivers/staging/rts5208/rtsx_scsi.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rts5208/rtsx_scsi.c b/drivers/staging/rts5208/rtsx_scsi.c
> index 08bd768ad34d..c27cffb9ad8f 100644
> --- a/drivers/staging/rts5208/rtsx_scsi.c
> +++ b/drivers/staging/rts5208/rtsx_scsi.c
> @@ -463,10 +463,10 @@ static unsigned char formatter_inquiry_str[20] = {
>  static int inquiry(struct scsi_cmnd *srb, struct rtsx_chip *chip)
>  {
>  	unsigned int lun = SCSI_LUN(srb);
> -	char *inquiry_default = (char *)"Generic-xD/SD/M.S.      1.00 ";
> -	char *inquiry_sdms =    (char *)"Generic-SD/MemoryStick  1.00 ";
> -	char *inquiry_sd =      (char *)"Generic-SD/MMC          1.00 ";
> -	char *inquiry_ms =      (char *)"Generic-MemoryStick     1.00 ";
> +	char *inquiry_default = (char *)"Generic-xD/SD/M.S.      1.00";
> +	char *inquiry_sdms =    (char *)"Generic-SD/MemoryStick  1.00";
> +	char *inquiry_sd =      (char *)"Generic-SD/MMC          1.00";
> +	char *inquiry_ms =      (char *)"Generic-MemoryStick     1.00";
>  	char *inquiry_string;
>  	unsigned char sendbytes;
>  	unsigned char *buf;
> @@ -523,7 +523,7 @@ static int inquiry(struct scsi_cmnd *srb, struct rtsx_chip *chip)
>  
>  	if (sendbytes > 8) {
>  		memcpy(buf, inquiry_buf, 8);
> -		strncpy(buf + 8, inquiry_string, sendbytes - 8);
> +		memcpy(buf + 8, inquiry_string, min(sendbytes, 36) - 8);

I must say I am not the biggest fan of manual string management with raw
pointer offsets. I wonder if scnprintf() could achieve your goal here of
combining inquiry_buf with inquiry_string into buf (perhaps utilizing
%.*s format specifier).

With that being said, I am just a casual reader of this code and I
really don't know much about the expected behavior of `buf`
(NUL-terminated, NUL-padded, etc) or even what the next line buf[4]=0x33
does.

Your patch looks good and removes an instance of strncpy which helps
towards [1].

Reviewed-by: Justin Stitt <justinstitt@google.com>

>  		if (pro_formatter_flag) {
>  			/* Additional Length */
>  			buf[4] = 0x33;
> -- 
> 2.39.2
> 
>

[1]: https://github.com/KSPP/linux/issues/90

Thanks
Justin
