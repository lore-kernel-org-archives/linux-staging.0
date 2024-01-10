Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC7938DE8
	for <linux-staging@lists.linux.dev>; Wed, 10 Jan 2024 06:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BO9OMiNH"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2cd0f4f306fso44535721fa.0
        for <linux-staging@lists.linux.dev>; Tue, 09 Jan 2024 22:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704869637; x=1705474437; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cXgNlQp1ZIJ0/l4IwMaa4BquknnSQdylTP1plQb4Z60=;
        b=BO9OMiNHPLm2iuFoiaL+phN9ZLqLuMFA1/b/vCbc7xQntVFku/+i/VIDwLa+OzEY45
         vGJaBtwxOJyGWeM1itLII5RDCTCL54wTxdfWk0bgK2XzHDoDWipmcFpka0Rw2VuDbM1t
         g1j+pDG/xe6KNe8iWjlqRSsu5Mg05zCQ0ElQ4V5+8CT506NX56fZJh7KN3+3OgpIa8iF
         8njZS1fKFLqJ7AcW8ZJ0rDTwU1wxXvmdC3NM2jeCyEYCQovenI1XyVP0LTccxCC5EIpJ
         EDWCMM8nIsKhsUKlDWcXHGmjXektb2x0v38u0LxDPpz3/Tkt6jKxq6uzjgpq184xjklF
         o2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704869637; x=1705474437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXgNlQp1ZIJ0/l4IwMaa4BquknnSQdylTP1plQb4Z60=;
        b=Pi76SRYbqrxUrUtHts9sIv6RArH6Z0X6N8gJoYzAkmSX56zvRR58qZcTkE3zOjhk5G
         kB9zgOC2qUaGDPInKU8Vg8mR89VsUkuEmDQc5Ydk9Jk4lg/QBgjZ+6izuKeywq2nakpc
         T5Tki8avfTXjRBbNK8v2SiiNW4ibLMXYIp0x/Z+PXhZchdbljp2JYK2efCkm7fhhr30f
         mI7QbfHX9zPqZFgVwu0mcCjfGQwgKP5isE1e65r3+eVpNJs1h1PFQZ8qlstJ+NqxMOvm
         FnHFycNEa48CkxMCT5jdlDF/qZIXhoXvgwpV/IIxmvVUzoquUn6i0bXl0rmttENJzRgd
         KYWw==
X-Gm-Message-State: AOJu0YwQMfXTdwWDHYAEnXEeyVUKyFljMq+lSCFid2ofZEcjBSK5KZ/e
	JQFJUTyYY3cusx3HAotkpOOzlTpzyNQ88l6wLHnDE/XwSs0=
X-Google-Smtp-Source: AGHT+IF3j3cmVNgId6d1lExluxTZGmz8RXnmQQAxuo9PbY8mP3MWYu4i1ZwCwl4JIDJ5sjQl5lo/Bw==
X-Received: by 2002:a2e:a22c:0:b0:2cd:36ff:4d7e with SMTP id i12-20020a2ea22c000000b002cd36ff4d7emr231300ljm.21.1704869636986;
        Tue, 09 Jan 2024 22:53:56 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id s15-20020a5d424f000000b0033743c2d17dsm4093929wrr.28.2024.01.09.22.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 22:53:56 -0800 (PST)
Date: Wed, 10 Jan 2024 09:53:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthias Yee <mgyee9@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vt6655: fix open parentheses alignment
Message-ID: <0efd34ef-1543-448d-a690-64e156607441@moroto.mountain>
References: <20240109205933.3221-1-mgyee9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109205933.3221-1-mgyee9@gmail.com>

On Tue, Jan 09, 2024 at 12:59:34PM -0800, Matthias Yee wrote:
> Adjusted whitespace to fix checkpatch warning Alignment Should Match Open Parenthesis.
> 
> Signed-off-by: Matthias Yee <mgyee9@gmail.com>
> ---
> Changes in v2:
> - line wrapped commit message

Nope.  It's still 86 characters.

regards,
dan carpenter

