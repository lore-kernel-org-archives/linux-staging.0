Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D5B3B19D8
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 08:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513003; cv=none; b=EY89E1zdr7zZmtTpLZ9Gzki0ydOYCe+MNpTbXcRn3iDvNi/KKDzqVkyws+IN4pZtpl2xy5m9X24o5NjBhZ19THI9MPwqzWRsJPjrjnRC6QiaTOqJBdjRjG3i/F4m3wcTxRDzDHYpH42blgSCsNa5NTMK/wrfwm2VE2qf+WoGhSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513003; c=relaxed/simple;
	bh=Bd/5OfzV7Sarf3QWBs7/bSDFPUaIF5mzDS/I9XfZQvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=elcnkcO2omIpmJ/8m8K2WCR8VJvJSOQrHQjXeuVmk2f+2BpkawZueBBpBohy6LHB2gW9QkZ+1Yb+ujXnQoEbJ/Yb6sUhzdwku95Ci/krIJzK3EtyCdj1ZcvIxVZXW2BF0jy8ws1hHQzYhSEnBDdet6NQzoTkRaMkhAgkBDYEHi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBEFs1zn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBEFs1zn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fe655187so7601545e9.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 01:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774513000; x=1775117800; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXqWD/J7jCnsXdMGUm54CWym6mF6LX/bj6037DcUiaU=;
        b=rBEFs1zn4eQVhjfSiLSJCnQmWBBD6GLECVQIgUIrPLw85IKF2U2s+Nkz5OHdOgCD2q
         8/HqzOUxrteBUAFSpuPWb5VpuoEspz7oPgqbAbGpk9mzHo9k93v4bjX+P3n0/qdFcmvl
         IEaVRcQNTXhlVNJwrL/Gc2muE4NiSmWUBb68e4RQ9qppMwcDrwY8WrWNg7IeKRmOTuCx
         6ESN9kGlCVwcEFjc14eqn4d3Mb9vh4KelrsiEH2aZaMCoQYai4mUlNH2+idMKZ7mlaXE
         dtfYDB3ON1LcAX9TzgmHAsa9Ao/SfwpEKBBCx8u7ELKm51IHY1xsvElFMCZ0irdFG5uJ
         LL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774513000; x=1775117800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eXqWD/J7jCnsXdMGUm54CWym6mF6LX/bj6037DcUiaU=;
        b=absPUQfrzq8kzlMwgcGkq6OUYyAKk8FpA7cfciG1ih/SoNeHT3/fuUqeRnKWn8YehT
         VjjgXVqdpyC0AzRSlSAV41Cadb0v4v1l+gOCYCwWSpLEYkchkdD85ykziXXFVMAY4zQX
         Y9AHb2BLyQsPpr5JEDIfHAemuEMZYJ7bmma3JXwKMj6nXhJQD4s6Izi7I9k3mJfnpNgb
         ehiN6P+pBqJ4pxPFhNSlCC4p0h0mFdbP3dbg2aTVISAw43gzu21qsRbYBzwVPnWWut73
         iS0R6IGOmEwXk7cgE3nz5kg8LY+3SPdbTf6PJoLSR7SQYPaFQ5go5b3YiPgXkmN9zWgY
         2kNg==
X-Gm-Message-State: AOJu0YyO5QwcIqcpiw5UR2VBfWOUXDCP/kzjzxZtfhBA00hq1ieUALCt
	yEGHB+qbv1zd+FWRZhVZDHe+Czm1Hv4vjfh3CeICIEkVtNO5IPIoVZdm
X-Gm-Gg: ATEYQzwafGDiiARVmjeCcLoQSwrmBD4w3/t44czL6oR57LiWhptI69t+bd102csPbuK
	4IP6XxKEJ0RFC9VWsBX7gyn7uHhxOVbGcUztWxvYQ+I0BDrZpwzjV3mRbToTHvjdK9+Lm3Rf5y9
	WmuGOyF+ZKMCJUZXG6/aW+klvKAOhsChZZ8a989+fOk57ATTKOrKMmzGJerCK0qVgQotQk9Cavd
	w/jgpfS/3LDHgKcJWXGxg/SET+RBCq1COwmqkv4ap6sHy5yseVNz07+pmey84RlnqqqgrvA9vn8
	eU9qUxXEzPuh6WIKl/lobZAq13+Vt7Tw0c1cDYNNXOh9JXH2y3qZ46qLJ0x3Jty8Y3czCGEo7Sy
	D8I2/49++rwbLp3Za+swPpV72FPRXXEjyd7fEl4EnJIWVhYM814yojuWlF05dP1t7INixpNnVIJ
	3CryjhewE8fisJUwDYr7lV3ug=
X-Received: by 2002:a05:600c:8489:b0:485:ae14:8173 with SMTP id 5b1f17b1804b1-48715fc3532mr96601995e9.1.1774513000080;
        Thu, 26 Mar 2026 01:16:40 -0700 (PDT)
Received: from potato ([31.176.167.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm32886045e9.2.2026.03.26.01.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:16:39 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v3 3/4] staging: rtl8723bs: clean up callees for sdio_init function
Date: Thu, 26 Mar 2026 09:16:25 +0100
Message-ID: <20260326081627.5841-4-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326081627.5841-1-omer.e.idrissi@gmail.com>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
 <20260326081627.5841-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let rtw_resume_process_normal return errno returned by sdio_init
instead of -1. sdio_dvobj_init returns NULL on error so leave that
as is.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 7ba689f2dfc8..e943dcea1a21 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1135,10 +1135,10 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 	pwrpriv = adapter_to_pwrctl(padapter);
 	pmlmepriv = &padapter->mlmepriv;
 	/*  interface init */
-	/* if (sdio_init(adapter_to_dvobj(padapter)) != _SUCCESS) */
-	if ((padapter->intf_init) && (padapter->intf_init(adapter_to_dvobj(padapter)) != _SUCCESS)) {
-		ret = -1;
-		goto exit;
+	if (padapter->intf_init) {
+		ret = padapter->intf_init(adapter_to_dvobj(padapter));
+		if (ret)
+			goto exit;
 	}
 	rtw_hal_disable_interrupt(padapter);
 	/* if (sdio_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS) */
-- 
2.51.0

