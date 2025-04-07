Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18338223322;
	Mon,  7 Apr 2025 21:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744062845; cv=none; b=sVzsL3nFz/I5+1w1rl33SxeZ2Y6k7nu4C1xrNvFCiajbeEduW7imAVZsdQih38nXTTUKGM3Cay3eUTda4zELlgmbQqpOGy6QskOSJ6PRiJH07COYPcSqV5Qx7KFYAwHz6Z/nZzuxSWYMT0Wits9ZTcFcBiy/JlKnEgJJAT+nFog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744062845; c=relaxed/simple;
	bh=CxAlPAdfHF9SCdrgxSt6LTMGsRjEdqf+DPORV3qKOIs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LwbO8whrQ6mXr9im0cYy6wUkXUA2R+qdYFba45r471X0qD+Qih/ukac5jHFgZPRY6w0XAIioCr2sI55R/GAsB2QDcH5WBuPSmkKxaTepfwZmIp3Mm/3pVrDMFN9D1OX/ZXKMDdL+uHKjFjV//Qfzo6NnTJZ0xWd7KyHzfaRZpn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNKKQ4O9; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNKKQ4O9"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-476977848c4so48406351cf.1;
        Mon, 07 Apr 2025 14:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744062843; x=1744667643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niPceQCTeHJ7vtDpns+YHZrKH87gdGexFeeW8Ejww9Q=;
        b=BNKKQ4O9ZIlDvdZagEmp3Pit/wmR2TMMkd4NJ9OYcbZGScFkdbwr6YKQ1/QrQZoShl
         trSG9Yte/XhylmbrY4ZIskPwxWWtEotIM5yytpdsUnYJpK5twmcWE2ORkRZDmZ8mq0GN
         KrCbrDdrNS2XCGZX9+5TKzzYa96DLt1MBw0X/K4BWdyIdROjoMRtscni1pI/PttJrLm2
         UHEJ/CEQBfNEtOgpAoPYTx24/20Fpd7pGVDN1LObjtyVywJZS98sDYVE2SdD5EYjQdJA
         oLbVoapKdTODY7N0SMVUwrjMhuEeqna6/R4xh4RmXu4CbxS3ITrlvNw3dGMkgtaFlGfk
         1ZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744062843; x=1744667643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=niPceQCTeHJ7vtDpns+YHZrKH87gdGexFeeW8Ejww9Q=;
        b=MheVh+J0r+pS1RxT+H0wcXg44OIDjk55gPRvoDKEfMLWH17quxyEUuUk+UgCn2Anyk
         NjMj+2roZrbQHdp71mDN7COCI7K8rOe7VXSsFH5ex1ZQCp/UJPgs7DAHvh7U2efoxXFm
         G8N9ejDuTB7f9ey+y34ZdFtTPxKAU0+9rJY12hbxs90Qz8sBVoRPeFSVDhE8bLfqJyqb
         WuFZ2UxY2V6axUlJUU/i4HfclHPAfRkicORF6oYdcWzbCdu5IboAN8dUk1NV/ByktBs3
         k0B3RJ1iLpEUdGCCGYq282OevAuNwKxQLgBJUzf9LMEMjYJXrnK7lKEJv1HX/NOzZHhG
         0F9w==
X-Gm-Message-State: AOJu0YzPQUahvGVK/GpUHL5SADjTzBgw2eHhetK0VH9u4GJj6GnCk8ws
	6+444wtMK/PP1+vRCyEv9BKd74YTMlExe95uk2eM5sntDWyIlMiV
X-Gm-Gg: ASbGncvUfSKL0hIIEhUG7BSAkVXLDG4eekVxTxZT2kJOJXDakJtb3psSqCfiWIcXiLD
	Ion21XFkek4Wh2c01ca3htWWr/MeFyiOzRDIXRl8rsnoHx72nNWFsMZh+fgzrbz9m7aQWNvunQ6
	fClstHfaYPw5601VD4+eWjyOAAG4FBb/ak7GX92follKj9HHVAi2Aih8z6jpyaPkR6Zdpi+fjnP
	IL5aR/Ljc7UU2cUTOKoQPnGHUA3PEiOpSapi1UQXxjZxXFd/keZlO0hcFs7pLQGIjAfNFJ5WE2x
	LdF/urkw0+569hDLKNIVgcrUFgtxPfp9QH+NKQRzf6PZlCo/PcfFiaAyhfEb
X-Google-Smtp-Source: AGHT+IEuC+ZszV61UGBGwxDndYGW/DtNDNbYQiTlO6xLG1075WS4o+qrZdIPFvWNlxEsXkm+ImPymg==
X-Received: by 2002:ac8:7d95:0:b0:476:ae71:eabe with SMTP id d75a77b69052e-47925a777c8mr255279851cf.50.1744062842955;
        Mon, 07 Apr 2025 14:54:02 -0700 (PDT)
Received: from ubuntu ([105.112.230.142])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b07226fsm65766491cf.31.2025.04.07.14.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 14:54:02 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	gregkh@linuxfoundation.org,
	julia.lawall@inria.fr
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	andy@kernel.org,
	dan.carpenter@linaro.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v6 1/2] staging: rtl8723bs: Add white spaces around binary operators
Date: Mon,  7 Apr 2025 21:53:51 +0000
Message-Id: <4ccdbfd3e8d74d99679927f294f71cfb694fcc6c.1744061673.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744061673.git.abrahamadekunle50@gmail.com>
References: <cover.1744061673.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code contains no spaces around binary operators making it
hard to read. This also doesn't adhere to Linux kernel coding
style.

Add white spaces around the binary operators to increase readability
and endure adherence to Linux kernel coding styles.

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..c41de6fd897b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 					if (SN_LESS(pattrib->seqnum, tx_seq)) {
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq + 1) & 0xfff;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum + 1) & 0xfff;
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

