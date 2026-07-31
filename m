Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E86C371D01
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 07:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785481594; cv=none; b=dR7YPqwD5EzqYAEkMJjfpYAd0RZzM2Ih/x44PkIGU3Drdae9Ed++kSmGc9YwSlVh9LkvxtZT7B+W8d9HRRu0sYROWSDnPG/zQgxw104Rz2CGkxT7IxSzRsAoM9B/X/Au0of5SeIqg5OtehCs1GV/WBGMJj+Q+TPBcY06v6F/I5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785481594; c=relaxed/simple;
	bh=OoXYpZ7Q2fli2l1172p+ihOsLv/pUj5fJNQ7I7ror4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CFYkljDwyCRVjWuEUrZLsSPpw0sXYol2f74+5UBTUqbajHA6Y0+zViGmAZqNqu020sv27XKlAPZnBIM4359JMT4KWiWxSak8vl/if5AfmhXc4s8orBB6nBYlkgLtzO7y+Cpga6iE+S5URNAa2Vb7hwIjQ0WWzkpLvw5dLhZx0pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3+yIIEm; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3+yIIEm"
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-37fb1883f59so194955a91.1
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 00:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785481592; x=1786086392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLP70stMRNJMbiaBki2KwUOdJcZtOnKHT3dQZuqY5Dk=;
        b=m3+yIIEmr2fod2guaxg9fo+QgFOxnj2i+AijltyjX8I3ISZxecnK1Aq+n/F9wyPxIj
         HBNgDOA8lnw22IxHledtRXXjxVXq4OW16jmUEhG05Qe+ld5vRJ9JnBW+05x8GtKB5eeO
         PRf2WtxT1aCODy3wAmw7fGyHt5r3HpADrq5MzWh3TD9D8C7wgBHupXnwSx3nfRZZFb5P
         ao/q08YdKBvWdTwIlDSlmB92ZLhx2y98ZtbFkMhJ0+ZwBn5mkkpLotbOGgQqQxRzJy/E
         1RxKB/owDZplA3mj2W4D3R04HgUYfhbHzpVu8yggZm2hq8XXa/nq3eUupDl5+KWzUMdE
         ZNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785481592; x=1786086392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uLP70stMRNJMbiaBki2KwUOdJcZtOnKHT3dQZuqY5Dk=;
        b=Obkr71qZYOrF70vZbak7X9S6RAU81844tJXj9Kbs7HYHl0euDt+vhfNiKrS4ADWbpd
         JLEKF5p8X+DA0IMy1KDuetUkUP9WUOXKpjQ6xcOLxkkQEgbu5hT1KUM3qvkglK6qcWeI
         gosHPfV6Cst2CGS7A3gCLhx0ajKS1my2Ofj8P2Cou2yykPLw8Ip3mD2yhVpwI9w9A19U
         t81c9bA8BNywu4ufWETN1guMjP+4eSeOphD24PD9YZW7OZzAsuhmk7dc1VnSY0mKqI9f
         5BQnKoi4hZVqobWLlE72iu2S0+tiwvRt/FoSNFeNpkjInE2XAI/mJkBWF76Q+8puim/m
         fDyg==
X-Forwarded-Encrypted: i=1; AHgh+Rrp5QRq6yw2SciA9YK4OMOpj4cBhcTJuvMfZzOqEJJdm/KTKjrcCFOXmFjHENjUzWfA3yh7y1yLJwKEd+6g@lists.linux.dev
X-Gm-Message-State: AOJu0YzcQpfqerfaP8Nl2Hdk2yJlPYWyRjwnxdeCtFft2ycZDm8u/vO0
	/tjUACivc6gV5MLSILgIkszHcxhSR+21cAAj96l+tzisRI5YdOXQwUZd
X-Gm-Gg: AR+sD13/TPz5AQxTn/OBIeW0i6a8whAruFRFevymC9kRRxc+6dxdzRF+7/wdp9WAsKt
	JuC86F6lZuMyMHe0KO3Qot0RxStroNgwkv1xcnnTMy9JYPeL2syTUDr4QEEu1WTEakQ8gkPsliA
	77H5uEQqxf+LaItfOmGJUo/sLUvpbpG+5iNI4ZFCwZR3nNPtIzQzaX8iaL9KpxMqoM6xTgAd6Hp
	y5b3AERLYaQ+0Go9kY3ROvYigWsPAA5sWNBiF4xRpf5unlmIzGzg+iQr3VLMGFk05YHrvVls8a2
	nLTwpv3ZkDx8Qpaf1K5KAASK1lAJgapesS3fkdZxHrxLjQNME7/6KbErocgsufTnAsNeV0XCQPc
	/NMlVrHE0DDTX+sD7EW1BcF2ApOZmBUWeTiN7l7ZE6acV8IJBT1eu9yZEsKAMRdYFGJydm8KbvM
	wRQc3IpcE9UDFQF+X7SL/dYbV391s1M+t/mfcZ1VTxfd8JmmXQmpFfJ0e0nnKDELxrTVijVNazC
	6VQnXtVW0pKRoYbcdME
X-Received: by 2002:a05:6a21:1b84:b0:3c3:7e9c:e292 with SMTP id adf61e73a8af0-3c91b111233mr815924637.25.1785481591592;
        Fri, 31 Jul 2026 00:06:31 -0700 (PDT)
Received: from localhost.localdomain ([76.86.179.124])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm2589587eec.7.2026.07.31.00.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 00:06:31 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: propagate errno handling for mgmt xmit
Date: Fri, 31 Jul 2026 07:05:45 +0000
Message-ID: <20260731070546.20959-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731070546.20959-1-dennylin0707@gmail.com>
References: <20260731070546.20959-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert rtw_hal_mgnt_xmit() to return errno-style values and update
dump_mgntframe_and_wait() to translate the result back to the existing
_SUCCESS/_FAIL flow. Update the prototype in hal_intf.h accordingly

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++++
 drivers/staging/rtl8723bs/hal/hal_intf.c      | 9 +++++++--
 drivers/staging/rtl8723bs/include/hal_intf.h  | 2 +-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index f5ab94a2d0a0..0027f9333738 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1990,6 +1990,10 @@ s32 dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntfr
 	pxmitbuf->sctx = &sctx;
 
 	ret = rtw_hal_mgnt_xmit(padapter, pmgntframe);
+	if (ret)
+		ret = _FAIL;
+	else
+		ret = _SUCCESS;
 
 	if (ret == _SUCCESS)
 		ret = rtw_sctx_wait(&sctx);
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 2caade1a8bdd..1443875d1369 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -115,8 +115,10 @@ s32	rtw_hal_xmit(struct adapter *padapter, struct xmit_frame *pxmitframe)
 /*
  * [IMPORTANT] This function would be run in interrupt context.
  */
-s32	rtw_hal_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe)
+int rtw_hal_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe)
 {
+	int ret;
+
 	update_mgntframe_attrib_addr(padapter, pmgntframe);
 	/* pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET; */
 	/* pwlanhdr = (struct rtw_ieee80211_hdr *)pframe; */
@@ -130,7 +132,10 @@ s32	rtw_hal_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe)
 			pmgntframe->attrib.encrypt = _AES_;
 			pmgntframe->attrib.bswenc = true;
 		}
-		rtw_mgmt_xmitframe_coalesce(padapter, pmgntframe->pkt, pmgntframe);
+		ret = rtw_mgmt_xmitframe_coalesce(padapter, pmgntframe->pkt, pmgntframe);
+
+		if (ret)
+			return ret;
 	}
 
 	return rtl8723bs_mgnt_xmit(padapter, pmgntframe);
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 8a85e8419e47..1b6b348435cb 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -197,7 +197,7 @@ u8 rtw_hal_check_ips_status(struct adapter *padapter);
 
 int rtw_hal_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe);
 s32	rtw_hal_xmit(struct adapter *padapter, struct xmit_frame *pxmitframe);
-s32	rtw_hal_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe);
+int rtw_hal_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe);
 
 s32	rtw_hal_init_xmit_priv(struct adapter *padapter);
 void rtw_hal_free_xmit_priv(struct adapter *padapter);
-- 
2.43.0

