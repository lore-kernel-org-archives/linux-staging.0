Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64488376A18
	for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 05:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789190872; cv=none; b=XlhFQ9vBEimTuPWwDtPlRFAIBapxrQ/M91mq0k+zK8v3n7dPHpVebW4i5dHfwkeOkKCwgWImM8Hh74E69PzMEaui7xsuCVmlauXSmArrzdxyW6dYXFwePTUMp41HNjGNYntdtxmNSnZ1d31/0FnTevaEHnv35QP0aJrIL/kEpJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789190872; c=relaxed/simple;
	bh=9e3MoimqO18CLNKOqyXRMIUHKkz4UELWpbyKkfKkGQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JORMxP8UuNf+xsnbauQQhc7mOJMgJ0J+oLPV8rVf1oHE+Luh2tp7VZtd+YaKhobpsR27fhTD5Jz7b+qoRvGEbClKaKS8ERbrxmyrS0nG+EPncNm1AkNmnZTJpuVBjpJgHlXYBohDZoomuhcpCIHDs2kWF3O/rXrWtVnNH5tIdtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYiogYRK; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYiogYRK"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso342778a91.1
        for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 22:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789190871; x=1789795671; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4CTLt0y61xRbyq35dXFUiInFGU1oqqBVvZP5/TpzPSo=;
        b=RYiogYRK6BicRksVbMdNeJmdiRuwDYY0/CSOdhwFt3hwVMq7lMrpQHkg1TabFHFsXC
         xUz28vwKc3eBGdawdSgWYynuMc9G5ti252A7L8DECdm4oyqzdn/jeiQtGzDwHOHF1fOU
         kRZsK/r2k+L/DPtw/jDLlrvFfP4y7P7DYd0HATj4Uh+MJ1aI9TJprbmydpdMeMxQ+86+
         yLEwuL63Q7jBs+PYwIIPinjTCydU1wE+/nTjNc425do82KGs9CcLzDsi636f0KRaVr+h
         T8zuQnwV5xEByaNNd9RYIs1Wbw7+eaCbspUMep93II0UnQQqOSIAGrLZjEi7X/joRW6A
         Esaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789190871; x=1789795671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4CTLt0y61xRbyq35dXFUiInFGU1oqqBVvZP5/TpzPSo=;
        b=sj3v0YJQ27rNih1CHAEwU27da3QBHRcBxUXpTC6XJA7IMc2Sfr8r5hLFfrR0m3PDaL
         Dt/ky/ySIYSo7hfau0jXiQZMg+FJk3CD84MxrP0YA1dC9lWFnV7OW3l+kRw3qrZZKOCS
         f79NqNqzpsQljVMiUWLm4IeU8yVSc/Z375N/KqoziV/Su0kdrJJ2s4Qf+zaE2ha3DNWq
         c/Y576ITsAW8n7H/ms1TyGlF2cUexth3WdEbg7Ux+FlIORnYop3xQfPA6okk6T43zdA1
         WleEE0lKD3rfx48VWzD/bqyxFIvTTkgatTYASSQ519wlf1pxExw4DcSZ7X1B5+2avE73
         fMkg==
X-Forwarded-Encrypted: i=1; AKwUvBwztZqEVfAfFnCgjj7CA797RgRQRbm61fCFAPOHMVWPeYDH8VsAFWOo+AYeviKZBANDsFZ/Izo8SHhnD4oc@lists.linux.dev
X-Gm-Message-State: AFuF++ky2YJI0YoYCRpT8yn4Ey3l5nQjBELK1UKdMP1fcgtzYvo7ZJ1E
	5zdtHf97NEm2R3lbkCKEmtVLyRbQLEVAzt7ZhEiGITlA/4cSbAIqPupy
X-Gm-Gg: AYBFou29CGwnOyI+4j5dYc1mYuRWAdAYfi9gXAhjZOfjnAU+vdRlIFeSs4YjnkOtuFm
	iMKUhYFVmmR6wICHQiWzIbpQDYxn6GgBK/WsbnyW7wWpnVCzmzw31ElO1NUJulqHfhvG7Jl/wPU
	IFFsn8DpmeRBXAHOH0Rc42IsH5wtdBVMs3AJrVxZ/dcKBNdKdSj2r5BKFhPAcHmpgXHTxOsU7EU
	jE2SNA3QxYCQU0CqKL64wfqvUBvv7Azr2dlfEeIn0o65SqkwjZEF6NDV7UDwzAwnbmVSkDTV0B3
	D27ry0SOGhY44JiRvECi2pzllX5/hKI+tXOTdrUjP/Ee2OBDRRJvDtz0Aw+Rp1vt7TcnwOE7JbD
	6TCDb1hKoKsIchmCe52avbldynbrJvDvUQMQez5U3fjI5kRnWm1SaonsEnMhWMsLGcrDHrembTB
	gcjUu3VnDIrzV65WN9Ew6U+hza3HiMJj86XGy2E24H6W2dVMJ8e1RJ317Xt2XJ6Fioqm/Tm7A9c
	PVnCaKxInNqaU0=
X-Received: by 2002:a17:90b:4fc5:b0:399:149a:3f27 with SMTP id 98e67ed59e1d1-39d9bd71246mr13414400a91.9.1789190870545;
        Fri, 11 Sep 2026 22:27:50 -0700 (PDT)
Received: from isaac-aneek-MS-7C52 ([103.74.86.148])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8ead8sm10796737c88.10.2026.09.11.22.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 22:27:49 -0700 (PDT)
From: Isaac Aneek Sarker <alvasarker2004@gmail.com>
To: 
Cc: alvasarker2004@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Prithvi Tambewagh <activprithvi@gmail.com>,
	Moksh Panicker <mokshpanicker.7@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	=?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: rename CamelCase variables in function paramater
Date: Sat, 12 Sep 2026 11:26:44 +0600
Message-ID: <20260912052648.12007-1-alvasarker2004@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the kernel style guidelines, and reported by checkpatch.pl
rename CamelCase variable naming in function parameters and also inside
the function

Signed-off-by: Isaac Aneek Sarker <alvasarker2004@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index df0eaff4c841..3c3eb2790714 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -77,7 +77,7 @@ static void phy_StoreTxPowerByRateBase(struct adapter *padapter)
 }
 
 u8 PHY_GetRateSectionIndexOfTxPowerByRate(
-	struct adapter *padapter, u32 RegAddr, u32 BitMask
+	struct adapter *padapter, u32 reg_addr, u32 bit_mask
 )
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
@@ -85,7 +85,7 @@ u8 PHY_GetRateSectionIndexOfTxPowerByRate(
 	u8	index = 0;
 
 	if (pDM_Odm->PhyRegPgVersion == 0) {
-		switch (RegAddr) {
+		switch (reg_addr) {
 		case rTxAGC_A_Rate18_06:
 			index = 0;
 			break;
@@ -96,9 +96,9 @@ u8 PHY_GetRateSectionIndexOfTxPowerByRate(
 			index = 6;
 			break;
 		case rTxAGC_B_CCK11_A_CCK2_11:
-			if (BitMask == bMaskH3Bytes)
+			if (bit_mask == bMaskH3Bytes)
 				index = 7;
-			else if (BitMask == 0x000000ff)
+			else if (bit_mask == 0x000000ff)
 				index = 15;
 			break;
 
-- 
2.53.0

