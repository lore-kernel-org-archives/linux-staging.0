Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F219374E59
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 03:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778555107; cv=none; b=FyAdlKfMzM2FjaVP01KYqoq7L904SiTL0cMRg0kcyAw0hlr+ez7eKaENzbHLdr6/VY9z2mTNI65/YrpbqgtRe+YOnRfKuHSrq+sZ754HGirx+R+nML/dsX4saMvGizqbbUXy8ryZaqaO5IfVccgkrmsrZDk9pEZVOSdhz6TM198=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778555107; c=relaxed/simple;
	bh=OjS84fyr1Np8GryesdkwyZdtusIvDqhk9G7atC1y9sw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cfc0xRMEiWMKvzkwEMUd1sT5dNafrcTh3aQtnAp15G33Jn0tdzghJTK/WI9kfO+1jtOPEXA2uTqmGdBmQC5gjYoQbZwa/BikACPv0BbuBVgCLPEm6zChmLLCvo0wBEI0lNeUUKp0v6+EKg55qTF1USkwX7e4DFq9OkRelYK2Goc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elPP9UUU; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elPP9UUU"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2f00a567cfaso3350492eec.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 20:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778555104; x=1779159904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwrfpKa7ZrSAnPBOF79N3IhxzqvT+3wAOiHHA54y3cQ=;
        b=elPP9UUUznLwa9sglnNYe6IVkFFsw67WhPTruOXF9avq3FFHBlmeNlb2n/nCfS/uOV
         4h74xNXV7V06WQOScICNKLi5DdZLBkVhok/XydxAyUen+3P2DosTgmbjpQjhaFi7bljp
         lyXoLatjEcq8cIrRGzzfHoUoogrlklPiebEgIs8ufr9I6rtBp3T42cgZygIttZag8f1e
         7K3dAVHbJkZtRFwvr0yH64/yrkBY7Nb9+uug4bGtX14w+dlYGTdzvjMb4OGAMqHjZ89u
         ZOxsmgefUNag/dVP5U6AtpCxgex+gwv3SsjO14BcTOABito1y/vAocqclnI01+p8yLEA
         TDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778555104; x=1779159904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mwrfpKa7ZrSAnPBOF79N3IhxzqvT+3wAOiHHA54y3cQ=;
        b=Oamwt37nUxZ6bSpIEa/FkfYix8Aov+DMmUgoVLM56d105L8ol2YizuaxyGQQtwc7sr
         jv80UTFF9yzgPSZBH6gtwvsnHZxOSkA2BBkLLjpunkskvXm5momH6MCeXmscOmqxeAw5
         loS5ruprUMkqUowT9Cmw5YanERDVNC/zk+QL2lcyiEUh8hDOREqSCONshJQiq2qZJfyv
         UxRpii9S5O/I4J2QbzzsRVx5OHbV92/wNI54T4GGVAiot2FjPQPxODw/90DurLEfJya0
         EMA7oHhDoySECwySEZ0f71PRzG6txmmNVIap9DeEjUf6HsVFPXHhFkcD4JoaKqSWfr7d
         cKGA==
X-Forwarded-Encrypted: i=1; AFNElJ+1NiFe3IzhE/wEdXrDJGeMWFbGl91+mPIOTQnxj/xjA7mi1RyWoQpSG+y1awmaXWEnQravKKTDnE41gKLh@lists.linux.dev
X-Gm-Message-State: AOJu0YyHiU8OTVXFeWFzNWrfds2LGCPen4A5VL3hJtseUMLvHOTYPBH6
	+x4SWDAF+S6sK9k/FnJhMWRW/mOBW+8JTznh51xQehJlzxW3MydDRYQWAfBueExV
X-Gm-Gg: Acq92OFVNIsIY2POB4guU/XeiYpKYoNSnBQwjTQuxiNINtPe7M5p0IirK0qepJoBi1B
	pO770bp7zyot9IMJQCMxfobimgXFjFRW2dqGy13Yn12APj5b2U8OFzLm6h0eLrWWbC9OqLK6bJs
	bB8mg2LHyiT8iBtxiiT76PIhnFjnHMJlb60ShTQqsmYNRa4IrK8yQcJDUYhJat7T7o1K/GesSWn
	LKvMXThdqpGNanKMCFDfoblhH/mj26KTn0QaZ6eL3BTGLxyJ3MFT1mxb7/91XNct00T5q0lWXnU
	NIEnHlKVH3Qn+mmUe/Y/BAwKtESBWC7KnFph3OxDDnWNSr1R61w4Nt1uyD+KZMbyhtzlGeUesby
	QNHfp7Tif+AhTcpcOPqQW8r3uovGNzMjOmL8jZBNvKImB08oSsChhnraXotw0Q/JZQb/2ILF3It
	8fzlFslIPKALvfL/wzyjptDFzk+RlInSROq99QbrNbtwD6lJT7+P5oIzk=
X-Received: by 2002:a05:7301:4591:b0:2ed:e16:6b39 with SMTP id 5a478bee46e88-2ff946e0259mr1090002eec.17.1778555104173;
        Mon, 11 May 2026 20:05:04 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e381c9sm15858223eec.26.2026.05.11.20.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 20:05:03 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: convert LPS_RF_ON_check to errno
Date: Tue, 12 May 2026 03:04:45 +0000
Message-Id: <20260512030445.6360-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512030445.6360-2-dennylin0707@gmail.com>
References: <20260512030445.6360-1-dennylin0707@gmail.com>
 <20260512030445.6360-2-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert LPS_RF_ON_check() to return standard kernel error codes.

Replace -1 and -2 with -ETIMEDOUT and -ENODEV respectively.

No functional change intended as callers currently ignore
the return value.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c    | 10 +++++-----
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 7f297f2d2ff4..b0122eef5c32 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -390,10 +390,10 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode,
 /*
  * Return:
  * 0:    Leave OK
- * -1:   Timeout
- * -2:   Other error
+ * -ETIMEDOUT:  Timeout
+ * -ENODEV:     Other error
  */
-s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
+int LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 {
 	unsigned long start_time;
 	u8 bAwake = false;
@@ -405,10 +405,10 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 			return 0;
 
 		if (padapter->bSurpriseRemoved)
-			return -2;
+			return -ENODEV;
 
 		if (jiffies_to_msecs(jiffies - start_time) > delay_ms)
-			return -1;
+			return -ETIMEDOUT;
 
 		msleep(1);
 	}
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index c27d07861b8c..7dc9c4e2dfd2 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -233,7 +233,7 @@ int ips_leave(struct adapter *padapter);
 
 void rtw_ps_processor(struct adapter *padapter);
 
-s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms);
+int LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms);
 void LPS_Enter(struct adapter *padapter, const char *msg);
 void LPS_Leave(struct adapter *padapter, const char *msg);
 void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets);
-- 
2.34.1

