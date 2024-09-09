Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1BA3D69
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 04:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725855298; cv=none; b=hfPRVoBXrzqkp8Xnb2tU7sk3DZvy3uF2Y2GITQZi7oh3vT1Pglorgq2oqEli27kftYHTNHE3pza1lGBcOj7ETVNQK/8XOFNn9KGV80PM1pMOUrn98KZXz1w41syViLvLU2z6CVHMX+LSQQKSLFkJshbOtUy6csm3jxoGgTrZYno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725855298; c=relaxed/simple;
	bh=iDOBJvjYerLoJFU3XA583JOfDG/o+TB80A8346WHUJM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oQ10DE4NJ19IdXcMYInH8Gc9CEErbrOg+wzySyL+UygKznl85OfMieNTv7tMrmowSodwgy9Xq/4O8Gu4KOO5fgt+zradg9HO2xC30EugGJHRzEgZBsuEeNDrTCbo+6awQw9ov1RFL9f1vhWbe8AhVITBs6sHLFQ/s6h2ORfSy0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VY5444px; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VY5444px"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71797e61d43so356955b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 21:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725855297; x=1726460097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PoGm47A6uDXokO5FjgQ8D6E0GeUc128l+0FCXA/X69g=;
        b=VY5444pxOCN1qtYE8DLjojNIHX5ZOOwwG5g84ypEfu+oLynIwp77EFY1amScZC1VRg
         ieMCnbGSwok324QYx4GrzgTt9tRbPhxUa2JZIHjso8q9I0pJBgJGd6ITc0O5n+HruP74
         ExJhsSeu4bHH6m1vE04rWPCNtdl1199bXIKkOr7S0a0tRQYucC3M9qbNL0yWSco4jIWl
         lDAdpSrmLOWWgX19KfuuKXJXveibilcvmK9AK4B7qmhLwlSHrtOS6BZftbR1VUuNrgFD
         jg+Ni/67bDbdzWu46XDakccATOrDBFGjQSMalH8InNYHyAbz9RyItpU1qY4SFAZ5Kkvx
         XFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725855297; x=1726460097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PoGm47A6uDXokO5FjgQ8D6E0GeUc128l+0FCXA/X69g=;
        b=aIMb6EL4sO33JhoHscQ4mFtRCBOvqzRs2AWHbRBk1KI0TB0pmrFa1WozKvvEUY1P2B
         hOfDW4Ugo6W8EB5WVSQXT/wB2OCWHIoGkbtzNM+pEOXQARPa4QpKhTCtUC9Mvy6Eo8k7
         aC76/ekjUrKpJ1mHQJBPqqQaY+5tRAGcjeZN45XV7albmRM3i2XF7A2FuL2TKY/5uhDP
         N8Q9OMxg8UTkLrmGyCRLIwD1Lcw0SSEgU7Gb7YwoELr9ENf6iTZ4wJUeh57cls2EKUWw
         j6hblRhI6o2v5GJhqQ1bnWS8ygP6hP2mtDnyQt5xOld/h3JuLNaAeu5Styo8EAKTjPZP
         3+nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx+Gu9HW1N5Yc3Vugbt71UqPCS7eSl6sdrqYxbJqqYagMqxxy7//CDnclLnHAzIVGwOtp0mODtSOwKRsCS@lists.linux.dev
X-Gm-Message-State: AOJu0YzDimhwugWSVNN4VsorR2AlXP5A7Ey2qEXi+JO3Rmo+0zFTQ8LK
	jtQkQSoiUwHXJ9ahT6PTGBVbqhYfVNrNx5pXE94nUnwJjOIA0Cac
X-Google-Smtp-Source: AGHT+IEBxC0qBl2mXynuvBAa5NyLBG8S2V3uRM5H/KyUmfOYcMhIGSRfaEIdVLH3BZ5aGN0XKGsj2A==
X-Received: by 2002:a05:6a20:3944:b0:1cf:37d4:c4f6 with SMTP id adf61e73a8af0-1cf37d4cc66mr1686938637.4.1725855296782;
        Sun, 08 Sep 2024 21:14:56 -0700 (PDT)
Received: from ubuntukernelserver.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e33930sm25755605ad.102.2024.09.08.21.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 21:14:56 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] staging: rtl8723bs: include: Fix spelling mistake in rtw_xmit.h
Date: Mon,  9 Sep 2024 09:58:52 +0545
Message-Id: <20240909041352.2392-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes spelling mistake to increase code readability
and searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
v2: Created patch series as suggested by Phillip
v1: https://lore.kernel.org/all/20240906141024.10021-1-topofeverest8848@gmail.com/

 drivers/staging/rtl8723bs/include/rtw_xmit.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index a3b4310caddf..544468f57692 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -15,7 +15,7 @@
 
 #define XMITBUF_ALIGN_SZ 512
 
-/*  xmit extension buff defination */
+/*  xmit extension buff definition */
 #define MAX_XMIT_EXTBUF_SZ	(1536)
 #define NR_XMIT_EXTBUFF	(32)
 
-- 
2.34.1

