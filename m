Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4C74DA02
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 16:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709570209; cv=none; b=Y2C52RGNrFsBpXuuXZSzTIvBALyAQAZXFIa+psEw93wnrvcdV2POkUpOwqGhLIAjZoFir/RIzU6rYIX1ss3Kx6naPtzTPH5Hi/UE8TEgbhthpaBenya4aUWKGLilS3FqqIGe05jzdcAru2lfn+DXDcpijy1O9toq8pXIHt7weZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709570209; c=relaxed/simple;
	bh=ndP6W950nxVn4qHDJFwlwsY9mT4woYScq6QD7ill8HQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QGHUt9OZJPjCj0tFC9m0iJ4r5buYKT6ZZVlvnEaLqEI6RRAhxpFauVxQJ7Nd+a4lerNSOWcC6WZSVOAcjgyiILnMdwZmQSA42JguLLPBnQinvTHdbilbGPjUayHkGeTydhYaaxLY1ilWHuzGFt67NV/6WU3lIW5LGlLlNJWhk1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktVzA8Q0; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktVzA8Q0"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5132b1e66ddso3728018e87.3
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 08:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709570206; x=1710175006; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iH3HOs1Afpe+dsvj9hMyh2QClhR0RzHFwjAwu6CzO0=;
        b=ktVzA8Q0cexjski5f5JApFAxAPOxXCQo56rOSwvVJMZi2xDkF9E2D/mq5pYjcz0ofa
         dqzNOMasq06JbZPXlZfcoSuj1PYYLmHeOrNLjCJLSbpp9YIRD5yT+oSpgZnqvSIgSCO1
         2/hxNlqNSVvkWzZGE67JmNA5xq9FPbcxa4AEp+6mbs326r3vrdkxh+wfqG7+tkUjZtpp
         bR3erCw/n2A8FIN7xU/MWlJHNDxFhJ2TcAbPkLwM58d8iXZlLv2hMDZP/ci6LeFqjqvF
         uTVv17AoXI2pu/i9inlbMG2OIu/boqJeHsohci77r/dYoKWSZ2zHy+AiNpDX3Sw8Vdfr
         dkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709570206; x=1710175006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iH3HOs1Afpe+dsvj9hMyh2QClhR0RzHFwjAwu6CzO0=;
        b=mIl0jhQ+DYxxAnLGJTlDai1PC88Pf4oyWI4hTSgNB2kOjjYqFqVq986cOt31PSWSBK
         5Vwf3Ue0NOLPzFfQsXRSq20HOL4hz3zMg2Phr//unuS8P/nkObntwsjsudv6wlEzrRI7
         YfH7lKyi0g5PHCQuvozIh01H0dsB6SG0hr1EEwOmydKnCBICH3P0qTkMZSY5otJFWxUk
         18LGJPn/GsusmT9jXJ57n3jDuhNhCtr+OsIklzlbdXw5tnZRVVOlH7/0J0BBbLlWrQuw
         hsGTnuFXX5+vQAJfn/mxMdgkmiVWdItszpWMXsGPPRJHGneeTIP7cbXVIrRSCr5Ov8q1
         KVig==
X-Forwarded-Encrypted: i=1; AJvYcCWCBj9ecoHJeOMT9cpL0bTLSgiwKZ7XZSBl2b6ScGVASlA7dpp5sh/lrnqB9pTWFRYrvqDRCjCi6iGBgIwch+vLabry2ci2FUbrota5gg==
X-Gm-Message-State: AOJu0Yym/FBwiyKHyKQJ5UKZ6vOH6s5EYQDaTDS3pCBx+7FtdFkhe6k4
	I4jkjXS/HAAhCg4+kYTUn6oxaybnmLntenM11LpbF6q547l2F65J
X-Google-Smtp-Source: AGHT+IGzY8HivskbHvcEOLKVIUU3h71aEQMFQLNjY/Kdma9YtktZ7st8Hs7cKc9SoHT2IUYQaT636Q==
X-Received: by 2002:a05:6512:716:b0:513:2c86:3498 with SMTP id b22-20020a056512071600b005132c863498mr6047788lfs.48.1709570205455;
        Mon, 04 Mar 2024 08:36:45 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id qh22-20020a170906ecb600b00a4558314ec9sm1130924ejb.192.2024.03.04.08.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 08:36:45 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v3 0/1] Staging: vt6655: Parameter Alignment Improvements
Date: Mon,  4 Mar 2024 14:26:02 +0000
Message-Id: <20240304142603.32982-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <08387340-4611-4403-b38f-75d63eb06d2a@moroto.mountain>
References: <08387340-4611-4403-b38f-75d63eb06d2a@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This V3 patch series addresses inconsistencies in parameter alignment with
open parantheses, enhancing readability and maintainability of the code.

Changelog:
V2: Modified subjects to be unique for each patch, as requested by
<gregkh@linuxfoundation.org>
    Fixed the warnings in the patches as suggested by
<philipp.g.hortmann@gmail.com>

V3: Combined the vt6655 patches into one patch as suggested by
<dan.carpenter@linaro.org>

Dorine Tipo (1):
  staging: vt6655: Correct parameters alignment

 drivers/staging/vt6655/card.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.1

