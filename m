Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECC013AA30
	for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 22:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706136308; cv=none; b=G4exUKJf1w5TjcVX9Ql+ZUGK2jdoVTdAyKkXuQT9Z/oNTYEwBDhKt3jvWXFvQcL2P/28/95MO+up5IW+cRrhMH+MOlsGaVF/fWRqiWc6vZduIMLMwtdMbHdDzFyN1rOrtgE2LrCXjOOQqzO/JZ5KJZs63m464GmvCi3y0OWHlWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706136308; c=relaxed/simple;
	bh=6ToM+Cwy4u0qXFjonHn47fTyU4E4Qpah3eIqQAIsO6I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HrU3N3rOJ1NzEYg689a3wTiy/l15ciB5ZkcabB+9hjZwEkOOd+NBa4H8op/DD48KE757qOuEnCPw4GYsPNkIwxRmLKSBmAwn2vvuDmRsILvLFG8GhHkuoSWcbm3H/2wLRQSk+CTiBIFGUCsnTmuQ0q6IMUNP7y6gFpnT2XmS7m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=OW8jVQKZ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="OW8jVQKZ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d51ba18e1bso55217895ad.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 14:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706136307; x=1706741107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NTpS/way35+vJRKykUjn1EX5vyHFpA61voGfYPi228=;
        b=OW8jVQKZC4jqe5FN5RTLd/F75J1QsIFAgLGRiQ+XlzTV3cSYWHwe/9HEHeN5//spVm
         RkyEbt99l040E01QSCwICZW9++Q/y4xEtHq0P/v/gJFM4PcpA6chTV8nHnWPjcUdXatZ
         8zBe5QWrgToVO/cvWwahA3WUCPeqljgNSIBVhcgdMrumORy7Cy9RohRvuQnkaEnXxIVi
         Jvlcsb6IifMIHJwqPppoc2tzSqi1o0vhaaVMF12zz7XBvpl8VsbGrO1cutgY0ufrhCh2
         m7AkRVJ+Ls/0RH1DrYjUtOT/S31i82URMe6bY9sOuzup5PN2ojYSl/MYDqdjttXiMqoS
         poeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136307; x=1706741107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NTpS/way35+vJRKykUjn1EX5vyHFpA61voGfYPi228=;
        b=Gb3ktzgtpjddMzG1u5pfnAI+qWW3d5y+djRL/WTTAgJOjwz5rJ8wctLQeSFIGAmPi6
         sJNRMHKxRzKmUU2eqJoVXdU/VerTYcbV7qto5cezaMMs4bvb0ovucUvrRHxiC3sHu8hQ
         N83Se9Iiru9lMD/YRuxcsQaku/HWu9YnAfcFqECBH/eSMEIsMXVJ2ykTJj81Dj+uarBQ
         pMHcdjDPIHhBJTlHDKIc0D62jQZJKTEzwoz4P0AZiNPj9Agt3vtfiHFW1ZrknpbFEYy6
         /lFrK8YhuMZBG+Iwf7DYdyXpX/r73dCVZmKmkSdOuGCxg/3+hWyGlYcI44++N0JTJK7j
         UPXg==
X-Gm-Message-State: AOJu0YwGlwJc+NepSxBmBjVXLGLmtF9qDngNNhQCzASB9l4XvGDW1uQp
	hjiUFFgakBrztisCjoY/DtaIooEaPWYzxhze8YbRxkCiz1zPpDVQpblxpldUbbQ=
X-Google-Smtp-Source: AGHT+IH0cHEUvO+RMY44u9A0oKjjcSfnvTB4ISwkVv06RC/1D0k5qOCWUYKNKt+QBvs/CzOT1TSl9w==
X-Received: by 2002:a17:902:820a:b0:1d5:78bd:af9e with SMTP id x10-20020a170902820a00b001d578bdaf9emr77886pln.116.1706136306792;
        Wed, 24 Jan 2024 14:45:06 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c28500b001d73a2acc0csm6743987pld.283.2024.01.24.14.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 14:45:05 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 12/18] Staging: rtl8192e: Fixup if statement broken across multiple lines.
Date: Wed, 24 Jan 2024 14:44:46 -0800
Message-Id: <20240124224452.968724-13-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240124224452.968724-1-tdavies@darkphysics.net>
References: <20240124224452.968724-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Join broken lines across if statement to fix checkpatch warning:
Lines should not end with a '('

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 538689fb5580..ab41632def7a 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1736,10 +1736,8 @@ rtllib_rx_deauth(struct rtllib_device *ieee, struct sk_buff *skb)
 		ieee->link_detect_info.busy_traffic = false;
 		rtllib_disassociate(ieee);
 		remove_peer_ts(ieee, header->addr2);
-		if (!(ieee->rtllib_ap_sec_type(ieee) &
-		    (SEC_ALG_CCMP | SEC_ALG_TKIP)))
-			schedule_delayed_work(
-				       &ieee->associate_procedure_wq, 5);
+		if (!(ieee->rtllib_ap_sec_type(ieee) & (SEC_ALG_CCMP | SEC_ALG_TKIP)))
+			schedule_delayed_work(&ieee->associate_procedure_wq, 5);
 	}
 	return 0;
 }
-- 
2.39.2

