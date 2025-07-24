Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB08421B192
	for <linux-staging@lists.linux.dev>; Thu, 24 Jul 2025 19:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753385443; cv=none; b=tal8lJ0IrX+0mn0Z7+Wh7YU1HeOwsNurBWT5REtSsF7EPb8ZPqbCWKjyAR6+5jUtafc4htvh9A5dO1KfPzrTBDLHxp9cXOLCHr7cZKBwpQm4OcuzrQwL+UcJOWcFwPgXsSFxFUelHRsY++b/BxVJBerTSg5qepqM/t8lWBdNMB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753385443; c=relaxed/simple;
	bh=Wl/MVrfadxWCvbcWuLboGbrjuXmRyvy0BBIFUzsNgX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WhERcibhDsp9QciiZx7SQKB54p58ZX4vaKFo13Ohzo+RrhiKz7mzJ45beWlHZek6hIJdr9sCCa0Xzn5iGqpMX4x9V4W1POiJfeGApT5kg4EUe2J6N4I/LZXebjBpO3JVdJAel8gqz8HV0T7PSmzf7sLBNO5Gw6MSmFohqp2rUt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxjwPcyn; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxjwPcyn"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-612b34ef0c2so2713713a12.0
        for <linux-staging@lists.linux.dev>; Thu, 24 Jul 2025 12:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753385440; x=1753990240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjrrUXAL6KpzkIM6/6atzGF3H/f1YResH0MiZx9rdi0=;
        b=FxjwPcynxEawYFrVVtg3+YeSKJA0xLvkn/8lp9Yu4YvedfsGFHqztZYKpxIoZBlMk8
         jCmP51WJf6EfPOiKJvp54t0OnWsSwbNDMs0WHLTSvs1Q4velVo211l/5SkwvTmLJevG/
         UlFn8UzErfFC7BlXgG3x+70UWRsWxhC7EG78EyoTrZ6Vp34zgKxYzeWWWPbz9Gm2g+rm
         BDL/I0raK9fpTqQ3sBG3iTEkSDPNTYustiM7jgLIDOQo3jmFmPF3qEKWTy3NvcJy4ucE
         POYLpDLBCGpwabQ7Si+pHcz8JybGuv6h8SMc4Fknj43znJxOyiOpzVvqnvkX8sWkFssn
         jmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753385440; x=1753990240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjrrUXAL6KpzkIM6/6atzGF3H/f1YResH0MiZx9rdi0=;
        b=LkCIoljF9m9/OsMfrAbzqQ7bKn5l6gYHDzfV1rP16l4DA0ZxnJFuxr6RAKX0+40/In
         vwfnRt9DDSv3LLcUSTi1jVeHO2iOCszVf26842MFk/lJVDJIQLdV8uBrssTZlERU50AQ
         KmhoYHcpHWbZ5qjhN/e8dOgnSPaAy0fC9gjFK16u7SaZaxdrlKF0iDQlQpy5ZBAG78Z6
         an/G/AkL6zLchwPdhlSXNdC/x5NC9sbT0oScuweSBbTj1x5n4HfeHBgaFuBQ8KXwPRPI
         ETl0oUGZYT5O9Co+2gxq3Wa/euz4FnqvpI4CN31eDQnJdCghi7q4sLE4gZRrbBNOuIA/
         fYNg==
X-Forwarded-Encrypted: i=1; AJvYcCWbQDYI+IUngu2+7duXtKdE7EcuJ8OUKX20v8eA2xiZvnz90Aqq+6bgeDp3mQ3KGwghqC6TTnTO50XD3tGp@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4/f9fhv5V8M3ZykUPccJp2AaQUxRICdT1WQEFLM0TBE6qvmTQ
	m5jJTI1wenGeIlkHsTyqAdDg9BADB5tM51Z92jt1YsoSNACLSyS8iVup
X-Gm-Gg: ASbGncsB6jW3MgQqxzMzhyaGkI9qtfB7ExMBCWwHFrFCwer117PKK3Vlykx0SR7Aj/u
	5nr4Orbu3yHIPNbbO/LpG2M0IwdhOylxVctxOLt30B8yhmZIJkbCHmIeQOLj/dQuVHfUhdqmk1J
	HCOBxTrB61Buk7bZKptHXMweLuFOLAaF44lLYojaN30ZPuguqXrhjyFukXVUvvZ1Quzp4JUg9Mk
	duGpoUDgEyFvwn5q0WBfHrtNmWWrBx62I//QFXmmuCUBh2Rcz8JfL1yULXOiREqrUyAATEoq9GG
	6FVYPzXjBdzg9N5uQKNQhwGqW5JP7mo2VA4tzd98TUyeQh6fBPkGi+4P8HLEHoa+nCT2S1AppbC
	PDAZwOoESjdYqd1etEcvX69ngaz6+jVpz4NeijSMdzKI+9dy7eiLv+EcxstE2ynmDk66Ef6o=
X-Google-Smtp-Source: AGHT+IG20VuhTwF5Qk3SeHna3sh3fNvxdOmTQGCORTJEgciTsCxNA/gIN+kcwVK+d2j5WSEPuwBMSA==
X-Received: by 2002:a17:906:c112:b0:aec:64bf:a393 with SMTP id a640c23a62f3a-af2f885df8dmr919246866b.38.1753385439977;
        Thu, 24 Jul 2025 12:30:39 -0700 (PDT)
Received: from PC01.localdomain (094190205166.static.ipv4.heldenvannu.net. [94.190.205.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47cc6b3e9sm149079366b.34.2025.07.24.12.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 12:30:39 -0700 (PDT)
From: Bruce Qin <bqn9090@gmail.com>
To: gregkh@linuxfoundation.org
Cc: bqn9090@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: rtl8723bs: fix if-statement alignment and line continuation in rtw_ap.c
Date: Thu, 24 Jul 2025 21:30:37 +0200
Message-ID: <20250724193037.23910-1-bqn9090@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025072409-promoter-shame-8105@gregkh>
References: <2025072409-promoter-shame-8105@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes several style issues in a multiline if-statement:

- Moved '&&' to the end of the previous line to follow logical continuation style
- Fixed indentation to align with the opening parenthesis of the expression
- Avoided ending a line with an open parenthesis '('
- Moved closing ')' to the end of the last expression line (as suggested by the maintainer)

These changes improve readability and conform to Linux kernel coding conventions.
No functional changes.

Signed-off-by: Bruce Qin <bqn9090@gmail.com>
---
Changes in v2:
- Moved closing ')' to the previous line as suggested by Greg Kroah-Hartman.
- Thanks for the review and feedback!

 drivers/staging/rtl8723bs/core/rtw_ap.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 383a6f7c06f4..c652e0cd35f3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -258,11 +258,9 @@ void expire_timeout_chk(struct adapter *padapter)
 		} else {
 			/* TODO: Aging mechanism to digest frames in sleep_q to */
 			/* avoid running out of xmitframe */
-			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt)
-				&& padapter->xmitpriv.free_xmitframe_cnt < ((
-					NR_XMITFRAME / pstapriv->asoc_list_cnt
-				) / 2)
-			)
+			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt) &&
+			    padapter->xmitpriv.free_xmitframe_cnt <
+					((NR_XMITFRAME / pstapriv->asoc_list_cnt) / 2))
 				wakeup_sta_to_xmit(padapter, psta);
 		}
 	}
-- 
2.43.0

