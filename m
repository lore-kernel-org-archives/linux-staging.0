Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B181FC3
	for <linux-staging@lists.linux.dev>; Sat, 26 Oct 2024 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729939812; cv=none; b=arE9Zn5OGDJi3k7Ns62z3vxqrLYHrW6Hit5mPeUq2s4P/qwufJzhocdmJtCoHTAeCNq4f74a2E4IM6qe1sCx6KNZGgB9Rxcxfc8VaEmsrSJJVSIlXpST+jF1bzPCoMvmYcjuHVJ7tr4/Ix4rPrx1R1eSe346MeJI+Ih2Ja8BSVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729939812; c=relaxed/simple;
	bh=HXw9JRhTSgEE+Sya2NxD8TdTvSXkkTx4mgfyPmBh+dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5yfr14q5iFIzzhLBNAtfcLx90F3Z8dNq6FFF5JRkcM09CAzDEWQRYMZVa6lIvMfigpnRVxQlgjQZGb/P4/gHz9XNZ9d5YtaG+O1Z+FTRAL1BiWlc8MHsiYxmds3Msy8dnqHYlGOLp+zlO8oKOiwdUxSzeS2rapbbxoBYh330iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DwDSIa8K; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DwDSIa8K"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso27178265e9.1
        for <linux-staging@lists.linux.dev>; Sat, 26 Oct 2024 03:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729939808; x=1730544608; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yVz5J6QwYAV8RfgyJiVOhZ6SmvE+XSupxSpNLrKom2E=;
        b=DwDSIa8KXaS582OZU8H3qUpk1BMpEfn5NqZJ/TNh9pZVQ+cI3yjFylNtDLs64l/dzy
         iAh1bCw+rqzps3FmpOr1zZmvHg3HPd+tpUnQce8l98h+OCCMHcCu939usrQkOKLmjtnd
         ibUOml/VEy3SdDuuQXTo7lHSDI5rs/7dvmQAGrQwsYBnaAHboJN6RMuRJL1QLYcsuamp
         tmP+pDN554TYWRcTY9MAvuArf4ul3yrh/V4TSPBA83xhXbZvBXPYZ8RXQTlbHAuumfnw
         /02PJvCZXOTMx0/pANf/mgCvRYH9NmecLzm/vlI906U/X0vGlqWaI96SgDUZe0Pp3U9d
         HmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729939808; x=1730544608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVz5J6QwYAV8RfgyJiVOhZ6SmvE+XSupxSpNLrKom2E=;
        b=cCgBkYyM9ClC7osui5nHWenyYo/IklIdjJP67xhu8STBlqRmrVUUaJHZtRE00+ogzK
         4WvtHY4fbAftF0yDNWfJhQ2du00A/vbzZ/aQGoadSwhbgzQ6V4Mh0C/BPyCthaJYH9Zt
         Cgei9xN0haG1awzJwpJf0RwfOT7I6f3OLJcWcLAoCrOh0zGLGxwKjVNAbSg8nQrUcTmn
         XMCWqcuhnx0EqC8VFCWspZNjmjWKNpyfyLO7V6wAsV8t0WiUPTaLRMOV7W4cIYP5YzoX
         ZZutUGrL58vj2kICyaTMmIuXE7Jh6wKYZxkmNLTqkgB9elhfRPlu6ROZwsSCDiBpDnAc
         4s9w==
X-Forwarded-Encrypted: i=1; AJvYcCWsbgOsdeXJQG3vZOEYCsk/DchOOcYe/59L4jhuJ1LTKmBdM6loOYnHtnT88OGM9tZxriNfRi4TlrwqhUOT@lists.linux.dev
X-Gm-Message-State: AOJu0YyacOugU47s0M3rFoan36llP5pcxiHZLYPWgvUkdp6AV/9hgDCm
	lfJX28lK7xVuRkn3Z9/0p5Jr5QlgZaQD/bAQHRLC9XrGYfmPqmCw3VWeG1aXdv8=
X-Google-Smtp-Source: AGHT+IHO434LELRXqOVavaqsm+vfx3F+ZefaoIvzcQGEzt13HboaTw4AXDGT9tjmHJFngTmQjqnGqg==
X-Received: by 2002:a05:6000:12c5:b0:37c:c5be:1121 with SMTP id ffacd0b85a97d-380610f7bb8mr1683045f8f.9.1729939807834;
        Sat, 26 Oct 2024 03:50:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b48216sm3981056f8f.59.2024.10.26.03.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 03:50:07 -0700 (PDT)
Date: Sat, 26 Oct 2024 13:50:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yi Yang <yiyang13@huawei.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	ankov_svetlin@projectara.com, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, wangweiyang2@huawei.com
Subject: Re: [PATCH] staging: greybus: fix possible null-ptr-deref in
 gb_audio_manager_get_module()
Message-ID: <9ada17f8-7b3a-4bf7-8fc8-f40bf67adb33@stanley.mountain>
References: <20241026081153.2649890-1-yiyang13@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026081153.2649890-1-yiyang13@huawei.com>

On Sat, Oct 26, 2024 at 08:11:53AM +0000, Yi Yang wrote:
> The gb_audio_manager_get_module() is EXPORT_SYMBOL, and will return NULL
> when incoming parameter id < 0, fix possible null-ptr-deref by add check
> for return value.
> 
> Fixes: 8db00736d365 ("greybus: audio: Add Audio Manager")
> Signed-off-by: Yi Yang <yiyang13@huawei.com>

Where is gb_audio_manager_get_module() called from?  So far as I can see it's
never used.  Why not just delete it?

regards,
dan carpenter

