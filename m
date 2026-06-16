Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DAD42314A
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 09:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603768; cv=none; b=ieB96fXDmxHWkv4nI+v5wW6tGM+5gK/uC68ctN3M1dDdGBMjPbX6VSJbCs40+KCXfHfeiHMS4iDKOGTb4Qv0GNE4qfsjVC8G9oXuEfere+9oA8KTVnoMkoSR4/5+9tQNf37XyFNonfBWGTtKa8FKq1sSQwLybYnuEJbPC6N7bOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603768; c=relaxed/simple;
	bh=UOj9UP0NvYgtZilSFNsWCMK4ZDA6u7oSOsHGVGZXCIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GB4JQTk3wCOTM7c18836/aGlT9h2XTsJnUzgvWz/6p9PhppoBin9j+8gpIKeITWx52Pif+SpGpBYHOUDZtn3b2R+2EiVbOfotRXuQ2wDynwi2POOd3/1Qsw9GNTU/wY6+pU7OXkppGnTM2BkDog7Lxj3vNGx8CZJN/gwbCHg0Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrkCgsr+; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrkCgsr+"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8422871b42dso2668131b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 02:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781603767; x=1782208567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hNCLiq2R1A64amHMahQM+GwV30l7MB1tNUS7iWCGm34=;
        b=KrkCgsr+L6gS5RuZl5rDQMgbDp8dPDxfIDk+QULjl8IkdbbW2XTBMXwrR5tUuUdZYf
         TN3+LVFx5hI7RIrbbFj+9rZfTxnN/x8xSbngE0nab9NsibYboePsvvMmsZWVqd7/BP5v
         z8cJUwvIjCeaMGooKlMogJTNkCUiAG3ITJSX16DRlRk8d2N5QLJ/swD9QWlgpbgVaRad
         zCakCB2LtesFErj568/8aEN++rk4rhNhEvEJ8IgagYlv+us6iBQYiGn+IMWPqf1rBgLd
         A3TGRXcKA+BlICV66i1zwb4P+AEDTYThW9szygovBnD2RsoH0RXbcaFAA3MDdjsR5sXw
         EL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781603767; x=1782208567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNCLiq2R1A64amHMahQM+GwV30l7MB1tNUS7iWCGm34=;
        b=dPEYIHU25luMB9xqHhz6vIdt9SQ4Vf9LbsvKg7bpji5N7+d/ioHF0vbaStq5t8njKz
         J4kT8aUuDywVNKqhO78Ff6BKs3kLAO3fUO75uDC377uHX7zN4XovJe8T3TPZgIbxWxZA
         G7LZ4lHE/EJ98SluL7tpND72yWlG298i88IrQhVQtAsHx5TkgTnqXp6but6xGqK5YGuR
         D+NvOnV6/xOwcQlenPi6J+33dtDRULF9QM5sDYsO8Nx4SM+UIVW/mJD8obsfjzSF+e5/
         MpfcGWymbJKPZDHwmRpzSWr72CCKqm5vMZS6KpIqu3VIEK1mZB2gc7kMOa/W/4HX4z+a
         /J1A==
X-Gm-Message-State: AOJu0YwngTqTwzn9DbqFplsIQWig6TdUVAOrrVMf1mXeyOcxVjaUhhlt
	MY+ASC7rk6u737lCWfVJwN3qMSDTJ+Fv87v9u75kCD3xEWcf0cabK07M78BOFo52gfs=
X-Gm-Gg: Acq92OFwIu66Z4g8low0Fdj1BkpgSWSe4LYBLo27YOyAfNA7TCoNuPX2r9XRf9mGXOj
	RTsswNJzn39XkJVKBsN7HkAxEAxOid7LRISZ92TQhrwW/Bvj+CRa4+i7yOfQiSwO4IYMdGNRuo1
	ifMyGjBjE2d96hmTcyGKI1Aulu2ZUxcwAwdpfPLUj2JyPiyu1cvuPq8R9iOQe4NBe20f3/ejjPe
	iufHciBEMHiN4izVEhWYBLGv7mpDPITMEDmJ6zDBR1av+hC/Ih5Hxjo5SjMHgrk0YG6AOjxPdbP
	i4D2H5/aEf30WYtwBh/SSXaYHefDxHBUX4vNY5QgKnIFZ6vfcw3Kd2+ftghV32BX6kIuNgFVIjB
	To8yRNlUiCJ9eLQQocfY/R5L+r0doPFQy1b/71qE22JUncAM5eGYOkcU2nCLcGpR5NsONFgvJ2D
	1Xn5xc0g7MCic5hstT5TqCZq0=
X-Received: by 2002:a05:6a00:a211:b0:82c:d7c9:5479 with SMTP id d2e1a72fcca58-8434ce92392mr19681296b3a.32.1781603767083;
        Tue, 16 Jun 2026 02:56:07 -0700 (PDT)
Received: from fedora ([103.51.149.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acca7ecsm12896034b3a.13.2026.06.16.02.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:56:06 -0700 (PDT)
From: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Subhrojyoti Bala <subhrojyoti0609@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Fix block comment style in rtw_mlme.h
Date: Tue, 16 Jun 2026 15:24:53 +0530
Message-ID: <20260616095453.36666-1-subhrojyoti0609@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Block comment was not using a trailing */ on a separate line.
Fix it to comply with kernel coding style.

No functional change.

Signed-off-by: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 403c097b46ef..dbb523c8a58b 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -183,8 +183,10 @@ struct mlme_priv {
 	u8 *wps_probe_req_ie;
 	u32 wps_probe_req_ie_len;
 
-	/* Number of associated Non-ERP stations (i.e., stations using 802.11b
-	 * in 802.11g BSS) */
+	/*
+	 * Number of associated Non-ERP stations (i.e., stations using 802.11b
+	 * in 802.11g BSS)
+	 */
 	int num_sta_non_erp;
 
 	/* Number of associated stations that do not support Short Slot Time */
-- 
2.54.0

