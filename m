Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6935A202F70
	for <linux-staging@lists.linux.dev>; Sat, 26 Jul 2025 04:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753504415; cv=none; b=RskggrrNjvdfdSaN9x5MEqwydv68gbSylNYDTzjdfBAMiPb4gsM7Qp8Kfcey+bdrJMkaFB+Kf5t44lcrd/SCtgmQlJbCHilRCkA/bV8k4IqWNzq0dVyruTXIvlYU2irxur/AtIXLWRRBaWeQdp/UQJab5sEfnGIdrR9LbtGDsQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753504415; c=relaxed/simple;
	bh=Hln+RE0XFXcl6Q+ZxGFN8IgMNryMqgMXLI5PboDwAkI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q7fx3y1572gOLhNqd3OY8KtDCk4bLtmxMOkFruCv2herEtsW9ZOOWZW6pjz8kpqM31x56Ibqd4njFc5dvGZ7iIdTcoUapwqrNx5JqqBc70d1yhBtPxWb/aDQFI7YGnAfAdUXJOkegi1tQyHVMK9vwLDPalcFhNKBWK48ClXDo4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkQw/fC/; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkQw/fC/"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7e62a1cbf82so168406485a.2
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 21:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753504413; x=1754109213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjkPbkLKXrC1x69MnZUinhNSbgEsQTgvN0JCPdlTAvQ=;
        b=WkQw/fC/PaQC7dR1uUcvEonZ3OwJHZs/0guoLQ2NwNg+YhZfLbHTtTvNXdbydd+tDN
         wOoz3BBsFmxpG0eZ7Qa0ASnF2J+j27Yo8AfSu0OT/OHhj1zmMWiVxGUKFYBW/pTbMLDi
         B5zvL7biKvI0bFqZBDX/SU7wEq7t+qsaJ1tcg/RVRzmA9pgITvICbgAaQnueRLTZ6cAR
         4dPpLDtTjmg97quf0UtQBnywnOWxU9VVuRkiq5HJHyQcsDvyesbH1E54mpbM7RZeZDZ9
         lYIa8Nj7o2AdJN3YfYpZu6Lvu2IhkG0FygEqE07bQwlFZX6aMwGORlrOk2/ecv6UlAl9
         FRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753504413; x=1754109213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YjkPbkLKXrC1x69MnZUinhNSbgEsQTgvN0JCPdlTAvQ=;
        b=Ft9IPXCknxrX4TzAO455uIu2NVu4wkhioWlqJaxB/NtbZRQxgcZIMWC3wU2G80EVjX
         upkICycTDTixq60DXoR3umHbH7Q3kpdMynKws5PrY580W3OZ/7KI/6INNIL6Q2HiyO+b
         F6OTg6HFThTy4dy6q3UsdiqRClsmW/qOlQieI0O2eK+j+qEDzTnxvynbValrtqBsD+qR
         UO936VgHomkhRqjjBfEEtEC+5+eDO8AmUaYo7n7Id/Co919vnDLW+M03p4PxnS7l15f/
         TomwMMKG8xuox7394kgDyIBYtCoUVIn3ugefEVz1uN6wG6fVgCyv1Si6v+tVHw0Q1pzL
         7fTA==
X-Gm-Message-State: AOJu0YwWzYxocCIDaStm0yfqexfFF7KUDH/KxXzGrE+fjknr3zFENuMg
	SYSQVhYqE0CGBskAjeAu+jBVzC6FOs7voZD890oyx6v6wf/HGyfK5AeU
X-Gm-Gg: ASbGncuo+Mudv8g/dLGU7snBc/Swa2rYV0b/e1ujSBsJLCOGKNwopXnqvFDLSkAvKTR
	NTxRKi/qra1pxOhsDs/Pep+lBgdtz2lbt/vpNaGXCr3fpT2KAW0ErezybkdLIM7Zceb9HTt1Jcq
	xS+qGD2LJYtwTQIV887gNJQvMfhXc/fjjGBDLjgbiHh1O2rQP1Iqlvom9c0K0s75PgG2wfIXK5u
	dcwqd4Eu2aNv2tcDXzYKPmjHzNtjUJGYXmfIMMJY/8oIsbMKeRA6wmkyVUAQj/fAdoSGRKZWfQ1
	BIF3Z93wwAociv/ac1JR5HJCy1XRb0BpqSeXFev05kr3oI7rKoKxCw79E8mreVWJWmpcpsuZagY
	2dWBebCfMy8YYf02AYj70Eq1zQdJTXxDA9sey9iVzb1TEYO0a//A=
X-Google-Smtp-Source: AGHT+IHADvqH6vA5wfk2ynhAPEHhDZbOKKGLISpDsIW3emLm5YPAfEmoxlfJG0uV7s1fKXA03oR/sg==
X-Received: by 2002:a05:620a:4046:b0:7d7:79ff:a1e5 with SMTP id af79cd13be357-7e63bfb09c4mr486653285a.29.1753504413258;
        Fri, 25 Jul 2025 21:33:33 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6432a885asm70322185a.36.2025.07.25.21.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 21:33:32 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 04/20] staging: rtl8723bs: remove unnecessary space after type cast
Date: Sat, 26 Jul 2025 04:32:02 +0000
Message-Id: <20250726043218.386738-5-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
References: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed unnecessary space between the cast and the variable
in two instances of type casting. This change improves code
consistency and aligns with Linux kernel coding style
guidelines.

No functional changes made.

Identified using checkpatch.pl.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index b1a427a655ef..536b6d036e88 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1055,7 +1055,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
 									(cur_network->network.ie_length));
 
-	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
+	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8)cur_network->network.configuration.ds_config);
 }
 
 /* Notes: the function could be > passive_level (the same context as Rx tasklet) */
@@ -2406,7 +2406,7 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 
 		if (issued == 0) {
 			psta->htpriv.candidate_tid_bitmap |= BIT((u8)priority);
-			rtw_addbareq_cmd(padapter, (u8) priority, pattrib->ra);
+			rtw_addbareq_cmd(padapter, (u8)priority, pattrib->ra);
 		}
 	}
 }
-- 
2.39.5

