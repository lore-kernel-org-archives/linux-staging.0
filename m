Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96CD239E78
	for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 23:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747869817; cv=none; b=Gr3SKbDae1jMRIwjPnnWAWS21AJzTpWMUcMW7xUFfoJYF+sKkeTVY9ONVbvRk4xD3vAOT0UQg2zDlbLSDNjvErYPZCxXWU878XvIclm3scgX6kqvzRBu07cbaV4aaALzzusNSV+yJ6+h73VUA1Muv/FlNvzx4AsdObuGStZXgtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747869817; c=relaxed/simple;
	bh=wxsg4EgbCx1fj+v3Py/w/yDWFyRYJGFCBuhrEr96qI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tOAlcu67v3Gfw+sB9yilyhRz/1SQCNzQ3dIv9Njbr46C4w7sB2hWPUA5o05+ONHdLYFbasbfnQ1BVYAJl80Dh6u/BDvbVW96/P0Zq6ehHaqh2LCfB1HHxwXbn3phPlas6BLhu7MBMU4tUqfOThBKwJYP22n0RQInVelBw4LNt9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+4lo7mx; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+4lo7mx"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70c7b8794faso74638907b3.1
        for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 16:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747869815; x=1748474615; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wi8GyyRpSYLm6pCKM13JgN3h71bL9ajNP8NCgZ9JC9Q=;
        b=T+4lo7mxEhmP+EyjKpPryFqR1gyDqtPaUsqlz1+i+Df2/7JmoIdsrgIuvD6SU5Z9FJ
         Hx+HCjauL8i1OdSLG+oFa/sOCoyOWkEhY/ihhe6/ek0LiTZxu4tmDCJ48voXcA8ctKiM
         gZUv/vRDZPKtM/yVTXoF/G0ecTqHgBiqt1IzXD+kaN2aUaeuG1Ev0n2L5SGUu2GSQyfE
         HRhufefqcsbcsoWQITG4GejKQFCCO52QkvKl4v04Ysmg+IroTsasXEoMA2L77cG4DQ4e
         7IwMD9VgyaTPjO28uQ9ySUHYim2+++Wa/M1bxwlXKD4ypHS2sHx2wv5uwK1O0u9zY5aT
         /hVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747869815; x=1748474615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wi8GyyRpSYLm6pCKM13JgN3h71bL9ajNP8NCgZ9JC9Q=;
        b=uwI4U5d7FjxqCYZ7y0l/9u2rOMRYflUbGoGlPj8uoBYyYmmTGKJ+YQ55ezWXU4oBQd
         G15aRu5bl4Oxo13G2/0G8k2FYjZ+fiywkDpMyOnCsdsnSd4ShZhfB+xw/pvsgXzsOyQj
         DkK7stqs2pgWv8NFxzSwnfP1k0DpfKgRwiWkY/sZWc6uJoNdAKLWelLdMlQd/b5EkmSZ
         scn5nCRQu9pAG0pB1myuGm6S553WXqrb9iWCzeplSsMka76bX3LqewDxWeQrBJjg5tx+
         C3AfrlDnu/RE24yLhPLH/X5PKCCSBlIT/zSkHoqX1OqW1uRw64fccX83h+ZhdvZ7Nwmc
         OB7A==
X-Gm-Message-State: AOJu0Yz0CqSVYgXE9KoHoQF4EWAHEPnOSmicUGLCjYq6FEYJHlpNiZ5R
	fzD82EbkNqaM7aM0/eZDpRpKwqvXzXMT1edbYslpQsPNW+YbY+n7Uv0q
X-Gm-Gg: ASbGnctA4gurMx3He3os65D33mUMlw9cC3P0atuV+63QQ0tQuxIraDR1QAXMMNAqYLm
	/Q6QubDPbeJsXh+sdnqoIyJGT+HZO4N5AGiqN1+rNNC5U+KpM3yhKJGNjAljniyRAEd8720w4LX
	SXAlsTjQRBT4KwqWKZ0PuZlAtyoUD76bAU4HxWNrjdiH8QnuoyMNC5bOTJRIgmT/BU0X8FUHWK/
	Dibht0pRQOZ/+NS6v4Vp2nSIoTGBgvCQTlYLjC04Dvhv1C1xatc8AzlDc0tepIdZmGVE/eDjAIR
	WX/LZkXkjwUYryirpVXceEyf7/hKvlPYW/cTHzpcf/hY/FO+p359F5SS4bhd9RNynNsldSsDru4
	QIaw=
X-Google-Smtp-Source: AGHT+IHwwHYfGGH2qEaXo2SgMm5hAhmNhNv5yGqf8z077S5mu/ogAZovjmGgdBpzwSVjhrdvyKxyKw==
X-Received: by 2002:a05:690c:4a06:b0:70e:61b:afe0 with SMTP id 00721157ae682-70e061bd1e4mr10870357b3.6.1747869814728;
        Wed, 21 May 2025 16:23:34 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.39.247])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70ca8509360sm28424517b3.71.2025.05.21.16.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 16:23:34 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny Turizo <donnyturizo13@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Fix typo in variable name 'ips_deffer_ms'
Date: Wed, 21 May 2025 23:23:26 +0000
Message-ID: <20250521232326.20438-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a typo in the variable name 'ips_deffer_ms', which was
misspelled as 'deffer' instead of 'defer'. This patch renames
it to 'ips_defer_ms' to correct the spelling and improve code clarity.

Changes in v2:
- Rebased on gregkh/staging-testing
- Fixed build error reported by kernel test robot

Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 44f7c19308a5..27ba364ea33e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -1006,18 +1006,18 @@ inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
 /*
 * rtw_pwr_wakeup - Wake the NIC up from: 1)IPS. 2)USB autosuspend
 * @adapter: pointer to struct adapter structure
-* @ips_deffer_ms: the ms will prevent from falling into IPS after wakeup
+* @ips_defer_ms: the ms will prevent from falling into IPS after wakeup
 * Return _SUCCESS or _FAIL
 */
 
-int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *caller)
+int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_defer_ms, const char *caller)
 {
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 	struct pwrctrl_priv *pwrpriv = dvobj_to_pwrctl(dvobj);
 	struct mlme_priv *pmlmepriv;
 	int ret = _SUCCESS;
 	unsigned long start = jiffies;
-	unsigned long deny_time = jiffies + msecs_to_jiffies(ips_deffer_ms);
+	unsigned long deny_time = jiffies + msecs_to_jiffies(ips_defer_ms);
 
 	/* for LPS */
 	LeaveAllPowerSaveMode(padapter);

base-commit: a481f0ebf213e0ccb85f70c07bfcd733d2dc6783
-- 
2.43.0

