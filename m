Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729881A38F9
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 01:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772672965; cv=none; b=cd+2lsf0s4Gg790yJ3YQXdNzwNvXdBkWkPepx7mTyeOGZ5k6hstoU70V/evHxqrMfq3S7ls8HG+AjQT8vBbVM28Dj0Jr/KJjg/KK3boKzgttKl/Ze+0GydRKk+NDXIfkkzFcDY4zIJZwSkUiDbONA4ZOQ3aHM/KDIWWs21ZXJic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772672965; c=relaxed/simple;
	bh=3ETnikXcQTmozxrXHur67wKUD9qeuBF8Mvx10IsGHGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LRR1UlWdvoKSwPVPDpFBr5NxUNkrl7jxTn2bl2RyOaE5hoqjGSdwNbKGIjG96YY7tua0LhJDlwPtDAo7y2DOPsSbf/ipvR5TmugTNTUMRwxeEf2MkqK5/faFDmXppq0MVkhwN7zEi4PMs1JbQr/AcNuL2kQTUg235txxepmpPZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfG8Taj6; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfG8Taj6"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-660fc3f30c1so1822220a12.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 17:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772672962; x=1773277762; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9HSWWMcRgtF4w1vOkxEXeSEfFCiIuPycJYbP3lPesY=;
        b=nfG8Taj6s4X9akRmYKLUc02JKHKPpTijC0FmWNW4OlDgCFGwmB4JDWqPzpGEi1rh5K
         wZna2jPJS4yCYongKXBeSnMhvazN07I0V3BuPadtbUDQtvDUYeoglJCIttDcOec00DzD
         qg/5x8ksaF2hgh33rNKdfEEbEd3GuwxOyf7Qc9N4Mnm7Co0Iwbdx/qwKvFgC06v2LRwx
         4Ba2vgTwHbXfjtBXVK+obK0MOQhXw1xLbuY/Du6DgZ3fLxxh/dS3IE4lBbVaSRbILD4O
         TFMwG+T3AVVFqlYfPWaG8+YYmdcFV/NDpzKJDYPsMeh7AkpUmy6oBZSjPR61RVntsiF/
         gqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772672962; x=1773277762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H9HSWWMcRgtF4w1vOkxEXeSEfFCiIuPycJYbP3lPesY=;
        b=sXIK66HE0fftMM/r80pFuF0oW0S0Es0oNQEzh/PSMsGCgP80o6wg4yOUlIcToPI2xF
         xGUkHOVYQErSMybgubvZzW53xk5Z1DmCaj+NfGj9D28YRf06o+LOLTSAtxMuPZktuX9V
         wZpTku8CtlWy/wzVTzrqXo5rOnhGCE9whHZuYRWZXik+XkgeZeXnnu0WNeyp8KyN4GWE
         j03lLdTK/Cc4LjpVr4iYzN4vXcepqPBdisFYEEPWUWNL4q4Z/wWHCPpKIvRzY1oHcuJw
         kcZ81vrzsgXq2/QD0EnF043rSWjrku3wQ1cOcFo2g0MJcPdgX52jexrfnypK4+G6Nk5m
         L9Qw==
X-Gm-Message-State: AOJu0YwPSQT5ZjU0YR7RZ0EzABY4I5G70wmp7WRzCj/Ihv4bePUSN839
	6humYdPreeEeK+WygUJphf3QWiPXdqzvFt8EjwT1WMKBW7HcwwVvObQE
X-Gm-Gg: ATEYQzyKbiuXIPOebPkOa1u5ygd3DyUiiaYqJ7smPgoq3ZjhcunliUEjuiAVUVBXgFg
	kDIyCUiy1GmzU+gLt9FXCVIBxMiq5JXHrZNd9HsjE6RKmG4A76qNrEAMRwKa/FP3LmGqbrfK8LJ
	jMJ4Vf5NfWfRErvIY6zdbAc7HVCyRlUvbR//jKuGED/V010MWVDanDqFMbOhBUOyRM6rj53s0dt
	1pgrkkdgad0nK9qsFQAoybP2mRAnMkVtGhzPIDqHaJdKhciHUkhqTwjjN6mo7CJMD0DXr3Uf1N0
	baxMLkLE7RIjCgtIflBoww32/D5ED4hgkdkwN7Qz+Nl+8rvlnn38w58cJjno5RjT0JlrpEXh8BE
	Nz4UmUDJsZqDaXd8+8F/E3dZEHQlJTt/63Eo1G+GI7o8pJqvZMI81kqJTa36F/d3WfC66FRFVkq
	mj1CWGKdamf6WQmdWyTsSq4ADMwgp3JC3mmKM0V5b8AKlmzmWxyeG5hpuV4YskEU0qzOKuInZqG
	w2MNxKG0f6t87BiCpMTe2o9wYusYmwL9heyF2LjM6xIZskOmKxrRsiVcXaLbPm/RDKIqhNsN8s9
	gU/slpdVU3wBGPRK
X-Received: by 2002:a17:906:f59f:b0:b93:c5a9:a5f4 with SMTP id a640c23a62f3a-b93f1171a50mr213832766b.9.1772672961454;
        Wed, 04 Mar 2026 17:09:21 -0800 (PST)
Received: from DESKTOP-JNMGKT5.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b94037fca0dsm43064066b.50.2026.03.04.17.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 17:09:19 -0800 (PST)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v5] staging: rtl8723bs: replace alloc+memcpy with kmemdup
Date: Thu,  5 Mar 2026 02:09:17 +0100
Message-ID: <20260305010917.40320-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304130706.37347-1-hossu.alexandru@gmail.com>
References: <20260304130706.37347-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace open-coded alloc+memcpy patterns with kmemdup().

This simplifies the code and avoids manual size/copy handling.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
v5:
  - Move version history below the --- line (per submitting-patches).

v4:
  - Drop unrelated DT binding changes from earlier attempts.
  - Include both rtl8723bs changes in one staging-only patch.
  - Wrap long line reported by checkpatch.

 drivers/staging/rtl8723bs/hal/sdio_ops.c          | 3 +--
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index c9cb20c61..6e03d3d8a 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -583,11 +583,10 @@ s32 sdio_local_write(
 	)
 		return sd_cmd52_write(intfhdl, addr, cnt, buf);
 
-	tmpbuf = kmalloc(cnt, GFP_ATOMIC);
+	tmpbuf = kmemdup(buf, cnt, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -ENOMEM;
 
-	memcpy(tmpbuf, buf, cnt);
 
 	err = sd_write(intfhdl, addr, cnt, tmpbuf);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 7cb0c6f22..0ae7b6389 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1430,13 +1430,12 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 		goto exit;
 	}
 
-	buf = kzalloc(ielen, GFP_KERNEL);
+	buf = kmemdup(pie, ielen, GFP_KERNEL);
 	if (!buf) {
 		ret =  -ENOMEM;
 		goto exit;
 	}
 
-	memcpy(buf, pie, ielen);
 
 	if (ielen < RSN_HEADER_LEN) {
 		ret  = -1;
-- 
2.43.0

