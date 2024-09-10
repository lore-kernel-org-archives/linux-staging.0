Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67139170A2A
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 05:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725947820; cv=none; b=kFgPTfOdvN8HohIMUiToEpU7o0Pp8uwx6CZFD2DUkVNten0xzNl00EYIVkiWwgCoAEmSM65Fgfla+FJM7CiEEBqZesx4FAmXpYbYplPO17KdoMtwT9NdMKVR4PTBB1XidQ2vnPo/ITdM7jHhptG7d5C888R01S/gNqL5QpHx1Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725947820; c=relaxed/simple;
	bh=IaP9rFQ/bolbuckaldqglihw4sOfdbU6LO82Iy93xPM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mrv92N3PlAELchfz7HSnvWZhSib4GYFA//uRUo8S3rZdSdayjRU4i2THLGoP/UVwR9fn5w2nvoDNaVTdq56ZIlV4yrZLkOkpOqLMOKAyMiXxFWq62vJnBtRhDSVsUmhln67PfdUOg8ebaGWHEL7o7arq9FPjoqtpamBl3x92LzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GarbuQGC; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GarbuQGC"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c251ba0d1cso401982a12.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 22:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725947817; x=1726552617; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YbgCb22kbv4qLXX4/sAXCT5ymhU0wUo6KWoE+VslriY=;
        b=GarbuQGCp/mb6iENhzc9GT/AMJon9wHO6twJR8xtVzcCrLEStASJnB7hP+7PJwhzCP
         iR6bLORm6r7FPJRi+yhOMLnWPqRzCYzD4ILbXvtOKpVLfh2ciqG07lOfcLrPcKBMCOfg
         hcQB/QL01re3s55hNwr5nhNmmU+qVMSz4Dgeem5/XUBV7ENdBuln40I/hcXml9oQjT6+
         cdFIkC9MFK1K8PMMmjNv9o//LxaBmPSNocXrq9rhw33UdU5HauLlq/j3mwxpDU5XeDkv
         1yxAf8ideReSo1/9AykhQvefGrnIrFuQX3t9OKi/ysCn+6iQ93lJKKNK1mcglFSsDPK9
         QUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725947817; x=1726552617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbgCb22kbv4qLXX4/sAXCT5ymhU0wUo6KWoE+VslriY=;
        b=snzXPcMi7fClny7KLkXmBm42Qgbr6I1lhkstGXdctycX3+YYyYTal+3DJFhUmkPs5V
         LT83nktPk8j8lD6T9XF3uj2FTKwxOrHZ99372kfbwqi/LYFkMWB/OPxDpaKbeYCmYbEW
         vTcNmaJGjokEyqxkpAEF9Q95QhBGpbjJqsucZ/3R7bHKga/+7hzzv7XQEkaDwjf6MyKP
         40jb5k7jwcmU6rMKYCylBv/THxU85TV57rzIexG16GyXTOPRtSNYd8vVrG+bU9fz+z/M
         YloFUp4h+Rfk+oRhpSAvY2t5CRfd93Fr4ZsjpmtNVLMMrWDahP2HQasiXLdDAElw9ez5
         Eilw==
X-Forwarded-Encrypted: i=1; AJvYcCU8QchJQ0A8/r113vogal9nhBWkbmuJjbIK98Kb1T/hvRzEacByHpcsYsIjxKat+x2NPwVrB5cxTYTuTEjB@lists.linux.dev
X-Gm-Message-State: AOJu0YwwraT3DybLCavX1fdznpl5mXWknPCSvvf6jTiqWt9Z+M7hyMcM
	7Q5SjjbOcaIQEfOF0OdTXzHuJKsa60yhmAj5aUMiZuafDi5+mtR7
X-Google-Smtp-Source: AGHT+IH7qXddiqCgKss0Z6iVsTYJRLpkuqBq5dOErR5g9io/RRsaWo1dBSyE5hmBP+2L1OzxFUMBNw==
X-Received: by 2002:a05:6402:5108:b0:5c0:903e:963a with SMTP id 4fb4d7f45d1cf-5c3dc7c0012mr8703846a12.29.1725947816924;
        Mon, 09 Sep 2024 22:56:56 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p200300c78f2a8598b80c2d4e9a813f29.dip0.t-ipconnect.de. [2003:c7:8f2a:8598:b80c:2d4e:9a81:3f29])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd76f96sm3777102a12.74.2024.09.09.22.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 22:56:56 -0700 (PDT)
Date: Tue, 10 Sep 2024 07:56:55 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] staging: rtl8723bs: Remove unused function
 rtw_hal_get_odm_var
Message-ID: <adbeaac00054c87e4c55714817ffb85f68d37c4a.1725826273.git.philipp.g.hortmann@gmail.com>
References: <cover.1725826273.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1725826273.git.philipp.g.hortmann@gmail.com>

Remove unused function rtw_hal_get_odm_var.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 6 ------
 drivers/staging/rtl8723bs/include/hal_intf.h | 1 -
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 7e3db8d3c910..b66c02cd1c82 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -160,12 +160,6 @@ void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariab
 		padapter->HalFunc.SetHalODMVarHandler(padapter, eVariable, pValue1, bSet);
 }
 
-void rtw_hal_get_odm_var(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, void *pValue2)
-{
-	if (padapter->HalFunc.GetHalODMVarHandler)
-		padapter->HalFunc.GetHalODMVarHandler(padapter, eVariable, pValue1, pValue2);
-}
-
 void rtw_hal_enable_interrupt(struct adapter *padapter)
 {
 	if (padapter->HalFunc.enable_interrupt)
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 5cffab2d06ff..efdd1f912b5d 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -301,7 +301,6 @@ u8 rtw_hal_set_def_var(struct adapter *padapter, enum hal_def_variable eVariable
 u8 rtw_hal_get_def_var(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue);
 
 void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
-void rtw_hal_get_odm_var(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, void *pValue2);
 
 void rtw_hal_enable_interrupt(struct adapter *padapter);
 void rtw_hal_disable_interrupt(struct adapter *padapter);
-- 
2.46.0

