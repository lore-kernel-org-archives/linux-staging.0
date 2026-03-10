Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F743396EE
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 18:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773168542; cv=none; b=AGluSNE1kjQ5zkN/o6m2MdcL8q9GnHMeqgvIPqh7hBui2UsdBQ4fjZZf2TYnkkpFYd1Ur2VOcxybx79TAU+7pdGj/BSlOHiPxuONPvBbRFPJatlXNhXNPX31KGWrXJu7YFRFXxZV/OzDKHyE2JBQ63UMfDu8vQQMJPlrHf5S8IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773168542; c=relaxed/simple;
	bh=ZnO0f3eCR5SSeLxM6lpmR6651GXvs8SrbDENycfYBRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p00HLigisKhJlUV6hGxTy5faNBh/hPHBbewLYtyxUw8dMCPmLpNDRsIUVwmlY/VUax0YzKWBJRE5n687aBZdT+pihRkPbHfHs1RWETTOtzSZCf3BH0795OSSNwJ5clmuxLJMvCORPqioJxnGlhD1l/j3xoriM536BzDaKX09gd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnW2VFkR; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnW2VFkR"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-439b94a19fdso8748332f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 11:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773168539; x=1773773339; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnO0f3eCR5SSeLxM6lpmR6651GXvs8SrbDENycfYBRA=;
        b=YnW2VFkR91OZM/Nnv4LSrtqPlJDZDiuigAF/FzUBYvB28SkKl9Epdyh9nQwWtfBKW7
         xmstjXPvNU1gUjbmjsieejNF68c+x+b5ZK1AWad2SMADhIurae8cudwG39Slx5yA1aPl
         brX9gX9TMDnCk2RTMXLylwx+xfM+eavTQddk/B16bSkn0MV39NIpbxYrihLeZxlic3/u
         4M5MHCjp8yh8auxoQZ0mWPlphFlFgY1VrPDpQXLsSmecna7LUlmUdRrr/Z8gFLrVZ2aL
         +wSLFEtYL48qSUf+6mi68IZ9mAMUrO4ROA1vBr7EextI4kpnf0h52/8W6vvTAMfbecxb
         Ia/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773168539; x=1773773339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZnO0f3eCR5SSeLxM6lpmR6651GXvs8SrbDENycfYBRA=;
        b=LV1tp38remcHLULzmp050cXWgHn4+6vhVcFPVJkLuWev7ln7D7u5MB73C/kPXCdjzk
         XCJh4LmGmtM6vDYEomLOZUcrqy3Jzu6IMHakCjx2pDMuE2Hvzl0feyIWjPCwH/X1UT+f
         fLrWOyOHubkYvumbz2hcrkLMfrOW6s0RPaVa96cG9RU6TzoD4wZF0z9ldX525zzCycxv
         yaSEA6W/dNI05o6TuC8yhB+aUrdo18pfQbIGHSzz1HA/8k5HxzmdYiX508SLt03No2Ky
         9odCx7vOTCc6wDiCgDCHhXYGDioS733KNvbRWN6v4C7/77iNm3cyytWmmpcmBHr0A45S
         ePDw==
X-Forwarded-Encrypted: i=1; AJvYcCVTzENk17VBv2oLqwJ5yPZz6Gd1NvpqL7oCxGNFVB3qimPDeDgF4DTng3jXAJXHrWgPrfZIu4HtkRywvHv3@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj8OPXv3MIjxqGXqZOVZXYzthqI00LFMSPXsSBeNhy8OYq+nmS
	rzwnTxrzEjMNqkO/Z6GrYi5n1OCZ8AyyNLGu2Zy8OVUeyWIBSeo/ZCIp
X-Gm-Gg: ATEYQzytqQrlbuDG7toKUhUQEHITFnEr+ipnta82O7gnamA95xiPcoO3GG1e4CLDf2e
	Ho9ytZCeomIE5V5LqfEhZDJwTzQZmFgZgtkvGJ11xBFAghjw64zfZHw1dmpXEav6ydLeOWbRI+u
	oPuBD5KndAx289KPdpENcoxjKu42onYD7wwzWES3i34bYXldUHh6cdewYBLRiTcp50DwBpsoOD+
	sLmdbXpyEX7PWD60Ydi1Ovdam+AtCEs0s6U4jeP2QjIybnSn5RKNIVacIyesz78to1XoNBPnec8
	il3+vtcMlrWWR66hxnm0cIZKjG9HYeDraplFrmKKoCKAfbKiv0Cdbui0N1ydoudqHqwxItZgXOH
	1d9b4ciXuVXEgUn357r1/UFnEn9p4msrUGFf482cXwxMlet60cgtMpDOKZAalA/hyjrtoD32Jso
	HQ41GL0cCKNpXqjCiBQG4kHbQJQ6To4zD+aKi/Wag+
X-Received: by 2002:a5d:5f84:0:b0:439:bc8a:78ac with SMTP id ffacd0b85a97d-439da89b707mr29350914f8f.40.1773168539054;
        Tue, 10 Mar 2026 11:48:59 -0700 (PDT)
Received: from DESKTOP-BTQF5RC.localdomain ([85.110.79.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae46353sm45343112f8f.33.2026.03.10.11.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:48:58 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: giorgitchankvetadze1997@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	=?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: sh_css_param_shading: Fix leading space indentation
Date: Tue, 10 Mar 2026 21:48:47 +0300
Message-ID: <20260310184846.1359-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310134636.65227-2-giorgitchankvetadze1997@gmail.com>
References: <20260310134636.65227-2-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

LGTM.

Reviewed-by: Bera Yüzlü <b9788213@gmail.com>

Thanks,
Bera
