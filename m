Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C591D6AC2;
	Sun, 10 Mar 2024 05:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710049070; cv=none; b=R/hySg1n2phdOX+aEsQGOuSR4n0Bq17z58E36MPp+KqWApoRbSEjBe2HXK3IZLQl16rytWURnT/m2NqvOriJC+Bunmz3OMyGQ+3yv0iNQiRbkKM2BCJXvSpDt7FngNdIQ7jEzAaHZQuEy1/Wb3B77hqS3I8e9DC3xCHN2x9vi1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710049070; c=relaxed/simple;
	bh=muI7a/7XpWl2VIIKBV1KOIR0E5txJUvtU7E42lzzVKY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XpRXum/3AO2gCDfjwaMQ9z3U7SksgcEzBxysUC3ajD8/i1urGtqlGpzpd/DkeBc0Kbv3WW3KK6iaDHKudZTF6da3iSzngLi4AtrN5utwtRU9Z2xUgL8AM4MEEZuJTiNLoiqrKnlIBuVeNwwtv0RI/JeMC3hIgHVLiaIZ9MM6H0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Edevg+My; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Edevg+My"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a44665605f3so517215166b.2;
        Sat, 09 Mar 2024 21:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710049067; x=1710653867; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0bvFozMLp1Nph4k/uTXAvTGqKR6wiY5/fMlftPWcmSY=;
        b=Edevg+MyRGdzHoa56omnvdJRUaw0Z3I7+3QXyA+qfcqEJt9EtPYUmG7Seb4Unx8V7t
         BGKsDR0vExaLvZnNpmYVMrL9TxRUMFVsAI3eRccjGUqlzY31hGynnFhCDGLSzlgFZFg8
         1VqO+Zcuk8AklgOfv5CoURQEZ0yO3v1bap3Y5lUMMcSow0Kil30ntVtmRmN3fTD0Btio
         UQGcySMUzxV7l3XWW2pxWM+TSIFo1P+tcwnj4Hd+g8FkdMjpHbn+Vv5Z9gW7DuraVD/e
         8KuDFBHgOF+WWzfMrHdC058AnFKSZHm/EO1ESGC5lBslYJF2A/HVqDxQ8NhcJhVPAUHE
         m/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710049067; x=1710653867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bvFozMLp1Nph4k/uTXAvTGqKR6wiY5/fMlftPWcmSY=;
        b=gpy3apG0bFCSpWpQ4OMqJ0MPU1xHx9e3nbwXS/TcU3rli6LPQGo1nvHBA2DT4JqXRc
         MOpwMVbDiTiHRceIkKuwTmjf3C3NyZ1x0g4dH5RjyrOV42Yug4E88GPagvD6rdQZ27eM
         FTkKtrt4s0M7sOLiJjne+JtcepGCBHPmSL2eSwuUfSOgQJHLaj4VmqFdlQ9L7zSwT1Rh
         CaMx8bC+dxbFbCzer/wCyk9OGphvoyzxXPXzL4w/UZNP3NExVdLtiyf51EjDWKwZHHX1
         IEHqfAREZ3eYT2lDVhvgZeGU2HgaaZrgGwF3lFo86ra7aLGS2/ZlAijx7ArR3R03bGAb
         g2zw==
X-Forwarded-Encrypted: i=1; AJvYcCUrIh7zwGqcjpf6TF2WAWUYL4EBs0OodoUM48aVjyPldXKlK5tOi2o64U0Jdgf/NKLE4ub9DI6QXCQGBzJ1296A20PMss6XgSCas3YQcXItTHOl9xOsQI+Grp6HxOp7DS+Ixtc37mnXPQ==
X-Gm-Message-State: AOJu0YzfFbt/sG3AG1CFmjp+kRWvksZ4ctzkslOdTcnuZilT+KUogR6/
	Y0CWRzjkARFcWDCo/kUrnBPXHJzgGD8JwP8msTddIZjqwXI78D9e
X-Google-Smtp-Source: AGHT+IFUqQYyL8pRAjRAbi3LbDEzFXJO3zhjOsBwt3H+ymV3jRvveqwL3CSyz/u5/ljHHNZ0/FzDDA==
X-Received: by 2002:a17:906:2a50:b0:a45:fb0f:d210 with SMTP id k16-20020a1709062a5000b00a45fb0fd210mr1681509eje.25.1710049066899;
        Sat, 09 Mar 2024 21:37:46 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id bx4-20020a170906a1c400b00a4528658771sm1587017ejb.31.2024.03.09.21.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 21:37:46 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie,
	johan@kernel.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH] staging: greybus: Add blank line after struct declaration
Date: Sun, 10 Mar 2024 05:37:18 +0000
Message-Id: <20240310053718.6435-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a blank line after the loopback_class struct declaration to silence
checkpatch warning Please use a blank line after
function/struct/union/enum declarations.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
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

