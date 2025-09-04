Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC6C1F872D
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 02:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756953511; cv=none; b=I6sPJ1z+SN3ttnwM/IfI97nXJh3qVPK2i5e6fb/XDFz43X5MwutosLgXeWbs0g3FzerZBe9GVcxKw7+iXalCfK9gtaUjiuDhcbLgIN6SufTObr9GS43zzX0vjabYtQkQovRKbys8NB3Yza3GYbc787wINJmIn5l0LYr+iyU79/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756953511; c=relaxed/simple;
	bh=gt/1ux9jF+HA7NGZH4b8I8x6guW0hIucfUmZRaX8Lnw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ILTM96QY5qRFRsfTSrZa/Z1+6q5L6QlvXkFNvnLRaXwfaP+AG627HRPwCBZGc7Z1VETSeyh/LVn5UnYXR9pTdvPT1cuim/MLN5jgMEXtdTd/I7UOhbusH/u7sHHDnlYH1GB/d4t8s8MZHvcQfvsIV9SeMsFChSesCe9ckT+GD/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DILWBbTX; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DILWBbTX"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-726549f8161so4594826d6.0
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 19:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756953509; x=1757558309; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gt/1ux9jF+HA7NGZH4b8I8x6guW0hIucfUmZRaX8Lnw=;
        b=DILWBbTXyhKBA4dTRTNKewgpbT7nUsVCwRPHkx1wZVNPUIjkLv2efEbXo1D5OiTgpS
         IuTp0C0ZHWHnn8ao4wyk7GVfiV3uQc3NerpNux/UOJ3cCq5lyw7T9KuOisL20nG7hwdQ
         +uryLS8eSstAMsoZlowrIMk+Vsv5HZrBL0lImoeUrw6bvhIWaBLDESfebrZhA0btae20
         5+EGlhyhsyiMHLoox4J4Irc4i4b/Sg28wo5ZKe919NpZG4lChYWFXkhHfEmJF+JNbEti
         nzCUjM2Drrjrvqyw1dkgbh0qATBmekK5aSw7ZRTi7BSefJjZ2FtAD+fmMe9mKLR7xe3c
         b81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756953509; x=1757558309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gt/1ux9jF+HA7NGZH4b8I8x6guW0hIucfUmZRaX8Lnw=;
        b=gWx3drS4Ep6nJOoFL2UNbxk2qo8EiAp5vn0i8EMDKckCokI4hrfIuSRLTC7UWM9PME
         yTscddtMDSgHHQI82imjwYUjv5uxVplYNND3j18WN82l3g72VJZ2WR6exbRVMi4npS1d
         JwYpdz+pQacqUZd703ZeOxfN6KteO1udbtW7GnSYAJwbtqzmltVnrpzP/RHkzA8Y88eE
         Iq7u9dN0jOoVFTNXoz2sD9sYY8ZY1F/kemNsS6wgoDwys55AaRlUfQJJGTNS7rCO1i66
         lW8c5/6wtWPOFHpUfA//J2Kjy0jXKLej54RLucEV9MJ1+glEn1zGz/ggrMoZp7cNLRNV
         i65Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZ5VGvDsFS6dW2e9mjNPAFk8WDR+S5l/KL3ZPry7gH4raKtcstwZHWq8CWJDyLQGbc3+tA48g0Un9wFwQy@lists.linux.dev
X-Gm-Message-State: AOJu0YwbNLyDAB81HwkP+h4XsoPWjlYt2BXKsZSreLo/6BxQLDd4/m/P
	iSPWfS86dX0RxQpA0WGv17hwFCjnt7oU48KdP9mRssJYc3B1zk/9IeUj
X-Gm-Gg: ASbGncv7V8+mHjM5JJHA0obnhnZVKAnYqpZUAf5Xek9sqN21eSBWHU6l9p/a4xTh2su
	iQ3QFES1EF+SgBsvRvuO187UI0RkNZWDYNiXnYU7K21sh4caZ7E+gGvGa4Vv7Y1K/jJogoIRiyk
	wUDnW6zgjVxjxxIBS+LIPzkFwanIAqDpijAnIjiLgSMRaTu9MECS8Iy0eRqSmkaUZrmU//flHqG
	t05vzCqwoBLq8d9diShcEsikMbo5g6EeaBGaQzwvwt0gKh3Jy9V+S3HIJVhfoKg2iKdv7rZQoPj
	jhzJGlpUVG94ktHUzwDmd37wuKJ7WUjjmwB3AvTYdHGj2ypo8frrUmiECu8Xn7G9pIFqb7//R7b
	tm0MEcA0zuGxCjYRIOdcMtzeEc92GxXFpnTF7na2q9Ue7XixXc9B6pczu6SIifw==
X-Google-Smtp-Source: AGHT+IEUP5RyMi1VOlfV+ceyjVn2nI/9lfMvjpM6uk2kMPvXZW8k4AHW6Lneo77FQNkYuZR/4O7Riw==
X-Received: by 2002:a05:6214:2629:b0:724:271a:9750 with SMTP id 6a1803df08f44-724271a9f49mr54076586d6.12.1756953509374;
        Wed, 03 Sep 2025 19:38:29 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720add668bdsm38209776d6.33.2025.09.03.19.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 19:38:29 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: vivek.balachandhar@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: =?UTF-8?q?Re=3A=20=5BPATCH=200/16=5D=20staging=3A=20rtl8723bs=3A=20style=20cleanups=20=E2=80=94=20please=20ignore=20v1=3B=20see=20v2?=
Date: Thu,  4 Sep 2025 02:38:16 +0000
Message-Id: <20250904023816.216762-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904012529.215521-1-vivek.balachandhar@gmail.com>
References: <20250904012529.215521-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg and linux-staging folks,

Please ignore my first series — I accidentally sent patches 11–16 in a
separate batch so they threaded under 10/16 instead of the cover letter.

I’ve re-sent the series properly as v2 (same content, correct threading).
You can find it here on lore:
https://lore.kernel.org/all/20250904021448.216461-1-vivek.balachandhar@gmail.com/

Apologies for the noise, and thank you for your time.

Thanks,
Vivek BalachandharTN

