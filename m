Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819784457D2
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 15:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513175; cv=none; b=Q76nwjh4G1cP2Krc+xrxMtJVSkzEOOX50+GIW3lz2uJYu28MPErDd5XEnWYXiP9pI4IPziQANnT7iWyNHdrB0mokxex3GYLj3kQ5E/WUjM6oeAiMpsP5sLeVw1TbEjfuIxuboeGRfwwlvOepceRQt3dry17L1dwZ5kRg2jtVWiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513175; c=relaxed/simple;
	bh=dl/mkrgMeB9TSEWmDgogvhLnGMjB3saQNaK8XEddEdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TVZ9aqp6q3qVjF93zYNUWCYn9XJuTNZmFFNniPBNprvpPd/Q3ja24qOxR8Ej/dZFUgR0bBFCgiMNNxTWNoQc9dyia4wzwVkbuFs9Qv9/BKA3EFKH/UG9+lPq+5NxijaYzgk9kLvmRGMANwHOLOkDPa70TmR1hPyonYPh1pojL4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afD/EBjD; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afD/EBjD"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-ca00ea47337so366792a12.0
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 08:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785513172; x=1786117972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SgxSm8O2Ph/vh7farPcof8o4aTta2ebVjrMlcZ8XUVI=;
        b=afD/EBjDLq4RB8kZyFHI33tFvvoqG9atO5UwjHeCoodljzezcYYZB88vwFanvPH21B
         2FeIjfq1aAxU7L/SL1I2tX1XtKiPc67cDIMYC4qB5SIpf7+vmOCjdy6SAYx5HTcTbTXR
         5qA+9eN/oOKAc5OTGzXk7vHSSslZcZmBeE7e77yjj76J/9HGZKtr6atwmQqDROLPgvEu
         fADSC2gbhhfHx3OBUd2kyAeFfCYiApv/BiyuMqcirfsbTdo7qTS0+WjLRFaDjvCDdgHQ
         VK1IKmjscbU1TmYbRjeonDc8XjwpNvytMNFVkKP6ng1e8fFigOdzCtwjgtl9hQMgHACK
         uppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785513172; x=1786117972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SgxSm8O2Ph/vh7farPcof8o4aTta2ebVjrMlcZ8XUVI=;
        b=Vphy7w/oGUXqSEsHmDk0mCD6gsQbgzqZ4juZq/BVPvwW8llRYx2j+yo4LMonjHsnLF
         hyyGscpQVYh5Fy+lJEUV4KDETWkJtrgI59oC7qSoDKXpKqa9cSFSqdQCd/Y7SqI82lvv
         1wa+jxr7146dw74u1oFKXCJx8mhuCzNWATNNXITUg6gkWDMx/AomsXA9tvqWw/J9MhGQ
         igMZrpp1eFJo2t5BRFpjf+lfn6R02n+QradN0iq3yf9Ot52IfmV/2GxWKax80tRnJM73
         0uZH+nTCwAnQ2bEQCQPvUggtIsB3zYSXxmC+oF/1HGlNVUUBwDQ+P96jZfZncPDwtQ87
         eq4A==
X-Gm-Message-State: AOJu0Ywjor8VNTIszSG7Zn6lHv9xhyLmYLrF/F17Lzw/wTQ2eAOHzRo9
	rWeRmtxL5pFPd0YWH65e6B6YbBAELUygbSN2CmmC5Nw8Fc7mTDy8YsgTEiocDh6D
X-Gm-Gg: AR+sD12PoUEjY56gb/tFZY3IUOIPpmqV25elb/EPBpulX3aEM0WVvSRRSRmIyLiaJU3
	iw47sN9h7IWRQ2G40okOFoI57RYk46cND4yrPvqxLoyb7inoB3Ekcfa/KCGWi4M2yvp9Dx7HlIO
	K3e/ltzo/iwUkQF8B6SG+lGM3hu0Q9wmD2b6AxOOBNf3CvSmVWiDwAOoRnMKE9UC2NeDyFjgG5s
	8v+/eqdNPt9wIjNmdqSbz3bgCZYm4N0B29IcYtgPzNXdJmCm/vi+KVDLqGTh+6GJ2Ok7MkXwo3e
	Ekwgx/EelHfAUafAphgQ0+XFu3iHxkhfElYFKIswsNdWtDtz2UeWKSYTbieKuJd/SNwHMxMikVb
	BUt/X0ro7iQBp0N4RJK/cd7ASV4b+wr/tkkY4zZ8rqtmRJwuAxap5FiZ1X7oM1VSofYDAklRqE9
	6LJ0lY6hGZbncoaoGNheI1VRc0dW8WMPJrh/VLDgDW1iNvI//jP1gJ0G2gHSv1tEJxDLeruQ6bw
	ud/bnlLA009+DSS6zOS
X-Received: by 2002:a05:6a20:728e:b0:3c0:adec:b3bd with SMTP id adf61e73a8af0-3c92a8a8fb7mr290227637.49.1785513171551;
        Fri, 31 Jul 2026 08:52:51 -0700 (PDT)
Received: from localhost.localdomain ([76.86.179.124])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm7669604eec.7.2026.07.31.08.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:52:51 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 2/3] staging: rtl8723bs: propagate errno handling for mgmt xmit
Date: Fri, 31 Jul 2026 15:52:27 +0000
Message-ID: <20260731155228.22526-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731155228.22526-1-dennylin0707@gmail.com>
References: <20260731155228.22526-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert rtw_hal_mgnt_xmit() to return errno-style values and update
the prototype in hal_intf.h.

After this change, dump_mgntframe_and_wait() still uses the return value
of rtw_hal_mgnt_xmit() to determine whether it should wait for
completion. A follow-on patch will make dump_mgntframe_and_wait()
return void since its return value is unused by all current callers.

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

