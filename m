Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3568C7482
	for <linux-staging@lists.linux.dev>; Sun,  7 Jul 2024 06:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720335146; cv=none; b=P88kxcVO2CIWXP5h1TVffOmyhEuobuHnX8hWx29/rqN1pmGOJAI78K6oirV5n8B/ro55+Zug+r9wihw9bZfeFJKjr4k4CbC/gctpti4myDl/C5nQDePaCT3spRHq1fXPGRx75CKKZoRDVUzv8xl6PaOwYaEEYCJq+Qwlt9jux1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720335146; c=relaxed/simple;
	bh=M0unsPZXof9195t12LQdbKVCLjsDSZCV25BC5Zi3GPg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Izp5rrZOgGitIPDM6HcenNumKabHgcjHWEe5YYsmwya6K/wtmFtZnCHbglZGMayZjgMfTluJ9brtUC+YFWy8jqmAcemUgpIvDxTWQ8Pj8n92za4l/RCJImrxmGMdtiknNdXSJzM35avJXhha3MgWRmilJnnT1YGaktdaHLABOog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLLOmQHP; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLLOmQHP"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57d3125e0baso332659a12.0
        for <linux-staging@lists.linux.dev>; Sat, 06 Jul 2024 23:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720335143; x=1720939943; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UTIs2Xhc94fJOZitmW0LJjQdfwpTiVJtqyfruFQJ5rs=;
        b=ZLLOmQHP0log3kqB3y/41aV4OFDv8aGlUfYhScEHKte3el4NPayOaCFkaC5wv/IcX4
         BJ+sxk6Lknv5u2bX9Ocvtexsdic+IUwredi/M2ne9uq1/tb+W5EZYD+PD6k62Qkq0QhS
         MMr52nq5xIzoXgQKraIl9PYo04aEVC23VriqGgaahnKgQdOQTmwzyALwNs+kOQAn5sfd
         ceeKyMDwT/CL9jBoGAzTWVQ4AlRQtcvDJOzdNHdZiq2BBC8LoXB4UvsYGcS+oS0dIjgc
         uXbk0px94DCHRnnft2EQIs2qlSETyfhkD8mvZs+8XXdTroeGo7aWlN82ywyBf8huJMRr
         O40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720335143; x=1720939943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTIs2Xhc94fJOZitmW0LJjQdfwpTiVJtqyfruFQJ5rs=;
        b=mKcdDKjdNgF4X2BH5SeIQulOBdque7JsVnOPA2m/PpgljaviX96i1GeWbJxBrkGdic
         PyNcX7Qo0016sP/nSrfMyDTRokZac+crTdzTJV4wIQLapw28m6Ysnauc9kqzddneTmd+
         P+QElOOIe5gEkl1Xn4iqgUKn5O+ZNx1wkV1QbB6bNgRbyJIaBDSv76skpuuS1SahRk2k
         rsJkYTrA6cti1eiAzGNTUFoq6UOkdZpaqGkeuiXVBrqEVQ2JP+aGD/6V55sMemRqwDk0
         V7QIxpVYciIIP9kHGxlt0Yo5iyKZGUSirwTa/lQmsPp2SRriUIB6Y1Bz9Ob0I283T+2W
         F2rg==
X-Forwarded-Encrypted: i=1; AJvYcCXicZnsYa0qBsE0a5oM+uTk+rdjKXVsdAMVaUF0GDb9Nmf9MCW3sipzRsOSV1/ksqhCTRVOvn3au433bjO9ojYSjRP5w9BrmNaAC+uZAw==
X-Gm-Message-State: AOJu0Yxxr6D0jNFjCAvVUxNmJdeAch2pSoTf3YzrSEmXQxQT3O5jw3Mv
	wmdtZOotf3c3vABIUvvt4TD4+tjoECtiIqocupqCe+CwNAVqb690
X-Google-Smtp-Source: AGHT+IHXUgOcer0IXuTSnfsKDy/tVvQGWERqsJTTQAzfKpkR620KfmWWosIl8JqwXq/40l/fd7pMXw==
X-Received: by 2002:a17:906:7051:b0:a70:4217:5c8b with SMTP id a640c23a62f3a-a77b9de0734mr481514966b.0.1720335143186;
        Sat, 06 Jul 2024 23:52:23 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77c978763bsm207772066b.109.2024.07.06.23.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 23:52:21 -0700 (PDT)
Date: Sun, 7 Jul 2024 08:52:20 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/13] staging: rtl8723bs: Remove unused macros in rtw_ht.h
Message-ID: <7bab6def02a4a89c481d20547375d894d538458a.1720245061.git.philipp.g.hortmann@gmail.com>
References: <cover.1720245061.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1720245061.git.philipp.g.hortmann@gmail.com>

Remove unused macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_ht.h | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_ht.h b/drivers/staging/rtl8723bs/include/rtw_ht.h
index 1527d8be2d7a..54fadb92334c 100644
--- a/drivers/staging/rtl8723bs/include/rtw_ht.h
+++ b/drivers/staging/rtl8723bs/include/rtw_ht.h
@@ -63,43 +63,21 @@ enum {
 
 #define	LDPC_HT_ENABLE_RX			BIT0
 #define	LDPC_HT_ENABLE_TX			BIT1
-#define	LDPC_HT_TEST_TX_ENABLE		BIT2
 #define	LDPC_HT_CAP_TX				BIT3
 
 #define	STBC_HT_ENABLE_RX			BIT0
 #define	STBC_HT_ENABLE_TX			BIT1
-#define	STBC_HT_TEST_TX_ENABLE		BIT2
 #define	STBC_HT_CAP_TX				BIT3
 
 #define	BEAMFORMING_HT_BEAMFORMER_ENABLE	BIT0	/*  Declare our NIC supports beamformer */
 #define	BEAMFORMING_HT_BEAMFORMEE_ENABLE	BIT1	/*  Declare our NIC supports beamformee */
-#define	BEAMFORMING_HT_BEAMFORMER_TEST		BIT2	/*  Transmiting Beamforming no matter the target supports it or not */
-
-/*  */
-/*  The HT Control field */
-/*  */
-#define SET_HT_CTRL_CSI_STEERING(_pEleStart, _val)					SET_BITS_TO_LE_1BYTE((_pEleStart)+2, 6, 2, _val)
-#define SET_HT_CTRL_NDP_ANNOUNCEMENT(_pEleStart, _val)			SET_BITS_TO_LE_1BYTE((_pEleStart)+3, 0, 1, _val)
-#define GET_HT_CTRL_NDP_ANNOUNCEMENT(_pEleStart)					LE_BITS_TO_1BYTE((_pEleStart)+3, 0, 1)
 
 /*  20/40 BSS Coexist */
 #define SET_EXT_CAPABILITY_ELE_BSS_COEXIST(_pEleStart, _val)			SET_BITS_TO_LE_1BYTE((_pEleStart), 0, 1, _val)
-#define GET_EXT_CAPABILITY_ELE_BSS_COEXIST(_pEleStart)				LE_BITS_TO_1BYTE((_pEleStart), 0, 1)
-
 
 #define GET_HT_CAPABILITY_ELE_LDPC_CAP(_pEleStart)				LE_BITS_TO_1BYTE(_pEleStart, 0, 1)
 #define GET_HT_CAPABILITY_ELE_TX_STBC(_pEleStart)					LE_BITS_TO_1BYTE(_pEleStart, 7, 1)
 
 #define GET_HT_CAPABILITY_ELE_RX_STBC(_pEleStart)					LE_BITS_TO_1BYTE((_pEleStart)+1, 0, 2)
 
-/* TXBF Capabilities */
-#define SET_HT_CAP_TXBF_RECEIVE_NDP_CAP(_pEleStart, _val)					SET_BITS_TO_LE_4BYTE(((u8 *)(_pEleStart))+21, 3, 1, ((u8)_val))
-#define SET_HT_CAP_TXBF_TRANSMIT_NDP_CAP(_pEleStart, _val)				SET_BITS_TO_LE_4BYTE(((u8 *)(_pEleStart))+21, 4, 1, ((u8)_val))
-#define SET_HT_CAP_TXBF_EXPLICIT_COMP_STEERING_CAP(_pEleStart, _val)		SET_BITS_TO_LE_4BYTE(((u8 *)(_pEleStart))+21, 10, 1, ((u8)_val))
-#define SET_HT_CAP_TXBF_EXPLICIT_COMP_FEEDBACK_CAP(_pEleStart, _val)		SET_BITS_TO_LE_4BYTE(((u8 *)(_pEleStart))+21, 15, 2, ((u8)_val))
-#define SET_HT_CAP_TXBF_COMP_STEERING_NUM_ANTENNAS(_pEleStart, _val)	SET_BITS_TO_LE_4BYTE(((u8 *)(_pEleStart))+21, 23, 2, ((u8)_val))
-
-#define GET_HT_CAP_TXBF_EXPLICIT_COMP_STEERING_CAP(_pEleStart)			LE_BITS_TO_4BYTE((_pEleStart)+21, 10, 1)
-#define GET_HT_CAP_TXBF_EXPLICIT_COMP_FEEDBACK_CAP(_pEleStart)			LE_BITS_TO_4BYTE((_pEleStart)+21, 15, 2)
-
 #endif	/* _RTL871X_HT_H_ */
-- 
2.45.2

