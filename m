Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48733FBB3
	for <linux-staging@lists.linux.dev>; Wed,  8 Jan 2025 21:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736370697; cv=none; b=jmgza2O5bS8aOvKiN4+Xt4E2TlWuyyTvqimM0eTvuIowFHJilFnvCb0cF9I7SVJcHsPGLBjV5XGPLVRpDu7mn3++5gHHnoz7/VtWCaB+ngdWAEIWZwYb8Kd9mOYZYTd/z4ilEC+Otx/Co6dgEt50JiyWj8+y+vvftAEx75dj1vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736370697; c=relaxed/simple;
	bh=X8uSD4sgZdpGUGuy9UwIDiaZApNmlm33kt0J+5bvMxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fvnqpROE9MUOXfs89AEw07IVHL0nUQJfv1ymV/CHb2VVInjHXl27lux+z4P4fqtet1p1dQIkbsqFloPzZgZAmttMECvLv+0a4vPu41r+aoBLPNa4+oHkePncH2XWXaVuaKSsVfsv6pVO37FZg/vYXw0tbbQxraKS7dzRj0WfR6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMutoaPm; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMutoaPm"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d92cd1e811so11034906d6.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Jan 2025 13:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736370694; x=1736975494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4n3b8qJskZJoiEl8WWAKEOk3CFfje22MCjyEJC4MYOA=;
        b=MMutoaPmoVeAwcyXbFJFhP+0/6MKm/x3M3GJbpzy9bTseTCJu35x7KsckId4ndUInI
         0vGzQ0lqwOIl8sA8MNpoZfsGqfFYDqV4aSllioSeS1AJAHxkodE9s6maHsbNczcYxCah
         kXVC2JbhxNwPFbMrdRP3zdqWaJDHO9uks7CTFga9pJ4kRt/IbtUdevrWhFVraEUK4WvV
         s6tcCdC/VYpb45sFeI36N8adj//U5pi05/GmUPZ9/FYxKXUiQeCSrnIIn1BgtO2gjjci
         4oAgx4vlkFqUhWtAlQkzHvHNmyvxYahO+egqJO02LMqi+Tc8yfJOWbiM8JPe7e+pT1H3
         40nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736370694; x=1736975494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4n3b8qJskZJoiEl8WWAKEOk3CFfje22MCjyEJC4MYOA=;
        b=eQSv5+t8UvXtq3wFWIen2hMVnu4KZyjrzrvAaVGYDa8DLRw7yVhj/Zf3teVDysyxT+
         U2du39v+6/4/b2hXphl541d3rocD96fdd+y0tm6SbilibWhrPH2jC7aExiqnWpQgaEz9
         C8IHEKzwSE8aXCaZqdVPOdmbX4HnCpeB93XttSpV19HAH1K4Q+L3SFiAbgYW2hHoZu+b
         2WWsqQjG+TvRxtHX4cFX+IQbnGYiPU6uAu+Uz40x+daQA9WQlRMTzOup+NCtvrLhuxPT
         +IO5zA9bDeHTjFBKvpiKIZ7mb6wED0rGrCfF7tPH9zEzHlWE4g3mBOmqissa6JllWJkO
         zehw==
X-Gm-Message-State: AOJu0YzK+SIF+4kxnBfj1bHdq5zrOgnSpu8/WtwYT0Cdv682fB67W4MU
	26IW1tAXhJ6Swggqsj/xioqJP2vucUwcdyU4QvqppGSeWIR5Gj0Y
X-Gm-Gg: ASbGnctmyo7g1kLZ/tM1dIOa8B/eFFqSPtfO8y6sXdvnFWawZExaCui6ODw0UwFO6Yi
	wPy3P940vdGKzj4i8CqBzGhLJSNyZttKOPQ+VpTuHEwb8MykUu3h5CL+gT0247Z/WzdGNmMJVxq
	k+XR++dOV0B4W83aMVmoZoT24I7d4Cpw6kW1P38UhhTBYt3ZBioyxbb9EiJEUE5PHljUImid1tD
	/rewmS1Qg+LftmrrD1L4hYCc8pknD2GpATbLdKEWrWDwFvetYONR0l4fBn5
X-Google-Smtp-Source: AGHT+IGERilrE+5m0aJC38zPow+upJ65CBZ41WMrMag4xw34RFx+wSwSoDYyOonPXtDx4KbnB7cdIA==
X-Received: by 2002:a05:6214:e6c:b0:6d8:7a85:59ca with SMTP id 6a1803df08f44-6dfa3ace7a9mr13567926d6.16.1736370694566;
        Wed, 08 Jan 2025 13:11:34 -0800 (PST)
Received: from localhost ([104.28.203.246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd1820810dsm189956386d6.131.2025.01.08.13.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 13:11:34 -0800 (PST)
From: Sandeep Salwan <salwansandeep5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sandeep Salwan <salwansandeep5@gmail.com>
Subject: [PATCH] staging: gpib: Remove commented-out line entirely (v2)
Date: Wed,  8 Jan 2025 16:11:27 -0500
Message-ID: <20250108211127.13963-1-salwansandeep5@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Per Greg’s feedback, remove the line instead of leaving it as a comment.
It's not needed for debugging, so let's delete it completely. Thanks.

Signed-off-by: Sandeep Salwan <salwansandeep5@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 3cd01613d067..7ba968e24add 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -31,10 +31,6 @@ int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_t lengt
 	int i, num_fifo_bytes;
 	//hardware doesn't support checking for end-of-string character when using fifo
 	if (tms_priv->eos_flags & REOS) {
-		/*
-		 * pr_info("ag-rd: using tms9914 read for REOS %x EOS %x\n",tms_priv->eos_flags,
-		 * tms_priv->eos);
-		 */
 		return tms9914_read(board, tms_priv, buffer, length, end, bytes_read);
 	}
 
-- 
2.47.1

