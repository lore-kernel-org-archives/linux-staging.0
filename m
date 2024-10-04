Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25752231CA8
	for <linux-staging@lists.linux.dev>; Fri,  4 Oct 2024 20:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728074106; cv=none; b=Dnl6m7mz1Sh7vu2I7KEPF8TS6pHCILsP5cza8bYms2LgDN3X2d7RUlnIZlgS3QHQog+j4EsN2ZGtvFEhJ/vmXTZbwQBfsbdgr0JOsT+LJIyfjIu4IafIJ+dkevV32tk3MPcJfmbzjLJz7TSC6Xxt+L/+dGoAkIWZxwRL4FL9Odw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728074106; c=relaxed/simple;
	bh=fQxqxvm/Y3nJCqrch8NSDiUYSIuSQW6jkRjUoBJgk8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lqf9RHj8wUZNLIkJPZ42SkFZMZ0v0b58xGy8oRdyKI+N4h1DVNW6n+TmSrGwvvOYzThsrSyMkyGQD27smBMTMrvtLpn3mPhQ5Q51ZJCWjJiNgaBnRMOnK1qTCvqS7Nfs2b/+AVzyRcMTvg/B3jo/bxKHn/jRpDCsMPQb5/3VjNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJgiL1jB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJgiL1jB"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20b1335e4e4so25258745ad.0
        for <linux-staging@lists.linux.dev>; Fri, 04 Oct 2024 13:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728074104; x=1728678904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrWCNsFUUmGIJDuvVTawBv5vSfC+UCfzRdwYzWDV0lY=;
        b=aJgiL1jBor+VhBxUiTEsdf1bp/S05iP/Dt238fyWWq8aKrerQgqYuHF8Epc/9d9oII
         mXlT/iQQB2zXETkWz0JlGXWz9Fjw47lkVEGsQIVRBJ11E4ayvD5Vq8jFDy0XqhUBifd8
         hEmTBINvd9b+e0AK/kcZbO6otOQ3Jaq1KSg7ahZZo97US4DPFEi4ENI9M7Gea8YFrjrb
         6NnJpIZpruBNHmYTWrQN7UOVGzNrRjMmMVu0xjoYWUswvGrPyBWV2rOsdM1pdBY8e9E8
         KcaMKVEwxQ5Iew3wZIFny5Sq45FHmMpprdPC1//fN8Lf4xbVY8keVbtqjAxJNNsnlood
         Hicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728074104; x=1728678904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrWCNsFUUmGIJDuvVTawBv5vSfC+UCfzRdwYzWDV0lY=;
        b=k4dKIfv6LQyAYC7j4sdMK3jlul4VWuFNzVFwZ4e59nisx0qvZuToYwLBvq9Ut8kHWD
         66FhwkNhlSid/dlKFBmiy2sLq7CmJYHtXASIuSnbrpxm97T+8wviQlNZxSw4AvNm/azg
         dUVokLu5Mlv/Da4oM8hbk1gaHIXGl99+aULEdF/EAFSjQQuqSkjnL+z3I1JtbJso+gY3
         mrKyGqKe2Dubxo6eAFCmDbCRIHT6qdEtP8dhILG87xTJuKrllkKHv0X/MBILvhVaNajE
         zfsvL0gPbjhEXw+xW2WX/XC+3S+SPIOIzljRPNEsVYzWdZEK9BoZQ4jhFC6ZgjtlHJzB
         NUIw==
X-Forwarded-Encrypted: i=1; AJvYcCVV3onDFj/x0JF34WZBLNwNP2Y+8HayAlFfxhTZZAGo6uABD46SIB/NBjunhnGFh2Szv47JhDy1DICHSPW4@lists.linux.dev
X-Gm-Message-State: AOJu0YxpEejYmF7pnCc94TiNVqNtNgPgQmnJqYTstq4bZR/+PUWKyGge
	H1c9Yb/FYkHMQ32GmeaUvafUWt9//bJKJdIsQGCji2KBodspfjpV
X-Google-Smtp-Source: AGHT+IHfQ/2pwTboCEbbzVBeENgHAF5cgqBAe0g8mWK53+4y8p9SRKDHYfw+tbGY/s2nEoLk4myELw==
X-Received: by 2002:a17:90b:b0c:b0:2e0:99bc:6907 with SMTP id 98e67ed59e1d1-2e1e6229e93mr4694510a91.15.1728074104233;
        Fri, 04 Oct 2024 13:35:04 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:ca9d:8e63:76a3:a5ec])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20ae696aasm370905a91.1.2024.10.04.13.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 13:35:03 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: dan.carpenter@linaro.org
Cc: deanahn@gctsemi.com,
	gregkh@linuxfoundation.org,
	jonathankim@gctsemi.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	rodrigo.gobbi.7@gmail.com,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH] staging: gdm724x: fix returning -1 with return equivalent errors
Date: Fri,  4 Oct 2024 17:34:58 -0300
Message-Id: <20241004203458.6497-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <47723ac6-9131-49f2-8746-1bc8845187cf@stanley.mountain>
References: <47723ac6-9131-49f2-8746-1bc8845187cf@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First, Tks for the response and suggestion, Dan.

> Most likely Greg will keep merging patches until the driver is removed.  It's
> up to you to decide if it's worth your time to keeps sending the patches.

That's fine, I'll submit a v2 soon.
Tks and regards.
