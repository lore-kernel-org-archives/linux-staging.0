Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657C82550B0
	for <linux-staging@lists.linux.dev>; Thu, 22 May 2025 21:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747949008; cv=none; b=nycYvdIHxmeWXjhh5cDqLUywdRcaAGKNBxyMsYBv15dMuQ9VsX6Xjl+guahvTH85yovTFmepSs7041hgpJy/Ifk3TAhGzzsG7qwyUQPOSQqx+pbSHZQ7epwP5ZxKhCPEqZjQOM1mE5w+Flv62gZpPGYO8Rpspf+JHsT2WqKXqQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747949008; c=relaxed/simple;
	bh=u/YfAggJEERo7Uz9zXkV9Ag3LuPVgrTKSytxUhbUbqE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sLin1E0/khYqUcP6wuUtJXFXdyXETMYEFqS/cjm0n1NPi8e5NzgGCn3qBfQM1cmMP9rNAVooLZjh/PEmGfqzqBrgBuFem+YTA9EOH2oyWBt/buAQgtLw4EaLkBMTb+8HauPxPzhIb7bKde8ERiCBp7ooxVT6GF0Q+W75IQU+At4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwJmvTR2; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwJmvTR2"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e733cd55f9eso8259422276.1
        for <linux-staging@lists.linux.dev>; Thu, 22 May 2025 14:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747949006; x=1748553806; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x0YM76fGKsBFeNgwF8PM/nEDQa4nOuCQrna9WKHV3v8=;
        b=OwJmvTR2nLqz/IJFA9LE851MlQLgDZmMeeq2Mt1Yv4ODPLHqJqymbt0ks2myjimJoC
         lU5gMB0/+301Obi8ToBbTJq1dGmiAdt+CvoNMf/MbZFgfS156EWsk2SoRBfcUl4wrGAC
         Kak8Exvcty18lWcoyAUTpopIuY9qP38S3QW5K1mj6xdpcbcgPxzFpwGMWPPKYxLCa76L
         bbNe2Gpnu8MgTM1JabhfhleLy7Q9l7bmAf3HHWQed5jYS1CEWxBy8fsv5uNwyvlbaqCM
         +48DZSpr5y5wQPHuvjNhW4zUyx1LmWewrlCvq7ulQYkvp9mMqP2WLodEN+6Q+JMQ92bu
         2ZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747949006; x=1748553806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0YM76fGKsBFeNgwF8PM/nEDQa4nOuCQrna9WKHV3v8=;
        b=I0wUio32Gw0YrCjO70M8gxxXShkddm1TkzNxRk+/RlD76cdJYC8VRoClyOMdGTGBG8
         qUlhC62utpM9uPLUD0jhPqbWQMTWzwyPty85kT2P5ypl7MjYymw1vgSea5JOcK7/GYLz
         g0SL5D9oZEGQpV7luHa8QH5h4lYT+3B2CjvGbbRJl0ABBAnQW6QZScgqfsicaIKI6EDx
         hwSlYplVe3uIHOawEmAPoLND13TKop7W5pyu5wUzBJwGOFpZQhGzn1EFnWzILFibNMs3
         O9pvBRjxu7wT6liXr3ejO4/ChmQSCJvGZRs97AGRD0AT+IlQaldgZvQgXGseUnGVu4Qx
         KzfQ==
X-Gm-Message-State: AOJu0YyPaMBZDjShQWRyWKWOr1VlXqTw4Scx2nX8FZen0L5Cb0+Kd2kd
	BLg1/pBeBQjx8LKkoYOXadVi6JlqR7sPKiFuiS7+tMoO0CB7t+DE1uvh
X-Gm-Gg: ASbGncujzLHjoDLGwAY32MZ1nfa8/2bEDkGBUgJdC0IxDusedihc15bBKdWxX462hzh
	mWxVyG9/UjIY0OwgMFeJnfWyqBBmRKNso1zqnYpX95V3tk7ZMuePgA7BIkaDM3BHU/hSVYHWY4b
	uOFu/28vAhqigKK0yeZwORJhZcjQ+3GIYb/Dl5ne1tXi4k5VyPYNReYqmL9Pd9seF1nqY78mNVG
	Gh4K/S6RgT+znf7iqKR3OsxCAMIbe5j00tOgntlBvHrtAfbcRtsHLMfUKjNs8uCjJeaMbwTgTEr
	jxcnxhE8H67ICYnIRukknRcn5ddrxF9D4/W+zfqeapzLh5OPCL2gJqkhgyuBSgR/QcwG39gFFkS
	dmg==
X-Google-Smtp-Source: AGHT+IG9rLGd60v51kDh0OFQiYQ2qXyMvEQs9AW6Xr6gHTbZtgq1cf3Vi07+fgkoKC8kJ7q2Uq8xfQ==
X-Received: by 2002:a05:6902:20c7:b0:e7d:7a89:f3db with SMTP id 3f1490d57ef6-e7d7a8a061amr2902806276.49.1747949006280;
        Thu, 22 May 2025 14:23:26 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.37.22])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7b6ac6a63dsm4754203276.11.2025.05.22.14.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 14:23:25 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny Turizo <donnyturizo13@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: Fix typo in variable name 'ips_deffer_ms'
Date: Thu, 22 May 2025 21:16:26 +0000
Message-ID: <20250522211626.4931-1-donnyturizo13@gmail.com>
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

Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>

---
Changes in v2:
Rebased on gregkh/staging-testing
Fixed build error reported by kernel test robot

Changes in v3:
The previous version of this patch incorrectly included changelog
 notes (such as "Changes in v2") before the --- line in the commit
 message. According to kernel patch submission rules, everything
 after the --- line is ignored by git when applying the patch and
 is meant only for reviewers (e.g., notes or changelogs). In this
 updated version, the changelog has been properly placed below the
 --- line to follow the correct kernel patch submission practices.


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
-- 
2.43.0

