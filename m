Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7FB3CCA12
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160742; cv=none; b=HgB2oRla63ygz5VGOiMPfPktqJGx4aXYXC2jyTD74FvKkECDDN11iNk7Axh19HkyKQHthtOm2p0WKDpPTfC3mAoH9f0JJeGrUKtmbBK6YTP38aU4oIRnIC7oDU8Zb7uNNFwFunQNXbROnbwrXOwxtUzTVRy/uwnDmDnec9T6+9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160742; c=relaxed/simple;
	bh=ys7BZ7ZjxChL1qSg9mzXiykJ5dJ4mVMXSNIy7gd7dJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rB9utTL6c/t9sHBoysyrGQer4Ea9iIOHGmoVi5i7OnHboz8LHCTgzTJFufCUvnpw6Bn8CJF+XKLHQzz7qA7n2UP+tR3SNuHBqEU1tjEOD8rvPdyz7/0oFybW2RTe8n0syF++AfoKwmZQ22r0nLQBdDGc8FBtitqvDkt4Bs37FfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N89hpeiZ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N89hpeiZ"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38ce8a5bc20so55813311fa.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776160739; x=1776765539; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoVWSHGfMT6ozs7Z47I59n6D/+dR84VPz1NohMFwxyw=;
        b=N89hpeiZK35WTYD/Fbmf15T2aGVRptw4Btp+luBy721lpPl1pFrSuWvl+BGNp8BI6n
         kv/6hJ+4B8b+as6ybnA4Y1DC+ocz/hZDWubwRkDFcleVSZumzKaaDltitn9kqexGEE1Y
         a3J9R8w5sSP2qyjhv3eQaVz3r42R2MvWtw6R0kimSYXtuF6ivMeWs+LJd76Jbx5tiivQ
         8RUt8VRCE7+9S5yVRmjEWrM7+7M3zYEg6HGaEdd2MMI9N2NIynhU8Z5SnnRvstCfQ2e2
         7sf/fQKwfoOPlgQog3JgZS2FlpCysFuNTOxKmJNRMMILUub7MhBG4U/y8dCQ6m2XlJsC
         PndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160739; x=1776765539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EoVWSHGfMT6ozs7Z47I59n6D/+dR84VPz1NohMFwxyw=;
        b=T4mhqPvOk9p9FBPsXC8xwpf8AsqAppSYu9SeVpxsbEX+sW4z6Df8SnJ6ZX2UVdxh/M
         20mWlFQhB9YtK/8KmjTNksIm9fQLtvR9ODZosPsS+PEI+bAfRVIyAsrq0t5gujW7X5gc
         sk26/vQTi5wEfAFhp117v8Z9QvCWF4K0egD9xP3+CjiOgvEgoNOrep2O8mZvR/b4OyZj
         0xolo188GT1Jsnxz9Uk+fUwp1e7QyNEadkPyftA1GVY+P5zqAyybfBWpYI7UPNnt6E6w
         OwPkyy4gDsBOxNZJbgMsL+YAa/8Wf6MvuX6aEDNJ1t46Kb8opy6WzKeFCxCQRymfiaTO
         WdZg==
X-Forwarded-Encrypted: i=1; AFNElJ9zPds01jNSBwsIZ+gXufSTyEuH3H79jd1v3PotJlw6uO4CqI/sFbWwZvJ1rQmSTHVRuA7+w13kXyZe7i0u@lists.linux.dev
X-Gm-Message-State: AOJu0YyzfNSY1ti7WD8n8FtQu8BFIoikf7uW3GBJizHhxVoL8/o2WovT
	vUgysYzc88dndtqhaH6ESVYKvjPpZbK9RX0uGvUgdZBc6zpzulk0FC/+
X-Gm-Gg: AeBDieuE/U7FtPurqy8gWRoDiP5auIT4v8QNBYxlD9JffNqS1MVLUMLmVl9lnhW/LbW
	ja8Z5XYw9JOEbrvIyvk7H/C/0xcjMEuM7aXerBAlouGDUSeYO2pKSsf+16AZPLJN4NkRp9KMm/j
	XkbaBVtNgyW2qFxaMRADsJwItRk/mjQMPlkbKbvxvWawx97JT8fncsDrB7mFM69WbW2R5giQF/B
	siiFK18ssQW5Y9+LVMOl9cZkTIuxiclK6C4xtsypMhd7jjE7LtJjcgIP6PNC+il2zBN5tTR7djj
	a5/ClJnfgDCowqyBuULVz+iY7E1GYc+qk6rBUClhB8B3VIM96Pek1RIMMkfZ6Kb9Gl6syWsmu1k
	VaSBlw1EaNY+kDYFKKlOP2u7lrYp7sVsBdFzUxl/bZKc8j7Di8A/gjstNr+SHZxgW2lTq2JEP8G
	lQi7Y2hPkFZ2sfyA==
X-Received: by 2002:a05:6512:3e28:b0:5a2:7b95:af0 with SMTP id 2adb3069b0e04-5a3efb29eb9mr5501035e87.25.1776160738504;
        Tue, 14 Apr 2026 02:58:58 -0700 (PDT)
Received: from arbuzik ([213.79.119.79])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef071cbsm3208359e87.80.2026.04.14.02.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:58:58 -0700 (PDT)
From: Marc Finkelbaum <regpacy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marc Finkelbaum <regpacy@gmail.com>
Subject: [PATCH 5/9] staging: rtl8723bs: add space before inline block comments
Date: Tue, 14 Apr 2026 12:58:29 +0300
Message-ID: <20260414095833.76480-6-regpacy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414095833.76480-1-regpacy@gmail.com>
References: <20260414095833.76480-1-regpacy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a space between the semicolon and the opening '/*' on all
Queue2Pipe assignment lines in _OneOutPipeMapping, _TwoOutPipeMapping,
and _ThreeOutPipeMapping.

No functional change.

Signed-off-by: Marc Finkelbaum <regpacy@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 80 ++++++++++++-------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 2f76d04aa9d3..fcfcdfd079da 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -342,15 +342,15 @@ static void _OneOutPipeMapping(struct adapter *padapter)
 {
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
 
-	pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0];/* VO */
-	pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[0];/* VI */
-	pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[0];/* BE */
-	pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[0];/* BK */
+	pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0]; /* VO */
+	pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[0]; /* VI */
+	pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[0]; /* BE */
+	pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[0]; /* BK */
 
-	pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0];/* BCN */
-	pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0];/* MGT */
-	pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
-	pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
+	pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0]; /* BCN */
+	pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0]; /* MGT */
+	pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0]; /* HIGH */
+	pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0]; /* TXCMD */
 }
 
 static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
@@ -362,30 +362,30 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 		/*   0,		1,	0,	1,	0,	0,	0,	0,		0	}; */
 		/* 0:ep_0 num, 1:ep_1 num */
 
-		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[1];/* VO */
-		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[0];/* VI */
-		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[1];/* BE */
-		pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[0];/* BK */
+		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[1]; /* VO */
+		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[0]; /* VI */
+		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[1]; /* BE */
+		pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[0]; /* BK */
 
-		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0];/* BCN */
-		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0];/* MGT */
-		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
-		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
+		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0]; /* BCN */
+		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0]; /* MGT */
+		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0]; /* HIGH */
+		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0]; /* TXCMD */
 
 	} else { /* typical setting */
 		/* BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   1,		1,	0,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:ep_0 num, 1:ep_1 num */
 
-		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0];/* VO */
-		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[0];/* VI */
-		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[1];/* BE */
-		pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[1];/* BK */
+		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0]; /* VO */
+		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[0]; /* VI */
+		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[1]; /* BE */
+		pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[1]; /* BK */
 
-		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0];/* BCN */
-		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0];/* MGT */
-		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
-		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
+		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0]; /* BCN */
+		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0]; /* MGT */
+		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0]; /* HIGH */
+		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0]; /* TXCMD */
 
 	}
 }
@@ -399,30 +399,30 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 		/*   1,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
 
-		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0];/* VO */
-		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[1];/* VI */
-		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[2];/* BE */
-		pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[1];/* BK */
+		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0]; /* VO */
+		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[1]; /* VI */
+		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[2]; /* BE */
+		pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[1]; /* BK */
 
-		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0];/* BCN */
-		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0];/* MGT */
-		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
-		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
+		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0]; /* BCN */
+		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0]; /* MGT */
+		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0]; /* HIGH */
+		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0]; /* TXCMD */
 
 	} else { /* typical setting */
 		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   2,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
 
-		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0];/* VO */
-		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[1];/* VI */
-		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[2];/* BE */
-		pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[2];/* BK */
+		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0]; /* VO */
+		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[1]; /* VI */
+		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[2]; /* BE */
+		pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[2]; /* BK */
 
-		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0];/* BCN */
-		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0];/* MGT */
-		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
-		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
+		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0]; /* BCN */
+		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0]; /* MGT */
+		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0]; /* HIGH */
+		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0]; /* TXCMD */
 	}
 }
 
-- 
2.53.0

