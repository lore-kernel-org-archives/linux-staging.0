Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B1D30C626
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 17:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769620639; cv=none; b=VY9ZZVqfDFTPcjVuHlRlZRqB9uVsdLWFgHdKgzI5WSXk8Gllyi4xGmHE/SclxHcwhwDXqVRyvh1cqy8c02JqbDyAzOFXpY0GEw5dd83wOqEU9QDbTBsPx4p9jKzk+gwkMFjehQgePYkFy0LhpirQe3bF6zroMhG3To4si8E93UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769620639; c=relaxed/simple;
	bh=kzinaispx9gDLWP1I7WilRVgrK0AEMjyZbEwOzk1yfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cn6+miZtRg7Lfsx6LHljE2DdTeQWrqQn8qTq5GhkCkuwpcpXJptIiht0vw31NG4RG4cpVfO6hna36WvHi8P+6dgxbIonhJTPpYPrY6//7LFwmUHXPOKmbmKQPQakaojK7jBfwLJ5/pL1XW6uqYuMuS+y0D0IUUGU6ySUHb9PUi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UoCYwewp; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UoCYwewp"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4327790c4e9so70069f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 09:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769620636; x=1770225436; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ja9FGellKwjQz4JPddbVm/NQLxP3W+A3xru3RH3aEDU=;
        b=UoCYwewpl3yyunsfLrhughVmjczLYpckRZhNTUn3+dLaDTMgHTjptnAmNjHGRVETsb
         c7ZYkNuJc/ibK//y7hJG/rxsT7B0kBF9sJUnlV1sOz81O913Ni/hxgfWEEz/y0FZC3AY
         RFAbUxJlBQ4a159yQ6GvVhciIx3IYj+d5G9j1CsSf7OTH09epkYgpDFAdnN3eQ1Y3oyO
         8qgSrJ1AKPzMze+Id4uD0cItdaOyLsHkDHN9vFsu1IlN721m7ZPz2AEWI8/CSec+L6zJ
         9Qvllll2GBmBH5DfOVkrC1evKPmkw5mRUN87nCbiDp9cYRPqkdqIbIo/dBimoPH0Z5h+
         OkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769620636; x=1770225436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ja9FGellKwjQz4JPddbVm/NQLxP3W+A3xru3RH3aEDU=;
        b=OEYcHWCBzXUCPacScJLN3tx6iCDyt2OQCEep8xXOFd/Im20XfziUzCdD9Pi3h5dw55
         GtpnUxhu0mES2HrUkN0QHEWerPtIfP+KJF9Xt/QFdKOEuK6uhTt8nNF5Tj4oEkbfQOsH
         eRrmPCGg5yegmfcRzDOGdmKwRH9aeLVLCoBzMhl8QjBTGrWnmISUlKT4PrsetPg9TA4J
         89QU95fZw6qBAs2k+CU/mE7QSUt+0EliFwo55FfzpPeFunPwIyZrvIGtqRmeZyMrFLxq
         vwstV6TG5JDUrFxhoF4COdkooDefeMh3RZFWvZSAa12eqIxLwTDgqnqwLPkFdrwnqFk5
         1m7w==
X-Forwarded-Encrypted: i=1; AJvYcCWo53o7Y4w5jYlUqU6c/oQ4sibEDmcRvNnG5rMs80raDrIigZvOXovYAExZCx8NewbVFGQMjTSqUbtxt1C3@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg+sQ8bLB6sVx9TVWiTpuAKpydWsgo95sQqaGOvU6YcJNd6wr5
	JaCnHbwORO1tmrvxegf5m5G5svsODUT8CwpGxkWUJVQ93OBZHw6R+YNMYvo/i7M=
X-Gm-Gg: AZuq6aIJ8bYixAwsvYKRp+b0/cbl8CRsWdBE6xTKaI5PL/sE/O2xOT1Wnx0PPT7spN1
	V+hJ8pcYUQfkv/JIFL6j9gsYWdeUwKVRqSwk/547rsh/P6GLgLV9cz8VLmrGFi3ythJP0EWpxNS
	7GK+qjdcdjnazdagvrMdF87m66BONuqVEfBUxP4eNiqFmQHZlRsB6qrbWAS9HbVKmRw+TpTxSPU
	DO3100PB2rk+NrPqRslihJlTzdyxnsPF/0Z5C5nh93SPSu0CztDEfjRAtnQ1e4l2TnBI2/ABA3X
	6jM96VwWVCkJz3kyKFyw5aH7wEnGF3Ut6CDNaDHB2zumjdwfl000KtKABdSqPHm0hyeNrqU7Hc0
	pHxyLjd4jAm8GFZ5w43F2Q+hqrZkosXV+8BUO0hpraraJ7cBHB4ZG7bWQJ/pgl3QqDvAaiv8mwB
	3vnQ==
X-Received: by 2002:a05:6000:220c:b0:435:7272:cae6 with SMTP id ffacd0b85a97d-435dd02bf0dmr9351382f8f.12.1769620636241;
        Wed, 28 Jan 2026 09:17:16 -0800 (PST)
Received: from LGPC ([31.223.131.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10f82aesm8758853f8f.19.2026.01.28.09.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 09:17:15 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: modernize hex output and WMM check
Date: Wed, 28 Jan 2026 18:16:34 +0100
Message-ID: <20260128171635.39879-2-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128171635.39879-1-lukagejak5@gmail.com>
References: <20260128171635.39879-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use %*ph for hex dumps to simplify code.
Refactor WMM IE check to use memcmp() and validate length first for safety.

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..4b671cde97f0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2000,7 +2000,8 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	while (i < in_len) {
 		ielength = initial_out_len;
 
-		if (in_ie[i] == 0xDD && in_ie[i+2] == 0x00 && in_ie[i+3] == 0x50  && in_ie[i+4] == 0xF2 && in_ie[i+5] == 0x02 && i+5 < in_len) { /* WMM element ID and OUI */
+		if (i + 5 < in_len && in_ie[i] == 0xDD &&
+		    !memcmp(&in_ie[i + 2], "\x00\x50\xf2\x02", 4)) {
 			for (j = i; j < i + 9; j++) {
 				out_ie[ielength] = in_ie[j];
 				ielength++;
@@ -2084,8 +2085,7 @@ static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 		len = sec_ie[1] + 2;
 		len = (len < IW_CUSTOM_MAX) ? len : IW_CUSTOM_MAX;
 
-		for (i = 0; i < len; i++)
-			p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), "%02x", sec_ie[i]);
+		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), " %*ph", len, sec_ie);
 
 		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), ")");
 
-- 
2.52.0

