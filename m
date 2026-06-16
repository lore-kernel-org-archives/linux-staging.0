Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E963D8138
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 09:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781602660; cv=none; b=UgnoFRnl2UIOGMmOou+hHY87Xl4/EK5NW/jDpKXgJeupcOTV54jKTl/p7Tx5HeSN2s0BayclMzSZulSQUqIEkCaTzAEsHO5+aZ48G1YqL9u9ZtH1yzbIFZEyvcAXCGvTzkVmglCFzUyrcNK64KbsuhJUO+DJkc/4Q54xznzTBvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781602660; c=relaxed/simple;
	bh=IjLioQZ6REOdw5Pf3NMhv9xhs0fyRU6T0P1vBD0rgY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BrErBH2CwrJZ/cAxwjegSF3obkanHIacZOpgcNccEHKL8QptrHpuM2Iydz6HzgUfT5jbO5mii3UGTgPikei1BM+fCZyHZtr9Tlc/t/9N7USJiMbKnDvQGQzT6lT6fwn5Mnffj7E/S3Ugn5enyfXptDP/R7ABRphnqiUVu9rvGds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRAP/0y+; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRAP/0y+"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8423f236418so2322465b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 02:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781602658; x=1782207458; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q8B7+OYWzmeaiE6+txOrPbNbByamKxj/fZ7gCf9iwIs=;
        b=HRAP/0y+/TEhlsoT5WuVHYE8RKyWuErSb5ZGdOq4coB2L/Uz5ahR0jbH8xJZEbSI5S
         3G0Koe81akRdOAiirtNNPCk226lYPCY8yb7Z8JJDp0C6UZ85Qj96FEx+Vk41PM2DkTXT
         EuPwk3MMxUjl3R2OLWZrH32qQnnVF+cbW1bQR3jaraWj24ecE8UzCijdkaFeI/PPJID2
         gl3zG8nsEWJXbIJIWfFIHcI1QgeYd/T7g2nXujGNiry3xcjobNSYQ4HOmg16cQe7O6cz
         u+eUWF2pUP33A96+UGtaFp9m17rZ77mRDE3DHWpnXItZtVVsCEnYc2ygZ0ibKuc6YELG
         yDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781602658; x=1782207458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8B7+OYWzmeaiE6+txOrPbNbByamKxj/fZ7gCf9iwIs=;
        b=SkoZDTuiwWst0BjhUjw2OZXBO91pTda316WnN+8clwGeqaYUdLZkBLSG1ardBQXTEe
         B0M3iajyHAJE3Qy3BV9Lb/lovNqma8w4drpdDuubDafYHKkR0CmwKB0D8b6pQpMqaoai
         R2/iXCB9116ag+q7DAGjvtcXMjFag5vUkZ6+hgcQ9Lq+uJFNmTP9py9T7rNFCyDnONsQ
         GRrfYlCQ03qQR//9C4QVz9wA6RQIBi5lmufKs9nFmzJjO1wrcXtSLiFD/PqGRbWIAFfR
         ICPfgNl1jWEveVA6fP5fo4friYNgvLhZU2UKfAgXb/hyc4quqPrEqm/A7twMEOXTy6I3
         K8Pg==
X-Gm-Message-State: AOJu0YwC7JdWCNTZxAYxdZOaIPVI/EBUwG9s+BANt99KxCRAc4vcP1yF
	RILsH49uq0gNWQMGHtA43vqNoC8DQSxha7/tgSKSG58jKtrqC7MhFXzXAOf/BCvu5ao=
X-Gm-Gg: Acq92OHotzSfY9m7W8JzTw1YYCN9p+d6x0XuPbngFym8jkNQItloTO4cN1c+LCAjy3X
	tcnJhIPhS2fm0RbMN2qEEu1I3uOTNzLXaS6N14zWda2k+nt1gJTFEICMeISyCulo6TyMfJ5vqix
	nmsLlMjbCosfZjT7N4jdGs/Dw+z20f/vmAqXbUzS4hV1GaXHQw0CoxFb3CCe0uK0iL1qDLfoCm+
	a0JEo55u8VcIj+WOLJ/f7T6ImSRbL+yu4SSj4tiaWRqINOrAFuWZsH9iSTDmnGcrUBTmyxebBZu
	rYN0b2xtKEZeBvHf+ObY62sFheMZlKBUdBq44OwRhHyLeMCxK+OnxQd6Y0JapkrLKFY2I1NECI7
	Fsd7e9Pia+chQ1+eMm0MIGYDmf+j4RoZzOiRUPRS5rVKbnIQ1s/5o3uXIoBN+GZtLzixpOxrmlp
	Oa6Y4Arr3oPFuk6mnzCX69hFH0xGsD/tZy3w==
X-Received: by 2002:a05:6a00:2e8f:b0:842:21f0:5113 with SMTP id d2e1a72fcca58-845154f5efemr2843021b3a.24.1781602658432;
        Tue, 16 Jun 2026 02:37:38 -0700 (PDT)
Received: from fedora ([103.51.149.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8fc7sm13637098b3a.37.2026.06.16.02.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:37:38 -0700 (PDT)
From: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Subhrojyoti Bala <subhrojyoti0609@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Fix indentation in enum in rtw_mlme.h
Date: Tue, 16 Jun 2026 15:07:01 +0530
Message-ID: <20260616093701.33645-1-subhrojyoti0609@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enum members were missing tab indentation. Add proper tab
indent to align with kernel coding style.

No functional change.

Signed-off-by: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index ac3ba746b64c..403c097b46ef 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -44,12 +44,12 @@
 
 
 enum {
- dot11AuthAlgrthm_Open = 0,
- dot11AuthAlgrthm_Shared,
- dot11AuthAlgrthm_8021X,
- dot11AuthAlgrthm_Auto,
- dot11AuthAlgrthm_WAPI,
- dot11AuthAlgrthm_MaxNum
+	dot11AuthAlgrthm_Open = 0,
+	dot11AuthAlgrthm_Shared,
+	dot11AuthAlgrthm_8021X,
+	dot11AuthAlgrthm_Auto,
+	dot11AuthAlgrthm_WAPI,
+	dot11AuthAlgrthm_MaxNum
 };
 
 /*  Scan type including active and passive scan. */
-- 
2.54.0

