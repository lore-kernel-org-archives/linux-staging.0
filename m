Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09BF25B683
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 08:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187208; cv=none; b=BmSel2Np3SQd5hsl708EqXJFnTg5j+6lAGabTB66ivZFs35aPLxITNoLOJFZwmCRYQQ7e6FjUhFOxVO4k2p4IBSlkkOkWChDuNCdo+WbQorCxeFKaQeIJTHXgXYEfKxURrvrPXXLzl3gLw3zTnXMPoG24V1G3CrILCSHbeR3+WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187208; c=relaxed/simple;
	bh=9mciwu4mtquGdEdTTCaWflAnOKZqghnNk3FnTpVRf1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ia98AyhYmx8AHKSqX70KztoEzNZtteMe3A4waCTxkCCxev49nlbKT6xBupNhI5xW7dTIZFuSNF8hrlKNeYl3PYAokpusca8a3jl5A2P4+jMPaW65vL0Ty2Lkqnb96QgvuCAfGkoG9JAKKy3PaYDkabJqFbQ7+6AxM1FNSbLP2Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pLsA48yP; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pLsA48yP"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f2f391864so3559844f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 01:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744187205; x=1744792005; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gxnhdbErfpSDUzVm/MJ1FKUcQwzNrE/EQxe6ade7B/M=;
        b=pLsA48yPpgKzDXUVyAIphLHrLTCPpU0XcsteLs+mvxUQDWoulY3Sue5Al+E0LKZmjp
         4zRAyX7C/cIePw6kA8PC3gvMbXrmUGGCetCa07vZFZeno3Rm1srndrLKM8WDeqlRc7p/
         oGaCXs2BBGdwcYHtlffLvllp+CHYaoczGZYC7dp8OvFjNym8B8gHNu5QHkK6igs+JVqS
         93JLSIvWBaJeHobNADUYjiB7ayD35ymfBpvY+5r59xAWrM1cGoVkLhPQQmbIHJCkPPAo
         SjBY1sO65y4rInl+CdBa/UxOzZHg8xjn2fs/nk//TZ3+VYSZ4EV747+BM4uzOIF1wEKK
         kpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187205; x=1744792005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxnhdbErfpSDUzVm/MJ1FKUcQwzNrE/EQxe6ade7B/M=;
        b=C6GwgyxNaGIYBnqf8wATOYKQqy8amkbz2eAuGP9fHXCzxhIRUmbJ8gzRosCheNxQs6
         zpg9xEL13US7JwkNb1ILVQxezvXUkhGCACGPeMpQQMRJUIT2o+K98p+ifbLJBK0GFKH/
         jVujHAUJmWSggIbGOYePdtcA7ItXv2FEF6npr0aj497RyrjMGLuY3n2Aem5AXeBNMBVb
         Gkvkk2XHenzjZ/oRBSvWzDnTJVZPw9uXJKNLSN56KantJIMDAaGomcsH/Qnc/1PTBjF8
         w53VUuheTwSnSjIFtTDCuAbxpAprzgFux72JZa9WojgjIFzTg2vwlf2rfb6oI6btgbbV
         oXKA==
X-Forwarded-Encrypted: i=1; AJvYcCVvfXd+PQpQc2ep5wbzFYLxTtnnsjglSm5k+3DidOfvt4g/SfLMFOJZszYVnmjr/ooHyLs3bKJuSM5TwV1q@lists.linux.dev
X-Gm-Message-State: AOJu0YxtNSAQ51GDD1fpjCzlbm1wF9ZUOAncJgZXQ/Dr4TnWLtvvihcU
	KcxPfvENwvTDkrgfnpvOZXZuL2Xj/8PaI3870YVjfKoWxqguV+kJewnadKNLXDM=
X-Gm-Gg: ASbGncuVj57ND5xfOhpc9sAy1Ns4ra7CMqdz4Izj5RXdFidt94bU4N0Moh9bsfcCTyc
	vWJoAMf2MSLnzGOlDgrouM/Ux9Fawui+4QkVjOPDVqM3crB2rIr1DqKHFhEgqc8sD2bakxMj469
	F3ubhLZ1kmrZXZkx9421dvBjh4bGcrxMqFDbqsOCURkMmyKdV24Aly6PSPO7rcvVKPizko6RKmN
	JO2jCwuXjyEhzYTq62RiysetT+TcFSHz/9FN3d8560BenfI8kWZuDS0CapEQPG7UpYEkMkm3SqG
	5qlE3ZbSSwnZviC1RQQzoqid2H8kkFoXI4tgHW0ixUAaFg==
X-Google-Smtp-Source: AGHT+IGFeSP7AaSQ03G7V1vbHKDCayG1EjsRKjk3tAbnZ4QszeoIUy29MFqZGhs6fu552vwU9PZ2+w==
X-Received: by 2002:a5d:6d86:0:b0:39c:310a:f87e with SMTP id ffacd0b85a97d-39d87aa837dmr1851776f8f.16.1744187204896;
        Wed, 09 Apr 2025 01:26:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f2075fca5sm12240525e9.32.2025.04.09.01.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:26:44 -0700 (PDT)
Date: Wed, 9 Apr 2025 11:26:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Rubin <matchstick@neverthere.org>
Cc: gregkh@linuxfoundation.org, dpenkler@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 01/18] staging: gpib: struct typing for gpib_interface
Message-ID: <804eaa0e-e1ce-4ee2-8ad4-f56bedd6d14f@stanley.mountain>
References: <20250408222504.186992-1-matchstick@neverthere.org>
 <20250408222504.186992-2-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408222504.186992-2-matchstick@neverthere.org>

On Tue, Apr 08, 2025 at 10:24:47PM +0000, Michael Rubin wrote:
> Using Linux code style for gpib_interface struct in .h to allow drivers to
> migrate.
> 
> Adhering to Linux code style.
> 
> In general, a pointer, or a struct that has elements that can reasonably be
> directly accessed should never be a typedef.
> 
> Reported by CheckPatch
> 
> WARNING: do not add new typedefs
> 

This commit message is quite long but it's totally unrelated to what the
patch does.

This commit message should just say "Having the word "_struct" in the
name of the struct doesn't add any information so rename struct
gpib_interface_struct to struct gpib_interface."

regards,
dan carpenter

> Signed-off-by: Michael Rubin <matchstick@neverthere.org>
> ---
>  drivers/staging/gpib/include/gpib_types.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
> index 2d9b9be683f8..10d8776ef425 100644
> --- a/drivers/staging/gpib/include/gpib_types.h
> +++ b/drivers/staging/gpib/include/gpib_types.h
> @@ -22,7 +22,7 @@
>  #include <linux/timer.h>
>  #include <linux/interrupt.h>
>  
> -typedef struct gpib_interface_struct gpib_interface_t;
> +typedef struct gpib_interface gpib_interface_t;
>  struct gpib_board;
>  
>  /* config parameters that are only used by driver attach functions */
> @@ -51,7 +51,7 @@ typedef struct {
>  	char *serial_number;
>  } gpib_board_config_t;
>  
> -struct gpib_interface_struct {
> +struct gpib_interface {
>  	/* name of board */
>  	char *name;
>  	/* attach() initializes board and allocates resources */
> -- 
> 2.43.0
> 
