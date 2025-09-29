Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2B32C17B6
	for <linux-staging@lists.linux.dev>; Mon, 29 Sep 2025 06:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128653; cv=none; b=h7xJJqUKQK22djSCyn+qwbMeBxMUMDQ15ppseXDV1WkeF7NbR3aztn/4mcdddvHNJOOaZFncvX9RUvVXCAlFFO7SVOlJuUUpLlrX3qOAEa1jJtkpTNyDgqV4KuLXdZ+36nNpHrOL8wGx+JTx3A+yTIJfUXRH66A7U8w8q5g3l6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128653; c=relaxed/simple;
	bh=9fcSU8PZLc3G53yaIKcXU1bm8+vedTHObY8TmTInhpI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SHxmRcW4scfuJZ+J7vJ6tQcGus0wBiN7bjbeMCEmYOJxm0XJBLINncpf33/kvvfRG04wMT4hKYbHtaoSwUPLq82zXWv47aZCgP4Cqb420DS0r2mmMAlvcBTv/2+/iyLLTskUjr7zppIvSOSVgZYklQ7LNKiWUPS0Awre/JOt2nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzExC8lb; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzExC8lb"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-826311c1774so497086385a.2
        for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 23:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759128651; x=1759733451; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMsQLzfREBWexRu+GN5366HpVTxolXnaYPuOdM55sFg=;
        b=HzExC8lbAVyoSO6L2maIi775GgPn4PcQuJl6QjMS18pdnUaHirDKCZRcOc2BWEJQMa
         0ztK8yZ4+G7TM0IX4VndVCTnIYu6PMi98Q687T0+EXy3V8UaNTZYl/ihqfDbBPTCSk9r
         xhgnYS24T1bBWCz5P2ME0bbq7e9UALGtW5RF2yuwosIuFJ2QT/PK8E2bp23NEkCnZoBB
         yadECJ8E6VpB3g7yzbNn/toq4zQTPrSQvpI95biGV/fHafTthqMrlJgNDmOJ16z4AKv9
         SHppKYDKVaU3MiMeNfQNu/Axl6W79awLnijnNQJ7JxyW1P2fRfqM4CY3oo4wyhs6L5rg
         P+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759128651; x=1759733451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMsQLzfREBWexRu+GN5366HpVTxolXnaYPuOdM55sFg=;
        b=tWeEZvqQg7KGJ5P+nYrAlBulsaU/oEoxOng7zinfGt2Dr/lYW+sPjtOivuiPeNLdCd
         VorUb4CPjxrEdCO9jJIGl+de0uACaF9CXXdFh/O2ohK58e5JArKpfLWv0aepk3NmTzWE
         fUPvGifVmvMfQlWCOvg459Yg6rct8G9zLY/i44PPQ7j1Q9xD38I9/dT3eE8Eeoil1YE4
         L2Z3oc7AFx8mbM2WCSTUardCBgjK4D3rV8o6bti9aMmQuB22IUj9pIc2Yfxs6DLjNH+a
         +jm0kyQ/s/+nt+FFhgEqoxIIRzxoscIQPbj76zoXOrZXirMIm9URnxwOjZFvHhYYsENz
         /0rw==
X-Gm-Message-State: AOJu0YxUyXGnJb14+ZpveNpptNV4s5HEBUiHOkHxQlTg19pHTF9ccxja
	PXOM8UTqi57qKoSVsVsFkVrRBy+mQyBJ/WO5Lv/o3pgx31bkZqXoVi2V
X-Gm-Gg: ASbGncv9dTP6nTLENdehG8TEQrxBKGFKa4L58Aj+SUKLQK0NBE0wrQLwk+fE354QGtg
	2xohpzubLR7GkK3EUcdOppO1FTCOM5qLrNlyAAlY6U3ii3ZqwnkUeC/Ysqn3FOtki9HhjkxxmOb
	94ruCY+Z8AXovuuEZ/+P4Eyp8v5lu7h2Q8a3PZhqVyFO5c7nT0bovu1Vnie2Z5UwAbyap/lz6sZ
	FELJJWjXawqQidLgoiIJdoUqNivdvBgHU0gQAigL7sXF3RSQL879BHLhLvrPqrSYFhRtSIBC5QN
	HEv8pZHjhUlPUceqmnrq77Jlt0jmKu2bKAcc5pzwouYIDH19kZGWxfIn/0yoypo81rlc7gBa2vr
	bPz6jtOT+P2Acvar1D+6fEclz+Jq98CzGLm5dZFIArJyauxCDzcYT8xOO15reOLD0hL1h1q5s
X-Google-Smtp-Source: AGHT+IFB/1SUb+6v70Lzh6OZRArqaQYJpAyAMMcK6vy338KffvxQjyIMHlnHN1YoJ0dqTQNeW7NY4A==
X-Received: by 2002:a05:620a:394f:b0:85e:b0:e5f8 with SMTP id af79cd13be357-85e00b0eabemr1847528885a.13.1759128651012;
        Sun, 28 Sep 2025 23:50:51 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db10874bb9sm69517671cf.24.2025.09.28.23.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 23:50:50 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v3 10/15] staging: rtl8723bs: fix unbalanced braces around conditional blocks
Date: Mon, 29 Sep 2025 06:49:55 +0000
Message-Id: <20250929065000.1010848-11-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
References: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Balance braces in conditional blocks to match kernel coding style and
prevent potential confusion. This improves code structure and readability.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index a2b1e34765ac..050fc54e251b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -785,8 +785,9 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 					} else {
 						pmlmepriv->to_join = true;
 					}
-				} else
+				} else {
 					rtw_indicate_disconnect(adapter);
+				}
 
 				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 			}
@@ -1674,8 +1675,9 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *adapter)
 	else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 		if (check_fwstate(mlme, WIFI_STATION_STATE) && check_fwstate(mlme, _FW_LINKED))
 			mlme->auto_scan_int_ms = mlme->roam_scan_int_ms;
-	} else
+	} else {
 		mlme->auto_scan_int_ms = 0; /* disabled */
+	}
 }
 
 static void rtw_auto_scan_handler(struct adapter *padapter)
@@ -2412,9 +2414,10 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 			operation_bw = padapter->mlmeextpriv.cur_bwmode;
 			if (operation_bw > CHANNEL_WIDTH_40)
 				operation_bw = CHANNEL_WIDTH_40;
-		} else
+		} else {
 			/* TDLS: TODO 40? */
 			operation_bw = CHANNEL_WIDTH_40;
+		}
 	} else {
 		p = rtw_get_ie(in_ie, WLAN_EID_HT_OPERATION, &ielen, in_len);
 		if (p && (ielen == sizeof(struct ieee80211_ht_addt_info))) {
-- 
2.39.5

