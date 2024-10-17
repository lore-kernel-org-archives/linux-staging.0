Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386491D4161
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 09:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729155669; cv=none; b=nZ+CzB1UdT6mXwBtlgyPnPKax8/OJL63M/9/d975/uEHuzW7+OGT9ymY5J1bV65EmrLJoZVVrxa8U7FOmfhdM30GbxjQWhjxfwslEXbcLjn+KeFuoWM/nVAQlEV87sn5sHSixswKee4T9hK3EsubwYsBum8EVdiGm+hurVsHR7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729155669; c=relaxed/simple;
	bh=PRJy7kpQyQHQa8WGN7JBUsnJEu2pWPYsxmv+GA6Z7Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fm7cwDqxHyPz6Z+p3AoWw9YldQnn9mc6xHxIPBoGWFz7asng0EPkDhwXMH4yuktcNpvRq1YKT7y3sbwWoZWQFTxIfRxbOYULhcWUhXj3IkwuocX60XuD8J3s+M0A9HRVGbVebMvKrqqMkJ3b96YpHQ1CmQV7bF71foAu4aUMIHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aAE+I2Rb; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aAE+I2Rb"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c9c28c1e63so674190a12.0
        for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 02:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729155663; x=1729760463; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C6aGvl/8M/aufRUPMsZdP1oi2gwHcXIgNS9xwjweU+s=;
        b=aAE+I2Rb3ql4fuhDLXm8jEl0rs20f9ETkVBlYQSkno8xRkPXn5pwyWuWTBGTkgdIRs
         MHj3oqRFHzkplLnxFMFIuWnY1oHfTU10mESWGMdq4WDY9nkhdUpASIgFtFXZ4v0hD6Z4
         8BWeqYMIQDTTwyDzjeKCB8KOZy3ucSyLhYByR7PoM5WkM5zPjza1sC4kIR8FwxzKdqNM
         XSugmkeAh/KueNj/V9krfEcL8wphQ77u7gPum47uwgiarpsgk1RobLZ0r9tkufv0OPul
         cPJyCZf0PLxEUCJZBoUeuFiX0M9QJ1eUbV/BGNX8VrNPY07FFQTU9IBxy0pY8OYzSU31
         JoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729155663; x=1729760463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6aGvl/8M/aufRUPMsZdP1oi2gwHcXIgNS9xwjweU+s=;
        b=PjLWKcLkI2kb7gu64BTKXqgq7etacqEqTlnlJRa+zeYbek3Xspbb4QhACUNlIQ4bQE
         iNdZA1sG/oA1bZrAGciLK58pr/9TxCp2qfqFhcfzc00/MDJS3Y9lq2idtr9oSZ7PUovR
         qx57R4ZuOijqOA/NsGniYXJJqqMxaywDyE5iINFaYECUPAHAnspYAynoYC6AvAPPoU1g
         y6JR3I/glSyVoy8urnAZRV1/3/GhkFIAgNqXP9ROItzuRMg3LJ/EWo5UERMaLvX+w8t+
         lGfPz7rLTznIlOfrczMELpR3MHAMmH7G4uTOfvlKvJujtoGZ9RPfFv0EmX0p8Am0bh4p
         ynzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyOfXNStAc5woELax149lgC5WpV6UQDpFggpoyuQNsXzTFIG/h1tpLwYg0EYr6G19lfNNaUCUImMem0IzK@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/blaRKCHFViWoQMEZrmPa7HqQvGbXwcgGI2wUTwUmOaVAzUn4
	pnFsyCD+zufDZ8irpO6zwEWL3crS2a2pTIRu6DR6bdjNVntclrl6zVn4euzX9UQ=
X-Google-Smtp-Source: AGHT+IGSXyeHyslIg4MFh3k+NuDIEQtRyjgZZ2B7sQlpZ+zhsl1ze+Ey7jIpBlerPmTut/kVntEp5w==
X-Received: by 2002:a05:6402:358a:b0:5c9:72c7:95a2 with SMTP id 4fb4d7f45d1cf-5c972c7986amr12936905a12.22.1729155663454;
        Thu, 17 Oct 2024 02:01:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d5298d1sm2525207a12.57.2024.10.17.02.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:01:03 -0700 (PDT)
Date: Thu, 17 Oct 2024 12:00:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Change return type and error code of
 fluke_get_dma_residue
Message-ID: <85cb4aba-60ca-4fea-8d1c-dd01578357b5@stanley.mountain>
References: <20241017082022.16874-1-everestkc@everestkc.com.np>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017082022.16874-1-everestkc@everestkc.com.np>

On Thu, Oct 17, 2024 at 02:20:22AM -0600, Everest K.C. wrote:
> fluke_get_dma_residue() returns unsigned int with -1 as error code.
> This error cannot be caught.
> Fix this by changing the return type of the function to int and 
> returning the error code, that was captured.
> 
> Fixes: 55936779f496 ("staging: gpib: Add Fluke cda based cards GPIB driver")
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---

So like quite often we would merge a patch like this, because there's nothing
wrong with it and why not?  It's a step in the right direction.  But actually
in this case could you fix the caller as well?

Do it all in the same patch.  It's the one *whole* thing per patch rule.

regards,
dan carpenter

