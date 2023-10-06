Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C53523D
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 06:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I8QP0XWL"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-32320381a07so1751480f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Oct 2023 23:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696574957; x=1697179757; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aKyYQbXkv0DN4EBuZMI04wTrChTBXwJCOcKCksVCFqk=;
        b=I8QP0XWLKt3XWLlWran9jWx4JNFyYoXJUGNrBdG5j4Ruaco1T14CBfyQAj555WrOu5
         PNCvjqOFA7E7F+FiINlZXKp73JYKtzlS1HnJbjo9Z3XttRk/yo9ta281hungFNZ5i7GM
         E2wcX0QgX3EpEWVCRmn3o8/0WfLGiwihMsEol4rab97yX1gIPfSzz0CsJBZf3llJzpBI
         mN9N3xHckhapFWRG0YZX7eOAN8pcdE1GI7NqTJTag0jPlSpHjrKZ2BIs5qu03fBw7txY
         cJIr6wk26kHYMbeJAQwKQqvmMGMg5G7LT4Z1tXgubGqzxUZwDoBkeRE1SQzXEjKcvZwG
         mHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696574957; x=1697179757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKyYQbXkv0DN4EBuZMI04wTrChTBXwJCOcKCksVCFqk=;
        b=qgurueZs7DQYmtnSRTqEgEpauKc7tuHem2apjIovrnQgk1/j5enCxoRnf2is5jvKJJ
         x21h1ayrQiV2RwuE0RR1MWWW1mScdaGqHe8VU1UmXWglLrbx1Gh/g1x2D7kcK3pI3p86
         Vctug9u/tAIC41hGhbpOAFlHVIkeDCAqIwhgbhTX7bIwMQfTZeFUz0n//2Z2GPlXb0cd
         72rX8lNviR9/l++0qPOMWmYf3d7U1djTpfedkXhsSKzlw1Z2iViFfUo1l4jUzbiM/61P
         IJ0QyYwS9znesRI+byZJPxxQq78Gftqh90/DBWF3kOIqF1u48bLzecT174IoeCe9S51P
         k3eg==
X-Gm-Message-State: AOJu0YzbuBisLEJ0m4CXbDSIFnaxuCKTnWzjG8c1GyWlw9fiXYPWns+H
	Pjz4mp7cQgtPCc7EwDuOcx9GYA==
X-Google-Smtp-Source: AGHT+IF2+kDKPp/gG06BUTDJC2DNcBwdzig6GHZZVXuDvKfDdbwG8DLu26BMKaY1cWPMGKa08l4QMQ==
X-Received: by 2002:adf:fcc8:0:b0:31f:e19e:a2c with SMTP id f8-20020adffcc8000000b0031fe19e0a2cmr6558632wrs.32.1696574956859;
        Thu, 05 Oct 2023 23:49:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q8-20020adff508000000b003200c918c81sm886963wro.112.2023.10.05.23.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 23:49:16 -0700 (PDT)
Date: Fri, 6 Oct 2023 09:49:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Lopes <ricardoapl.dev@gmail.com>
Cc: manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com,
	gregkh@linuxfoundation.org, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: qlge: Replace strncpy with strscpy
Message-ID: <869f4059-1fce-49e3-9edf-8bfa42aba4a6@kadam.mountain>
References: <20231005191459.10698-1-ricardoapl.dev@gmail.com>
 <0b78b29f-2a84-487c-a43b-f8d3fa20d935@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b78b29f-2a84-487c-a43b-f8d3fa20d935@kadam.mountain>

On Fri, Oct 06, 2023 at 09:42:41AM +0300, Dan Carpenter wrote:
> On Thu, Oct 05, 2023 at 08:14:55PM +0100, Ricardo Lopes wrote:
> > Avoid read overflows and other misbehavior due to missing termination.
> > 
> 
> There aren't any read overflows in the current code.
> 

So when you're reviewing these to look for read overflows, a string
literal isn't going to overflow.  So that makes the last two obvious.
But for the first one you have to review the caller qlge_gen_reg_dump()
and the last parameter passed to qlge_build_coredump_seg_header() is
always a string literal so that's obvious too.

It's not really that much work to check for this.

regards,
dan carpenter

