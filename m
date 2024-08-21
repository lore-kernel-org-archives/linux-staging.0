Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A896E1547E2
	for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 03:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724209745; cv=none; b=qixCCSl/Gp29tFmCJi94S4HMYTO94Hbo9cyFzJ0xoQC9WoWgh+CzTDK9YA2B4IYltFYU3I3FsV/AiKYsLRRNMWP3lxssmqPyWaFolI2wvq4ZkVfsPeCxdJ9JnEC+08W/ovhLjEJ3s0gZwjnKTi8VIcMir5indVFEcZHF8LVTLic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724209745; c=relaxed/simple;
	bh=1Av+PuZOoDYh2k4NZ6QZDE4Eke1SlZ91iumF9rXODRg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YMQFylwkXYPtn/5uc4fXyuDkSR2RL8jNxnAfnaJnGMelSJ2J5mtimIYOL23WQu1dakyohSmPBuVBWgETeUJvfV8dVJOxJQuaMMrYim0hkYDqrwwRHfue4pWnNUqnOpAeAoZdlmcbk9KlwuXJpNie/6USopFGKku4hT8OBHwol4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=mIA4Vrn/; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="mIA4Vrn/"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-714263cb074so109104b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 20 Aug 2024 20:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1724209743; x=1724814543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+piblWHiJyw3dOHLH5I47bMeAehXIK9gihiM+97PvQ=;
        b=mIA4Vrn/qRDlLRJXHA0kGLh2GKoy1AkCUox2z3RqsrpbM4lcUVe3gzoyhPMYqSJL0u
         66m3VHRg1Kd0suJJIc8Sk0yUVQzMvbxZVxFBEaXdGdhOixQdCmx33As+zZmWdx+DFaEZ
         G5IerVr2cMoDxNwBZPNA6SQm1u5yxL9eYoZfmrnExe9mBiEaA000l/Mv+35zHmXrTSwz
         RlM6o4V3RaPi0T0opfOTFZO9CgyCkTD36y5E0PHI2oiZk7baJjWeLRbnzlEZlezr20Au
         /4qP9g7kMou6m6Rtv5d+IL888bVcCNyFS6TRXjGPzJeiifAt3Vhn9fD7KE2RwDpHiB3U
         N/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724209743; x=1724814543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+piblWHiJyw3dOHLH5I47bMeAehXIK9gihiM+97PvQ=;
        b=lbCEvV1BD19Zp3Xwm35KcekoADmwZAQ7zysNsoeGqL1/scbmkkHN+lpIH4+MZVYjmd
         uA8IoRj6P4Esd0kwZhvgJeW8haHBZGsOcYq3klpg154rMxLp3VEvMnHRowWrJvV4vwgl
         xVSXeYEVbOatlX/gqxtrQ3JenxbdLPUfzSMgWT4Ep9XcoHXxK8nc3HrD/BokagZqKAnF
         22LDox6+2OpCcz/bHiL/OitVO9VZixmqy3LEqWgbI0O55hRQQXpkApCTEPByTCzrBYdW
         c2Nth13vbI6V/wNl5OLKlpsl3jEhXG4QMgLVHzLiJxb47RP3W0hK1LEJGAnTEdnK1d4b
         N/lA==
X-Gm-Message-State: AOJu0YyPpxxUdr6r4uw5fzkSseybDGj7drhlpdaxK267dhn/4Z1eMcUR
	85EE735mL9NK6/G0lHV6ZRHOzDGzX4GM/6/3a+IKYI+SsgoB5a6bFBlt/dxbncc=
X-Google-Smtp-Source: AGHT+IERATv4xTSL7nRdoVV4/H1PTZtwyK+OCOJ0PcafPc7TTidobAkmmCzgLuMsLDVSxSx7EP4pYQ==
X-Received: by 2002:a05:6a00:91ce:b0:714:1c0e:1336 with SMTP id d2e1a72fcca58-7142344325emr1300505b3a.4.1724209742849;
        Tue, 20 Aug 2024 20:09:02 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add75dbsm8934404b3a.44.2024.08.20.20.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 20:09:02 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 3/6] Staging: rtl8192e: Rename variable CmdID_BBRegWrite10
Date: Tue, 20 Aug 2024 20:08:53 -0700
Message-Id: <20240821030856.57423-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240821030856.57423-1-tdavies@darkphysics.net>
References: <20240821030856.57423-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable CmdID_BBRegWrite10 to cmd_id_bbreg_write10
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 19afb056520e..0eaca4be4f15 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -155,7 +155,7 @@ struct cb_desc {
 enum sw_chnl_cmd_id {
 	cmd_id_end,
 	cmd_id_set_tx_power_level,
-	CmdID_BBRegWrite10,
+	cmd_id_bbreg_write10,
 	CmdID_WritePortUlong,
 	CmdID_WritePortUshort,
 	CmdID_WritePortUchar,
-- 
2.30.2

