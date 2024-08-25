Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991BE15667D
	for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 15:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724600765; cv=none; b=h65+IjXeoAk9f0J7f7GSLrCVBUQI2GKLLxlNrwHViiyeuq3q4u4OmPyljiZjIMUnW4L2P5n6KAyFt+qtexuJLJr/NwZCwcXG3RsLtEh17MfwyZQPS//DHbNv61l/lDAlI9B76uNWd6A/ceFx51OM5HUigsoS9P/ZJrskxIH8Na8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724600765; c=relaxed/simple;
	bh=qFAr3JB9cQcJzIL3tHGa1v82oa2xKnsbgnCcDYEJ+f8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=GaGaAYpFCMnuBR1eOaSxa+xmZflKEKsTV0D2mfYS8+UGpRUNW8BoMutIshgQ6SPg3byRvktmAMahkl0d2sPy4IVdvLDESqalndvUPAEXomitBfmKgtPpuQg42pHZ6gYWMCTdUVLfK68ZzA66Jbm5SKPqlzu290/QVouiL+Ev9bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNdxlbGt; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNdxlbGt"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2021aeee5e4so22565055ad.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 08:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724600764; x=1725205564; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TovjW3a+wi44sci9aoW3NvQpz+eAWFPeMHC0GadI33U=;
        b=CNdxlbGtB8D50YwoCDHe18pVIhFO4ZqHJKU0pesNuNa+Ee1QtULTcRFxa3LOBY66z4
         UfnwQrr7SikRTy752nrMgVPdHGmc5whbyKsJLBzoY+KIQgDvzN+Sp4ng7lLbtg9DkhjW
         nGTslKBVxlpgR8ewTKQrjhyKn3F2f+7NpArLqR9l3wrgf8oKTNWZLggjs0sIZRLJ5Dbb
         9CmkwOqBQOiisanI3vVAFeaMXtjr0eOy/azowGsik/9XMwPkorZS2MxIp0KUDi6wFGwr
         iWyh1APf97miCrHiLXPohv1idnvkq6yKRGfFuLVYB0nA8eu1za5BSigEj1etjzLYVxgU
         dVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724600764; x=1725205564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TovjW3a+wi44sci9aoW3NvQpz+eAWFPeMHC0GadI33U=;
        b=qLxF2GEFc1VX4O0yZQjYssjYkgzZ7OOkhCpOeYNuULX8Jl3jAA/rMOYKaSsc9peKP0
         +4/OFEtRisPjDLGBcDA9GQ7pBFcRV4Dh4FA3+jc5Qe4shGmB4Ndg3WTzukJMYCdPZojD
         jOyrJEwzgbqGOKe8qQiUN6kRSTRoGEaHWL/cmxHu/BZ4mSMVCiBlDOHqGjgyu5NtC0Xn
         CG6uW8BjzbwvPf3pU2vOzuGqi4DpA6QcDBSmbudz8MiYWnJykR6FGVkd91e3Efi3Y4Es
         PXWWhpGqNwilbl2ceQjfEd6P4qoF6ospeXbv8dPwHo2Z1gtmvcfSTQmQ/7kF77r79HIf
         NF9A==
X-Forwarded-Encrypted: i=1; AJvYcCVyVLshd2mxcqDW9T17OzfXuS0ea0qEFJLgikZSf2fB7WYZ0LwwrVXqx6nIo48zgLBRWhZ32q1b1/k02kMm@lists.linux.dev
X-Gm-Message-State: AOJu0YwUvOFRn2MgEdXnTNev4xH7/Shuh9334XCF5hFvLFbDnZ8UcgFK
	qIn1nd517lvypoRpFRHjTnt2rSq2HjEJGU+o6tjVvRiUqsDJtXr5
X-Google-Smtp-Source: AGHT+IHlEas4dSlHv2gTUSOkjdLdLADScUZdAxxRIGXpu3M9hFADuEnKHV7QD6DfyQIX9o+mhj6q+g==
X-Received: by 2002:a17:902:f54c:b0:202:3a1d:a231 with SMTP id d9443c01a7336-2039e4aa902mr79215165ad.31.1724600763592;
        Sun, 25 Aug 2024 08:46:03 -0700 (PDT)
Received: from localhost.localdomain ([2804:868:d047:ced3:41fa:c7cf:e733:9f1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385564dcasm55256055ad.14.2024.08.25.08.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 08:46:02 -0700 (PDT)
From: Alien Wesley <alienwesley51@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8192e: Fix multiple assignments in rtl_wx.c:529
Date: Sun, 25 Aug 2024 12:45:57 -0300
Message-Id: <20240825154557.17912-1-alienwesley51@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separated assignments for pairwise_key_type and group_key_type
in order to silence the following checkpatch warning.

CHECK: multiple assignments should be avoided.

Signed-off-by: Alien Wesley <alienwesley51@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index fc8e7f73b2a4..47f1adf30ab4 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -526,7 +526,8 @@ static int _rtl92e_wx_set_enc(struct net_device *dev,
 	mutex_unlock(&priv->wx_mutex);
 
 	if (wrqu->encoding.flags & IW_ENCODE_DISABLED) {
-		ieee->pairwise_key_type = ieee->group_key_type = KEY_TYPE_NA;
+		ieee->pairwise_key_type  = KEY_TYPE_NA;
+		ieee->group_key_type = KEY_TYPE_NA;
 		rtl92e_cam_reset(dev);
 		memset(priv->rtllib->swcamtable, 0,
 		       sizeof(struct sw_cam_table) * 32);
-- 
2.34.1

