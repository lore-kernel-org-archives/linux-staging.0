Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30644519AA
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 08:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362269; cv=none; b=QZcYP3SpJPBnfRjgHYif85WZ1s6I8/Wyb544Tth4N2LnRE8+niJNau4acIYZP11X2KPsVpui7MXjjIEN7lj94wxrY+9n9kGCkh2f/IBk1L3skS6mNvJlWosUbH6YgUyauotVcNHDz5W/yRH10YOk3OyMkIotJQirIjFxTBgnt2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362269; c=relaxed/simple;
	bh=T7NwYuMLXlaLWNVt0s7LrRxSvrLhYEZRMYxHpznZBm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I9zKppNSiqJ175ggdsZslmFzo6VV5it5nAZtyX+D5zeeSQc3Zm4tytxtamjZrXgXMQ9uM5S9jPsfYQaAWslJRqYmCGYw5/fI3MOoIgHJyxCI7sRfjorIDjbvfOBPpxOVtVsqZYXojc6kU3OgDZZ7PWjv1YeIGGN0ePU0PkSGrok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGSrbOE2; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGSrbOE2"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3515f9a5d25so1107008eec.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Oct 2026 01:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791362266; x=1791967066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OkuOm9iXmeW0EP5oRudZdRaRXze4xzSnZq3aYWaRFyA=;
        b=VGSrbOE2XM3X3tw0UZtfLqdUKwJRQJYgI89K7dwTBEgAprwLqbpBKZ0KhQsn5GAUin
         RrCfcuhcsAon48U+NibAozlY1Pee1s9mpqWE2gQbSoGupCZXmgtjfo4MpaRg6qiDukAL
         i9uINK72F3Jnc5CGfffby2FfKpCPuM3YHV7b5LP4CiknUsORoYqZVrtzx2uPDEUIAbr4
         blbU/HbU9rHpDNS+nl20+EcglN/r1mKqqVU/MWQjU/dM7rJAjkur68tY6pSULSirAfNu
         eZ6hJZetcCTLwTmxnd1Y7CB19OWPDMPUvVlQ/UtIk1TXL7akhSEamWxKBlkyllEBQPe/
         keIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362266; x=1791967066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OkuOm9iXmeW0EP5oRudZdRaRXze4xzSnZq3aYWaRFyA=;
        b=eq5i71pCwpyeHvqbKFV/RMyfJz5KX9mLB4FhkdB24GG5kGJb3SJAQ1BNWy00FjOByj
         jC627p8mmCWn4oPHKaOKnrlGKxraRwkjik1TuCdmWvovMoMc8cXYKc9BXeZQstIt1zk0
         wpfYdns6TrvIQ6EefOMr6cQm3OFgXd39rtKipeHZbbNu5uVILi8PqMn7aCOgivSTLLjw
         cHCnx8vFs1KBU9+JiOI5z0RZnbJ6fqdQsPOUw5gPhDq8BNmLsMUFqGuN+RDl3WDNU3uC
         Fu5m3toCVMxOdbDLMJ09c+JsFnS0i49m0cxNF8AnX+vb1VXOOn+1epdTNJ0MtIbnGzJ/
         X3ow==
X-Gm-Message-State: AFq9FYJ0cplDpWUVDyyeMw/3ZmC73aiK7lRRhABI6nO6qakOKbnDDox4
	ElkMdx0xKMEcEWWcFoUcRXVk/oFb1h7wVM5IkhDbovpyE3srRe5J1WYm
X-Gm-Gg: AYBFou2mqKivNPjsnjPmqs+h9lp3fB/qZ10wP84Wsn7O0slN/aXSCBNvC/GRtHMmlFX
	YZAtQPBFveqAueZgpzemHUgmTZYNkSwFeTqIl7idffnq/RpuQTCuxWDwLrLnPV0ebKSEGXEU5ab
	MKwYcT6iAiBvrCIIHyGBbk9DP1lbM54WL2PVAzH7f9mzeid3T2OtgkYGTHhVoTYRzYFk3ll4IIA
	K/ihrW5SYydTL1+n6GAPrEHo9ftnoJR/XEfFGbEn7JgNoOcXKYJxaGiHxQ8+FuTW9T8zcg41KMM
	JvyHdLog5935zPII9MQHPgcC3qmx/kF9ELy8TDC8957YHvzyvpkQXqN8waCEGPeazrqIwkNtfqS
	uOuEpljM9oNH8kFf4mqSgAJgBGrXEfWn78bEx7APPJM6ksTVgc8C9o73Lkji2mrjtMM7CG6OiMF
	QouoeEZjJvKrHuTQ2c7Y8whOBX1aqQimlnJJEcbUVfWd3u8J8qLhyb7jTk0Q0hK9S+L6WkHhhwh
	BsVMwi2
X-Received: by 2002:a05:7300:f542:b0:34e:f5c3:96a with SMTP id 5a478bee46e88-3515deca0d3mr1526588eec.39.1791362265645;
        Wed, 07 Oct 2026 01:37:45 -0700 (PDT)
Received: from Hruday.lan ([2409:40f2:1168:fe18:f738:9eca:7e0f:4b32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af7ab9fsm5766569eec.18.2026.10.07.01.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:37:45 -0700 (PDT)
From: Rahul Rao <shreeramrahul94@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rahul Rao <shreeramrahul94@gmail.com>
Subject: [PATCH] staging: rtl8723bs: align arguments with open parenthesis
Date: Wed,  7 Oct 2026 14:07:17 +0530
Message-ID: <20261007083717.14031-1-shreeramrahul94@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a coding style check reported by checkpatch.pl by aligning the
continuation argument with the open parenthesis in rtw_get_ie().

Signed-off-by: Rahul Rao <shreeramrahul94@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 1b95ef6996c6..8f0257ceb700 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -749,7 +749,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 
 	phtpriv->ht_option = false;
 	ptmp = rtw_get_ie(&pnetwork->network.ies[12], WLAN_EID_HT_CAPABILITY, &tmp_len,
-			pnetwork->network.ie_length - 12);
+			  pnetwork->network.ie_length - 12);
 
 	if (pregistrypriv->ht_enable && ptmp && tmp_len > 0) {
 		/* Added by Albert 2010/06/23 */
-- 
2.43.0

