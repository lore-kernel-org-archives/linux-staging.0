Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB47C19148D
	for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 11:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724931373; cv=none; b=I5/o7zIuI4hmabCRC/3IVYMyrEZk+LoDMfSqPruQSNFuhRyUOOtxcA0z0pPRj6cAzix0GMfwZO/VMmc3m+nv8Qah2wvdYvm6bH8Eqz1bRKRvlO46VovmOU+TFzfU9N4wEpsH8CUle3tIvJA3y9R+TA+uwU2p+pjLdi5QEItoxks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724931373; c=relaxed/simple;
	bh=xjlUdWHuXe9kVpBV5SFh+YipUMtfQLnvnhnIdhIMRWM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=sh6WxJKL9zhvwnu9/N+LojTVlu3iSzjpWGaoFG4ONRUNi7aKb6UdhJ9XoQAl/iV4Nq1Q8bFoAWhV3bDoe98PdvfPK5HEHoKcU4wnCMJZK0aZsmEV0/w9PUSpB0W+eAAvvP69T7tR40r44NUQQzK7SEzv9r+x8/vUfu+4Z6XDfOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7sbaveF; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7sbaveF"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2d3d0b06a2dso426366a91.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 04:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724931371; x=1725536171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nvk8Z4I/ZWd1pT8hER0HXmY6x7UiyZ6oh440YU2oX9k=;
        b=M7sbaveFiNd0lb2yNfYjDPVEv3C7NC8bezY5UXcnXDRQJYIzbgjBwIGd7udHFFTqKO
         6+q2rTY+XMRcINt1mgAevY9X3KIhkmSHfHjd7TtxhSfh+y9cehrewDqa1+q+WNXEOVk0
         rOjjj+u8q6hZf2KqwObEEy9cqxWyF7/j0sj7sbck6o+VXCKG5xsDYeVRxPkmY3KxT533
         oHSvWf75i78RmHYvnRoGfvzOjJ2P6s3QXJ03sxIbQP5ymrx24IgqHYbgfxF2AmlzwS5R
         jOisG0dY1Q3dgI7qW61rv30r14/1BpO2zYUG1cx4sSGeiKOLjp/CxJ+rYHasfGFqmsMG
         9UyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724931371; x=1725536171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nvk8Z4I/ZWd1pT8hER0HXmY6x7UiyZ6oh440YU2oX9k=;
        b=lv5+7lKJl1K7hTDN5eQa8JDLot1ZI4zRkL9anYmT9NDh9wrl/qtudfpepwtcUSPs28
         vp64j1QkQN2QxR88kPwGTJuKKycR1Q+PSMLnS8FMfKDWE8WR9Cd6AmfggBuYMOZFLlzt
         wzRsLdDJP1+G3RN025suOOVBe3N725SsCb7Vu1JUDF/klsFeWJpJ4YR6pZ40GgUxmoVS
         LTQzeyCfObK9lbwCQl6snlrqflDSeyuFhSe8YaYwoxvpoEfW7FxgZ6naevEA9fPxDJoG
         VAYO59xMhhu7lZltwxJnmUIHEgd/Q09zhzztpQ3uZnIKe1BnSG/8E0/DVofTtZYOovM6
         HoWg==
X-Forwarded-Encrypted: i=1; AJvYcCUmDDGS2APC/AoVjBAr4WzxzWrq2ZI4q006DRBzzMXPt+YzLnHHy0ijUXQ4gYqZalAGVbU+nxEwYtmZ2orj@lists.linux.dev
X-Gm-Message-State: AOJu0YzY4qSQH5nbPsy3TEk1ObMZ8dDATVrlBR2QPx624+PJsbzkRaDz
	9vlVzODGJrQBgJN+rrCve9FLFEqHHgkwXMtZQyZvYpRllUVH/3RO
X-Google-Smtp-Source: AGHT+IEkZF47UaIKPM2D4LC2LJ2ypEMjLFClj2jLf+cLSfwzEsvqy/rT6wVXFf4Q+BVYFwtdjzjMwQ==
X-Received: by 2002:a17:90b:1c85:b0:2cd:40ef:4763 with SMTP id 98e67ed59e1d1-2d8561a7ce9mr2608353a91.15.1724931370576;
        Thu, 29 Aug 2024 04:36:10 -0700 (PDT)
Received: from BASE-20.technicolor.net ([2804:14d:c098:8bf5:58c0:549d:d99a:c399])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a5b56sm951788b3a.57.2024.08.29.04.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 04:36:10 -0700 (PDT)
From: Alien Wesley <alienwesley51@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v5] staging: rtl8192e: Fix multiple assignments in rtl_wx.c
Date: Thu, 29 Aug 2024 08:36:06 -0300
Message-Id: <20240829113606.76645-1-alienwesley51@gmail.com>
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
V5: Line number removed from subject
v4: Squash v1 and v3
v3: Fix typo in commit message.
v2: Removed two spaces in front of "=".
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index fc8e7f73b2a4..67c4793e0fc1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -526,7 +526,8 @@ static int _rtl92e_wx_set_enc(struct net_device *dev,
 	mutex_unlock(&priv->wx_mutex);
 
 	if (wrqu->encoding.flags & IW_ENCODE_DISABLED) {
-		ieee->pairwise_key_type = ieee->group_key_type = KEY_TYPE_NA;
+		ieee->pairwise_key_type = KEY_TYPE_NA;
+		ieee->group_key_type = KEY_TYPE_NA;
 		rtl92e_cam_reset(dev);
 		memset(priv->rtllib->swcamtable, 0,
 		       sizeof(struct sw_cam_table) * 32);
-- 
2.34.1

