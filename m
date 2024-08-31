Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3EA17BB2A
	for <linux-staging@lists.linux.dev>; Sat, 31 Aug 2024 10:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725098927; cv=none; b=migwvXYCr604ETA6RTrzrvY9QbaIpZhmCOogDWfKpZ35rxJ9X1jhMhymJ4U1YupaalPW51vea26EO7+s92Imq3SPTBe8zpMj0mvowdMaiPqlciIcSCc7lcW7Fe+FL8bm2zmIipeXeJsVCQ5zBlBhcD+3vcE11JjR26Q42tYDRFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725098927; c=relaxed/simple;
	bh=Nhe1Kkw/FoRg8Qwa9UBPSnis8dKevjpCGUA6qwa7k7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRVhSk7OiZ+0XVbf0gGm16vk68/wGj3hNR3dohL8uFcXvIfhRHJIs1zZIG4hjfpRLsURbTnJxm0+szc4sbf0ysgAlHXeUblnGpzvrGsMSak+/J8KfiN8Gw+wd7pbs0h8FTENoI01Ncg2srkWJaVO3WDPFgKv/q6jxHa2gJT2TP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdfC5Kve; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdfC5Kve"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a86910caf9cso641836166b.1
        for <linux-staging@lists.linux.dev>; Sat, 31 Aug 2024 03:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725098923; x=1725703723; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFqvD3mmrt1l890q+NAz0Rb4IBw7y1KfY5UglsMerHk=;
        b=VdfC5Kve+jwPMpOl3oWzBFfpW4NFmm6LBlt9dLWqBIcefAGOEXwLwNWeSu+tik+Oz3
         fNNq3w/oVDPboRdxrEMAvzfa6sF72aqpq/xTtd3Tncel6i6gMzDpxH3oRho77NaQyX3h
         BbbQx8lsS3jndVOiZ+I6xDcnOayzMInWAIZVNCOb/xC3C2NlTqD6hZdzR6Ulsh99ixpz
         HJuSEjYsL+0JPhd41VKhex3EKqLP/4504V7X5hbHcj8ajRQtKYs6SXBXkdmXnx5wUcQJ
         WzCfMvZpuaEgz4DlNo0i8gMvR3fwZwjntxOOD3/6JoDnmhudjT2Q6VgvkjQYTg+rZx9w
         Bqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725098923; x=1725703723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFqvD3mmrt1l890q+NAz0Rb4IBw7y1KfY5UglsMerHk=;
        b=PeBmtUad1RXXjypRN/qc5AoZnp202tdYCRDS8DX7J9dObw/Als1KOhz/PvWsnWbZeL
         BJL/Lp+WC7ckzj5KBGohrX6nfjrq9/IXEH8xPbVd5XY5wXgafXu5NkukuzylJEjeQQ2f
         lVMi6/FYYgKU0rSIgznA9rgIqF9yYS2eTBudxI9QwPTR31HCJ9mDEXwb7/lwPrGP0x4l
         fP1fjYTLjgx9YIalAP9vQGgs5or14DH4ybpfy5YyVz12xS3EMCCEbi/7PhrwA22v6uS6
         Xfdm3rMtXaOwhhrwbtG/nRNr6FbhgtHIeoQdAzAgt93SN019Iv5+oEcMqIRO58/R1Qls
         sogA==
X-Forwarded-Encrypted: i=1; AJvYcCVS72EiI7Ghw6xM5PfMX6BLXekiZM1/+kjbd2E9+M8/PDpbmXWUnIRTYil+Diud6LY0w4fGKZ54nYb1L/SG@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+P/gObEGfTW+UsfIqDb3SaW6IejkQECy2oy2ISe419c58e5HB
	Gi99DkUHs5Ff3JTfeqn/05UDhiwiDBJ23JmTVppycmJbN4XSFSC7
X-Google-Smtp-Source: AGHT+IGx1jxgBTt3IZq0k6GwLhT0dUVGvzFmMQuOhijICW07q2vbOUcAPnY1FpS9e1o8j5ThvSVOYA==
X-Received: by 2002:a17:907:3f20:b0:a6f:996f:23ea with SMTP id a640c23a62f3a-a89a2693566mr431760566b.15.1725098922583;
        Sat, 31 Aug 2024 03:08:42 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aba11.dynamic.kabel-deutschland.de. [95.90.186.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989021973sm307444966b.82.2024.08.31.03.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 03:08:42 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/5] staging: rtl8192e: adjust size of RxMIMOSignalStrength
Date: Sat, 31 Aug 2024 12:08:09 +0200
Message-ID: <20240831100809.29173-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240831100809.29173-1-straube.linux@gmail.com>
References: <20240831100809.29173-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The array RxMIMOSignalStrength in struct rtllib_rx_stats is always accessed
with indices in the range i = 0; i < 2. We can reduce the size from 4 to 2.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 7a1a68317a49..0eb987e999c5 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -480,7 +480,7 @@ struct rtllib_rx_stats {
 	bool  bFirstMPDU;
 	bool  contain_htc;
 	u32   RxPWDBAll;
-	u8    RxMIMOSignalStrength[4];
+	u8    RxMIMOSignalStrength[2];
 	s8    RxMIMOSignalQuality[2];
 	bool  bPacketMatchBSSID;
 	bool  bIsCCK;
-- 
2.46.0

