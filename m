Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2251CB316
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 14:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724335237; cv=none; b=Lk+iuSmrRH9xunijaV3ZhUQcCEdVBfOPaKFURvwsCPPCOkourAVVVUJZraVFi756Me7TKEOJ1UK4XZOY+I+nCfHGm8O+9SAabs9n1WR0D5ZYU1+BjZstnKtnwwQUgk2ooQbSfinRPS+/fkuPuzFnonxjjxbA2Be3t3jznAWsZIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724335237; c=relaxed/simple;
	bh=tGxySKSTO8qcGXrB893f4C6YFSw1eP0VHVb17wjt1OE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Oq/CVS3GwWRSzySKavUgTZU1fE3i6J7ecJg38QkpMb0Z7kBLHUodmWEST6GWoSYkRvGxLRJszfVtW0KVv2SUqG1IF8FUeKuV4xfmgPG3rQdbL0auXzgOpT88Y3ocDJJkWwi52p5hiVtQXRC14C9vIYoe++OZ1tHgbU7yH8hEYFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXQRfvv/; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXQRfvv/"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7cb3db0932cso665767a12.1
        for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 07:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724335235; x=1724940035; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hTLkljK79vIqNPsl6WF8G9Xx/q3y0p1QAtEGLt2aawo=;
        b=CXQRfvv/1sMKMy68ANT2I8jOm24t0EIDyfwNCXY8OrDIwtgCWb678jE8oxCPBNkTIb
         Xi1nt9edfDSxlnJeQhYc7ngYaMv88hATmYnWrNm77nxqtpqyUG+uQLay4crV2/wBEAjN
         J4nwKVBQJBOjHB0E4PP+nlrqFw/MupON3AhzcVCfnInFdemzYCMvJ3Ev/6MvnKrTiyRO
         S8ERd23dviqdr9X/2zS8TTpBcrSITJme2NieorQGcuy0QCRyl8hVNYNIndaJ5Xs3gvhb
         Xbs5OfzuKBFfmjLk26PhGmJLj2/RWukQKLEVmF2dI3TfsQJvKmKtufU0OZPmsvxS2ge5
         ZIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724335235; x=1724940035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hTLkljK79vIqNPsl6WF8G9Xx/q3y0p1QAtEGLt2aawo=;
        b=uCsfntB1bjIbgXakR2xxebhtb/azg+rGLJPW+ic5QbimlRyJ27q/y08xYeL8XA79yh
         L3w/8tB+rDFNWAsJfaFbnUO+EHxQm0h3e/Vht4/cXmylvVc3bLgKbKCS+i141GEoDKZW
         wY2iynjAEfEgi4uUhEch/2Qs8BLkqmdlEfY11EB3adZ9Awdajw8CqGFLq0eT8FF8/kr6
         krBYDP2cIVN5yj5ZAJhKADXVLzSpoZH3CDbzx8JdD6Y3OZ1XX1dqtpxNNqVox1K36iTu
         P08leOwgYkytiKnYlU6tusE/ji5EJf2VlpOGa5DHAu+AoIuTpGiyiU2MXjPlqVgGUAmh
         Lxfg==
X-Forwarded-Encrypted: i=1; AJvYcCXpU1rd92CiNdDipCji8kMV5q0KbMQR7zJJ9Ah6QbkVynYJINkMJoJT/0RQ+fZwdgHOLRvRZTAw2cGMN0Sp@lists.linux.dev
X-Gm-Message-State: AOJu0YyMidgjrOy3cdSJqP61iuc34vDJxNPa1ZdjlqKdR5oqIkh5pcGM
	VS33EP4GxBwUKM1ZiuewzgJxSjXgisbxygFB1J9zfd5UHZh5BF5+
X-Google-Smtp-Source: AGHT+IFs4BQn9DIBeswayw4RZGkrbX0qCsLE6XAPC6PPsd/BR0n7wRyn6MVViOGUVsk6/6TaiBBCTA==
X-Received: by 2002:a17:90b:4b10:b0:2c9:61f9:a141 with SMTP id 98e67ed59e1d1-2d5e9a74ac1mr6885074a91.16.1724335234407;
        Thu, 22 Aug 2024 07:00:34 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:baa2:9074::1002])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d613af145dsm1830588a91.38.2024.08.22.07.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 07:00:33 -0700 (PDT)
From: Hans Buss <hansbh123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v2] staging: rtl8192e: Insert spaces around '|'
Date: Thu, 22 Aug 2024 11:00:22 -0300
Message-ID: <20240822140022.11197-1-hansbh123@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Buss <hans.buss@mailfence.com>

Insert spaces around '|' to adhre to Linux kernel coding style.

CHECK: spaces preferred around that '|' (ctx:VxV)

Changes in v2:
 - fixed typo in commit message

Signed-off-by: Hans Buss <hans.buss@mailfence.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
index 1b444529b59c..e507593b939c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
@@ -229,7 +229,7 @@ enum _RTL8192PCI_HW {
 				RATR_MCS6 | RATR_MCS7)
 #define RATE_ALL_OFDM_2SS	(RATR_MCS8 | RATR_MCS9 | RATR_MCS10 |	\
 				RATR_MCS11 | RATR_MCS12 | RATR_MCS13 |	\
-				RATR_MCS14|RATR_MCS15)
+				RATR_MCS14 | RATR_MCS15)
 
 	DRIVER_RSSI		= 0x32c,
 	MCS_TXAGC		= 0x340,
-- 
2.46.0

