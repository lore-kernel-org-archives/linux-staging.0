Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DBC1EA8A;
	Sun, 10 Mar 2024 11:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710070149; cv=none; b=JQ1z/tLowC+NTBnqbvumQ9a0F4t6pTmHbU9N/aWDL+GD8W+qbvNEO/XsDVtbgCGCc9crpuPFFdMSOboOpTkNBU1WMHGmxKbOSMkdeBHXVZ6sawnysvj6YWTfTZYWD411EgerHQYrY6lk7+XF35uqr5pz4/79XakpAgRAHYT973Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710070149; c=relaxed/simple;
	bh=UXY8Nu2CuYJFbey/wJ6obryvvQYbh7HSmS3W6gHEQEA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tht2SWqpXdMaEXN0TWb8GcVnYXM8E1dFmUyE/fyc22ogF+BbyeQKP4JkfgStvws3oQ2HyC5O6aaEUvim1sY7vroT7CeQoU60nxFYsdAyMgq6GqHQv29gmsoankbWcezQJN7cngerE6fCErD/ajRxanVKdfGX55zot/Sh2e3S1Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+F5om6q; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+F5om6q"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56829f41f81so3191019a12.2;
        Sun, 10 Mar 2024 04:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710070146; x=1710674946; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UlHLU+xOG4sY5pS2qF+8sjU9e8NVUB/U8gNCqR6e1c=;
        b=f+F5om6qlCbaqcdq1x7c5fhfxUO92L67l/K3P7Ll6mlJhbztEKF77IlOA4f9KWMuLD
         t8Cmeh5+tmdny9LbgAoOOgDGMjXnsubatz7YvzqwSEESxx54rMi3aRhBtc6sFO2XzVhS
         1h+zpwHWDaH4d2Tj9dCj7iCSbIJ3PTB9AbdpcvKTIsKqf8B66o3bqrcC+xsKT7EQB/rG
         ffka1lYHDOuwX53Q9g8VMKFblH8UfI8s3YXwEYZNI5es+ESfT39wzty03r/yq+ZcyeYD
         MuY9jFamdWPlQyGRm6poICI5kOdsWJ3VvykH0+Lk0Nk7lRSzeFKIhKT7drcEAPYO8OQO
         JGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710070146; x=1710674946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UlHLU+xOG4sY5pS2qF+8sjU9e8NVUB/U8gNCqR6e1c=;
        b=QvrreWGgq7oZaM/46MJ/k5DXvZ9yKBNH8qb99NbF7RwNTvydguxCmOnCkaTCyJ14LJ
         yPzvV5WRtahPCAqZICka39DEpbhKm27+eJA6gMZka84rJMHOykBznoW3GHssFlg9MnmL
         2uyQakv/X/me/8cggMASMI3z8Z7bEuJ6aHKfzAsMtLW/ryi2wwswgAgG4nUZEJ18bN8A
         xrvV4ciYpMA8rKZV6dbpCZKTG5jctVv50695rBdMaLe1gxFFyKZ+dtzoCzzqJFvhlc4X
         NNHNCMsnpesyEGOYzIdarZJA5maVuSR8UXGZYBtUAZUB6t1je/vzruKHeZsYyh606uv7
         tpiw==
X-Forwarded-Encrypted: i=1; AJvYcCXccfTrp5j0T+wdMA6ykX1OEsS3O3LKGlL1DLXz5xh3WsEIgN/N0CVXtY9mvXvz39AkQ8abJjUKpclcrfZpFgU57vRd9z/p52ZcELINBdAQdu+2x2KSYYVZvdr9sIlreS8w/hi36Y48CQ==
X-Gm-Message-State: AOJu0YyVS8a12hJL3NtJPjiLqriZmaZoMnLo5aFYnzB2BtajXJzB0J/J
	i7qF/bZZM1lX71/ZuDQpKVB5qgI34RlRCPuY3QTdRdfn8fJonw++b4rbjVny9zw=
X-Google-Smtp-Source: AGHT+IGWMS122/SndBhYtIPK92ep0A30gQHZID08PxFJdUBGbbVVrspNaP8w65cKJ+vuO6L4gEWW2g==
X-Received: by 2002:a17:906:9c86:b0:a46:1c57:aeed with SMTP id fj6-20020a1709069c8600b00a461c57aeedmr979592ejc.67.1710070145679;
        Sun, 10 Mar 2024 04:29:05 -0700 (PDT)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id t21-20020a170906065500b00a45621ded4bsm1861883ejb.146.2024.03.10.04.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 04:29:05 -0700 (PDT)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie,
	johan@kernel.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v2] staging: greybus: Add blank line after struct declaration
Date: Sun, 10 Mar 2024 10:47:14 +0000
Message-Id: <20240310104714.22224-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240310053718.6435-1-dorine.a.tipo@gmail.com>
References: <20240310053718.6435-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a blank line after the loopback_class struct declaration to improve
code readability and adherence to coding style guidelines

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
Changes in v2:
  - Make the commit message clearer

 drivers/staging/greybus/loopback.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index bb33379b5297..4313d3bbc23a 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -101,6 +101,7 @@ struct gb_loopback {
 static struct class loopback_class = {
 	.name		= "gb_loopback",
 };
+
 static DEFINE_IDA(loopback_ida);

 /* Min/max values in jiffies */
--
2.25.1

