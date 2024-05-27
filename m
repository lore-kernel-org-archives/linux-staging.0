Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D2ADDAA
	for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 10:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716804430; cv=none; b=ULDhVZmfkgmXDeNbInOaI11sGgAZSX2Z1Cul8YlIQ7ppb9WNaoLvvXqmRg2uCsJf6s6zt0AyI2K8iXDo4XLGWJXr8w0ZF3uQjvFbtXDdrctbtlT7T70MA0+0MwsVAPJqm62NaJXN+LZwxg6JyyEwC4Mb0dZOit0tdw69fP+C2dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716804430; c=relaxed/simple;
	bh=lhGSLA+6Fd+lkf7hFK9IB1TG8eIIis9jKYhy9eOwP2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dx2eLZTsoGq3JDk83y3VEjUiLSvnZpqi4Sf7j0YCgkTqcWmp/pKp/e0mbax98+NnIreRA3X34N/UVAyR/heMqGSP9bNGEVyp2AbVGVUgPuBwpcA6o3NrFl2C0uj4yz/Q2SUA4l4mfx+nfExNyDxaOU00wLwDCXMjCPh3+yKlEw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jraOkYhB; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jraOkYhB"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57857e0f462so3013369a12.0
        for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 03:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716804427; x=1717409227; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JbPDN1bud0jCQR0vRfMQ4CNUPwHYHGmVY5chaq0K9V0=;
        b=jraOkYhBK9m0+5G+veVy53fNZ7kFjFwKtejxUEcJ0sMGRB+/QlwvPbBfE4aPETeVNX
         kvphlAP8cQmsZ2BVqrD5t5B6IHhDS4fUjg9H7NUnXAknVjj6kZ/ebL1mCGGL4qrN8ow/
         rYqkUqRE1LggQ1mXsWT/5jWf1OZnNHGWF37zsBBmyKJLqh51b6K3kw9yaSlM0izFLBba
         mZUytTQ7uJbTiTAuQN1c/tLAPkq8I0CUkrmHYm2jN5YBu5Ob594+qhCI66s66xy/gOwe
         2pepoBRmormgp/8BCNbtq8GsK+Dlx+BytKc0w5LQ8YS9e0/CMDkz3u0bUMBzZ2jgnKaQ
         POhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716804427; x=1717409227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbPDN1bud0jCQR0vRfMQ4CNUPwHYHGmVY5chaq0K9V0=;
        b=t1/x9f0vj3asl0ym7yJDCdvieqDiTvu458uOQoptIssXgLzvltsoc2Q8iSZptvoHsI
         CEnKLbeOti/g6dSt2dS3sk1k/GISK6dLvsKWbgmw+mYe7qv/Fs+4bIjegUmYoFAC0B+d
         DRSEabhd4DKtbCcjb2eIF+RsjeNjH9Q3hyIzTm2kK+nBQ1GTwJbITn+UZSYLL7wRMatx
         Afb/J1UBKDmWPx7tc/LJp1alPmtw0wNRG1H5qYvjqJTGDmS4x5rUxYqzgpfs4X2PeHvH
         EA/jYiihVgTn5QTcnBqcL3PjcVEW/ma4czGPaoL+L1Vqgzm9XKuGWPqbcntW0tt68n0O
         mzlw==
X-Forwarded-Encrypted: i=1; AJvYcCWlzW/E4vASsCQ3JZCIjBrLXFrcBLQJvqxb5D9WMl/KUYYfImTgs5ltSJ/RQE5WHjoDeREbRqPKc5MfFQlNpuQkiuEQUR8Q7txLWcIgHA==
X-Gm-Message-State: AOJu0Yxyw3kB8v+FICdiRKqdBft1Drog/xghN9S18Zlf+DHsWP2f6EgG
	wf7dU3TlLQURHp21DNq6Ht2S0wEwLsEFIBBom/P8Og4LJmfYeiuQLdW9UEOO0us=
X-Google-Smtp-Source: AGHT+IHmKdFKS+UH05kV/Ub9d8YRErAmwvuWURmcX2+a+Wh+DzcLct8J/iJmx6FJlI5QlYuLMmZ62A==
X-Received: by 2002:a50:cc85:0:b0:578:3336:92a with SMTP id 4fb4d7f45d1cf-578517a5268mr5768669a12.0.1716804426876;
        Mon, 27 May 2024 03:07:06 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579d018ef3fsm1649365a12.13.2024.05.27.03.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 03:07:06 -0700 (PDT)
Date: Mon, 27 May 2024 13:07:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	namcao@linutronix.de, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] staging: rtl8192e: some refactoring
Message-ID: <efe21ff3-313f-44cf-b1c5-361b48393fda@moroto.mountain>
References: <20240527094527.2046-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527094527.2046-1-straube.linux@gmail.com>

On Mon, May 27, 2024 at 11:45:25AM +0200, Michael Straube wrote:
> This series refactors two for loops in _rtl92e_dm_rx_path_sel_byrssi()
> to reduce indentation and improve readability.
> 
> Compile-tested only, due to lack of hardware.
> 
> v1 -> v2
> - Removed patch 3/3
> - Added Nam Cao's reviewed-by tags from v1

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

