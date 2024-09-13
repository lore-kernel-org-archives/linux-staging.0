Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE521C3D
	for <linux-staging@lists.linux.dev>; Fri, 13 Sep 2024 00:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726187340; cv=none; b=jeAmDvgodflmIP/SbgFnr5hnNTajynSj9rnreqJQrsrAbEAMimtMa0J+N+MTmjuIHByJEYhvPxbeGeO6Qm903cBjf2koT4ad/03YcZ674eG4cGmQXy9IaukewEnPjEymEgKnW9b9cRkUmSoSJFUCsabwp5hnWibpo9cyXCH2yAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726187340; c=relaxed/simple;
	bh=7S4DCxTwiaPxtVe2SN3HCOjZCidsm4UCsEl5AimvkpY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T9ZUAfhtcB3o0bAVDBM51UwQxJA845LXUVcfj6dxqHqOYPD2MYy18sira0aMfz3gcLSVgJwlIh2HvYw0pr6vhBiIHdPTSivh7eJLdbfU8bsZlMDg/u16J1tWWO4dRk2yzQCBLRQNv/dF4Pnv/p8py6BnZ6XMGVSdfH5MuubO8q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=t+k0lZva; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="t+k0lZva"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48D0St2iA2030644, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1726187335; bh=7S4DCxTwiaPxtVe2SN3HCOjZCidsm4UCsEl5AimvkpY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=t+k0lZvaeL5C3eCLsu0xc8t/QiHZHMZzWHhRTNHUi/wSm+geD+b9m837OxOqrNRBO
	 wy2VjyDQJWdvOmNNU+0A04bdcDHBviL+OcDUfr+lkH5k74hUpgeFBHG/wQtej+cMkn
	 jb1OliH0w/KVcQPR2mk86RvMzc6FZKkPMG/oVidnFTSI2WQrYuY1KEI8nhAQHmvHh5
	 zVO/LjbnhR402CccWPfDU74eZqE6lzfeJPSRZnsLY/eC79lGcsntxqKT5odgfC21E5
	 msQ2mwXBhyd0MfRE4O9W0/Wr6Fx0eWAv8QXGdM8KqZQsWJPwBjH4w3Trvfibjw2+9s
	 5Gjg8/sO3ws9Q==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48D0St2iA2030644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-staging@lists.linux.dev>; Fri, 13 Sep 2024 08:28:55 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 08:28:55 +0800
Received: from [127.0.1.1] (172.21.69.94) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 13 Sep
 2024 08:28:55 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-staging@lists.linux.dev>
Subject: [PATCH v2 3/4] staging: rtl8723bs: remove unused cnt from recv_func()
Date: Fri, 13 Sep 2024 08:28:14 +0800
Message-ID: <20240913002815.5149-4-pkshih@realtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240913002815.5149-1-pkshih@realtek.com>
References: <20240913002815.5149-1-pkshih@realtek.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)

The 'cnt' is used to show how many pending frames are processed, and the
debug code has been removed, so removing 'cnt' is safe.

Otherwise, clang warns:

core/rtw_recv.c:2030:7: warning:
	 variable 'cnt' set but not used [-Wunused-but-set-variable]
 2030 |                 int cnt = 0;
      |                     ^

Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 7a95e15e641f..b30f026789b6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -2026,12 +2026,9 @@ static int recv_func(struct adapter *padapter, union recv_frame *rframe)
 	/* check if need to handle uc_swdec_pending_queue*/
 	if (check_fwstate(mlmepriv, WIFI_STATION_STATE) && psecuritypriv->busetkipkey) {
 		union recv_frame *pending_frame;
-		int cnt = 0;
 
-		while ((pending_frame = rtw_alloc_recvframe(&padapter->recvpriv.uc_swdec_pending_queue))) {
-			cnt++;
+		while ((pending_frame = rtw_alloc_recvframe(&padapter->recvpriv.uc_swdec_pending_queue)))
 			recv_func_posthandle(padapter, pending_frame);
-		}
 	}
 
 	ret = recv_func_prehandle(padapter, rframe);
-- 
2.25.1

