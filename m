Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05EC44C97
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 09:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729158294; cv=none; b=LkBFODcDz/Lo56FlpW2WoKO1ClpZqtIUatrAQbj4EZdEG0gkRmL7+voRXka/3DcUnXSQimwST2cck6Gc7mM6Ndec7+m/E8q99m4f1uIGv7Wrp6PaIVNcx1d0c2Jnkns30TQB8Zc4f7W6uNOTMeYBMon9NjTjR4wwUZR5GitmOhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729158294; c=relaxed/simple;
	bh=JC1Zanmrvs8NQAJ+FsUwNyvBCroCRyGZRG7n4pSQX/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VyYEH30Djc7vFIJe1yUW7FDTOJmOp8IoxFIDyaBAf9G7tF8OPTn7pn8y8nGyFkm0HzCHErtDejh+NwLnzRv6AW1Uc9xYerYDTEnQg3HdSrZUmelzum9TE7Ob8eoD1UsjiMobnAuIDWW57jnMaPPLuhCSu0CXtFAIPyf7btFB+ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bvn2u9V+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bvn2u9V+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so7407025e9.1
        for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729158289; x=1729763089; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o+HE8p18F4JnOQRy+SOktGO0GlPEF2AUk2XJf7kCsIQ=;
        b=Bvn2u9V+WzaegmdQTRMxEMKfDAbS2x4RTXBNqcNRgHdguGFTPvnYaXOpkW8NqK/8Gh
         PO5UFGgcUGyfx967QtBllrKGEerbqeT6jQCr328ZsE5i+oPL63jWXXc6Ui8PAET0ngvr
         c1ckg4Q+qFP0Y6CQuQGLnYgn1QMt4+cBB6MjYTqMS1AF9dd8Vy83BiMfwFPY46pHYXSw
         2OG9n4ALyb9q+ypFHzTapTA7rbO/5xUCbsoPh9FHgwdha6WnRISIpxiYCnSXc9XzjAzB
         O98U5WNSjsWmEJqjGChoVPW8zzHJc9p9iYW37wUO0SQiMu+4WZ7O52cDLK1BmJvLdLis
         AH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729158289; x=1729763089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+HE8p18F4JnOQRy+SOktGO0GlPEF2AUk2XJf7kCsIQ=;
        b=a2BFGWwJNE0kpAMny6xYhm0ZRu7vctE5fIGltR9BxEMU60CyBGh++MVK4pwpT7i//o
         mHXcjN0Aa7xb2jmhTgLi+YhzwTaPIAkcxII/vaa+ugaOB62gSTC9m7z9QRmUdhvUROfg
         mOemevQuvFDjoidlHVY0vumvOyuWdQjOh8kGhNBjoFsCqVaqXDKvZEGfER/oi4WQNFON
         EiWjs/pon3IPZy1M+Sjs+UL3IV9HPvc0jZt6iwL+N61i6DIsC5ZOYP3HYvj2A3Lj1WYh
         iDOYu6+JzuQE7LYWcwVoH7uPwDUukUq8M2xSEgKOMJJEQE5xUBb1yK3zlu98k3X9bfQk
         xj4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9m4Ou1J+EUshC9CuDqN59iczVPXenig1df23Efvf/PeYTYgH5FZw5Rgt8lc+COctQiFuwyO/GFym8X8ne@lists.linux.dev
X-Gm-Message-State: AOJu0YyBcyJ86NNRKxVZp5A67MzaMPGIleAPR50IhDU531o8fHBvD/5r
	IvkYUt4UoIV7zMUqS2r7T1jHV7GVv/gYcpuJdh1Ehikb4csk2bLUZlYSXhxs
X-Google-Smtp-Source: AGHT+IFtymMP2250BiaxUsDc2zMRZXBhJnKsIf+qEALgKlNQZGuadqD7nKmaLUB4TD2bxJqsWNjveg==
X-Received: by 2002:a05:600c:1d82:b0:431:5e53:2dc4 with SMTP id 5b1f17b1804b1-4315e532f84mr3935095e9.6.1729158288708;
        Thu, 17 Oct 2024 02:44:48 -0700 (PDT)
Received: from egonzo ([82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c61e82sm20444215e9.45.2024.10.17.02.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:44:47 -0700 (PDT)
Date: Thu, 17 Oct 2024 11:44:44 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: gpib: avoid buffer overflow
Message-ID: <ZxDcjDjJr_MTYTFV@egonzo>
References: <20241015201629.4B97918DA87@bout3.ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015201629.4B97918DA87@bout3.ijzerbout.nl>

Hi Kees,
On Tue, Oct 15, 2024 at 08:38:13PM +0200, Kees Bakker wrote:
> The remaining buffer size for snprintf also depends on `pos`.
> 
> Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
> ---
>  drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> index 1da263676f2a..4df1ceaa138f 100644
> --- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> +++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> @@ -364,7 +364,7 @@ static void ni_usb_dump_raw_block(const u8 *raw_data, int length)
>  			pr_info("%s\n", print_buf);
>  			pos = 0;
>  		}
> -		pos += snprintf(&print_buf[pos], RAW_BUF_SIZE, " %02x", raw_data[i]);
> +		pos += snprintf(&print_buf[pos], RAW_BUF_SIZE - pos, " %02x", raw_data[i]);
>  	}
>  	if (pos)
>  		pr_info("%s\n", print_buf);
> -- 
> 2.47.0
> 
Thanks. 
Please copy the <linux-staging@lists.linux.dev> mailing list.
Can you do this also for agilent_82357a.c 
-Dave
