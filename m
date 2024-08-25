Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB9829CEF
	for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 21:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724622380; cv=none; b=bIsnFN+DomkI3EQZ23xC/Kj6LCDXvsJhgMOjn7DoT6rwNPifsf0c6UpSfoQ81DLuhDU614QFyywfrc2O9Bx1b+zMLWRIwd6EtLa0ZGWW45fdBVhW8VxlD3S+UXa67ZhND+/q4hVRU1cgZvWSQOwC8H4Rd5jvJxg+go9HhxIaA30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724622380; c=relaxed/simple;
	bh=tRqA3pZO4ChqklOPMPNPOfJsYDua8CM0p+lMxxbt3Nw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=QQ9Gb4qQNOnzUMRNlwfUQBWxglu0oIoM818wIXzk5s5oRocTCgNWULd4GbwbG41siqmi2Hm6NDbMisgLIdNwR4b0MN4OJknk7xt0qcU0sGyJRVq+h0fsQQWZUFdVChbIBoJBhB2pqzeEe6ZyejtJS6dz7Pr5/Q9odleyT3jXvk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJ+7IM6U; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJ+7IM6U"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7cf6641765dso835887a12.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 14:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724622378; x=1725227178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=I7m76LHgbUmejyxProia0AVM2QTv2kcsI9DgRl8hHA8=;
        b=OJ+7IM6U1yeEz+ooj7XjmpkNAIU3LIG695CKoNnek0PC62+u7oD/dmFbRIBWFMJlNG
         V0hMMmn4Sq/2qM4Nak3UUtLNN8FnAvhW9c0LLyas+1LfMbhn42FCCCwk2MeoCGX/cdma
         b/ZuXaMLMt153pKmI07UfiumPo2BTIo/8gA+gP17B4Gmt/Q0SKVHhviauwnEUIIQVLfM
         fNIal+iRqWb6qAM6Ef9iyA7YMOZJI5Z5e718C4HenuL6qcXAF3fmni1MWzDuZNV7ambR
         l72AvZMI9wGQoNhNo0vyivMFzIe/jTWIIf8yhcnJAdq/YU6RuEnRxUn1wqkQpbz0wtTg
         hpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724622378; x=1725227178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I7m76LHgbUmejyxProia0AVM2QTv2kcsI9DgRl8hHA8=;
        b=Y5MOcJWh05rXhXgLrzwId9siaxha7BfeWARrxNE9ECSjanVTow566cwdTc4ah6jln1
         p51+p0hqm/vTWs72hZk3Sh+IsGggEHk0l8MGZ21QM9wxH9zILCiZT+9Y5G3l/2aYu10b
         DGt6GEqWOaFSA6Yvvy2/43UHTie3qKZk4CjM3sNRePUI6NWN+e4yXwXAwhUmvgbOWKuy
         kwApeCIrrF00mUWigGiUKVV+losGSDFJsHe1ADkii01qGtGxrvXqER6+cCgYdsCmVmpE
         84b952nq7tlc0YxVjCRFH95fsauFSxS6gLcNcwi+O/w3mqHO1OZRMuc4ZSP02zz/tRSb
         cqiA==
X-Forwarded-Encrypted: i=1; AJvYcCW1B2N4C6Cn3chpBFL9EpiXIWo5Wm4ZK+EFZqePiguvWrh80giX0t/XPAgisBs9jBl+WxsysYoFow15fU07@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1P9YZJ2Y901Zm/amDK/MW16H3do6rO79BfqGsFKVGNy8XZFQs
	/YRhVa1RMVms6db83uI4vf2WAkZGOxzrIwfSbeZbLedYggZUr+iv
X-Google-Smtp-Source: AGHT+IG0vxhout6cqPChAOh6vpjgZACAApP1gSMoZ/6MPROdMrPfys3a41KGYvyDKQ9wQOGMeOlbMw==
X-Received: by 2002:a05:6a20:c909:b0:1c6:ae03:670b with SMTP id adf61e73a8af0-1cc89d29dadmr10719629637.9.1724622377863;
        Sun, 25 Aug 2024 14:46:17 -0700 (PDT)
Received: from BASE-20.home ([2804:868:d047:ced3:41fa:c7cf:e733:9f1d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143430cc60sm6014817b3a.154.2024.08.25.14.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 14:46:17 -0700 (PDT)
From: Alien Wesley <alienwesley51@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8192e: Fix multiple assignments in rtl_wx.c:529
Date: Sun, 25 Aug 2024 18:46:12 -0300
Message-Id: <20240825214612.49254-1-alienwesley51@gmail.com>
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

---
Changes in v2:
    - Removed two spaces in front of "=".

Signed-off-by: Alien Wesley <alienwesley51@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 47f1adf30ab4..67c4793e0fc1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -526,7 +526,7 @@ static int _rtl92e_wx_set_enc(struct net_device *dev,
 	mutex_unlock(&priv->wx_mutex);
 
 	if (wrqu->encoding.flags & IW_ENCODE_DISABLED) {
-		ieee->pairwise_key_type  = KEY_TYPE_NA;
+		ieee->pairwise_key_type = KEY_TYPE_NA;
 		ieee->group_key_type = KEY_TYPE_NA;
 		rtl92e_cam_reset(dev);
 		memset(priv->rtllib->swcamtable, 0,
-- 
2.34.1

