Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87E046426
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 17:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710351296; cv=none; b=f7N5d7LrEaGq3xiE9clIYBY0wXpRCq/rhvbPtHtUUgzMN/72MOKY0Hat2LC1Sk+NWoWS8PqlBesiUn1omRgCiM3Z0R2hJp9QC9Nph5spqZIb9G2pHNOuUjU9Xxn/I7otGfuRQ6h3fzF7MvT0gsTnvsVWZULcC4p2B6u7Wg25pv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710351296; c=relaxed/simple;
	bh=wDVYaiWTHLKSiNQF6TvsedVi1h66ePmZbiVPozc8hJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKNgM/g/o04yjkoH6eewyChzUeWzs8XLb1GjPhKpillGqvWO5hguZ2lo836mOiSChPJOD3uYfCGfAnxOtEuS9PRAFvr66UO5uqsQPFmBPv4SbFjGnimPOLldGR2vxffh5agLwdKVMZOxBKGg3rafsZKpmBSp/+iCCyfMhXY6A+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cTdbMnqC; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cTdbMnqC"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-563c403719cso81126a12.2
        for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 10:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710351293; x=1710956093; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wDVYaiWTHLKSiNQF6TvsedVi1h66ePmZbiVPozc8hJw=;
        b=cTdbMnqC6X5oMm/5RZ4hAhCTt9Y7/rpT3UwAAksbsjo/UWAcfXHIt3TRocqcgiWFz7
         p7mnWqTZ4cXxcJY07DBQxLVkOxR5WOGi2bJFej5LFej+i8vQ+wdPtK+R/Q5TJsPGK/co
         iHPBsXIu6ZiTWOR97SAVzdlHoY9i48PtC46mssLpxOQC+o8RMjsrAq7fR6JjzYJ+ibeU
         mI3wOttsjU4JnHTPq8+wfBWJIEmFdmVA8k5OItFlLd0/sBlxeqHDINISNs/1yAvDwGGM
         Akc1+wRgsxX1PAtErdEjiW/HAUa30kWNzyr1kHSDw7bC7g9MoWEkB3CRGJ7fxt5qRDVa
         4Qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351293; x=1710956093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDVYaiWTHLKSiNQF6TvsedVi1h66ePmZbiVPozc8hJw=;
        b=VDcnnLox5COMBK2k/SkJirfgBD9Q/0cx17oDQc6TXJ8gJHDOTKBizmLFKYGthiAbYg
         pLu0iX22yMmaKyyRU9silsr6Pv5bacsC7T9FHELAPi2UhqKsfDPU4iCI3UdkcYOsZGfz
         El6hEu3qVwD+RkVRt85DG4Eq+Rp+du92S9VHrm103AIE4swvWnG1nwmB6/8MPbTAswy2
         rnKk3LwuLAaXLO6eryy3yXb4GFnwJ8KUGU2VfKQWG4Afsxp28cxNnsMymsSbk+V+A3qD
         IMUm+McgKo83MBw0Mz5iXX5oeeVvPCMgSjY2jTITo5xP2UJhvsXRYCX4p05hEx51BUkU
         C4Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWOEUeiVhxRtl8WHfQw80HYb5Zzdqmh3b+5TX2WRJZQ2rKBB2Ki4lFeZ+xrngyzcqv0l4+/ePYVuvmRzrQzOXJo26H/uPoheL8bFusp3A==
X-Gm-Message-State: AOJu0YwDCJpga2uF18peuVruzmYcPpWyvQrHC7WQZ9EZp2zCd2Tu+9et
	Q8spGAWloXq6jRsvzMo33Ry3vvY/X5PE59meleHUL6x/N8XgTvn83KO1BPnRL+s=
X-Google-Smtp-Source: AGHT+IF0uw6I6idQAb4xv3M/WoLxMq8rIEcSu/qwR7wMCtqeIzkvl56KxAb3RLUFTKsxfBzsJerNtQ==
X-Received: by 2002:a17:907:c209:b0:a46:4469:6ef7 with SMTP id ti9-20020a170907c20900b00a4644696ef7mr4148744ejc.52.1710351292978;
        Wed, 13 Mar 2024 10:34:52 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id jw22-20020a170906e95600b00a4623030893sm3441069ejb.126.2024.03.13.10.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:34:52 -0700 (PDT)
Date: Wed, 13 Mar 2024 20:34:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
	deller@gmx.de, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	Robin van der Gracht <robin@protonic.nl>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 1/6] auxdisplay/ht16k33: Replace use of fb_blank with
 backlight helper
Message-ID: <ece2ddfe-a996-4622-8c46-abfd84c79809@moroto.mountain>
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-2-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313154857.12949-2-tzimmermann@suse.de>

On Wed, Mar 13, 2024 at 04:45:00PM +0100, Thomas Zimmermann wrote:
> Replace the use of struct backlight_properties.fb_blank with a
> call to backlight_get_brightness(). The helper implement the same
> logic as the driver's function.

If you end up resending there is a typo s/implement/implements/.

regards,
dan carpenter
