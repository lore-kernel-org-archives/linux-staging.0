Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5823FEF
	for <linux-staging@lists.linux.dev>; Sun, 22 Feb 2026 06:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771741341; cv=none; b=Qjf7zQCe+JwnUbVjcU7QOiXseyenKYStz0/1xJ4ekQW9d3oGyYyYzIMH1eFXyd4nKmRjRBHUoKIpog3GmfMKyk8REbxkeQvZ8jAuIhSr9PS70xFxdNnCFr3FvjeUf6sPaggK2itCf0lZQiihaCuKPxzAPYIIiv7+0kHLWezASdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771741341; c=relaxed/simple;
	bh=dDThAu/xlRaSsS2m7jaLLmgvAfGHqPGnWWlxlVsxCrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=liggGaZsDEI68Z7UoK6inwJ2PT8yG19vAe2PXz/kSZvdqUeVxAPJpsuxRAo7eJSbWr7g3WX46t2UNhR/Y5U+ejFBqyMu77HoZ/mNCGWUTxr9+hydzM7vt6VHa+5E/fYDcxLa5kWNXk+m25sPxJXNhKKLirUYZQ5i1+qm5SSlI4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=StUMHbjH; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="StUMHbjH"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4837907f535so29357235e9.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 22:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771741339; x=1772346139; darn=lists.linux.dev;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dDThAu/xlRaSsS2m7jaLLmgvAfGHqPGnWWlxlVsxCrg=;
        b=StUMHbjHdkvhU4nG8NHOfVwLCzwBaXgk2hLcoWOrGgS+XTe4fYov8aWsE7Df2oxBgt
         jAUgD5IhMoKDq4+bsGw0sOnmHDHyJs4o7zAQR2xQO6DCpf/ZEDBUdbHQTfWW1hd61kOM
         BorAlQVxja1ERIvBVgH5B/uRXW9VSDtEzbdaWNZ2gtilpihFrjNX6U83YETmXVKWEXQW
         i3z7c/TyIeyGBuGZexmIq3359q7pqp4V8/8e2KV9khiEPEEWcvRAyYBfIYtRe/aVZGwB
         /4lez3Je9/6zt04fp4zJXsh6Givpl9nuN2D6eSqCarxw1Ni4QPiHavnxUPFRhbFfXVmf
         H3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771741339; x=1772346139;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDThAu/xlRaSsS2m7jaLLmgvAfGHqPGnWWlxlVsxCrg=;
        b=V8uJpi5TgO3WK4Ls7JpF+tSuF7I33iv1fvHRXsXUXiFP5TdH/jqGdh14ca/vAte4ol
         vgBjHaq+0flg1Jhtf0xVPX5eJS9rG5bmLinsLPKS6wTP76DSvs/MShGcVYsEC/eNSvmN
         rGN2KLROMEhv3jVNN1fnqh3pS9luo8stp8eGfD8wCvGGNQVSThzSZ9AiqDvqfePyUnkz
         JOpOMsu9LksAhnC1fnYEBWt5Zs98sXDIcIQY4WZbMTEJMq8a9q+DtSDx7DS8yW/WwezS
         8Gjel06CFYu/vskiz57xneDkzmPwM1hGDil71NWYzQA5CtefX3HUf25d4NUC6LqbcE58
         cnzA==
X-Gm-Message-State: AOJu0YyZ1OkhKuFHX2foUnPR782WwTjlTNC3yVppgcB25eVYd+8oR8qx
	ubGvJuj3l0EBZssr5lz0eA7LUZBzhQAiVC6EFl0KZzStmeDf6+rZgP7d
X-Gm-Gg: AZuq6aKaLr3qQg9eme15opKVpJi+s4yusZ/9wjttYFROLWVdLBkSDSIEtE0sWKmvnoS
	P24WNxk+uGpde4ndEMtLJVRmggKGNpozegXnUnKCiMUAlFLJZs5PPjicy+5pjF5XTNRFWIFVcOw
	cSS2XhUfdVxThSnxuPNO2tMFSz1zRlXqB3qp8kauJ9hVDDOlw11yKfO0Ez6mQ8An9k99oP064L+
	V8qTTx0jejrCN7/J84TsmjaGq8FJtEIiF28SJF0FP6IljxhjxvVsWebDl2Gm20SaYFnlsLUd4Od
	uwAAPKGkW7He8/hEvXijmbuSPlBOg22BXPPdU9DPdcZ1WYc3p+SatkpvQxEAaAa/KM+qsXvIt8B
	plMUaPyyLHE8ZD4EwGYnnIzZUg3QY2872PP7r3JL9jwl1S2rIIv2kGM5ba/K7XPN9ONnf0Jr6Lj
	UXwmDiCKgypA==
X-Received: by 2002:a05:600c:1386:b0:480:426e:9d38 with SMTP id 5b1f17b1804b1-483a960371amr73009425e9.27.1771741338595;
        Sat, 21 Feb 2026 22:22:18 -0800 (PST)
Received: from BERA ([31.223.72.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3d88sm194468005e9.3.2026.02.21.22.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 22:22:18 -0800 (PST)
Date: Sun, 22 Feb 2026 09:22:16 +0300
From: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
To: wojciech.develop@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org, ethantidmore06@gmail.com,
	arthur.stupa@gmail.com, horstaufmental@gmail.com,
	kaizhetan@yahoo.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH] staging: rtl8723bs: cleanup rtw_io.c
Message-ID: <aZqgmKwlS0z7xGo2@BERA.localdomain>
Reply-To: CALGt97_zniC2O12ge7-5tHTXQL+4PGgw8fwdx4jMTb-AEYQeLA@mail.gmail.com
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello

I tried to apply this patch to my local tree, bu it failed due to a
formatting issue.

error: git diff header lacks filename information when removing 1
leading pathname component (line 101)

It seems like the patch is line wrapped and diff --git header split into
two lines.

Thanks, Bera

