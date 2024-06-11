Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85D64C8D
	for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 02:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718072155; cv=none; b=KcNs5zmNGWFL4EKJy6eiac+CeiKldDS/kNii+K9bHRqxITdoX7XMfNNXBEKj2pY7esu4Ucm/Fm9lINfxcXcsOKifZlSlPNBga506xo52AHe5xetmoOC++qPs70ds9BSzqfXkzbmvLMyKjVPlwaz1O8XAmq6fiFskCwLR+ODMwLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718072155; c=relaxed/simple;
	bh=Hu52NiUMZnfWmhYSBz7t0d0I/Ggbxn0bNqdedmqTXY0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rA5z7F9uYIZxQYxjNwEqVaD1qlDoWsTrEbFc0AtYIjuLlNY8YDX901C9UUP5cAG/3MUUqXsYiXXj7+r/6nYe5UgaJuxGzYtqYyXpAecuL5IaXyIlMBtYez1JOe5WJHliTwBUG3s3yu1k4WdKcKgbfX1ChmvmcditxdW3R61uTDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=Un3h8tNR; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Un3h8tNR"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2c327a0d4c9so499213a91.1
        for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 19:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718072153; x=1718676953; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M1iMWD0cXe7m//eT5hVbZ/CrnHyq5DzwD9T5UDxYRWk=;
        b=Un3h8tNRhJaFRPLqPQQXuFAKHGvEF7jj0IAV0GIyhOPvF9kyD6Mo5+g0aoivL+ZZeP
         QGo+Hf28isz2Td+qz3KbDIBJ+ERicSRVlSRnVaGelasmltElJwC49GKXfb0h36i4T2XG
         fKgQawwp+bayN/A2j6DRjEUCfFnyMudh5gHdhJ3rv3KskH5u5h64r/XHvuDYdIywigtl
         UlWU+dvAD9JnDRLr5LKQI/46hHqb78CbTE2Mb2CIAKnN8YdEDjLY7GJyIfAPXTZLnmbN
         bCuVg0ajOcwGW6SK1l/YoWDte8oCkdYD+GIYDodPZ5DB5eNvAsWhln1l1HQ8ZTq2Gs7h
         TKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718072153; x=1718676953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1iMWD0cXe7m//eT5hVbZ/CrnHyq5DzwD9T5UDxYRWk=;
        b=LxFBbqErCUQ/Yx1/K/Olrd7yPJ+ceTbiMSTo7RwVWnqu9wkoQw0rledIyxW+x49Jmx
         L1cit5IOY5aI8bEz14TtALSt47gmC0FFI2dieJ26U7pXXLjqMHrj4M787XruYezQw126
         PvVjL7GXkAfuZg+jWu38C1kktdLYECwO+ATodw1BwhQ+SW11wf1NLg7nGDdrp2e1qfMH
         /9zsE0dHI4x+ZmlKmTsNiZxRNrilSxDfC+7eULl6SqG4eU+q2cMlJUeIl8VPog6LTskP
         K0TMXb7vrgKlSpgLlFfod6VyWQ/WwzETOkYH/SwsrsYAuYdKIfMHo41hbybW25Sk5DMP
         OKsA==
X-Forwarded-Encrypted: i=1; AJvYcCXHQWuXP9TSiUAFIdiNjYPg+ICOLu8y6LlO9DI3tDN3zllFK8Jf+zFWegNEM9yRMhpULbsegyYX6evjvrk/fPjXWWqwnMG2gnI0+witwg==
X-Gm-Message-State: AOJu0YwOXC8tCFdmKmEO88sRicQTsyN8mQYrauWqyRpnt8Cl3uzmlp3z
	GJgoYAD+gT7RrEToSIrwFkrWk48Q/Wf0juvE/q5A3BQ4wTxK1xPdnk2RaG/Itok=
X-Google-Smtp-Source: AGHT+IFCCmF1Pb0/pLej1CnnPxa5PYZWpZ4USpYe65UOEQV4kdYmk/TD1yjqtPqRTKpKrqRMvMYysw==
X-Received: by 2002:a17:90b:3701:b0:2c2:d66d:1b8c with SMTP id 98e67ed59e1d1-2c32b4e55bdmr1755621a91.20.1718072153177;
        Mon, 10 Jun 2024 19:15:53 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c316e0fc1asm2039654a91.29.2024.06.10.19.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 19:15:52 -0700 (PDT)
From: "<Tree Davies" <tdavies@darkphysics.net>
X-Google-Original-From: "<Tree Davies" <tdavies@gmail.com>
Date: Mon, 10 Jun 2024 19:15:51 -0700
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com, anjan@momi.ca,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/24] Staging: rtl8192e: Rename variable bforced_tx20Mhz
Message-ID: <ZmezV4UvCEImxMBX@lunchbox.darkphysics>
References: <20240610054449.71316-1-tdavies@darkphysics.net>
 <20240610054449.71316-10-tdavies@darkphysics.net>
 <5ccfa433-f1be-45f6-9138-348cb4093866@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ccfa433-f1be-45f6-9138-348cb4093866@moroto.mountain>

On Mon, Jun 10, 2024 at 09:08:03AM +0300, Dan Carpenter wrote:
> On Sun, Jun 09, 2024 at 10:44:34PM -0700, Tree Davies wrote:
> > Rename variable bforced_tx20Mhz to forced_tx_20mhz
> > to fix checkpatch warning Avoid CamelCase.
> 
> The correct capitalization for megahertz is MHz.  So the original is
> wrong but the new name is not correct either.
> 
> regards,
> dan carpenter
> 

Thanks Dan,
So... I guess just spell it out as 'forced_tx_20_megahertz' ?
Tree

