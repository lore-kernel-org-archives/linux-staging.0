Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DED34C8C
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 00:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724286425; cv=none; b=quutIrzfgqKzPEwrZSbEG8Oae2L7EOA+30TbpAksC8cnpIFbMDaIR8Olqat8fMQGODnnbbBAscfO0gnH6EJm2wGDkv+Y6BCB+mVupJzyMTL3gwCNEepfuEnSDsK+z58Q30nFdFzYJmQTTns19Kwvh1OFOpNMhL0DGYZuLEllEDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724286425; c=relaxed/simple;
	bh=meburOTuZMLHPYgqfoHfd6vrVObsNhzhsmWmRE5ijQA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=IjcOxOVhmj6v/Y8RjNXmOJoqxCc9Gcl2kebnsEoDBb7zy26EBYuDWlQpB9xsBY+PYe8+NUIEVRBdeOvNg0u6qm0BmzaGrYo+EXBkZI7YvrOuZvUp+uOfIxYJyaTo7u632gzu+KC8Tvu8E0ouqNyGFaQstUdoNBn8EvYJ78jAYBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/RCGTZF; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/RCGTZF"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2021537a8e6so2183395ad.2
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 17:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724286424; x=1724891224; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VTe8UZvf5x/OVSuUip0xn9D9/lWdiUo1j0pjYyI1a7U=;
        b=k/RCGTZF7sF3JnKdujf4wuNFwa4Em4kd8AQkXaeX9kcGoc9WLTO5Lnqypx1HaGDBSH
         ygHh+l+fEKITegmshMqFPcv+U5flwlPt7KLt9gp2rcQubGwnsZZxrMAeHU66Q5Wm/cA0
         W6omASpvS5v0iVXcBDSjI2RN2U2Y+4FZWxUBXic2DdhgnpBGGYgfTevWdZq5oY136A4/
         4zAEmKhWkjko7Gz2VuaF0KjRF29epp/HffdTJr3P2CSS7OU9WRC3gH+Br98F9rqaCY/j
         xzHb8R+xW8h22Se2d17jjZeoYab6iOY8+tbARj0rgnPiFGnfWtsvjw54BiFdL8Us4jvY
         S30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724286424; x=1724891224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VTe8UZvf5x/OVSuUip0xn9D9/lWdiUo1j0pjYyI1a7U=;
        b=BIcMTDWCtUuUuph9a2oz0oFgPqthIQ003na18dqDcBFM7wwfbLjoB5qG/pTRDUi+YI
         VV3ZuoG78pUOAOIIzupNlGwSoxH4gGrGatU/0s38MPnw1wn7KHZVPWMwI8xaNPf2nbwP
         +NhCgtx4WeRKKRxxun2x53Ouqw1LBw1yCnnELcNR8nL3EIi6RVWxF3AE3KdegFbet4W7
         y3qcBcXOAkYZRD5P/LeURyfnEuJE5PfRmNpXeMJOiOjsiEgfM5bwnkXSJHCj3n+3aeps
         lS8GBb4LjqtmzbvxCbigxyqKuGigrIU1PGNknIfS8S2fjO2y5Q893SzBRel0iCz8DpIz
         SmNg==
X-Gm-Message-State: AOJu0YyyvJY2Z1FjNwAilTc/oiLBK2J39VKHUhYksdHTLyBiDR2AazFF
	QyJsfN4dTyXIl+5VjYklN+9xfOZJdYXj4TZ402cIin1jIW7v/PHTehCXtnWthK4=
X-Google-Smtp-Source: AGHT+IE4cVQNQLgPRErKli0tV7ew+G/AvDBgEaurVCpADHbCSbXxyBOdFms2vuWw+LxZLQNae3SUpQ==
X-Received: by 2002:a17:902:d2c1:b0:202:708:343b with SMTP id d9443c01a7336-2036821e1c6mr44870925ad.65.1724286423670;
        Wed, 21 Aug 2024 17:27:03 -0700 (PDT)
Received: from orlandobook.unicamp.br ([2801:8a:c811:1:5276:8462:6a5a:930b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855664d5sm1725915ad.31.2024.08.21.17.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 17:27:03 -0700 (PDT)
From: Pedro Orlando <scramblerdoodle@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8192e: Fix parenthesis alignment
Date: Wed, 21 Aug 2024 21:26:58 -0300
Message-Id: <20240822002658.33672-1-scramblerdoodle@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix parenthesis alignment in _rtl92e_wx_set_encode_ext to fix
checkpatch warning:

CHECK: Alignment should match open parenthesis

Signed-off-by: Pedro Orlando <scramblerdoodle@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index c21a0560410a..fc8e7f73b2a4 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -675,7 +675,7 @@ static int _rtl92e_wx_set_encode_ext(struct net_device *dev,
 		u8 idx = 0, alg = 0, group = 0;
 
 		if ((encoding->flags & IW_ENCODE_DISABLED) ||
-		     ext->alg == IW_ENCODE_ALG_NONE) {
+		    ext->alg == IW_ENCODE_ALG_NONE) {
 			ieee->pairwise_key_type = ieee->group_key_type
 						= KEY_TYPE_NA;
 			rtl92e_cam_reset(dev);
@@ -710,7 +710,7 @@ static int _rtl92e_wx_set_encode_ext(struct net_device *dev,
 			rtl92e_set_swcam(dev, idx, idx, alg, broadcast_addr, key);
 		} else {
 			if ((ieee->pairwise_key_type == KEY_TYPE_CCMP) &&
-			     ieee->ht_info->current_ht_support)
+			    ieee->ht_info->current_ht_support)
 				rtl92e_writeb(dev, 0x173, 1);
 			rtl92e_set_key(dev, 4, idx, alg,
 				       (u8 *)ieee->ap_mac_addr, 0, key);
-- 
2.34.1

