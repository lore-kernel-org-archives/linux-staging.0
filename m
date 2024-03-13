Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481DB70CBD;
	Wed, 13 Mar 2024 18:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710354088; cv=none; b=rWcY1Prf6tz6w3z1wOv8MkgOLgjQ/WZQ+XHSgYWIvY345xGhpUqhbTaW7yp3WO6my5XDwErXdkxGu9CiWFrNIgCE/wMIPtNkMYTBcdvfXPxUIwgHhUKtKGBLFdIn8w7tWuP+QG/NnaAceBWrAS2lDsE21QeAFlxCwdm5cwSSTLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710354088; c=relaxed/simple;
	bh=6rFg6CcKMLD14drzCA3SHo3Z7zKCaSKlbg5GJFtZOhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EkZbKRKtVvkAxcyGZfLtbv8yEE9eGulHSUw8AFc2nJee42dMgFEEQDemltw5uRdqU0ngSVHxcDfa6vSJjUJzSdXNPwkpB3qO+We6avwIjBlncQA4TrEbyZNzJ+x8T7J3xalS+Cr637iopzxCc9ZQ5ULB0HA6gY2MoQi0nQAj4EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vo1JFRZy; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vo1JFRZy"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dc49b00bdbso918545ad.3;
        Wed, 13 Mar 2024 11:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710354086; x=1710958886; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3sV8OWgEsKS+n96/9q+dNrgF4gsdo3YO5aFuikQZDqA=;
        b=Vo1JFRZy0j5oeq+e+pC74pZnUP7yO1M9ijkj9wi7mHA19iT9GAidwZ4kkYBe0CtITs
         /vc6Tt7Ao4G6hkdB8Ejjnl3TyFhCX+jFfIOZM09k65IqcAugZD6EXAeaDZJ+CjPf53MH
         gclFPFcKG6trqYHPPrJAQlPaQGL4255xcyuXourFhCM/yXw2Mvh6s+IqV7zoW+/g9/Ed
         2z8HJi69U8pszTHawAzDT/27TD3GlwRry/3V6wsbpR0S6875rNmsfKGSJWK/+dmwOiIT
         zUdvlNw0qgLnFlm5S4vK5JJhYKQI61/MeJWPuJzy90QkcPtinR7t5DDyfV8AFCccxO6D
         KO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710354086; x=1710958886;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3sV8OWgEsKS+n96/9q+dNrgF4gsdo3YO5aFuikQZDqA=;
        b=bfJIuuY2jy7cpJhd1CedOzaqzzAIZBJbI/Q0V3VtLbsJRRz47nkF0+Xxb1rZ6k3XIz
         0Prf2iRmmv06HAE4wIFznMeKAJzu64ZjZ/as4swe9HF+TnqkTHoXwNveF/O/bf9bkT9/
         pw2P5inZn94xT3gtTiZ8fD5d8BFmiqPYf6hbP1TWUzaC3Pc9G90x1HQyy0VPCcK5EG21
         b2a/uVb9LD+SvVXF3QtXs0ZJBks9xzPfrFWwtz3am+bMiqlHx3t9KE3MZei8lbhMrxGO
         oXlr1yzdQmpNeOUq6DEbqqE2Sja1al26nD3M+M1h99ZQYJw0sTD/EzUUq/W/1gq0Y84a
         S2Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWHzWlsAzsJwYKzCTzhlLvY+uRN88L/jLKSpBltM2TS4N3HbT6HiQNHE7IJfwKTCotJAuc7bCU8fqYCxKI3oLt6i1JglLBO3R3KUs932g==
X-Gm-Message-State: AOJu0YwQu7+Xs5icL00l5TXPyI14J9SO0Qz7Qbf0W9G+0wrQB1XDRwmM
	wpqMQty8EEjd124X9DypuHdom4TANOs4t1fSQ9APYUSe8hwxVmDijGNW5YjQcZs=
X-Google-Smtp-Source: AGHT+IHFppbnb4bOvcDyX6Y/Vwi359p3T5moeHDqQ8hYM6Eb3swg94IWpkuT7d1ejOpLNdRHa5CHag==
X-Received: by 2002:a17:902:b784:b0:1dc:4199:a31d with SMTP id e4-20020a170902b78400b001dc4199a31dmr12133902pls.53.1710354085965;
        Wed, 13 Mar 2024 11:21:25 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.67])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090341c400b001dcc14847e8sm7282436ple.138.2024.03.13.11.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 11:21:25 -0700 (PDT)
Date: Wed, 13 Mar 2024 23:51:22 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH] staging: greybus: add comment for mutex
Message-ID: <ZfHuokO3pQXMOxcC@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch adds descriptive comment to mutex within the struct
gbaudio_codec_info to clarify its intended use and to address
checkpatch checks.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
 drivers/staging/greybus/audio_codec.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index f3f7a7ec6be4..1f97d4fb16cd 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -71,6 +71,7 @@ struct gbaudio_codec_info {
 	/* to maintain runtime stream params for each DAI */
 	struct list_head dai_list;
 	struct mutex lock;
+	/* Lock to protect register access */
 	struct mutex register_mutex;
 };
 
-- 
2.40.1

