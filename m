Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81EF18B11
	for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 10:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OMl1imqv"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-32dc9ff4a8fso860760f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 03:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697624531; x=1698229331; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+YPVxhrij/9yyiFDCmXjbqG79WA01Bk0XowWcY3BL1k=;
        b=OMl1imqvx0buMCWLsUOjcPIc+wFgoZI1UCq9v2GGSSNhwemcs7Wkd+mgHFiVJJ7PEC
         n6tF+0BkSsS2OpVd11WlICuSpOTL99rEnr2EbKagObLtSD7/BERuduYMF4D7rA1bee9k
         XowaHev77xIxg/Cwm3qG2svv62OMSMJuqSRJQjkJfy/f4vv7av2mJ+Hm3ElcEtx8h6yh
         sQNUUaMjwNR1UEh90zrZUQuRuu9qzgDV6ONZSg95bC0MuGxB7DifBiQGeiK1nJWnghaX
         oXyKLamei6RRTOmApbrbafVXwbxnkwO2PAIFbzNOthyt/JJVqBJwQglM7t1jhZzFQnxp
         0KMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697624531; x=1698229331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YPVxhrij/9yyiFDCmXjbqG79WA01Bk0XowWcY3BL1k=;
        b=askTTH/V/4Rv7sFEFnu2AVF+EdGGAMBJ/HUJTuRZg/9Kkplq8Hw5wfi4bxdm0+Zvxd
         2jcV/GEBHJGCYz95SvsJamR81nY6xd01FpCmgf4ohlaPKOJPNmtQGHIsu0JS3B83Kw/E
         tFVD+10OBjIRxLKrMNdLN3WK3ZCwKjSa7kdkgKqLJAJLprcnzswIMJm4PC2R0L1TaGkS
         jLnaFjfJGeP+m+i8laQYUVjD3MS94bjNaNmKAG/jNgY2mQSDGxDorrb8QG0bfwRTfO21
         Ajsz77qh7R68+YaTHJiIUOzPviR2KLwCJlW1793kdF/MIy1dC1BuzWC1lYLg4ASJJ03m
         4R9w==
X-Gm-Message-State: AOJu0YzKQ3xugQLcGd0PBZJD+uoH5+8ZUHvtaR1Q/WMFij+M62rDwif4
	AemUDHH6gITcrzUnuW4/aFxV1g==
X-Google-Smtp-Source: AGHT+IFblBhRhzmDzaS+pqwHqudeZroQ2KZlSAXVw5pwCj/0sJY/9y88i/ThbUt7ShHZ/AFjgg/51g==
X-Received: by 2002:a5d:4e90:0:b0:32d:a4c4:f700 with SMTP id e16-20020a5d4e90000000b0032da4c4f700mr3953978wru.38.1697624531035;
        Wed, 18 Oct 2023 03:22:11 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c5-20020adfef45000000b0032da4c98ab2sm1796413wrp.35.2023.10.18.03.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 03:22:10 -0700 (PDT)
Date: Wed, 18 Oct 2023 13:22:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: gustavo@embeddedor.com, outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH V2] staging: vme_user: replace strcpy with strscpy
Message-ID: <8a1d6d6f-b650-4aad-9b31-07a0a8acf45c@kadam.mountain>
References: <ZS+c7NtfEw5ne2Oj@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS+c7NtfEw5ne2Oj@lab-ubuntu>

On Wed, Oct 18, 2023 at 11:53:00AM +0300, Calvince Otieno wrote:
> Checkpatch suggests using strscpy() instead of strcpy().
> 
> The advantages of strscpy() are that it always adds a NUL terminator
> and prevents read overflows if the source string is not properly
> terminated.

strcpy() also always adds a NUL terminator.

With strcpy() both read overflows and write overflows are an issue but
write overflows are sooooooo much more serious that we don't worry about
read overflow.

> One potential disadvantage is that it doesn't zero pad the
> string like strcpy() does.

strcpy() does not zero pad anything.  You're resending patches too
quickly.  You should wait a day between resends.


> 
> In this specific context, both strscpy and strcpy performs the same
> operation without any functional difference.
> 
> The reason for this equivalence is that the driver_name string "vme_fake"
> is shorter than the size of the fake_bridge->name array which is defined
> as 16 characters (struct vme_bridge {char name[VMENAMSIZ];...}). Thus,
> there is no risk of buffer overflow in either case. VMENAMSIZ variable
> holds a constant value of 16 (#define VMENAMSIZ 16)

This paragraph is good and sufficient.

> 
> The null-terminated "vme_fake" string
> (static const char driver_name[] = "vme_fake";) can be safely copied into
> fake_bridge->name using either strscpy or strcpy.
> 
> While using strscpy() does not address any bugs, it is considered a better
> practice and aligns with checkpatch recommendations.
> 
> Signed-off-by: Calvince Otieno <calvncce@gmail.com>


Okay.  Good.  Re-write the commit message and resend it tomorrow.

regards,
dan carpenter


