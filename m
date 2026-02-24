Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2C926B756
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 16:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771951534; cv=none; b=C4tbcC7VOTSc7Gb4ePDX+EoTjsJP59ucZoPb/HI4ZvKbeOBiCQaHN9XXpcA/ASL6ud4dh8B+vCCYydccyhrd1S8gK9FuQJJ2CCzdsTniIz8a/enSNXJMcW2hT8gG+RkSHcrzMqnpxkYLYc7AJUHzji1drzO7a8gyVzT25gsXBwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771951534; c=relaxed/simple;
	bh=uHx5S8x9iGpgv6HQkPfGpRhQPzriMWMgFRouE4PWzI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=epn25NBKj+a/sIo12eR9WT13LVXCBa74BiV7OSxtTiwURRBkUgAenia279JZE5tUFVvXBNww5TX7wXb0ffI5Whw1gnZrI5/tAyy27m8iP7sq25a2vn+Y1eYPl5JZEiphCAUMigG0PgGoB16bX5F7p+/m32oBnMQgn9CcemW+0zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNWnZDYN; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNWnZDYN"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-797d509a2f5so60127517b3.2
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 08:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771951532; x=1772556332; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=daUd+ojxMfZQeOD6HgfpjAq83/Qoio0llKAC9E4Rc2A=;
        b=nNWnZDYNUGAVNtWxyu747cU0dGbUcTv1ttKqYTtGNAw5yTZlfanw8vsMNk1Hhs9mDU
         vbkjqcqZCi5Hyf2RFC8ph9b1aZ3dsvcfJQBqCNsM4EizHANSIdRorAFXWPiAo32YqJHN
         RmhiESGzCJXZ8E362i7m7sTCFlJYq9/ecmmsMDhM0VWeXSjE0Z5XVz/SpYXSTamD2jFy
         4EoPkxL0GX/71oH/MSkya9PjfFAIM0P1xtTkvryNk/4ScU7AQA91tPLh0+aftrHZxGni
         L//QlWBLsRe4zFsCt4fRiXQP2+yuaDZ1Rcyfv94Xwu15ck3BOglDgcnK7UFeJUKndijO
         KTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771951532; x=1772556332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daUd+ojxMfZQeOD6HgfpjAq83/Qoio0llKAC9E4Rc2A=;
        b=WTOyETpLN/5/D2G+PR4SV6u6Myymu2eaQX54UOBgdb78yWoc/STmo9BMXxgB1ePfNl
         sLqnBeqJ9UaE+9FiLpMEkGo5NE4cZ4sWS1GdrPTmOQ/9RClRg1bSTV6Ce5VNYYnSGGmz
         Q6WptynLrnLdoOY6y3SgUH7W9RZq4NRXbIqceIGZJ3Tvu10d738fEKgJgfccxs8qQLeo
         hj4IXkqqu1l1be7e8j1y9FgpvuhWrZ6oC/XRTW/9wkW3CfsazyNxjNmsxRjXUetBmT+k
         COZLsQW4ogCcyV1JugrK20XaYi+XzhrqxGxXuCVj2dSgRA8y/DQCedNF0utHqbh0ys5C
         mqrg==
X-Gm-Message-State: AOJu0YxpWo0to2EeLp/vZhTlf+4fKpncqpWkJBR/1Oklwmp+HdH8x27u
	tpaoPsmnp2bRTkYW+B6TUiO2UOGE99Udv1inVEngbVhLOT4DBRyFKakl
X-Gm-Gg: ATEYQzz8alatnwle5+bfh5Y+E/FLPhEUDnZCQzyvQW5CYw2g1ZNJoCFoaImRF+iz56P
	CPMBHHGvPc1C2jWHZq7/5d3uHfDcu5goH7PSkJ97wAHfCmi6LoAb1WQ65mh5V3Latm+YCFr1eqP
	OTBx7+Es7TVjJSO+n+GWtIJVRL9MBKVaj8kBi7wyCIpS+SOw7JEq4zc4+wkE/SbdsHS1uyaA4vt
	ytYVsbq7vHBpnp26mPT4qW2CYPVjDDEqEwr+80b27rgtu6sDIJkit5w/70yJGU17DI7dHYaNGyH
	kXr7jaOpMlL+rEEs35XCLWWu+7IhvVU2Fncv3owTqhuTikRkQljNbRZtdeuUM8Mx8f7bBoQQtn/
	GrQqri3zO3wOdIJJhEOMz1NyBmFwUIBNns4rOaHr7PZQBQhFmPJt6PZtUpa9U3oFg8GzBV6b/PM
	4A4Con0nFOdZHbwy7g9gbqQQ==
X-Received: by 2002:a05:690c:368a:b0:794:73f7:ff81 with SMTP id 00721157ae682-79828eee522mr95828797b3.14.1771951532233;
        Tue, 24 Feb 2026 08:45:32 -0800 (PST)
Received: from archlinux ([93.186.111.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79858b663d9sm12070267b3.48.2026.02.24.08.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:45:31 -0800 (PST)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove recurring counter increment
Date: Tue, 24 Feb 2026 19:43:19 +0300
Message-ID: <20260224164445.18316-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code:
	cnt += in_ie[cnt + 1] + 2;   /* get next */
is in both the "if" and "else" branches.

Remove this repetition, which will simplify the code and
improve readability.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 23 ++++++++-----------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 605c32fd2e88..e1077ca609bb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -589,10 +589,9 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 			if (wapi_len)
 				*wapi_len = in_ie[cnt + 1] + 2;
 
-			cnt += in_ie[cnt + 1] + 2;  /* get next */
-		} else {
-			cnt += in_ie[cnt + 1] + 2;   /* get next */
 		}
+
+		cnt += in_ie[cnt + 1] + 2;   /* get next */
 	}
 
 	if (wapi_len)
@@ -620,18 +619,14 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 				memcpy(wpa_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
 
 			*wpa_len = in_ie[cnt + 1] + 2;
-			cnt += in_ie[cnt + 1] + 2;  /* get next */
-		} else {
-			if (authmode == WLAN_EID_RSN) {
-				if (rsn_ie)
-					memcpy(rsn_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
-
-				*rsn_len = in_ie[cnt + 1] + 2;
-				cnt += in_ie[cnt + 1] + 2;  /* get next */
-			} else {
-				cnt += in_ie[cnt + 1] + 2;   /* get next */
-			}
+		} else if (authmode == WLAN_EID_RSN) {
+			if (rsn_ie)
+				memcpy(rsn_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
+
+			*rsn_len = in_ie[cnt + 1] + 2;
 		}
+
+		cnt += in_ie[cnt + 1] + 2;   /* get next */
 	}
 }
 
-- 
2.53.0

