Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02332D877D
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 16:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772899281; cv=none; b=g/uU7F14bC6MbYto46CHARMZnpNaEIMGzh8cAK6wCMDEF011u2RLHkKpcI8p5ef5Qrg5JIS3MJMQAcHmz1ZLmQyj3zxk9BUpxIGhZGf8RMLjqtrNl+NyYidZz7Yh4CPhqFr1sH660fOBqc/SjYs624zCJtL9L7n3BRGsS+Jj9gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772899281; c=relaxed/simple;
	bh=pcyVReh4QPk7EEoKaBhOJueUhpKPqmYjTyk1Sevp8X4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dbDMJSmf4Oex86HSOB5zJnfPAFjaYrGVqhF8huokypr3pw7L44qGmKL4qLSXjmOfYijR94gZW5rpDIzSwmdXbZcybXpMNQhDjGGlKYqsInh2b8JSGNKFsA8f4UbGpZqTOgVFTrY6620IvWDZR9dDAJOg9KpUiBa3lNJGIh9yS1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcH+jy7K; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcH+jy7K"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64aea64bf15so9474919d50.2
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 08:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772899278; x=1773504078; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhXll60IDnT9zpbZ/06EdsBPU5kb9HHd4aD1YPwr414=;
        b=mcH+jy7KUUW6BxEIk64D/VofeJ4WS2fJ775mM/tUWKxzqlxi36edxQjQ3eEu3KZPxU
         v9N/7lH+W9FttjWQEmsmITuRRzlozEqP57deIpjfS+wLdaLtohNNHWsPpT+o+DPmKE9R
         oUHrjoPsbGOfvwte+yiEThvVdh86CmX/mpMVYeZSAdYiIyV5qS9JT9OMoqRsdprN1J6n
         U30HbyE7q3vHDKO1DGGIhPb+xsuYC0Galnnd2mIM1/g+vArvwuvzw2PGptsd0Ra6g8bh
         14csVKY08V1DbBuywYUNeYX8Wp3Hd3pQc1o0MndlqqQ5U8/Ql0qe65KBMSH4MgzVCpus
         R02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772899278; x=1773504078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dhXll60IDnT9zpbZ/06EdsBPU5kb9HHd4aD1YPwr414=;
        b=ZUsogPkoQUdeKOeXrEJ7Oa1FUL3WEDpDu2fsZ3GyKkbTmGCN/7SuwcyvSnSQhnlXl0
         Vwy09DoNNb8aGBv0uYbOCr9aU9BJi1M6LxVMlYOZvj29KzqS96owcu0faX5ej4b0Mtkg
         YE4uby3fjdZVW2u47zaCb0YyyrZISpj/zgHuB6yMeVKm6C+B5eCnbZ85a2kIo0Kzi16f
         89rJI1aNSZlmUUG+yW0onk/xp+rS4o9YArTRcNDEB2hO0/aqpsRoOGjfYncW834rqxWW
         S3AkjnctEf4ZobJW4Jynzpr0T2LrfqprS4di3n3oDbJYORMF3oQSfjZ8PkzYV/Q190ep
         W81g==
X-Gm-Message-State: AOJu0YzF7Xo0EZYWsxEJrKyjJiojNWh2X13TiUa/qpUyD+dg2qrPf0qN
	foWNQ7vZE5jVYG3UseKAIFR6Mhd2UMSnKXaTTehl/Q+lwh4c1x7ZxUlx
X-Gm-Gg: ATEYQzyrC+5ZW0z5EAL65K6kbQ/GnVOd16SvPcAGk670MUWW4yr2Qqop8zpP2vOgR0l
	uFUf3UIi86qetQTw0ywZkooQ2eTV7j7Z4ycyawa3/fmOwhtFcT9zIQ8tBXjVxiyh4DyJKlzmLB2
	cY61WmwaZjnqjdiAPLZG7TqrDlb6R8H1mEzJjjcGbfH2ljBj/ivvr8hUAFoSBAGfCUHRFUcia+G
	48KBFyQyW79a8tdr1MKR9E7o34ftqWGpglUQ5crYpxBlijvs5NQqOmnfncOKVUjkGvQQuD+6ZLV
	7RqBMBen+I17OSwtgOpFvs3hYrJTIkrSopiWJwQOHs+VAUPQ8s8JVXAO7GuKVLnhLFPoLxgEVm4
	WoewB8lSK+wKTNrhHLijobAXZoyd287LbE9jKfjsWvckJNUaoQEedJuHoy/NCAdCs/zIflpEw4d
	+tJx8cL74xnNyVpnO5sHnr6X+Q
X-Received: by 2002:a05:690e:1489:b0:64a:d04e:a340 with SMTP id 956f58d0204a3-64d14065a8cmr5442797d50.11.1772899278472;
        Sat, 07 Mar 2026 08:01:18 -0800 (PST)
Received: from archlinux ([185.140.162.146])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d175d2f31sm2232160d50.5.2026.03.07.08.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 08:01:18 -0800 (PST)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	ethantidmore06@gmail.com,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 1/4] staging: rtl8723bs: replace rtw_if_up() return type to bool
Date: Sat,  7 Mar 2026 18:58:30 +0300
Message-ID: <20260307160024.18039-2-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307160024.18039-1-nikolayof23@gmail.com>
References: <20260307160024.18039-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_if_up() actually return 'bool' value, but it's type is
'signed int'. Replace 'signed int' with 'bool' to make it more accurate.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c    | 6 ++----
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 28dfb974fdff..85ec172d6a89 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -262,15 +262,13 @@ void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
 	spin_unlock_bh(&scanned_queue->lock);
 }
 
-signed int rtw_if_up(struct adapter *padapter)
+bool rtw_if_up(struct adapter *padapter)
 {
-	signed int res;
+	bool res = true;
 
 	if (padapter->bDriverStopped || padapter->bSurpriseRemoved ||
 		!check_fwstate(&padapter->mlmepriv, _FW_LINKED))
 		res = false;
-	else
-		res =  true;
 
 	return res;
 }
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 0bdb204b85ba..96a402328398 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -362,7 +362,7 @@ extern void _rtw_free_network_nolock(struct mlme_priv *pmlmepriv, struct wlan_ne
 
 extern struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8 *addr);
 
-extern signed int rtw_if_up(struct adapter *padapter);
+bool rtw_if_up(struct adapter *padapter);
 
 signed int rtw_linked_check(struct adapter *padapter);
 
-- 
2.53.0

