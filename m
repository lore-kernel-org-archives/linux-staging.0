Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0E617E01C
	for <linux-staging@lists.linux.dev>; Sun,  1 Sep 2024 16:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725207339; cv=none; b=l19/E9VJZtV+HoaHYsiH8M+54OkWjbq8VhYY8lf33TBzK9kCxet0jv0dDHDg/pSKs+yZsXQuQD5hmDk4fW6OUDUsPoUPCN/OQBpuHqDgOEqDCIIGq68dyethmmSz8f6fYlCxDQOriPC4LkdnifqhFL+Zwq0MxsklvF6aEXQKX5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725207339; c=relaxed/simple;
	bh=R4VNz8BWmDGh8AOZOk4zNDKcYi+yiwkcZyfuIJceqXU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=dWB2tLH4EbDcMR6bVNaegCLLzGDdlFqJUpLFoQB021Cgu+4DcOpxiDeI0FwX3JtHNxjKMZorzNODuGxC3U8Ze8k7zItXuU31aDwmr7m9+khOEuZXBjCSk46ImDKtAbCzjLJg/LwD1z1ibjlaA+4we7sJ73n3PoaPpcGV1nYjoEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0hjIafY; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0hjIafY"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a86a37208b2so388898666b.0
        for <linux-staging@lists.linux.dev>; Sun, 01 Sep 2024 09:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725207336; x=1725812136; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FvHJ/0sFHcIi56+VT5QpPlQ5XneFMSu2E37DEhXuugg=;
        b=j0hjIafYJCEu2FFXx6A8Le/PkPApgM3zMBjKCAiE8+IF0U8f2B75fl5jaTfE3V7GU/
         B+3xx1dIDRnCwgECnz277RB67fJDPBeYY3jY51LUX/Grpk4KdrqUCPuI8Mp+wLXBuHYs
         riR0xjsf2ugqGpvTCPPrU8fqgl59zvBFMzc1lZfZjDERj6HgXVLoXIB5MDC+H/M0XmuX
         3DuBj+XbL0A3HG5pKJOMmcGQ2/4ThYXWq91obe0cmNTpbHj286cgVyIpzmLTzaRpJEsK
         zchhzRRBVeaSPayuHUazI/T8rR8pxaiAanoITVij3Qqn5eRx2hXwci1TDhxgPFEN4Q2/
         YOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725207336; x=1725812136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvHJ/0sFHcIi56+VT5QpPlQ5XneFMSu2E37DEhXuugg=;
        b=fPvtHsEjGkLSZQMvshMlZuzLOV2j+YavwrIVtoQ3TetXNF/PnW1C24AyMN6x/rXVaM
         iUvFEuZU+n9jWqYHnOufaA3B0udSODpUzC6a1vFT6xyf6DquiNzp1T1hYfQzbiLDCzeJ
         mgDMau7N6r9C8hLCZv6USBVPxgGxipV6dkoUTPEMjjje7zujzAD3cfjSTV4W0RxLIsRy
         W9ftpLtrnru8yQe1PQAmeRjLyEGlYkzeyqu3GPCoWwB1x7wl5nlpxiTxa60n9ZAB8WIN
         OoY9MpEpzOFt5PMr5W5HnEqKJiMOBv4E6i3BYIHmUdCDImbfA/5n4sB+svN4Ahe2v+6W
         w11Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9GJfWEc0a246h35bUQBj1ZDASZMAXwSkH5QewnbA9exkhKS/xfi35yyi+ioXooM+5d13HFKD8Win7Mm7k@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ0dzoGXrpJRw8R6j2NWs4xDiOmEQtkR+xOZ3RXW5t8wdL2gd1
	GT1uNg37yqgo9kGypj+rVkrz0xXl2Yx7hfFxqqzqnCw4gGSqHOypFkwRWA==
X-Google-Smtp-Source: AGHT+IF46DT3j14xhDm2/bhky7JkzuBdMVV8iKwUpLkL+6PHWlDcG4bcSo778pkcrTmHtjfWGY3Q3A==
X-Received: by 2002:a17:907:7256:b0:a7a:a30b:7b93 with SMTP id a640c23a62f3a-a897f77eed8mr1010865666b.2.1725207336312;
        Sun, 01 Sep 2024 09:15:36 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a898922276asm450787366b.204.2024.09.01.09.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 09:15:35 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] staging: rtl8723bs: Remove trailing space after \n newline
Date: Sun,  1 Sep 2024 17:15:34 +0100
Message-Id: <20240901161534.143887-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a extraneous space after a newline in a netdev_dbg message.
Remove it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 9ebf25a0ef9b..6c52a856c9e7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -628,7 +628,7 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 				ret = rtw_check_bcn_info(padapter, pframe, len);
 				if (!ret) {
 					netdev_dbg(padapter->pnetdev,
-						   "ap has changed, disconnect now\n ");
+						   "ap has changed, disconnect now\n");
 					receive_disconnect(padapter,
 							   pmlmeinfo->network.mac_address, 0);
 					return _SUCCESS;
-- 
2.39.2

