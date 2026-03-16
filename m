Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2831346FA9
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 22:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773699585; cv=none; b=eqKuScj2KaR36ekHp74HPEO3MljAhRG1WHA7+2vZ1HUyVHMbFIlU1sKovMKAeEvYGUCprdEl1PZgExKKT6EwJJyME7thhS0XGLj0R51IpHisQroSh2C/LH2PEHwFmWcH9nb7wem7T8+YqeWtRQScXK8ZuRFXSjjtb3USSUOusw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773699585; c=relaxed/simple;
	bh=CM/X8S0vcpdZ3crm2UrFKGdMJv12g+UEOk4qsMehcw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FRwo2GC3UoiDj6N3nU3xGSSxEfO/jTxC3kvgA1Z5cNze5idwWN8vxnATWISWwEIQGXifPhG86sqOZLv+GAfOeQqWTZUp9/Hns0rn4o4o4jpUxEGk/K6ZuLbSvfMoo/MOUge9Rn6gyD8nGeN/R9+5ZC2TvxF/+X3Muujmcq0JVaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fs/JlGJV; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fs/JlGJV"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c0c482e069so1246580eec.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 15:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773699584; x=1774304384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JDEKwxQMYWzrzuldYy7udy2QmtY/Hmc7D8YU2PTvK+0=;
        b=fs/JlGJVNn5NSDtYuzR/r0g58NTGRPw2PZaPpmj2pLpXr/Hn3cg+5QNspTieFEwAAX
         sSXLBcXkVI+0McXHlCaBSiHM1J9eGgBg8NkBxUN4y1iYJqCs0UygkkO2GOmDom/fTxIh
         /vCAUuJ7pBxuOJ8hxUYXvZ/76YLv9xZvtzK/qTS1gphqA3CQus7QxGxBO3X0emIpa03k
         5DBByvkmxy7BoVLeyfwqbkd4HANCqGe3zviCo+KV6La7oxO2dXnr+DShB6pSTD/ufW+4
         1/lC2CWJmmSx6qRIeBF0vdpYxfhmnI2VCVsTFABFMs2dg3z7XtXXrJrXBL8hvfF593yQ
         JYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773699584; x=1774304384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JDEKwxQMYWzrzuldYy7udy2QmtY/Hmc7D8YU2PTvK+0=;
        b=K1TR+wv6FnoEMGwBnHZSoKQFD/JU1UBZYoglmaJo7fN5oBBA1pqGcE+Mkt+DbBMZWM
         jDeF5bv0C7BeTCkNIA3TP4iyBI51mszRjrdHK0mUucS3dWKKwePxr5lsxkkNXE4Yrsim
         0UKKCnj430QMkE1uZ3PruQlm2caIbkMbKLuh1jf4pOAjmvpIc/p0yaX6GKy9ieRuG2Cs
         6HIfXHrBfyVxsW+0tq7Z1+ckq1xZF+B3f8a6H4WNFLncfGVXTmyvJqY87JqD+9tUgcQ5
         ih0MUKgeE0gfxres/IWMLlXnHdN8ZKYc7F8sY+RMnYAxpX1l+a1J7EZJJRYMD2VRb9a8
         Tu8A==
X-Forwarded-Encrypted: i=1; AJvYcCVWTeMAHQTz3zyh/+eO7vzJL2ULmtl3RgL2lwnM5bLhyWZkET7OpYjm3j7GvrY6JuhqvsxNVVUBuLHHMhpq@lists.linux.dev
X-Gm-Message-State: AOJu0YzRvBxHXSJ8ZzetLHZ/bgFUydAFmAaAQJbq6SR4NIS9YmFSKWr1
	TgUMYXIugaeVJ8QYlvfU2L2OaIspCRGeYWkyK4KwoQvcsDRH8r61INfo
X-Gm-Gg: ATEYQzzkOxAS73xfrDHqIWBiVzquuLX+WtsvKnnU4Qsuf9lOigkSa9sLawQ3xZBIJlp
	O5PQj8ZcDkj4OjasSGsGZUKmiTote9D+RyrDLdM2GenPGWZNP9fqAWnyfGMfYabtFpApobKoxXx
	LZ6pADJRXzaPutFVtkBg6mijopceKzs8++ONlRHImgNw0Bh36f/6ZdCOq0itKEGCn8WHaBJahq8
	x9R2tInT95hjjodK39Lir3FcF6et69eoMxm5sWrPp+mNA2p8+U0tXdDADN8sPeh5ZWQWsZxP4Az
	MypqiYsZ+zi6WqQXjrXKprZNDQ6DgQyyu9Cn/yi5pxmmkDMM8lN0/bIe0JuT3kG9wfX4KSNDK8H
	pVWgRl/acWwfVjGWWAK6389j7Mw8I3BpCEBPrgXdYIRIJJBJ/W0kYgZ4z71Cn8FbbQht75mr8ya
	kXua8VSkvHtaBYJaj5tIs7R3H7U+OWkhHZ3nWjar1tb5gNfGE=
X-Received: by 2002:a05:7301:d19:b0:2b6:af85:dd2d with SMTP id 5a478bee46e88-2bea5523ab7mr5892838eec.32.1773699583971;
        Mon, 16 Mar 2026 15:19:43 -0700 (PDT)
Received: from mjmachine.localdomain ([131.255.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526d61sm19548389eec.17.2026.03.16.15.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 15:19:43 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH v5 2/2] staging: rtl8723bs: Replace msleep() with fsleep()
Date: Mon, 16 Mar 2026 19:19:24 -0300
Message-ID: <20260316221924.4904-3-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316221924.4904-1-marcosandrade95963@gmail.com>
References: <20260316221924.4904-1-marcosandrade95963@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep(10) with fsleep(10 * USEC_PER_MSEC)
in _rtw_init_xmit_priv().
fsleep() is the new standard API for delays, as it automatically chooses
the best sleep method based on the duration.

Suggested-by: Ethan Tidmore <ethantidmore06@gmail.com>
Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 4062fe0c1..dab16851f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -5,6 +5,7 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
+#include <linux/delay.h>
 #include <linux/if_ether.h>
 
 static u8 P802_1H_OUI[P80211_OUI_LEN] = { 0x00, 0x00, 0xf8 };
@@ -129,7 +130,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		/* Tx buf allocation may fail sometimes, so sleep and retry. */
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 		if (res == _FAIL) {
-			msleep(10);
+			fsleep(10 * USEC_PER_MSEC);
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 			if (res == _FAIL)
 				goto exit;
-- 
2.53.0

