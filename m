Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E015D2563B
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 22:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308301; cv=none; b=KTviWK4/U1aON+nYXnhmYGYyrs5gl55UUUE7AX3IrGAUqD4k5f06Ocas3NBy9MBMdqVNuvThDi44OO/IgpavUIZ+rqOv+Ao/C46jCrVjWqA3ryE9wgpcZmQ0rdtCUuzWGXINo81qNVarECx7fvu7+T/qPVYSXBZD4Dd0ErTxFbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308301; c=relaxed/simple;
	bh=dXw+xJPnXmVCBosVzmubmp25LSunaehvlrajPSDC21U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qc6bKB5N1Hlk7Spdj7Gi9kkRHiXaV2uCxvcdYoTs8za02Trw2wZgzleJ+491K6l0tL7tl8Fli7Js1fOYJsHjXiyoGYX5rUbW8petr+gUhBmwrit8tUEdeT2PIC2qb/HM1Xh3qp1gv1Xs0my5ponXMqgGJmyOPWbRgWDjIcenwdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=LOdenFLN; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="LOdenFLN"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-29026523507so969556a91.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 14:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706308299; x=1706913099; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wRVZ/ZTl2OxdPtkwzwNCkdwel9KYX+X218syEA+ShU=;
        b=LOdenFLNJ54do3FwdxNUypwSTXxzH34OaaoR1/z0Z/8yl5txnzn6up7TDn337Z8IBP
         RGzRudtbB7vYMnb7E3dDOiia1O8nX2X8cq7HvtdMcKRuLnoClHI0xGo/aD9WaCpZjuTa
         iqRBZX4smBd0muh9NgNVUlYzwlZBw6i3TBoJNE03s6oVmgzsNTpVu288ozOpGIddbHpU
         83zo9fBFdefWjOGRbNYTOXxo+YIJsX4k/qcc1QotMS6T6qJ9XNpIFIx+BTBOIBCrBBub
         77eNsVsPSchmWlthY+nbxP0s6LYRf+A/qtwRHz0COFy4zU9PTTLXDb4mOTXoLeFKJT+i
         18YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706308299; x=1706913099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wRVZ/ZTl2OxdPtkwzwNCkdwel9KYX+X218syEA+ShU=;
        b=GsMT8OXp2bycH3V+5HL5hPtEFT2dSiki1GGK8c+cNqDyBXTh0qIDV84ohV3WCUPLC8
         WguQFVV//2VoGWdc3xNWW5paU7vGT0hnij8kRfO3AbhX34GCqDVlISSyGdw0qs2hodxh
         LHfJOY/0NVw4sst2izeccut8sBVZG4d9zzTsb4N5MAw84Ki3PuF3o3YdwzSKqB4FxtPO
         wRmO9p/a5op1BGbaXRZi0P34tZPT2BkZwq6o1Hg5EvnE8bSC9jliF1GS94RnkCdysWWD
         AA2V3halEPpZkoMQi8Z+esRlnNVRQiD8rqulA220IcHufeWhShyG/m+GfNju++GgbFDQ
         R13A==
X-Gm-Message-State: AOJu0YyKfDAogWLd1UrLMO8LrNoBIeFSFKjwRiarDJWapG9pBTeqiEeA
	B8P5i5aHv5bJZgZ7AUa0L+HHLY0H0o9RwmG7mBo37j5XbS/vvEfBLnJm+iEn8Gc9oB44b6kkf/j
	V
X-Google-Smtp-Source: AGHT+IFB5b6nIl9AxF6VP8DLp5SQhPiettq8mA5bonkhbVfv6wjZamvDIl/IXkJPo5fCUjxOevuTaQ==
X-Received: by 2002:a17:90a:9311:b0:28f:fb55:4bf2 with SMTP id p17-20020a17090a931100b0028ffb554bf2mr568548pjo.94.1706308299263;
        Fri, 26 Jan 2024 14:31:39 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d0c100b001d8a8f431b7sm737909pln.300.2024.01.26.14.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:31:38 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 03/18] Staging: rtl8192e: Rename variable LPSAwakeIntvl_tmp
Date: Fri, 26 Jan 2024 14:30:51 -0800
Message-Id: <20240126223106.986093-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126223106.986093-1-tdavies@darkphysics.net>
References: <20240126223106.986093-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable LPSAwakeIntvl_tmp to lps_awake_intvl_tmp to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No changes.
 drivers/staging/rtl8192e/rtllib_softmac.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index cf855ba39c10..8a60bf3b7079 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1390,33 +1390,33 @@ static short rtllib_sta_ps_sleep(struct rtllib_device *ieee, u64 *time)
 					       (psc->LPSAwakeIntvl + 1);
 		}
 		{
-			u8 LPSAwakeIntvl_tmp = 0;
+			u8 lps_awake_intvl_tmp = 0;
 			u8 period = ieee->current_network.dtim_period;
 			u8 count = ieee->current_network.tim.tim_count;
 
 			if (count == 0) {
 				if (psc->LPSAwakeIntvl > period)
-					LPSAwakeIntvl_tmp = period +
+					lps_awake_intvl_tmp = period +
 						 (psc->LPSAwakeIntvl -
 						 period) -
 						 ((psc->LPSAwakeIntvl - period) %
 						 period);
 				else
-					LPSAwakeIntvl_tmp = psc->LPSAwakeIntvl;
+					lps_awake_intvl_tmp = psc->LPSAwakeIntvl;
 
 			} else {
 				if (psc->LPSAwakeIntvl >
 				    ieee->current_network.tim.tim_count)
-					LPSAwakeIntvl_tmp = count +
+					lps_awake_intvl_tmp = count +
 					(psc->LPSAwakeIntvl - count) -
 					((psc->LPSAwakeIntvl - count) % period);
 				else
-					LPSAwakeIntvl_tmp = psc->LPSAwakeIntvl;
+					lps_awake_intvl_tmp = psc->LPSAwakeIntvl;
 			}
 
 		*time = ieee->current_network.last_dtim_sta_time
 			+ msecs_to_jiffies(ieee->current_network.beacon_interval *
-			LPSAwakeIntvl_tmp);
+			lps_awake_intvl_tmp);
 	}
 	}
 
-- 
2.39.2

