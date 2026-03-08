Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A03532692B
	for <linux-staging@lists.linux.dev>; Sun,  8 Mar 2026 11:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772970039; cv=none; b=Bl6ThQ8qQ92QPu8KdJKoK2IoIxz4VRb9S9RltXzVSQ/vtBABSwuFAdMfAM2/xHjjw9GiCQth923zmDw6Jmtr/JEjQQcI3JSJhsmuysuPNRZv1JvItHqmjEQWv3k/2FDQLgABGE+s7Jfff3bk0oLNF1I6u0KiHADO0hmQBGkhSy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772970039; c=relaxed/simple;
	bh=C5GEX5djh6spCt+K0hRjNVg1VNComwREzrQi6+OmkKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OjCcPGg2aamjRRLaYP6O222yY7brFwYGBSLeV0CAedtc/SGuR05j09XpQ7K/Ie+7BCTm3Y50oNEEX4fa2PExSo8Y83VhbCmtq2/QCzoveNf05yro02JHvHUdVhGxqjj3qLjWZeOdXBDzMeqeAi7Ay8a0yNYcDfzcCzvqBht/+uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2E+YYmS; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2E+YYmS"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-48529c325f0so12069385e9.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 04:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772970037; x=1773574837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5GEX5djh6spCt+K0hRjNVg1VNComwREzrQi6+OmkKI=;
        b=L2E+YYmSAv9f+o/KiMEE/VKrLQ7VzsKdCrpcN3EwuOWB+4RQo2df/4QHASYrJ8i/db
         ybvwHYEjsl8miZZO3xtBwQn8yH7PR02iD1+F8Tf9u/cHpbZ0Vp6uWyLJ5ST/fgZhJXLZ
         H5ZZuMvrof0TBX/RxwbshGF3jeiUOnSRivIa95RKGofBvj5yjCrweaawUdx9nHdvHkjK
         NVItSqU3qqBrtsfVybaJXSl9JWFnvXiDvEdBYP8Rns+0FGhEOKhjEGsLyAl33AKtGLDl
         FDFy5SxQ0VUZX6PWuMm2sOfJBg3InsNC9e62V/K3IcIZqsJjseyOxAIFrDZboyt4uN+Y
         rloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772970037; x=1773574837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C5GEX5djh6spCt+K0hRjNVg1VNComwREzrQi6+OmkKI=;
        b=jxaFhi9iUB7z/ctZvoZtwWem2gt6icHIrK/7oE8SAS+yWWlnJWoCa1QUYI3OznZiSL
         k18u7aAen/EKj0PIvS007gAtUTP7YkLoXkcZJLN2uoIHO4/w07nVRihps3zwzlo7HthA
         bTTYFFU4euwsRoZPVF5RGMRidTltL3OMuk6ohnzGXjDU1bwFmL4DmTvWkZ83n3StkZa6
         QlvIpNDJpwAnk/VdvzpEwGNRY5VyNLGRI3p2cySEzqCXrlNbfm4XWELQXWxPQVrxAXk4
         H7nmdCZPMpWGObcEupNpjvDqGO0R7EJSGfdwskyRRXB6Jr9JubepeVAI1nmVi1Pdr0dJ
         IUww==
X-Forwarded-Encrypted: i=1; AJvYcCXINpOoBvuOUuTneV1i4c8c1goefP5SzDi8h+PXp4b1IpygvZEQimE/DKgkEI3NhxY+0BX/UuOfMnwKNc3l@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6MzSj6l77j5P+bgQ3EXwIzEWmA713Wb8hW8L5EWIm6rOUz9Bc
	cSCejwltjX9ftzv0MGG9A9EJqvblsrXHUdMm1S2YfZYaXJIKiVgujKJT
X-Gm-Gg: ATEYQzwqsVH6i+y4BAnHS+5luVCLA+W52mjjpGoD8BBwJ19bMY+9fQ0uw+kBRn6B9FX
	oDonSjpNkvFoLpCzyDQg+P2FewtjrD+/DxTjBHv4YKeRc/ZVZwHXHE0g6wwfBIAw4Wo3HDvM2y9
	YAcUt1jL/woeMk9PcUrQnPPXlWjPLxMoTZX7NlaDalTPZTB3wB6Tvh7br76iUL4L3N/RzkACIcg
	qiFsZN3FCajx3UuWcF3HPXtpmu60U63htH2e0+pZrcOrPeroYxYcS9oIMcx9SqKs6WPbZHWcAOR
	gjmXDw3oRhT+3dGAd1j77D4FdVgLw8cgpEogd9uI/0Aiu7K3yALTdrb30WQcrvWd/Yg5MBYxF4v
	TyHt8wNGs68XKwQi4bEmcLbd9Un75S8IAJg2I8yV7gx1O2mUyhevM+vU24OJpIkDsUPDhlAYuk2
	n+z01o49JFVXfmSG96KK8/Chy57w==
X-Received: by 2002:a05:600c:4e8b:b0:485:363b:fafe with SMTP id 5b1f17b1804b1-485363bfcc7mr24519235e9.1.1772970036539;
        Sun, 08 Mar 2026 04:40:36 -0700 (PDT)
Received: from BERA.localdomain ([31.223.72.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fad27e6sm271478135e9.3.2026.03.08.04.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 04:40:36 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: krishnagopi487@gmail.com
Cc: b9788213@gmail.com,
	benjaminpotron@gmail.com,
	daniel.baluta@nxp.com,
	gregkh@linuxfoundation.org,
	karanja99erick@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	simona.toaca@nxp.com
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary braces
Date: Sun,  8 Mar 2026 14:40:02 +0300
Message-ID: <20260308114001.1215-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308031704.4907-1-krishnagopi487@gmail.com>
References: <20260308031704.4907-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Next time send your V2 as a new thread and after --- use version tags.
Look at this resource on how to make a v2:

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks,
Bera
