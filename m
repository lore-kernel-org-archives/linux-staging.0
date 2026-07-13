Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACC136997A
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 07:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783926362; cv=none; b=dW5YHgSKT9/icrGb3kCyCEj4InjaCj3Jfadft/0j0HtyJie4xmQpdz8mtAp3hNwmlHao9RUF/BzOTq3tZk2YogAQZsXWpssNwAdvlx4/t8AYda9senoFRVik94c609Lzv+N1o40/24jcpMSYZ3R6HUV0RFkibf8h/0ew+GinxEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783926362; c=relaxed/simple;
	bh=xSpjy7giDG2N15KKw3u4QFJ63jbvutsHW6+WADr9bMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hpBdHZZ98TVKnq14n+RWmknWlb9dcAgHL6vEpJc6R3Xi+zu03npCtjk0wHyHRRGSg3dajyzUjM09DZ5IRF5qk7kfF5Qza2QtCagW8Xv4oDE2SzSE18pE+DVjpTfdrvD5p5SQkQsFhEOKMHtBABmgOeMfu7mGcIzVljOd6iNYZHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3GfiJLB; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3GfiJLB"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-38de693676dso729593a91.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 00:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783926359; x=1784531159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yOlmJH0n1OVlXWDZ91LzVBkSBOpbC1reCkCRza+2PqA=;
        b=i3GfiJLBPzfg1eP9QrEqhuYfT6re6cMbSrvbYogIQgVAfcjWO1+sQna1FTlrAC/zav
         79B7KeMgJp8BtXqevDMkdPFw+nQvPE6a7iJe2VovfDDh7Nf8tFEocf7MmkJEJLw7/Ylk
         7e8j8jJXzExOQOwvKwjMIAV9oshdNxhDBXOwoQYE5CMvo4Pfkod+U8etLqpwrNVg6qfB
         6a0pCMIveSfphODpexT1G3DFi1UkUNRtqEfEY0A9bedayInJRvbBs6Oufcd+Tuln5fan
         PbJdBBrJPqnNGTI4ivOmO1vJy3XDpcE/dBN6U4bc/I1s6YJnauib0o6rj+ZNDvoQrpZ3
         gtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783926359; x=1784531159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yOlmJH0n1OVlXWDZ91LzVBkSBOpbC1reCkCRza+2PqA=;
        b=h2IQyQu6IrajkqL3EqAsWSsp7yeLmlHqBdZ6tzpJyvMNzqy5gxLhDRKj+AJ2jxSrbp
         rIod8rwHJ+7y5hvrGyCIN9W/GnQJMaZtgfZJR+GXG69yrAL1IhtzcOdfBRJbzvjU2lLt
         AgrzA/bP+UQo2aBLVRoG+aVtLISw/33Am+TbAzXMptD/q0jQXGyG0DJivOUsrE+ZYg3m
         qZNlokQh+9UWD7J/JoMfcRWsb9+Tr82Z1u6gkTkcJnei4o0MvxPlRPAf1MA1eAH9GS35
         0aEAU0IowUbPtrtslD09ojj7sh7pmMpz/gOoYbmgK8iud23VYMuPwkSGGFxAuqn0FEPB
         KlIw==
X-Forwarded-Encrypted: i=1; AHgh+RpWGya5YhnH0vOUAN9q0CsCH83vFi2SF0sMMpn0Ocs1+gUaWterzXyHyrlusNyJ3/ERhbbNuxlQQjTlaV7+@lists.linux.dev
X-Gm-Message-State: AOJu0Yww/AQVxdMweQJh27M+uUFs81iVulme/fdR7ehozLcQRcJ1IISI
	PHwsVzq7h1h0vtJQHGaYzUTK+0j+02jVoJCX1TdjFa+xifEiBZ985deJ
X-Gm-Gg: AfdE7cnGSKbUuu2psypF9id/r7Xdp8iDrDW9XrvG7+5ZGvVvOlxlAeFT0PZVj8lZ5bL
	jf4/nH503CkXVDiCF0Qnm4lhUfw+ciDkaQexb/LQl7/rI2VLjIvXC02UkJMs4kPtG70LWOTZ66z
	zQPjMHnvdSyGlVxvwjVs+HVZ7jFXmLDAmBbgbFcPLzXUPtzUgyli7TESqaeEea4oVQyaHB+IirS
	r2RWqNsc2XETC6d0tRbpHVhppqm/7QWwXRw3MPIjAJeYrvPZIvUijctKC6qKmEjXaRoYQHqKGoE
	r4TNIDWub/vhh5XJdidb+3nH8OR95LI3PwTzU969JHP7B4yD19QfC6+pKv2jeeDLpHGuhx2mvMh
	AfZz2TqPyYc4xA7+TPo8a/AwtSLVblo4cIP79NCmSODDQSRJdhglPFhJwkA/t8lmwdPuqWz4uXe
	65x+guSTt5ItR9rnyxo0ThYJuqp2x2Vl5UCYNSlVljvtAb
X-Received: by 2002:a05:6a20:431a:b0:3bf:edfb:62f0 with SMTP id adf61e73a8af0-3c110ba1098mr8198249637.55.1783926359014;
        Mon, 13 Jul 2026 00:05:59 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b0240570sm33971943eec.28.2026.07.13.00.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:05:58 -0700 (PDT)
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
Subject: [PATCH 5/5] staging: rtl8723bs: convert rtw_xmitframe_coalesce() to return errno
Date: Mon, 13 Jul 2026 07:05:37 +0000
Message-ID: <20260713070537.15903-6-dennylin0707@gmail.com>
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

Convert rtw_xmitframe_coalesce() to return 0 on success
and a negative errno on failure.

Propagate errno values returned by the helper functions
instead of converting them to _FAIL.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c      | 10 +++++-----
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c |  2 +-
 drivers/staging/rtl8723bs/include/rtw_xmit.h   |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index d4bdda50b68f..2626ac8ba178 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1064,7 +1064,7 @@ u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib)
  * 5. move frag chunk from pframe to pxmitframe->mem
  * 6. apply sw-encrypt, if necessary.
  */
-s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
+int rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
 {
 	struct pkt_file pktfile;
 
@@ -1085,7 +1085,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 	int ret;
 
 	if (!pxmitframe->buf_addr)
-		return _FAIL;
+		return -EINVAL;
 
 	pbuf_start = pxmitframe->buf_addr;
 
@@ -1094,7 +1094,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 	ret = rtw_make_wlanhdr(padapter, mem_start, pattrib);
 	if (ret)
-		return _FAIL;
+		return ret;
 
 	_rtw_open_pktfile(pkt, &pktfile);
 	ret = _rtw_pktfile_read(&pktfile, NULL, pattrib->pkt_hdrlen);
@@ -1174,7 +1174,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 	ret = xmitframe_addmic(padapter, pxmitframe);
 	if (ret)
-		return _FAIL;
+		return ret;
 
 	xmitframe_swencrypt(padapter, pxmitframe);
 
@@ -1183,7 +1183,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 	else
 		pattrib->vcs_mode = NONE_VCS;
 
-	return _SUCCESS;
+	return 0;
 }
 
 /* broadcast or multicast management pkt use BIP, unicast management pkt use CCMP encryption */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index e40f69c13c44..79dbca1b5525 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -285,7 +285,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 				pxmitframe->buf_addr = pxmitbuf->ptail;
 
 				ret = rtw_xmitframe_coalesce(padapter, pxmitframe->pkt, pxmitframe);
-				if (ret != _SUCCESS) {
+				if (ret) {
 					netdev_err(padapter->pnetdev,
 						   "%s: coalesce failed with error %d\n",
 						   __func__, ret);
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 303b50051274..917e846e9ce2 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -423,7 +423,7 @@ int rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitfram
 
 extern u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib);
 #define rtw_wlan_pkt_size(f) rtw_calculate_wlan_pkt_size_by_attribue(&f->attrib)
-extern s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe);
+extern int rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe);
 extern s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe);
 s32 _rtw_init_hw_txqueue(struct hw_txqueue *phw_txqueue, u8 ac_tag);
 void _rtw_init_sta_xmit_priv(struct sta_xmit_priv *psta_xmitpriv);
-- 
2.43.0

