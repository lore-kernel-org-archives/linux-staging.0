Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5A3368D5F
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 07:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783926362; cv=none; b=E56MeMx8IZX99bDIMkg+Jk5g4Lxa+JBg9SC0h+bRh9GrvOsuf/tE2xV8J9GSj5MK1ytdrqwgUDVJ3/nCeJqCq9tuT92EY1gMdKTqNZEx5K2YnQi3VdriW3qZL1J3jzpbVdmhbd0r9SnQdwrJU+zf+83mkXgFIi/Q67GlosEjJlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783926362; c=relaxed/simple;
	bh=oMlfsfiSE0cT9W3OByCiHCCl7GXUyN/eRFDfg/rVZRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MBQ+tqJCt7g917W6Ca9p/ktDPlj7z+WjB3V+1M0msBm2AMqnEob8jsZb5Gh2zD54PEzkuWS/AkSXIWZtAjL3dq/Cem0J/sPo/W/AXIIiGzVs3HFNAPHnaIb5+plL0dywoHhgMtjVIRxza+TYBFZUZjGVIIhLwPEtMFCYbx/OV1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9nJ7uqH; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9nJ7uqH"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-381072761d4so1838894a91.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 00:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783926358; x=1784531158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdQwwTxmpRrQW76O49QNFsy/qCBmIpByAPOiT/YU9R8=;
        b=K9nJ7uqHJtXQDnkXBAcG4rVH0TrpXGar2LnUFjCp0F9BG5x6OvG+D4vcd1EpBpSaJ2
         On+acBNbPzPR5sHrzC1EsfZ/k911/k1I2v7o0Ydqhe9ne8lKsqE2qpgOIILsq7l9sjvL
         lmnjPYC7Xq//7719GGXXeqq1naPyUCu94D1EkQ7qaZ2as9tpVOI8F81wlo3dONoAskMn
         +AvoYYbz6XMKJddH87yIYtQHR1Z5bvue1LKa8cy0jaWvoFX60w7oZUh+pT1T7qDzaW1X
         RSLaSR/+Wm7e1ovJuQyZtT9Wie/qBq45/FQm2/rDd0YJNknvQgcgwqNssZqzuQeew6aj
         g6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783926358; x=1784531158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qdQwwTxmpRrQW76O49QNFsy/qCBmIpByAPOiT/YU9R8=;
        b=p94iKtObkSfopS0rNGX7a//QFrtxKwboZ5d3cKT+JZyxULR3oYMyy1z4wB6bmkukzI
         OpCEVuqZge8Qr5R5+f2eAIBaHF0I1BpxTJ0bEC3wRxD1SZZ4acV2P++OYrYJIqkSv7lA
         waZtxTMc35Zqhse7dd/cYUjhEz5ohSfq9Dkg3dlDkLbVlop+MDgSzcyT4d/zIQ+M4zfd
         SSQns379//QYtQ2sIbdE5C9Ult7iF30iblZ5ZXMk+0EE1CkKhx+hDt1NJNSlZDHwhQzX
         t73oy8FvHy0vdT26fFaZLRSX0OK1R3KjmoqEnw08k6utnRQPMte0kIhiTNHSRhOshatR
         fRaA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/hfOR2uTfjiIsBWlwGPUTYfpuL6zrg2pk7NQKPYD7tlCGSYS6WFVz3b2CUDPJ23Aeu/XXI4rprkxy4qon@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9du2Idyr6Nyk3qWZ6Pcvc5osDyaKbHB2VVRqLxA3DoAopHg51
	5iIiYx0zR1ZSzPVPLwqYirKqiqRmwEUsepEmmD5db2gfP2xYSm6pR9Zj
X-Gm-Gg: AfdE7cn1+s8NG1iCdA/QDInolT/V5wlwK459wMwVZgl9P7lrGNYV6CMh9h0w1Z8TdUb
	L8tWDHmtJy9rqfFENvGhMU/KioOrrOuCvG1ylgciPGsBHvJpZ6HDSKAAdIyecsfvE2bDnyI1WLN
	SCszcUK5udhRV39KB6nj3ck0b0nU30h9bquo+G1K5ODKL6As6rWvd3vkN/Y7AhVZFL4djfc5JWM
	ZJCI0VuwFHwI7/UaYRip8SL+iPCWzTKYaWJKfEJD7b7yUXgKk9lZQVkdAOt7A9JDxPz6xUfGD4y
	9RgJ7XyGRE0szbGLjZ8tfWRCEH6TYIIfQpYmUvXffhF2tOKmdzsWvuScTa6XYZnRGmSw8F/J9ek
	yXxw90yHUspsz3XveEaGW8ApB4/g4lnSy6rJQnkUX03wyn/X14SlKkIa3OEm2e/AoeLYO0elZ96
	BSvnI9RE2DaDXWEsvwlgtXSrEVEznarpCQkXjoSPjjnHsL
X-Received: by 2002:a05:6a21:398d:b0:3c0:9c19:65c2 with SMTP id adf61e73a8af0-3c110a7780amr8249156637.74.1783926357806;
        Mon, 13 Jul 2026 00:05:57 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b0240570sm33971943eec.28.2026.07.13.00.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:05:57 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	khomenkov@mailbox.org,
	khushalchitturi@gmail.com,
	s9430939@naver.com,
	nikolayof23@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 4/5] staging: rtl8723bs: simplify rtw_xmitframe_coalesce() control flow
Date: Mon, 13 Jul 2026 07:05:36 +0000
Message-ID: <20260713070537.15903-5-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713070537.15903-1-dennylin0707@gmail.com>
References: <20260713070537.15903-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace goto-based error handling with direct returns and
remove the temporary res variable.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 07e413f4dbdb..d4bdda50b68f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1082,7 +1082,6 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 	u8 *pbuf_start;
 
 	s32 bmcst = is_multicast_ether_addr(pattrib->ra);
-	s32 res = _SUCCESS;
 	int ret;
 
 	if (!pxmitframe->buf_addr)
@@ -1094,10 +1093,8 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 	mem_start = pbuf_start +	hw_hdr_offset;
 
 	ret = rtw_make_wlanhdr(padapter, mem_start, pattrib);
-	if (ret) {
-		res = _FAIL;
-		goto exit;
-	}
+	if (ret)
+		return _FAIL;
 
 	_rtw_open_pktfile(pkt, &pktfile);
 	ret = _rtw_pktfile_read(&pktfile, NULL, pattrib->pkt_hdrlen);
@@ -1176,10 +1173,8 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 	}
 
 	ret = xmitframe_addmic(padapter, pxmitframe);
-	if (ret) {
-		res = _FAIL;
-		goto exit;
-	}
+	if (ret)
+		return _FAIL;
 
 	xmitframe_swencrypt(padapter, pxmitframe);
 
@@ -1188,8 +1183,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 	else
 		pattrib->vcs_mode = NONE_VCS;
 
-exit:
-	return res;
+	return _SUCCESS;
 }
 
 /* broadcast or multicast management pkt use BIP, unicast management pkt use CCMP encryption */
-- 
2.43.0

