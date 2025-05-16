Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C06230BF9
	for <linux-staging@lists.linux.dev>; Fri, 16 May 2025 09:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389092; cv=none; b=cGX2+GFcX6/kV6Wvv4K77x+xu6wVGfURRfWWCFLe1R27PyIt/j8x3vCdQ2qe0GhFOkF9jfpWrPuy0bbFyeyvkFhgWocRPnsAf0wy8BtHZJpE9GkjFvwGw71ZlotsFZiOumFo/5ZOJDOtYPw1pF6Vrerx4M70nMKGf+yC51IXVRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389092; c=relaxed/simple;
	bh=Gu7DAGMs8OXfRA48FowN/UWaHhjAtaoqoSWWO1d8+38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4a9gqCnvh6/t3JiihkhwcynyEAYTVnecRmyR77dvOoaUW67CZzXPFL/q7Gu1Dt3J2MOSg2mtqFNS4Bf8CDCoVvkQx4bSlY0+lpfa/W9suZNUFsRWRrXXw47rMupe5nafC7dujxolkYgBo8OjOQqqBz/xOCaE5ElxPq6QKIYoXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RkqAuuIo; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RkqAuuIo"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a20257c815so1708670f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 16 May 2025 02:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747389089; x=1747993889; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K+LSjGf6EFBKwBFrJfQr9p/yrXwMirkG4Tk2TYuSNm8=;
        b=RkqAuuIoCr+XPg2fTnu5qYn5VJzUWSRgBneiyVE2SbUC7edqGJch9XP12p8hath2ZT
         tg3WNJ8+MU5nhmkFbDcDm4pqJKZoiJBviMU+ICQCZQ6BOfmzZjeMdNOfr3LjDx1ICuhD
         DTxb6OF6MvG33N02w5Iafgfl0fhteTij1hhia0YZ+7snqZnkhF+uqfTK8jHQPS2oevry
         tbsSkvsl/QYeDTlwa0mfiwaslqVNSdptsiC4yJA0uiqPpkDou62kdoZ43BW76H50j9Qf
         9Z88xTeEklaUqXcj86yqoEh1cOrsezCRaSzkUf87qWtj9dDgf02q6t3DOgFdJrvxZYyg
         TpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747389089; x=1747993889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+LSjGf6EFBKwBFrJfQr9p/yrXwMirkG4Tk2TYuSNm8=;
        b=EfDmM8Ex4ZS0HyPCYG94P5+K+GV1+URq20WPNNzHS3uZv1D3ZArjmJybhDcirVitb5
         khPdvtdYJHcTPFtx5Lp62MCUFRazNBkJlhN9LTYhgo1QhemVZq0mSb8oGmgsj3fZS7SA
         tMzmFCDrKhjeGJeho8CTieQAvkO/iyaK1nfNAe0a4bUtt9mX3GZ3O86gpZlpG7r0MBYW
         HjNBRhWSgNyzvvGin4NrZ4HYqf7fDmHihDbrCn3t4+/S/79QgmqHMzfY5PWMM5Ubwicb
         R8i7889fwHWYtlCCTeUMTeno2mX2NbFXZzmRWGZyAXftMsBWPV65RvM+WqzUYs1E2JAn
         /7tw==
X-Forwarded-Encrypted: i=1; AJvYcCUnoMx+Vgf8vwfcxymMP3pGvUFfGTwDKGJzOwOMUDmo0eDOELHRcoiOXLsyT0kBhyg9ZhX/FnDadBRWM4dX@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/iAVkiyLltfStcJumawwdYeebNtBPjfJafP35G408axjJE7uY
	cHf1BgjBceb/iNPJZpVm4TU/bXUYxKP/U9YhuCFoKU4RS2ADoKry4/bVuyRYVT8HKLs=
X-Gm-Gg: ASbGncv/ZYA8Vw8DceToaR2Ct+6BV+0NbsvtqsC5TL9LaQE7EDp9G+H/eikqjhbbaP/
	eRlWKV/VTp7+AF9PgM2WRrQkYql4j6ahCHoEAOIE132beA/3nIpDdaQ24FoAdOH/b3TZedbk6wk
	2XmmBC7ER24T7cLYfS/aznV0mEehx3YRF/BjwKO9OGkz6NtYZk12CvCz4MgSnUchBWNWtRZkBRw
	+Bl+k7ZVDjMWZ0kDx0GziRrfLn+38tLGVUYTfThhLTP2gtAYcQe/iSQ2/8HaypbeFsbCZyfX62f
	ZzwYmnhESzK6XUMLFUiYw0057uQ7nJyTM5vkc0d4enk8/CVYJOMdo6v5H/Wn4IQilnF9ExT8mrG
	TrWlnRg==
X-Google-Smtp-Source: AGHT+IH9+6rQReRUQJWSytxZ+G1uwpsTux1xN8YauxmBEa6K79wk8JHtL9Rbuks70p9JG0WQ3FWzJA==
X-Received: by 2002:a05:6000:4382:b0:3a3:5bf8:3732 with SMTP id ffacd0b85a97d-3a35fe961d2mr1450354f8f.35.1747389087844;
        Fri, 16 May 2025 02:51:27 -0700 (PDT)
Received: from localhost (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951854sm97778635e9.24.2025.05.16.02.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 02:51:27 -0700 (PDT)
Date: Fri, 16 May 2025 12:51:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ozgur Kara <ozgur@goosey.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Tanav Chinthapatla <tanavc01@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix spacing around '+' in rtw_cmd.c
Message-ID: <4fa93b15-2552-4585-ae60-dbbc2dcfdca3@suswa.mountain>
References: <CAPGyJDMv-N3HkdV4znQg=_i2owE2sbnRhzFem_Uv_15GjADBFQ@mail.gmail.com>
 <2025051301-projector-earlobe-9542@gregkh>
 <01100196d6a80a2b-a3be3f40-ed8b-4bf4-b2e3-daa37f8fd19f-000000@eu-north-1.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01100196d6a80a2b-a3be3f40-ed8b-4bf4-b2e3-daa37f8fd19f-000000@eu-north-1.amazonses.com>

You'll need to resend.  Here is a guide.

https://nickdesaulniers.github.io/blog/2017/05/16/submitting-your-first-patch-to-the-linux-kernel-and-responding-to-feedback/

regards,
dan carpenter

