Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E82421EF4
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 18:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770230504; cv=none; b=IhxnwdW5WRAOVQS9d2uq519jJw6m+yjArTHXg4cco/JsSLfVbNkcAPTNgxsh5eOU3gkFvjp2ySqv6wmHDQXr1/Fu7DehPgWcNApv2LsvLJe+z4/ukC0mxmHML3QEpx4fhVg+HdSvlvKKa/w5Dt9sZp/Sl9SkYI+6c4MTCDPSEHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770230504; c=relaxed/simple;
	bh=DQpHOL+0SXTSy2z6/ZBNI7Ckko1Pz1MNVGGKcr8ZfRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fJO/yBv56hasrcvAifLK0NSkpNZ5bXtMnZoYDlGFmybc9sKIfz9MgJEz/53midfat4is6RypVFyGlLTOrO8MfSouFSrW090Ob46s+gvTYahGTQELzXTXxltQ1ZLcxHBwJ/i1epWP8blWgzoa9ldfzX2m3qpjKrx04SMzNi2YZI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nyj083Aa; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nyj083Aa"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8837152db5so12715466b.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 10:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770230503; x=1770835303; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gh3x73JwXTZjbn+cDuP9/cavTn3mXryUSuTK1vUTUgY=;
        b=Nyj083AaFlOAiXkqaB/z8v4ssRCIVqYxxvqkbEdRLxVz2GusqExJH/q+Q1FQpa0LBA
         G36EcHDU5aIDy0yhkLSXPtS2+jpOmjYix2fVSIVSgqPfVG9eEj9SY8wTRi80gq7SjuOB
         cDYQSXZG2dEtksaxVL5bulvwwKw+9pl0GHbmTVNEFE36MLpcBvfH5R3vLk0R0gDNNsey
         cwEOdwS9qbBAnSzd9bPLmeYyPtoiFpyn873n3wtK6t0HUVa9Q23dEKyNyqLEdkzqtsJ6
         kPIruEF2uYd8aZtPGfRHp9hihEqx/r+mGnTzJ2pdOVKeIreUh9hXA3IwhUcLzSQjgUrP
         nQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770230503; x=1770835303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gh3x73JwXTZjbn+cDuP9/cavTn3mXryUSuTK1vUTUgY=;
        b=JuoPwCjHTKiRIaoRaAlr9odRKjgJdlYU2OSd18DHT9Xu7c7QaZ9CrKG7HjHVqdYxaB
         L8zLL7+kntHSZqgfVFJw2V56UYbgeil1u/hTaQva3sAv689ohgjKyR+QLUJkVMWr544R
         z5Zu8Xh2NznK99DnlxVKbowb6u5ml9qAsxRLpo1LQfpZ+FGD4PLd19LlCxTL44sVJEGs
         auGi/D2AKiJoYBrWyPy/4x3cAgadUKY3KYLqsk1DWq6pKGyE/GmQZdFG7QOxBjc4yRn/
         VZk9yvQG5TU7G5gwo391p1YO9RQnbUVIJ2SQEvAQ55WtZFLmgE5DxJ5POy8XuVeSxgoA
         YN6Q==
X-Gm-Message-State: AOJu0Yxz30sv7a661sLb9AXeVraAzH6cDgJ7OyLq9q8lSrmhdco4qUQ2
	jyzNkY5ZODDUiJE60cG65EAmc46M54XTZKz5jtpsG6v+OWEQVqkYcqFXJexFRg==
X-Gm-Gg: AZuq6aKxGXP/KM8y+adSB+7cqvZVdc/dA7ZzNsTWXvada0xUnrrY1VicnAWmo+Y2E+Y
	eqQKbLh9PdyQcchzSwQswrv5XjSNWVTX3JDXQVtskYKTTtCTLRErQ5Ym1cu0eSlcRIfNPO5WfUV
	ysfykLh5SnhHzHF7dXlkGNdQp2EOw1RCiyRaMZqkuZkmc80xOcPwClFDYJH9exdYTiW2vq0y8nu
	nVzQfWWGTXxCmqJ9wgMPJ0laafkhhQjx3aO6Gk/ru9cE77Oz9MUu52OauuewbhBgeg9QOHlmFnJ
	iq/mFMTOSzUgyOc9MFRAyqCO8HTs076XPoeNVD/3bn8Hx91eOus2kBJ9As3gIf7ZIstOI6lnDgW
	9nCy/jl5swxDs1BgeO2OQnzPtSP9LSFuAuyI21V1qfGEpLlKzACGzb40WD04k+rM+6tolHoNkkj
	0MQBMgQTRsEhz9wbkINMxBuCItHZvm7xFSJjVhqFht1ngi26v4
X-Received: by 2002:a17:907:2d94:b0:b7f:f862:df26 with SMTP id a640c23a62f3a-b8e9f054a77mr298027566b.14.1770230502375;
        Wed, 04 Feb 2026 10:41:42 -0800 (PST)
Received: from arch (45-161-98-95.ftth.glasoperator.nl. [95.98.161.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9feeff5csm147871266b.34.2026.02.04.10.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:41:41 -0800 (PST)
From: Haroen Tmimi <tmimiharoen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haroen Tmimi <tmimiharoen@gmail.com>
Subject: [PATCH] Fix checkpatch.pl warnings in rtw_ieee80211.c.
Date: Wed,  4 Feb 2026 19:41:33 +0100
Message-ID: <20260204184133.142511-1-tmimiharoen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1. Fix "Yoda condition" style issues by moving constants to the right
   side of the comparison (e.g., changing "_SUCCESS == val" to
   "val == _SUCCESS").

2. Change the _action_public_str array to "static const char * const"
   to ensure the array entries are read-only, preventing accidental
   modification of the pointers.

Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 8fdeeda88..febc14de6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -1009,7 +1009,7 @@ static int rtw_get_cipher_info(struct wlan_network *pnetwork)
 	pbuf = rtw_get_wpa_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length-12);
 
 	if (pbuf && (wpa_ielen > 0)) {
-		if (_SUCCESS == rtw_parse_wpa_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x)) {
+		if (rtw_parse_wpa_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x) == _SUCCESS) {
 			pnetwork->bcn_info.pairwise_cipher = pairwise_cipher;
 			pnetwork->bcn_info.group_cipher = group_cipher;
 			pnetwork->bcn_info.is_8021x = is8021x;
@@ -1019,7 +1019,7 @@ static int rtw_get_cipher_info(struct wlan_network *pnetwork)
 		pbuf = rtw_get_wpa2_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length-12);
 
 		if (pbuf && (wpa_ielen > 0)) {
-			if (_SUCCESS == rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x)) {
+			if (rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x) == _SUCCESS) {
 				pnetwork->bcn_info.pairwise_cipher = pairwise_cipher;
 				pnetwork->bcn_info.group_cipher = group_cipher;
 				pnetwork->bcn_info.is_8021x = is8021x;
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

