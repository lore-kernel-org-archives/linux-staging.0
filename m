Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E9030B529
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 16:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770740195; cv=none; b=CFvGZuFy0P6rUTXLxwbhBzhGFtaTzoQrLdBQQm4WGEVOhAa9aTWph4vCuKvhIPNvfEvRdHfWLxJbLol/aDa7BQ06hlbgEmIWe9dsdZ/9KxxVhWTjofshcRfifgEvGH0gHp1RyJaiPA3arAvbh08obBpt1RwCILNil8OsDDCkRgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770740195; c=relaxed/simple;
	bh=eQxQ2GsqpLevYgA6etoyHh3hK7V4jFMtqhvtFyNASpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LnBDTtjxE/fopaJIN0wRDkQWykvViFfB2zZPcue7tYRGJOBrl3n4Q/6YRaN/IE+5a+Zt7h2UOdpvLVL9AZfYsEkQRNtydb4CFyTyZy2s7TYE3Y5dSIuUyut42EFtXVfnuUDsdUhXIOer6BcGG63BYshj0PgH1SGRTeUU8GbrA70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVqGCCcA; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVqGCCcA"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b885a18f620so893829766b.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 08:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770740192; x=1771344992; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zq4onkbA1YrrBhZRX77ETjQ+h1Sgdc6M2PRcBgG9Gv0=;
        b=DVqGCCcAWzbOqLUy9C3TVgoQduMZP9Fyy5wDWbZa0sfKXD0uQSlqrDKeP/GnY4JXB9
         mz/DL8A8gdSyoO4rC8kcHM/b0dysqMSXj399J3XGAkfV9WzvvsNoM1dSqaBakhMNeBxQ
         3kAZrAowSqk+ohrhZp69/xYk2Yls1cLuU33lKRzuR5DOslC3m+tg3QQ2ohPluluRJliJ
         DhxyqTD4AbbCuEQgS1giFs8tJdtDQXsVvZbA0LtIoAyl5JplSdY0hgEaSDfN8mv3epyz
         Yan4Nc8gVy1MADVG7fW94CC6a07Dgad8g1Vml3jYidnGXBQRSNyTSLs9mTy3otQuIM6V
         GS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770740192; x=1771344992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq4onkbA1YrrBhZRX77ETjQ+h1Sgdc6M2PRcBgG9Gv0=;
        b=Aqr+OgHHN6LuZVAfgqe9FKYh4l1aA5Kfqkjs4XSV/H4GeQ/opKYAyb6Qzzd0DtEz/q
         l1kaR3XMbjrGsjcCEkO3dkDm/FwLM/9awR+mwp+y0T9K9rnN8QJLYg1psBK1ZavC+dqW
         PVxoB7uYa+s/Pi8L94qaZyyMICAua/grpY2gfte6YF06XxjrSvJs4apIqyOdVlWYfzBa
         Y6G0VDdsrjxVQL9SwX0IQvIZUqNiTOlFFLe4YBWqxAxIGcHOch/2QJbE8i4j5cDRIH9m
         5iUw4OkpuHJHcIGj3p7R4qfvAPoMt3Tx/ZvF5vqcRqN1W8QC+l4aDG+MxUCpQnQXFd8K
         bJNg==
X-Gm-Message-State: AOJu0YxRt+UYoQhCd3xdpE/QX9VrhC+jOPDm5vqnLWhoUFaEWqdlZlsH
	KKRPPH1UDK5tfiDdRDYv6OG93nu/OkHkiR7nxmsxCqRodc43FQzYA2We
X-Gm-Gg: AZuq6aJO6RXAX7fvZWArkyCL381KClmXmCoWex1aHmwJ8X4/NXSuv18Gb0hw89ADqj8
	XcRL2ru09diE1Kl2sK3SeVEcpwkN1qWYuYAtVp+rWxBpwYOzT/sk2HnkjrU+h8f2Y0O741vOpk/
	8BEgoRbkNQDeVNF3jTZx0o8t43ONB1prKPSDpaf2OEqMFf+ScLfbin4UMUV3+Ldag0/cKh0DqTF
	5iAAWOa4J3fxzZoPt7fXbgbbmDy34VKTuUGeVoLl5jUuJPzI45ruIo4dIXvFe/OoNW44hQTTKG0
	u7PzAVt33ityUmsa8NZ4mcF7WtrXMsdIXM0RR6BAo7G6sbeSecj8FKG3rA8EmEo8CSBbqX/1KH9
	wM61SBtxiyx/aBveok27YunslL+QVjvl0DyUQAkKPy/ITPudXKCPnzJ51rfTjy63bRQ6iceVQk0
	dgg66PihsEnsNJgf3IJMKmv++MPWgDy89kp/xEYg==
X-Received: by 2002:a17:907:1b0b:b0:b8e:d4ed:5eec with SMTP id a640c23a62f3a-b8f547f0518mr152687166b.64.1770740191866;
        Tue, 10 Feb 2026 08:16:31 -0800 (PST)
Received: from arch (wlan-208086.nbw.tue.nl. [131.155.208.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda74a56dsm532376966b.11.2026.02.10.08.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 08:16:31 -0800 (PST)
From: Haroen Tmimi <tmimiharoen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haroen Tmimi <tmimiharoen@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove explicit comparisons to false in rtw_ap.c
Date: Tue, 10 Feb 2026 17:16:28 +0100
Message-ID: <20260210161628.42130-1-tmimiharoen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl checks regarding error prone boolean comparisons.
Replace explicit comparisons to false with the logical NOT operator
to improve readability and match kernel coding style.

These instances were remaining after recent cleanups in this file.

Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
---
Changes in v2:
Fixed syntax error: Moved NOT operator '!' to the correct position.

 drivers/staging/rtl8723bs/core/rtw_ap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index ebe73abab892..0192543cdec0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1013,10 +1013,10 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 		rtw_ht_use_default_setting(padapter);
 
-		if (pmlmepriv->htpriv.sgi_20m == false)
+		if (!pmlmepriv->htpriv.sgi_20m)
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_20));
 
-		if (pmlmepriv->htpriv.sgi_40m == false)
+		if (!pmlmepriv->htpriv.sgi_40m)
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_40));
 
 		if (!TEST_FLAG(pmlmepriv->htpriv.ldpc_cap, LDPC_HT_ENABLE_RX))
-- 
2.53.0

