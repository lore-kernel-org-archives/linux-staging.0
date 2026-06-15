Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C7B3F1AD5
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 12:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527985; cv=none; b=kq9W0c/cocit+d2PkpZmJa6T0omBdmkZ1o+244bTE9D7nWgUTjou0xN1q7QB+3ds8qmw5PKMo4rj+ElUo9xeibdzMJS3yzYp+SuOr76YYWqdXXj6VzlhtmwCQVkzMRfQYj1smDTtzah8F6fv2Nm5/asc6YChy7ZnBF83ri3agRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527985; c=relaxed/simple;
	bh=KjVjeBmrJVKuyjmRMYFWhqezrlsqJFk38c5b0afCLUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZg+THRdUr3NMtY3OYYlokIaVl06E0vtTJwD0kSrf0c4zsOeNJHrEarcI2CfESoVbjqaJhzET291+Rq1lcbwMd8Lu9CrVVb074S+U1wjSocJ44chXBOOYEsI4xqMX0M8VwVPjdsZ7sfU63XXLN6mG84h72JKH+ozjeotpuumxDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B133wXOl; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B133wXOl"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9158643e538so309188585a.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 05:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781527983; x=1782132783; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rp+3cLG/IkZra8uWUBB1v0uK+PmlhsRsCaz+zT6XZRw=;
        b=B133wXOlx+CU8rGAdMEYNkZRtvr9U1tBderPvRgy59OnhdBJiJXZlS1l0w3ME9izh7
         b4iI1N+5zMTO/EwXBEBDsKRpTBY71L8gmtQb4JFtmtYAmjKAFk0yJEG2H07MO0MMDSbP
         dh6Xwz19ufdbSzm1t+MdTiCpxI4FazfUOhJCYEyPJhibAll6vFq+PBIj0E0VBeQJyct4
         gr1zndEk0lZ+q43wFWlZuWNOXQWoZ6guV/A2mPBsORwwgl/eH6+vsyHNZPNAAIMxqfVT
         gm7/JbdBIEz04DGEvDg3U29FRdH7woT7TToipmDt638Gwva+OibGOTMP4F3GvNeO/+N5
         U1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527983; x=1782132783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rp+3cLG/IkZra8uWUBB1v0uK+PmlhsRsCaz+zT6XZRw=;
        b=SogUZ6ZPgXC2Ue35YCOjWGhz0LKxIdqcFtvMW0J2uNW2kbgSZKCKodMb6bLcjJ/koS
         iaIOM0nZzV6yQeoLvSdMsl9jOweOnBrHPGdxlHYgDgnpsO8tMipB09gHnTuITmKGRcij
         tMkgcl3f8PRL19U8euEnCEeXYsOv5tEY/T7hzZtWRPmdwZT/gYkhZ8kEnGdi5AqfxIKA
         53arKXW3OlWEGuqDx9AHy+PuqpG7LuqanfBKaSelc1SXfnAcFGl7KaZ9WcQKty8d/7yz
         pa/0qp4e+q5p/TJJruz4hL8zbb4tRypfdybnjZ3GyGBlHujT6hDXH+dZn38KHA3V9pPv
         yoeg==
X-Forwarded-Encrypted: i=1; AFNElJ/h0dMXuauQeTGdnXQRRvFuS6HqeoPrsqOLosFLCdZN5nJQS4VultydBtQGCjwYAnqahg+hwEbM2SLO9yo8@lists.linux.dev
X-Gm-Message-State: AOJu0YxSbG8+wGif2aELuhYu/2dlnvDX7BxVjKNkuDdCSyoDULTrPuyk
	+NV/WYsaKmQ0nSVY1A7Dm/GYOEDmtWGI86ZVo9Su1LpGuZ+6dJj5EpnL
X-Gm-Gg: Acq92OH2a0Y4ZcucQkByjsoOyLWRfmdWdNWF62A5toh3XPdXWYutui6LOZ+WmhATHy/
	/+sdgE5jC7cg0/ThmtZpOj6WFOLgXWeFz3CMIcEHQ1tqCT0juoS0NAUzmGvMwka9BWJ1/5A43i7
	qDq9hMOR4uRa1MDg/PavqiTNzhFpg8Mo0Z9e/GxYmn9+AGrVacupkEbCYHk8KHQgmHa5ROXq2s8
	XTG41cHrLFwz6HUULse+8xf331lBxuxkKk7mGatYP//68CdD4K0RE7OHjVGSEPqUJKKkgGupOHO
	IATkKhvAe8Y+5BqTMNXLVX2flbxrNqIZI00dk70pPnGDbIifQZC4DJsObu4M4P+2dKw0eN87BTu
	jKGFUIMY+2cx2x/k6aX0kFteOY6eEOiBFuNkdidIPWXZy0h2EBPTElWQk+QMthZ5mbJ2otLGBqe
	9ATnf2QkGc8WWpaMY8
X-Received: by 2002:a05:620a:448f:b0:915:e2a7:bea5 with SMTP id af79cd13be357-9161bf9f59bmr2020356785a.50.1781527982986;
        Mon, 15 Jun 2026 05:53:02 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619ed7862sm1104760885a.10.2026.06.15.05.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:53:02 -0700 (PDT)
Date: Mon, 15 Jun 2026 15:52:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Devansh Soni <devanshsoni874@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix line length checkpatch warning
Message-ID: <ai_1qCYJYVKO43Sy@stanley.mountain>
References: <20260615121838.30825-1-devanshsoni874@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615121838.30825-1-devanshsoni874@gmail.com>

On Mon, Jun 15, 2026 at 05:48:38PM +0530, Devansh Soni wrote:
> Wrap a long pointer arithmetic line to resolve a checkpatch.pl line length warning.
> 
> Signed-off-by: Devansh Soni <devanshsoni874@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index c1185c25e..d727a00f2 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -184,7 +184,8 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
>  		return -ENOMEM;
>  	}
>  
> -	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
> +	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 -
> +			    ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);

This code is ALIGN() the pointer to the 4 byte boundary.  We have a macro
for that.  But also I bet that the pointer is already aligned to start
with.  Also check that we allocated enough space to align it.  (I have
not looked at this code outside of what I can see in this email).

regards,
dan carpenter

