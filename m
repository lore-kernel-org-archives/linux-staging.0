Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D0D1361
	for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 00:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724717475; cv=none; b=inAy25x83pB26Qu6lRfHOu3UI4ozn0Wse38wg+h0sln8vCt6UwwZREbyTB9M0HzqU6ORj1Fxh4VUVO6uf+wIcvcPY2KVy4hwovESQKum9VHpODOrE9v+ng2DkZ6p+WLs+GD7bC1far8KQ6gUiVF4dHORYIuiEPvHopPFycSXAIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724717475; c=relaxed/simple;
	bh=kXWyl0slUnO+a5sfYHnSJVT3blREh+IyY4fDehSco6g=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=gf4YFitTXYv2IGx4Hs3NO1dIYpkQBbMd4Af7rKbNNrviS1vSdCcbga7UK3DialRJlpzjTCz2IEzGFtQaSQ7p67LTTR0ezOY+7ighKTD/7wjxNShg1sFeSsByjWBifRXjv2rYjbupJNmQ/O6sJXxyh4TZDMdGmi7+PFC342E6k5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWKR3Xn/; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWKR3Xn/"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2d3e46ba5bcso3531877a91.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 17:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724717473; x=1725322273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=k/5xpuZ3Z5HigZwmywx2n/8WWg9SbPfgJSYKo2cWfbo=;
        b=TWKR3Xn/F+TdsWPBjWZM+ZjDlPBcTQ6YxScdDwYUjGsGMu+V29RrO4yWE8NS4azIGD
         q5qdyDp/lfgnLsNUp7ogzsASNVQRTF0uKq3E4LNd9KHGsBxFoZg8dMnD5wtLnmdxbeS3
         jYMvFnEcbCQsrfr8O8DxIXCeN8FF3NhqZgGkTaoj/hBioY5GUMHqhssuOnSPx6eqMY+1
         VzOHXXemKuvNb3uW7Gvlogcc/Vez4GjpSuF25IS+DKXkHSac5XTGDbQTB+sz+2/UJuz8
         896Iisd3hghGREIr1TlVOmKLgS5M6TbExpMLcbyG4M8Q8qZWiKHYWwV0si4zv/xpaPva
         d2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724717473; x=1725322273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/5xpuZ3Z5HigZwmywx2n/8WWg9SbPfgJSYKo2cWfbo=;
        b=iiKckJf2QGTHQTW9/Phl/d6MrAp6mydWUSaCv7MgwcunTRS0unuRbC1GLLeuQ+ovJ6
         12xCPKsPkOK193yNoWo/Wy/5vrMVliRyevtszrdllF9sxON1rS8KPCnPvN7McrC5wnsh
         ZwXN3XUlb7N1auUNiLmh6UE9TEtSCH1pk+rtrd5k/QYGu52H0/0j8Zmv1+0+M10Ql9HU
         I43RB3AYySZ3R2fMBjT6uOeuZI37lcmPasJ1ogCBsfutLlNV6NbUeVtdZm91K8hcxLoC
         qnoyIz8X2/TG/F21wI4jPbBWW53hlROHtoLvNt/ZFmFcvXhWPaqMi3w+0coOExwkvU8Q
         3/7w==
X-Forwarded-Encrypted: i=1; AJvYcCXu3c//wu3OmJ9Y50sqD9/xlphITwFigEcHA4Q9LE9As4MpT76gTmPG0f5n8GE5Y1s5PzoawUo9ZaKVYqUY@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc8nBx+wjlQo9jiUyRSW/vuOgkVUbxcJI7kcZ1n2jpG2RQ5p2L
	JvnTSMXxbMc6wH69QtHuTVEOdS0Grnj9FE3AGdGxFYt4/fWlFXbs
X-Google-Smtp-Source: AGHT+IGA7sBRy2eLjfiFC5yRgmq7NtE5n2KHyaVp7Vh+LqY+09lXe7pw53iNR7nlwPoeqgSygtmIIQ==
X-Received: by 2002:a17:90a:514f:b0:2d3:b643:8386 with SMTP id 98e67ed59e1d1-2d8257cdd17mr1307070a91.9.1724717472775;
        Mon, 26 Aug 2024 17:11:12 -0700 (PDT)
Received: from BASE-20.home ([2804:868:d047:ced3:1cc4:9ed6:b242:b7e6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d613af14d6sm10457462a91.37.2024.08.26.17.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 17:11:12 -0700 (PDT)
From: Alien Wesley <alienwesley51@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v4] staging: rtl8192e: Fix multiple assignments in rtl_wx.c:529
Date: Mon, 26 Aug 2024 21:11:07 -0300
Message-Id: <20240827001107.10641-1-alienwesley51@gmail.com>
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

