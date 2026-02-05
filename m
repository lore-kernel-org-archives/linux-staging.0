Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B26333ADBA
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770293356; cv=none; b=edaONe4HfnjdxYSCd6/O2SrOZvHuagmc5NUZyvTjo+guAEPX+pedmA3AeTII+xFnmBeyNlXeAcMih+ewvzV8IEG0GzT4nWIZG0b6oby5Kf9bt6f5BMQV5VWK7ZEbgD5Oj+rxlwPxi7hpdhARefZkDzgMxshcwNcoHxpHUTJBVck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770293356; c=relaxed/simple;
	bh=wMHYSWs2L+mwaqJcylGQhTKvOY1zsxaX9rtnEMlTyAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DlDEThPqfzDuyycKjWF9GlN3OT0L9WDuCOAiqk7hZEk6EgT0DjQvmZJfTjlnzWXPzCzvsyp+3kKmC9OyCl+vyvN4P4ZG6J+XU6sa02+0+HqL3/zovddSexFeCzeO4v0/1kZhLqAiH/P5BT2h2Q1BoyE9mCWtLMYa3ZkBJBoDWW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2q+Mabx; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2q+Mabx"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-658b6757f7fso415356a12.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 04:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770293354; x=1770898154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gi7DUAR8qnugd7GNKj6EZB2P4GtnQFCGqjFlV4BxK20=;
        b=Q2q+MabxGnqqDvev/jLCh4wx0NUn0ptnOHArD/kTXZAr4Ky3hZgJHGjyFkoOEAosBs
         NwpMsbaCT6rnY9dKVvWGVGaih5g+AAt3u1TCacnICY14ne0z15kES64MIEacENP3e6nl
         rthSg7hUw1Abj/9X1lcSMTFvWae2y94DiuMPZ28iDjI7bJg3FISY6xgRBtXQAHN21FvY
         LRd4zOIOdzUBFTg24DAtBpiUvlQLVZKvjsL2bfwpFPi4rCQsbgwEtRZ9G3/VMvdXAN52
         ZRSaindgifpujmdyu1OTvnICtxyaoOsJJBz77BXUekxO8rnqtXKuqrJatRxtB/qWKy05
         EvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770293354; x=1770898154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gi7DUAR8qnugd7GNKj6EZB2P4GtnQFCGqjFlV4BxK20=;
        b=MzjvhZbspHopBoOW4RG3cM/yzCGexo0s043ZHfIvybuowmbitPySiVeYRl1Oq4MsUj
         vbqBPRmPaVWdz75vgBlz8+87I23oYjtsaMX9AbtB+eA7N7ZXPRo/pK0Zwq+4po5zBHWF
         qIW1HgLThogvfryGS7J8SvNsvB/DLPjaYX+NIFn/SoSVAG7vhxmo4ZyXATvc22lDDCz0
         dUuKcFWwvYesNGoNmwPLGvSZScEJJ4XCDv2Z4s0uK5l/NuMeG1Klacji0dR1JeWb/oiO
         eoi1AnJqycdw0vHBfU9vdiJkCA6YVXSmICqvpBPxX3rfdgxYBFm+6DrPE/qKOoumreHw
         SBoQ==
X-Gm-Message-State: AOJu0Yz4cNzbOl96CGKZxsB/Ca4NKhY2Qu+qzctiMBHFnn3Q1I73qu+A
	MMT+K/pFohZ059wPL3hddcT+WJDZ3lx1i5V3BS+TMWnzCUyRnUCEzemn
X-Gm-Gg: AZuq6aKoAYfQ/4EFSTabzyE9BZB+6mwlVwU8PLgr22tWf52Q775lCuMcegO+8hVBpL6
	5GrlEgaWf91PlR8QCEpR+6QJR4xF+dKgzPINNLFuh9/nxo8zbRVg+P888GS+mTrZ6GtF5HdnZBe
	9TCYHWzI3oThiD2wQW5lZvlAy5EX0iFGMh7KmQmHdltoyEUENeNOAkujbXPae5yIoWR7K+KLSzX
	asDBbMxtaJs0Amx+llDdGwxx1dGyh6XF9QPadsKBTKewBsv5OqQH2paOyIHg5YlgtcMZI6vtDR8
	7+j+zv17adPr3FgpOsf9bxv1tClzvdVQelbDUWs+jIaSjG/7y4FE2VDz3pj8wcz5N+RCuzbg+/c
	zIP6h+k0TYjZn/u2A0V0SmKXPxH7ONNKTKJBjJQM2pyHv4yQkH0Ij78Dj8gnOLzuubYJ7sCXT7v
	25Ps3sNNz1gS6qjzZMelMZZD/8zQ==
X-Received: by 2002:a05:6402:13c9:b0:658:b029:9e50 with SMTP id 4fb4d7f45d1cf-65963035f7fmr1473101a12.12.1770293354285;
        Thu, 05 Feb 2026 04:09:14 -0800 (PST)
Received: from arch (wlan-208086.nbw.tue.nl. [131.155.208.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6594a216a79sm1835662a12.16.2026.02.05.04.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 04:09:13 -0800 (PST)
From: Haroen Tmimi <tmimiharoen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haroen Tmimi <tmimiharoen@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: constify _action_public_str in rtw_ieee80211.c
Date: Thu,  5 Feb 2026 13:09:09 +0100
Message-ID: <20260205120909.161336-1-tmimiharoen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the _action_public_str array "static const char * const".

This ensures the array entries are read-only, preventing accidental
modification of the pointers.

Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 92b12a13d27c..febc14de6bc0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -1139,7 +1139,7 @@ int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category, u8 *act
 	return true;
 }
 
-static const char *_action_public_str[] = {
+static const char * const _action_public_str[] = {
 	"ACT_PUB_BSSCOEXIST",
 	"ACT_PUB_DSE_ENABLE",
 	"ACT_PUB_DSE_DEENABLE",
-- 
2.53.0

