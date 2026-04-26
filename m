Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DBA3126DA
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 09:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777197225; cv=none; b=odiJH8/7XFdVlTlg28mh3hxnClmEMjrUCE+gs0BLonpcrcvgt+ZY26X+3R1Pbsp72sXC8v0nQt3DJ+XFlj1ftrrl2f2Pp4HzS87aVVbOG8824Zo23lfb4E9eSe2h9bly9JJl+YGccJQFp1VzlBqFhBwN01tjtEweYwj4REmXAyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777197225; c=relaxed/simple;
	bh=+lVpKE1QZRQEXC1moT5U4HACD2SU7kfRqYwDGYNL1hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gzQ4wdPvwv1IrC07nk3e83vDVYhruCWG0BJImFLF/FXS0vB5vAoWdmKQ3gxKtj5Uuk0T4uzJ7eJUL23DZhnizU88V2NIkVHJVJzUGviZBzrBPHCWUJDmBz74KRGEPzLFZnL6TTsf4OZ4qlt5jxygLqtCkpvRS7johGxH++eW+Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nu3TLdyl; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nu3TLdyl"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so113708235e9.2
        for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 02:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777197222; x=1777802022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/fYK6c5kDEhdCDlXgzeFxfmv5jZ0y6gLmyPk2OsiLQ=;
        b=Nu3TLdylYDelrqiELUHwiy+QGHzWgTVtjkvHeIhE0FejmR1jKRMG+MxVqaaAA3Kr6c
         W0FVGXgM8jw+j3ZVS69M1LSK4KwNpzx22ICTAPEYi6QGpavctHZuvRav4+xpgDj2FWtM
         wjnyx3EvsdRnZKfS1OieHV9YCtDnuifoRZia5dnANFqQtn2vz1tsl3z88tbHtZvDTFz8
         /v3OEK0jnqawUIhqF8BZ7Y+hqUwHgVLsu1DB0Sqt6w/LM/qjfjjdgSMUaf2qEV0WZF8N
         kxOumv1zZpY0iZ5kLeErwyo9k1PEIIIXnu4ysx25g5R6HbBCQQOBZTk7oGHNkE9UiJ2J
         ZxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777197222; x=1777802022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z/fYK6c5kDEhdCDlXgzeFxfmv5jZ0y6gLmyPk2OsiLQ=;
        b=DOlnSxt1tLJ9YNdQTC06VhoaK1GcW10EiQItoF5V6nCVh181nT+EFdLcUMao5DI2G4
         LdEQ5zjXn7dfeknL6hZgvsMYKZcJY8HWFcE5w95zuUd+lXTqT4dR6/pGfXdA6NtvtsTs
         RHur3v1ORo8Hqvq9xHrwlwkkcoPGjcK6MAOplsPuMiqrcs8q5CMiYrwNzX3pgdETTsvE
         7oYIAc8+XoBDpzjlP13YufSt8EXADj4IUQ5LWOVNY2q1V1h0hwutS2/uYbW5QQvD9PEf
         W/JVt05oI4/eWvtiMbZ+mMtSFYzYa/JP5lAyV/+IV/A5Z6fGI/PC5Z6XHgmaWDwX4T+0
         7A+g==
X-Forwarded-Encrypted: i=1; AFNElJ8OVjNK2QxEYy7bAsFpMBGdrWKLDO4zeljjnwnA84E6AjRpxUsb/ekJPR/nlax9HyH3qMND7/7AqyaPyMYS@lists.linux.dev
X-Gm-Message-State: AOJu0YycOjqC289gxOGtwYyqimDkRDdMf0agRY9itxbCj9+4hNVUnoA3
	+OeOwK6uopy98ZiFdgSe2ZNSPlLN9htogzFw0KtPx+JE2cvsonbPZFTv
X-Gm-Gg: AeBDievYmbcbeomZDRxJHdSTz2D4KGEmqilaYZpKTi7AnasKdrQ/XP9nNMCCPNb3U/G
	LJKdd15rA0eA73BoTI0GgF0I9rwqqE5FfA5umEwyX5snM8CaOoEEjUERMrf6NEeioBI1gQB0Zq3
	dA7kwVGMKYX59IUtL8gUkHg1nQIbXdlZit8zypvEAYg7ecK6NUZMEPLde7nNQXnZDXXwXN7VBnW
	GvgaF+yq0vprOg5ByUkoTinEEQAtgybmi+qwbnvyk2zmsp5KCEyPfmRrQnrZHXDNhQPdmYRG4TE
	aI9m/UhEnqQgifV2Vqn3ScN1JjduPJcP7cGHZ5NPwIF93DqEW/wjqdW2XmcA9p3JJn6MFGmVlWD
	yebD5yf/J2lJkFWUnY7TMYInrs/Y5JUu62HRmrxEFMOYTc9YIsifG+qBrguyHYDvVEOh821kbcm
	29Y29/oyGPwkHx0GWIEv9qwcyRQUk4UWwqFzcEeDLRfZDEgGumVcdkh+pA2XPbxEkbtphWiF0Y4
	21OfQO53FSVciJ6KL5UgJhk50VtL8aXQ+7FPBkrcod1KwXiLaXZHaUKXx68KrQa7eYV7Ck=
X-Received: by 2002:a05:600c:3553:b0:48a:52f2:a0f1 with SMTP id 5b1f17b1804b1-48a52f2a5f0mr354235405e9.18.1777197222401;
        Sun, 26 Apr 2026 02:53:42 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb735d3dsm510905405e9.2.2026.04.26.02.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 02:53:41 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev,
	hossu.alexandru@gmail.com
Subject: [PATCH v2 1/3] staging: rtl8723bs: fix OOB read in update_beacon_info() IE loop
Date: Sun, 26 Apr 2026 11:51:54 +0200
Message-ID: <20260426095156.3523480-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426095156.3523480-1-hossu.alexandru@gmail.com>
References: <20260426095156.3523480-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IE parsing loop in update_beacon_info() advances by
(pIE->length + 2) each iteration but only guards on i < len.
When a malicious AP sends a Beacon whose last IE has only one byte
remaining in the frame (the element_id byte lands at len-1), the loop
reads pIE->length from one byte past the allocated receive buffer.

Additionally, even when the header bytes are in bounds, pIE->length
itself can extend the data window beyond len, passing a truncated IE
to the handler functions.

Add two guards at the top of the loop body:
  1. Break if fewer than sizeof(*pIE) bytes remain (can't read header).
  2. Break if the IE's declared data extends past len.

Also replace i += (pIE->length + 2) with i += sizeof(*pIE) + pIE->length
for consistency with the sizeof(*pIE) guards added above.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
---
v2: Replace i += (pIE->length + 2) with i += sizeof(*pIE) + pIE->length
    for consistency with the sizeof(*pIE) guards (Dan Carpenter).

 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 6a7c09db4cd9..e0d73c267786 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1289,7 +1289,11 @@ void update_beacon_info(struct adapter *padapter, u8 *pframe, uint pkt_len, stru
 	len = pkt_len - (_BEACON_IE_OFFSET_ + WLAN_HDR_A3_LEN);
 
 	for (i = 0; i < len;) {
+		if (i + sizeof(*pIE) > len)
+			break;
 		pIE = (struct ndis_80211_var_ie *)(pframe + (_BEACON_IE_OFFSET_ + WLAN_HDR_A3_LEN) + i);
+		if (i + sizeof(*pIE) + pIE->length > len)
+			break;
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
@@ -1314,7 +1318,7 @@ void update_beacon_info(struct adapter *padapter, u8 *pframe, uint pkt_len, stru
 			break;
 		}
 
-		i += (pIE->length + 2);
+		i += sizeof(*pIE) + pIE->length;
 	}
 }
 
-- 
2.53.0

