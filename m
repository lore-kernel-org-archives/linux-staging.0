Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD6B14A4DC
	for <linux-staging@lists.linux.dev>; Thu, 23 May 2024 14:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716475461; cv=none; b=J+beI0yDvFbWd76FdJd6AlyuQZZrFPnDXeIIcKLTxcTZpB3l1XFTlwEYZvZ6YYPE9sArlen5C3m0E2tBkBqJ4iYGphQJpk50siKu6UJ03qaeb36LBvIUe0xDi54nej/yEpi4GVdEKGPwCPWmcX9PR4Em+vfADTQIIanTEfGIscs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716475461; c=relaxed/simple;
	bh=CTkFcBEe+lA0saa+37DFgtuerxcdKMPPNDW5UJ0eiSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+Kt2dW0s1O3Wa3BsKRUVpHGYqhjNhMyeu9PPcY1M7LLGCryd/5dUTq0yyeLsdl7oiJx6TgiAsKmppO7Bz9rL1yl4Tkj7wIAjpDcupV/gsvwlCHkiAnWccwEU3UQctgD5OHQGDIfjmShxPsz54MQi3daXG/97odx2HKfEMmcRNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DOyRfNY6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DOyRfNY6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-420180b5897so19686205e9.3
        for <linux-staging@lists.linux.dev>; Thu, 23 May 2024 07:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716475458; x=1717080258; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EflueoXTaQwLTE/im9nkFXYa8es8iL3v6VZsuAhHrIY=;
        b=DOyRfNY6UQm3UGLs5LGhxvcpTFaI3jhp66RVu8enoJJ08yeGX2yfE14niHjXnp4/Pr
         JK0BKvMvvlUtdNa318p62GwT1uRWOK5tJ0jnSVKTgjRfADu9ONtCO7kJd9FSzifkuWbm
         IdzXYpIJK3oRZt/TXQXCC8IS6xI0B8jZAx1Xrrn6cCVnWIFhT9V05JhjhcGNoB0tojGO
         ohTub8XgFoKkiAeikxDKv1GQo4jSBxBDUQlWnu8KUPVWg3dffHefxS2OhS9XTZqHfBli
         eqGxonWfDWUoidkgOXVUkJYIfHKow0e8FVaRFyczy+A1A4gFtIqjG05QhHlLBVTdnXds
         aMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716475458; x=1717080258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EflueoXTaQwLTE/im9nkFXYa8es8iL3v6VZsuAhHrIY=;
        b=TmX5ukXXHVo515QNoOk+clCQMvYsw5KjjvTahaEj7hFuOqPEKzF7OXmB0e/s2FR3UE
         JpjGRz5N7FqT9NIjw1aeOg+Rjq7X7AefVSkr8pXdWLd3dNxxVX5ep2Cy5Isl73tuN46k
         CAjTbE1MVcDKp4pEXMNLZYwAbi87J//JS7ll+D8t9CWVzepNCZ8fjSHEaYbkBhq2nkF/
         HTdkfVU4z5FED8iPLXzf5bjIRqLI1aydQcnvV0y6dy1CuNrOmgN6X8K7vZYgtNXNRPAv
         beP0/YtUywAV+JVaCPVhZib7LkyPRfdmRmuQwn/N0y+oPayTe6Mb1RGy1l1OWVC7MNIE
         oCLg==
X-Forwarded-Encrypted: i=1; AJvYcCVA/WzwKMt5GS0gR+QwVtAiDQbQoc186HQmPoeFqiXGCfKVLCJMwUxDppITnbr7pOAnZ8JWtBIv+u1aYDz/EQBxHA4m5xHuz5YSdehxUA==
X-Gm-Message-State: AOJu0YyTjoTJMWl7V8+eoG65Q3FKTdHdRE8kmCGYxNXV/ezC/atHEW3f
	Su5w8bNqIPJ3xoRJlflACundBFUkNjrpBwrQ5hviUkPzntrw+Y6tkHlqMrhi+qU=
X-Google-Smtp-Source: AGHT+IGKkx7VMsskD3yuGoLQql+31EQW+bCMcF0GvqSoicuAhJyouji9srJuUdiIZnIAxGjg2uDLaA==
X-Received: by 2002:a05:600c:6a05:b0:41f:ed4c:b8b6 with SMTP id 5b1f17b1804b1-420fd3494f0mr40729205e9.38.1716475457414;
        Thu, 23 May 2024 07:44:17 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100ee7f1dsm27249335e9.7.2024.05.23.07.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 07:44:16 -0700 (PDT)
Date: Thu, 23 May 2024 17:44:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/31] Staging: rtl8192e: rtllib_rx.c Rename camelcase
 variables
Message-ID: <75949442-193f-4db6-826c-6f23250c11b5@moroto.mountain>
References: <20240521031718.17852-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521031718.17852-1-tdavies@darkphysics.net>

On Mon, May 20, 2024 at 08:16:47PM -0700, Tree Davies wrote:
> This is v2 of series renaming camelcase variables to meet style
> guide requirements. Thank you in advance to reviewers.
> ~ Tree
> 
> Changes:
> #16 Renamed plist to list
> #17 Renamed npadding_length to pad_len
> #19 Deleted ChkLength variable
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

