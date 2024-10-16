Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC30208D90
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729085925; cv=none; b=YBKglTMkU2iH5PpozG8CgSDtcUTb3OOdXPT/7GMPcxVCYilsanfpqeSSrRdb/PBd+rg4g42im3lEcFxLa2rPWr5J5gF2nNQkQRwaiSHeLF7mxhNZjfZTdL7fbYx02oZjmDqYdll/SeMMnOOvlHGOc17LGQuIuLz6wHyWasmLK84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729085925; c=relaxed/simple;
	bh=tbHDQU7+FcD9GSsduwAZKIWRTOJD0XwgT6/mjSHgoyQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m9nXrB27QtPVGL+39PGeupYMhZgW/QOhnJKmvBnGBf/pyjLypPudF3avYPmWqnfo13smAB35rIQyeJtIo1cginHkCvvgq7WsrtPTJxuAssbiqZ1ddiMLNUi6+PWPXcR0Z12oJwbmyHEEzbKm2euZHeH84Mt8CmnHkNN/vK57SsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJkCfsId; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJkCfsId"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4311420b63fso50824415e9.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 06:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729085922; x=1729690722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w5FdBAFPkUzSuk/D1h9vZiNvh4jFMsL2H6ZGgQ1wWj8=;
        b=JJkCfsIdhFXi0bwEleKl6yOSYr7hTl1sfQ6PcanxTn7DT+zxGLL1DyvT84fnYCLdAG
         iQDz5VfYR2QuXj217CFxeUCwBM45M3hjYVB1anHKJRxSeMySbP0ouJChXE7rGzaGpfox
         62fvS5YeVw9DztU3tt56p3Kg6c3llPx2tOYDMcArBMlqmOv4PSBFZkOTmsnMC0qB4htn
         aUsHl+L33X4Ak0Tp3mQkaVsACVwpPEGr/4ZpkVtrzN0dPsMq4cVng1Ps/pbBe6v1UJD5
         cNqJKgfzwsw4/anPTYllDMbRm7KNM5hI4ZFIuQRkffNuO1A6jJABxW6+VGo6wKz97qLN
         X45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729085922; x=1729690722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5FdBAFPkUzSuk/D1h9vZiNvh4jFMsL2H6ZGgQ1wWj8=;
        b=VzoxCj5HUmW5jJ5tVphJgjKCk2zLs56qDCK1f6QQ2b8N6ZKjLgODHpDwz+xrs7S4/j
         ZE4niOKqSkqN/DbJ8sQ9aSUc5JJMoWrhlewlisLRzxFidX0xPwQc/glaV+48g/pNzj2k
         5zNFZLTDa5BuLLAunwwykjf+W7XftiwqXRWAqyihDyG2xSOlBMP3fGTZp55WfPOWyV9R
         wVqRcgpZma0CkvYnpnFjbjpihVM6Yzbc+HBakhXfyRhNnrolPqk54kTSxYAcRQ6/xTEt
         Fk7zO+8oyeQRMeboF64puSTh76Jtbs+qOdiL3ZwBjy88cXWe6UfsX2tF1RoTGXu48/9g
         zSIw==
X-Gm-Message-State: AOJu0Yxzf5t1AdLBf5jsaxvcLIRUTvPkmP/iKuK19S9ipyc6C4Z7tz+2
	GJCKHhVYSBPGF3q8txT3CCaLJM5nzFRpaHpRXLJZ7036yNSQdGum
X-Google-Smtp-Source: AGHT+IF8OaYk/3F+YK8dAGSXilf72Y3bmvzWuT3U/oVNdbdqSUMcp5iMl7ktoZLPqZ2RzFKsDsqsYA==
X-Received: by 2002:a05:600c:3d89:b0:426:5ef5:bcb1 with SMTP id 5b1f17b1804b1-431255d55edmr125565015e9.6.1729085922220;
        Wed, 16 Oct 2024 06:38:42 -0700 (PDT)
Received: from ARL1114-LINUX.. ([196.233.5.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f6c5524sm49415035e9.44.2024.10.16.06.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 06:38:41 -0700 (PDT)
From: Aymen Khalfa <a.khalfa.1012@gmail.com>
To: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	Aymen Khalfa <a.khalfa.1012@gmail.com>
Subject: [PATCH v2 0/4] drivers: staging: rtl8723bs: Fix coding style
Date: Wed, 16 Oct 2024 15:38:26 +0200
Message-Id: <20241016133830.2485315-1-a.khalfa.1012@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix different coding style issues that generated warnings when running
checkpatch.pl.

changes in v2:
- Fix cover letter.

Aymen Khalfa (4):
  drivers: staging: rtl8723bs: Fix braces coding style issue.
  drivers: staging: rtl8723bs: Fix space coding style issue.
  drivers: staging: rtl8723bs: Fix missing blank line after declaration
    coding style issue.
  drivers: staging: rtl8723bs: Fix comment alignment coding style issue.

 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 27 ++++++++++----------
 1 file changed, 14 insertions(+), 13 deletions(-)

-- 
2.34.1

