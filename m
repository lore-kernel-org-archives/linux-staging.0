Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1881877
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 20:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718312168; cv=none; b=M1YjO8TYglRlBCDf53YGXkgHC/1CciyLJqb3zMG/C64nIDxha3o4jNaLa7ZExfCFe+pqZRSxwswDIIU5Onplt80f4Z0YHkAjfKfbVChnsXZG2AYWjXoXwfMX+022bErTsCCK2fl4bJ/6/n3PFpxlkabNPIzt8CZovz549LhtFXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718312168; c=relaxed/simple;
	bh=/o9SMZeH0JArvECk6xRjNeh2FTZ6kHf/xA91ncCt6Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E59iADCKmhtsqdn0PWmpFx8IyhnrDEdKikoi4jzzjgkX61Gp3jklF2WWyEvToUKJJpd0nInD//+YZQYNbN5pYUPlN6CIX/VOqj1O7rxkhnSmPohBNTCVcPk1DVy64fIegyDSj/u4XvEC189nD85i8AJ3Y2pThsFpin3wNR/rldA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=shq32vLw; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="shq32vLw"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-35f23f3da44so1387505f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 13:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718312164; x=1718916964; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zCVlCd3UjUTBV+cEEBJwXjWu4fzORp+M3gwsYSHFfxk=;
        b=shq32vLwyISGbAuayZEUZx2k2SGbt3ribvAJ3pz3msODYYltm4vs8vZahqeerLJyCx
         Bb1fcffwB47ZPQLvvbo5iJXgGBaklSzVSaGAVc34o4KjBYiIICkTYY+j1oPVas45TJ3P
         1NoqDyFyvsHQbmqzugKZszNFuZMzcZ9PRM8HypdOujnilQNjI2BOTNOKKApzadfEkr0K
         jCOuGvkqWZH9x70sPWSM9NZkjX0GWYoX1oox9CxlrTPl3NudhykEdLjNevvj6R++4Hfl
         jIY0TRSEY2sR5oXMobPUN92v5N0RkaFgHqQmGvbdMOHKpEYHhk3WWe+QF1t2fyjV+Cph
         QfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718312164; x=1718916964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCVlCd3UjUTBV+cEEBJwXjWu4fzORp+M3gwsYSHFfxk=;
        b=oXrJjxwhACwf49DcWO+k5ftpQYpkwQy8jbUF2K1weSfK1y863Woasc+ew6SVW8sDFg
         tL0MbLLWL36cJ7hfHb7eOfQy6j5Gbjm3b7vXjVkCNH4kmRI7Age3vRSAKSZdbjLWVG73
         EP9r8lpG1F1Q8YwbceS9raZe4QlOOD/PH7fhMHc+M4/ksCgoweCrqYMfnl2QnBIqELMd
         8GfRC+zzMZDhVUCNB9pldDo9ewUStCnRDYjslX/CCTD0g6yNftMu5ZPyz4CaoZWR7XOC
         zL8p+9MT2H48Atj5VIrpZ6ZKrDgbgM8tJnHfck9D7y4t/pAbyWRZBsuntVnde64xqCqt
         0L1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpinby6XQ34nz1wjF/ZKeXIav9b1SUAJBrPZEUrP0Bn11gQNnVwSEKHYGdlMXXpbBEoELvAxozdb8TsTG34NHUNdskSytIXIY0+ZEURQ==
X-Gm-Message-State: AOJu0YxDfjey7PPG6wMGpEcASF5xlrY8OkxpuWXymuMP9wOaQTIZc+gj
	iM9FMxcnYE8ZA0XR94wLX20eRQiKSShzjttlox146pkyjCOK/qV8fDKFR0G2tAA=
X-Google-Smtp-Source: AGHT+IHTv39w8lYeW6DtnAHirUWaWA+9uDEYHURyMfqcjKzNxs7TKlVdAHjocyZ0l2HAT3NjGfz7iQ==
X-Received: by 2002:a05:6000:1882:b0:360:6f9e:8a85 with SMTP id ffacd0b85a97d-3607a7d978fmr569390f8f.43.1718312164263;
        Thu, 13 Jun 2024 13:56:04 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750ad216sm2631782f8f.57.2024.06.13.13.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 13:56:03 -0700 (PDT)
Date: Thu, 13 Jun 2024 23:55:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Teddy Engel <engel.teddy@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Remove unused constant IC_VersionCut_C
Message-ID: <ed5db92f-68a0-42ef-898c-236d8342c25f@moroto.mountain>
References: <20240612143326.6764-1-engel.teddy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612143326.6764-1-engel.teddy@gmail.com>

On Wed, Jun 12, 2024 at 03:33:26PM +0100, Teddy Engel wrote:
> Remove unused constant.
> 
> Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
> ---

Hi Greg,

Please don't apply this one.  Teddy sent a follow up.

regards,
dan carpenter

