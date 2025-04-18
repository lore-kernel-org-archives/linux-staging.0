Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099CB218AD4
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 17:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997700; cv=none; b=mY/2GEtncuocPNJXcgSKh6N9XzEoBIBiGYNhQiWBJW8JVq6BPyNkiODZb6rZFm+RlTYRwr66wGCEoYGmFfDSYcX1Nf9IMnVkqZAstc30yPYfplHtTknJUBZe8YNzLg6xV/BjztB6z9eXYE3XTCEdhwkfxQMEBoJBiVwuXjaT98g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997700; c=relaxed/simple;
	bh=ne10/qVG/Z9dVxxIfZAEEkiO2+1PiOiZ0CHlV/sFviQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iZP6O6HrIq2joW/zttIeSggYwzJchDVPbhnmLD1GRlpleavIpwytcb/BSCO03cFKTtztS4WA6HMe3TyPLxH5Dj/MudVYaEwZWyq6x6BGrLlut2uDW9PaSomHtXyfhLW7kQLFnqrYEarp0hYLk4+0aCdFmmyIcJYLgY9+PQejJH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+vE2gGn; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+vE2gGn"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38f2f391864so1172684f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 10:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997695; x=1745602495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jH4AbpkU43gIjXkLIyvvHStxjo8ZlrUkUdGQZryYFo4=;
        b=c+vE2gGnBf8aEFl50uQ4dvFWwldkZtP5yWx/rMAsjxdra74q35dRMCjeC2cj17cu+V
         nBenlTBYaFLf/63jWfA0sWlW0gg4WA2RoCqOi4ERaM5uqGrNKWxfKdYp94LL+Amb/nR5
         eRov/50RiMvhhiAUxWpm0TNdZhdgEkaSzTAi6pLAJeEOFE4Ct9UiqyvriohprVwDKiMD
         Wnoq5ukgNn7GGeinh5qce2TX6dkiiJnZZvSBtKRtujfN8W9x8qj2Y2WAdURm1S+77oFN
         2+d7q7t7T1UyOtRO68JH6d3WdIKC1EfsL63Ro5LUsCtF+0+iVlKy19lH+FajIRIdQRi3
         qucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997695; x=1745602495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jH4AbpkU43gIjXkLIyvvHStxjo8ZlrUkUdGQZryYFo4=;
        b=ihIT5TKhuYs1f0iDkEgUNAHVzD++HGmP/ZT4i2uzma9ZblhPxpUszxDhRWNkIRwJgH
         On6o0wUsSnkVK4n2npioGxKaS3dfIoFsyHRGVHCKZ3iYQFKsiD4xgyHOAct7m22hgqBR
         oYdAIjPftO+a2GdntKFj3uVYfPfTe/aoe0rqkRYKBjj7bYvVFahA3eVqBiNVJfFLH9NP
         Rfxf3nH8VndudBI+3lSLjHiPCi1XqNkyS3usaptjLciiAZS0Yjjo+NVGdBnAgeuGY6oY
         1vRI0l3JH+9tw9P2+uHQ2pRsYbdKaOh3gghdAMCu+cIy1LMMAmEUDD5KjElZk952ym3k
         SBjg==
X-Forwarded-Encrypted: i=1; AJvYcCX7YOMhwKr5rYVi94WopsxC5u/gcAcZ5PLRV8P1dS4fABT/0qWhU/920AOhVVjV1Ar9Bal1FzahqiP4xAMU@lists.linux.dev
X-Gm-Message-State: AOJu0YxeBPEtt6XDNuql/slCbDDmKdxfTEKOe/H5u/e1IXnQ4XiiAk8P
	6t0XoJTuSn8I3vTh/gIcK2ilzV2rrmNwridedItNY6CqES0MkLLomMcd+Cc4
X-Gm-Gg: ASbGnctEcsersqc4RlMPSj/BIlmX1CTselyreSp9k8Rdyet7wHczurf9dNeTxs1qvAO
	1iXxNH8TvEYnp1mminRPHOU9XY5dGGm9cq1j5TjeMSgmC24dQNXo2Ljt3UCYn+C+oXr2wL/wuL5
	H12lUuBJbY9XWWD6bFnRdEejSzVPf6cKipYT1aWIor5zuMvoNkYVRG0c6xInhGqzd4WwaHFE1hK
	tp+bbT3Xc6hsJ9h/OGQhltW46BBYwKrdVAW2jRYhZ5smyKT+Mk3IUPz3eib9a8AnFBPF7aYw0WU
	NMqVrlrpWHhnsxF3cz0hjfI3jPfGDWxwejJz5ebWPzZuMeQav+N1VDbEOkrNGzbLZ95UEXZkI0W
	u
X-Google-Smtp-Source: AGHT+IFWsUvUtyMLZ3LB2ut72tqx28ZgElhVa3rTsibeeD19gUL6aJHQ82dILW9NhfhpOYx7hKvcPw==
X-Received: by 2002:a5d:648c:0:b0:39e:cbca:7156 with SMTP id ffacd0b85a97d-39efba2ab70mr3007336f8f.1.1744997695212;
        Fri, 18 Apr 2025 10:34:55 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332f8sm3287320f8f.40.2025.04.18.10.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:34:54 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 1/8] staging: gpib: Fix request_system_control in gpio
Date: Fri, 18 Apr 2025 19:34:27 +0200
Message-ID: <20250418173434.2892-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418173434.2892-1-dpenkler@gmail.com>
References: <20250418173434.2892-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The implementation of the bb_request_system_control function
confused setting controller-in-charge with becoming system-controller.

Remove setting controller-in-charge and add initialization of the
control lines for the system-controller role.

Fixes: 4cd654f84769 ("staging: gpib: Add gpio bitbang GPIB driver")
Tested-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 9670522fe36e..29aab72c1f0f 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -889,9 +889,13 @@ static int bb_request_system_control(struct gpib_board *board, int request_contr
 	if (!request_control)
 		return -EINVAL;
 
-	set_bit(CIC_NUM, &board->status);
-	// drive DAV & EOI false, enable NRFD & NDAC irqs
-	SET_DIR_WRITE(board->private_data);
+	gpiod_direction_output(REN, 1); /* user space must enable REN if needed */
+	gpiod_direction_output(IFC, 1); /* user space must toggle IFC if needed */
+	if (sn7516x)
+		gpiod_direction_output(DC, 0); /* enable ATN as output on SN75161/2 */
+
+	gpiod_direction_input(SRQ);
+
 	return 0;
 }
 
-- 
2.49.0

