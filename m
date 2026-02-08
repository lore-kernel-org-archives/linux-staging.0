Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834C9346A08
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 12:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770552905; cv=none; b=aIHzelhX+SMNVlbfhDSuiWIvBBoYa5RocTtHJrb11hYF9uLqj0ZQU3UV4nCwONfmJymVstIIZaf1O589ujVnwY+D6jmYifZcsl1BavLcL1C/5w6t9wrAjOZTzGY3B+xzIDv9AV+tyEPbhj6Ht68TIZgCiMClxKFz5YNPtClG+Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770552905; c=relaxed/simple;
	bh=xf2RoF39VOUBNUWEgBlV5m4FCvskYmrC36NJcKEGIaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OnvOcl62ZlGp7KwBkjMge72vflxTFy+6kkQ6fUaSvgTJaRZgg5jB/YEnc+ZBPG5rkTpF+tvnJunQZx3sBtofR6xt7wK+oFwFksvP2tuTpKwF3C+/0knuJs7xBHQxgqvr2Mk2yjL6SsXB877YuV5sNAmQIeV5IALx83LcFluhuIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwROCcz7; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwROCcz7"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43626796202so2586862f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Feb 2026 04:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770552904; x=1771157704; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJNr8V+RodxtGicb+CljCdk0ZoYn0PJWwTD2D7vbmI8=;
        b=NwROCcz7zPX6m6QT2Czk2gErUD907ql+Oa+Khxquqvuc4BoEWvf36yKcv5gCh8gTNT
         TinvQuhXsAFg3gYCEeHUgqZD8Er+O/R96Hgp92uCNVnG0x8c4Yb4daa1qB4V54S5RPhr
         b58H9/IHeuiDaI5tsRk4FnV95HP5ZUBAxpgaHs6vV6Etrk0w9LiZ8fZcyZO57u6s4QYa
         BCeWjzvfsSwCxYwLeNH1npHIZznzqsy8FIPCUK0crrcsG6sEnmB08vUqgGQI+sjSrDO+
         y8MqjOsooicQBAYK/A9mLBXBHjZQL54Yr1Jx/YddhqvNV38wjZXmZKpXauE2IIkZ7Ca6
         Xiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770552904; x=1771157704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJNr8V+RodxtGicb+CljCdk0ZoYn0PJWwTD2D7vbmI8=;
        b=ZmK6Ul5QH5nVYtHzW+MdxBh96ovlM+J9NPMwHsLrV6wtDWU0pKJxLcgCZVkIElwkbu
         gqqNlmLQ0IHhpAA7lydRa2X5R/VN9uSB6jJtHx6Cnr/ZoJrcA2SvEUfkDmeoS5m1mClk
         xVcm+EXupRYITNSda6UjTgSIt6kE0mKUBDjWo2FlhV46Fxe4sl4RLyWW3KjveR287KTX
         Hl7MpStOcZJbDRQeW3hbhbx7sUfPKdf07EqmmctkQA41AgbegsrWDpVVy4IfzhexhlKT
         XLHU5KCN2aHrUEqondHwG9gmbJOc+HhWJ4WIjPoWiAZZIWwdTMza3BlHZZ8JNEsySado
         w1fg==
X-Gm-Message-State: AOJu0YzsTc98GvkeiLCxcp8Lh3olKP6eSC4suddWdKMYpacpX2R3CAHJ
	del/tORwXI2XAKmQdiRaIAHt3FOp9CauCMhmgcrHNtPV7f/BaPsvImir
X-Gm-Gg: AZuq6aKWp6ZN7RaO25RyzHRyum65a6frtLoi0QhS/Zu/5+Ad5hhHc34JFad/XVuGNVA
	FrLljGmn4uny7MZBgc6HjmkUUpzWh5iwFXqKLH8SIK4Hls/VKvgAXz7+bsvFS0yuDVh2g4iRoCE
	bly+ZK6sUSfujHNoFoeWwlRuO+UcAZTrJTky6yp5YytCs9+X3DYLqE9OE/4plmGow+4/eRHkLnJ
	s4B86OhT5YCaShvbFnlZ+qiQrTVvUewIily2DDSVSaTG0wF2LAgKh5Ks3rwmeEUFTL+VN2p7fYP
	5qOVxGoeZpAmOA+QvNCt7+VW6uRXTQ4dGBJh3Hqu+Y0oT+7h3JskYAmlduC0gctJd+ZEwce+q8w
	Fu0osc9P39mQ1VDs4t3RxRS6aQ2/7yqJoi/cYZe5AXE3q3h8rwXDKTJzUThDltXBJixlpeP6Mg2
	bfOP6M
X-Received: by 2002:adf:ed46:0:b0:436:317b:f3b7 with SMTP id ffacd0b85a97d-436317bf538mr6138856f8f.48.1770552903530;
        Sun, 08 Feb 2026 04:15:03 -0800 (PST)
Received: from PC-Arch ([159.26.107.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b25casm19833972f8f.4.2026.02.08.04.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 04:15:03 -0800 (PST)
From: Miguel Angel De la Vega Rodriguez <miguevrgo@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Miguel Angel De la Vega Rodriguez <miguevrgo@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
Date: Sun,  8 Feb 2026 13:15:00 +0100
Message-ID: <20260208121500.164404-1-miguevrgo@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl warns that msleep < 20ms can sleep for up to 20ms.

This patch replaces msleep(10) with usleep_range(10000, 11000) to
improve timer precision and allow the scheduler to coalesce interrupts.

Signed-off-by: Miguel Angel De la Vega Rodriguez <miguevrgo@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b2e7f479f72b..3f5b3ca2066d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -214,7 +214,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
-		msleep(10);
+		usleep_range(10000, 11000);
 
 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
-- 
2.53.0

