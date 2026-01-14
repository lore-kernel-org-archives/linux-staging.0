Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0143612E2
	for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 09:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768384208; cv=none; b=WqUvwcxnJDCxDAUMm/Yu1aV94tSUjXzg2eaOhs+3TnCgoTEHP7cuUTSB53YiwAuU1SHp8kXl4+MnyHOlRjGTHmXe5mzZv9f8ZQXcum7SnZvgY5WCULxWkANnL8vf9TlGs+hfucclMUEoyMuQp2fBvGYmgFWiNEAG51ghk0CZYLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768384208; c=relaxed/simple;
	bh=rDI+955V1jHA4f+o04s2bi+hSm8VIAVwNmOP1ARWelM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RABpSt4xSejSC5GkKklW3x+1dl2kuYbvnChV4oaPDW3LGUzDcAyY0sE77haogXLvmeVKZ5oNF5yf7ZY2pLSHzsiYRsJ959GiabEXvDDvbRIIOSDStYeCIybMPaX1s4uHtKC0p7GZ9oAywf8o+hLAO8H666t2nPzYwF8ETpARXYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHTZAqzc; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHTZAqzc"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-81345800791so4278140b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 01:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768384203; x=1768989003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Di8jtALac0OSgf5a/G+6gqbqz1iom466C5Q5jKIt9M0=;
        b=AHTZAqzc7ZF6O4BLbd1Oa1/aBecc1hMRIVnrfh5o8J/SOuVcMWxByzRRfR11ibyJtz
         QpCBPQqYMOH3xkbTDlXzV95UPyAjba7pNr+PVtk5vy4/TKB9gd2BTe6Ad9RQWz97T/R8
         lRsrtoi8wSh/786UNZZQcPt/aF8xg5QYHg+P1/UbvHX2Ndv2vR94G9LX43STIIfyirhk
         +bH3ALiBTmdghVORnUkaC5S/Jt6pW8PK6gWvQVh/FuWTM2Q3odS7c0XfKPptzxOazB/e
         pIHicnChJBPKE5pvKKf6Y8eFeMkkFypFo5G39OxaPJ9pfIiLKM0dTx84uTaKOfbEGv9x
         wSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768384203; x=1768989003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Di8jtALac0OSgf5a/G+6gqbqz1iom466C5Q5jKIt9M0=;
        b=P5fRh7Ab6OL5dOL7rUh44VcKKBtCjveREGXLG2QiRwfLOSdGZvdNGMji6LnwoQUmkG
         y/tCi0pcKG3GA4ouFdjYqzOSOZbsCjJtDpDOh7o61o0KSrUfIQJh96ZkKzT57PDZyDbN
         QgXhJzG4mH4QIF1rW2H72mRLDlHmzPrJ3yPon6bQEybrgUs2XXidtlQT8pdY92P6fd7J
         jPIRnhGxJsAml1XJzsYzfLB0S6Y+R8SYyV4TTQEKfsVvLjt6S16dKrbKHvdIoRgEV0Ss
         fWRH9Y9igCva3de/wm3t1u2jdMyq9+/pINxxpZddf/entNKmTnYcO/+tgxt4+vqBCcIR
         c9tA==
X-Gm-Message-State: AOJu0YxwgB0xydrWWat12Iie4NILznsVMTCOXn2zn0KGn2DcpeyWFUEu
	fBOlC+ThoU9pCR3h21Y/dkxUTRIknpPrXJVnuy88NjMRP8uWqvNrG5HrEfe0I4X0
X-Gm-Gg: AY/fxX5EgYBwycU/a4kMqmew4Bw/wKdliv6lwDd7W2uL8Roi6L1lcgWsa8fcqGZwL8j
	lV3gxVG6IRxoz2/889hhcnzevKNe5vpxF++9RQDlwj5rSzNzqdxOEe0x/i8zM0GMGnmWUu6TMGE
	0XzkD8NWck94bu83KVctohNxGcH8ESqEoQ0PrN+3ZuIlw6TZCQ9TjSXBCGprwQjonG5j4rSXISg
	epi0BRWwaDJ/RUgsWBiPvoio//KTBQLp2BPaQfykyqkylpmKYgQ/WpQ3lm1HkiZTLjsfOkwAHBi
	7tjsidyjLsMfmk9slQhPVWj+lVPViqeSdADiTMzEjegG8HBIYgn2J/wDHIXfPvFvsY4sI7ki6E7
	Vl313naGL2R39cyr8Wpy9m6IgdmMdN2drGQ1ELXMFkY5BcJ/DOCTawFDae26cHIMZcQ+w5wknLv
	z9KX+XvU1qhP3iAdrKV0T30M1NXK36Bw==
X-Received: by 2002:a05:6a00:4c81:b0:81f:31c3:2e38 with SMTP id d2e1a72fcca58-81f81d241damr1851364b3a.19.1768384203200;
        Wed, 14 Jan 2026 01:50:03 -0800 (PST)
Received: from debian.ari ([152.58.176.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f43dfd462sm10201075b3a.27.2026.01.14.01.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 01:50:02 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ArchitAnant <architanant5@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: remove unnecessary blank lines
Date: Wed, 14 Jan 2026 15:19:48 +0530
Message-Id: <20260114094949.14825-3-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260114094949.14825-1-architanant5@gmail.com>
References: <20260114094949.14825-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: ArchitAnant <architanant5@gmail.com>

Remove blank lines before closing braces to comply with
the Linux kernel coding style.

Issue identified by checkpatch.pl.

Signed-off-by: ArchitAnant <architanant5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 03274738c94e..f7b5448415ea 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1002,6 +1002,7 @@ u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid, u8 *addr)
 exit:
 	return res;
 }
+
 /* add for CONFIG_IEEE80211W, none 11w can use it */
 u8 rtw_reset_securitypriv_cmd(struct adapter *padapter)
 {
@@ -1224,7 +1225,6 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 	pmlmepriv->LinkDetectInfo.bHigherBusyTxTraffic = bHigherBusyTxTraffic;
 
 	return bEnterPS;
-
 }
 
 static void dynamic_chk_wk_hdl(struct adapter *padapter)
@@ -1446,7 +1446,6 @@ u8 rtw_dm_ra_mask_wk_cmd(struct adapter *padapter, u8 *psta)
 exit:
 
 	return res;
-
 }
 
 u8 rtw_ps_cmd(struct adapter *padapter)
@@ -1516,9 +1515,7 @@ static void rtw_chk_hi_queue_hdl(struct adapter *padapter)
 		} else {/* re check again */
 			rtw_chk_hi_queue_cmd(padapter);
 		}
-
 	}
-
 }
 
 u8 rtw_chk_hi_queue_cmd(struct adapter *padapter)
@@ -1877,7 +1874,6 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 
 		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 		/*  we will set _FW_LINKED when there is one more sat to join us (rtw_stassoc_event_callback) */
-
 	}
 
 createbss_cmd_fail:
-- 
2.39.5

