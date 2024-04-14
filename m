Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6163036B1C
	for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 11:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713095794; cv=none; b=d26GFOGdYgr/pkT1Fn3n6XnDsRAKAAj4f7D2OFOT2/mGjqGqf7qWP10KCoZLDbnesi6PZYyzMEyx7m4aUAG7U1/WGZ40c9RZWOAo0tHB57Gjva7MwZyGQoEzhmL2IVEHvE/p/ZB866UoSfurmHFfY/ys0GRXuOC0+wc5SpnSk8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713095794; c=relaxed/simple;
	bh=te8d8HOM7tGSKKyzjBD+iKaH64bmDCXn5BVnXjLGOy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9PbU6CSomj4jhkve3OAy+O4uoZnej95KOdpR1t+wnLrYfeG2IXSx43wl/gk+2udUh5sxH6WZ5rb4kmCmDr80lY7Ukw5IuU59o2vFyayOWE71lJN21t5umnaEG5tlXYQw+0RGqUjbTFLoBUHX90foqPQzDo40ol25FAt9p6VG+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WJ4jwfMA; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WJ4jwfMA"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a51addddbd4so265817066b.0
        for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 04:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713095792; x=1713700592; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0J44Ja/Bzh4tals2v4JnH0Q75YFMRHuB9+NeZkXE5FQ=;
        b=WJ4jwfMAbxUcvUmCuv+xV9J/2lDXpkqwuUhMOUOFLea6TGUYjiComIqVQTuuGZK4Wf
         GZztptsNrEKb14QCbkxR7Rm5MEH20AAnDPNTpexvR4xe4wne8mYIbPb1MwYLVZ73u8fw
         8w1A6epzr6EBxbsTwskTrI/g4bH4O6VrSjkucjQKsvWNZtNvd0mxZ3c6dd9vBdaVGp4/
         sidTm062xpZpE5KsA5vZTXFy9oakPD8/RfaWVJkuexWdwQz/IRXIV6EBhP32buUxjY3b
         iO1/iTCGoMGDdlU4WurDJ0BPrPq3a1e9g0JZ45whDhsDGmpYTu0MV7G6f4J2jWwA9ciy
         sP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713095792; x=1713700592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0J44Ja/Bzh4tals2v4JnH0Q75YFMRHuB9+NeZkXE5FQ=;
        b=qb/4NWEfgSbExGMLB4uFqB1VBv0LOlesUoe2Pe2/l5i7ptzC8+SJ4XWP8w8bni7nHu
         TSKjot1aGPOAxFM2J1k2CvT7VFU4RiCz0OXhd3E7fy/4UsXrQ+Zft19qWsges2kR6g7E
         1G0VvDSYGzK2keu9LzVSqVtgPc9cfWg0fEKLb5i0sn6tOF2q3Q5DBpNiY5sIBf7gCi5X
         TbRdVYk/skDI0f/JV/1Fq5g2etkVK2ZHuNrh+4BED6OINUDeFljGmEQY9HPzTT1MvIpx
         t/BOZMaPWprLw7qjlyzRYWEf/meCDheOtNG6Tvvj6lXOgmEVzoZU2x4cOSsrIjN8WvAe
         eXyg==
X-Forwarded-Encrypted: i=1; AJvYcCUCWpysRFCJsiY6dxaoGSkvjtnnscKJipnFr9S4Q2rwcCiPFppBhqsdzOoa2tOEoxvU/xdlGQPMWarWy+AAau/xiY3soA1xeT4R8h6a7w==
X-Gm-Message-State: AOJu0YwVCjSR/LkMFcbvDLDT+Ja7sPY/nbuwKTBysVApEMYnK/MF7yqX
	55TtA9iwXvz+XnH8k06d0a/L9Ep8/xI++0mJUS+kR4pEhiI+JJc+yLOuhVLmdhk=
X-Google-Smtp-Source: AGHT+IFINQBAAaoyQpplk9rEzgUdjg4KQ+JmoOqwBweFaAw5lfnYNzNR1zPQ/pl8mk0xi5cID1KKnw==
X-Received: by 2002:a17:906:1b14:b0:a47:2087:c26f with SMTP id o20-20020a1709061b1400b00a472087c26fmr4621383ejg.73.1713095791494;
        Sun, 14 Apr 2024 04:56:31 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qw17-20020a1709066a1100b00a473774b027sm4125719ejc.207.2024.04.14.04.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 04:56:31 -0700 (PDT)
Date: Sun, 14 Apr 2024 14:56:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: sumadhura kalyan <opensourcecond@gmail.com>
Cc: florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Replace function alignment of camel case by snake case.
Message-ID: <67995611-dccf-40bc-a6fe-66f6fcc613ac@moroto.mountain>
References: <20240414102443.98927-1-opensourcecond@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414102443.98927-1-opensourcecond@gmail.com>

On Sun, Apr 14, 2024 at 03:54:42PM +0530, sumadhura kalyan wrote:
> Issue found by checkpatch
  ^^^^^^^^^^^^^^^^^^^^^^^^^
What is the issue?  Keep in mind that when people are reading email they
often don't see the Subject so it's fine to restate things.

Look how your patch looks to reviewers:
https://lore.kernel.org/linux-staging/2024041457-outshoot-voyage-3e5b@gregkh/T/#t

regards,
dan carpenter


