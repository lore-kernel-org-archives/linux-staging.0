Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC39242885F
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 11:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607685; cv=none; b=PFBhl5twa3gw8emo2Oe0bjVh4/iPcdsX8cMkMaGj8VnWxyKp/fFIQlSV9B/NQnZZJp00hZ0lXYRMtMe4uu+H/VsxEG5k9LhNScbgYjGztmXvttbRfyqnURX1sww11Wn3eu3aex4zgm32r1nRTzdVD4aLfd99v4q5hi6MfrzQ7dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607685; c=relaxed/simple;
	bh=UOj9UP0NvYgtZilSFNsWCMK4ZDA6u7oSOsHGVGZXCIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R3UpDIsqRHc/P/pVmsSo3r/NGETJNSktlVNDhDeeEsC/8MsHbCJ+zmoGcJ7Z5zw5/VKVPrygDA4H03TL5RdQCepnNkHQdJ++JxVV01PRYKhOWQPk2rEkgzpPuz1cdyIZrWyYj9XL/Ebc0GQVT6vgTQGai2ldwy+yb3E7l2mi15g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edV2VYSg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edV2VYSg"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso33937925ad.1
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 04:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781607683; x=1782212483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNCLiq2R1A64amHMahQM+GwV30l7MB1tNUS7iWCGm34=;
        b=edV2VYSgnElCO75IRJ71AZzT/IxFoiKBRCcZOxydMOGGLyVR7AlN7micM154OfX2Qr
         dSatX4HzB8zk82XPvAHa35zjwcZgdpbe/czKC9eD295CO14bvKRY7qqU7MgfnnIgMOpX
         RG4pz3Q7L7Ae1GXlLFxNKAcTkGq6+nWvxKGlNsVjyNcLHdIAaTqXYrRS6FY/G1CaNWQo
         jW5MUagT6rYkNCT7WcyaHuuPIAyot+xICmgIOA7dg/fCQcRj713yyNV49Gv+1LwJuWBF
         K2F2ojcadLLHxf9ZNF/tQnk2iY3lgxeld07zu/vkNgCFE4oNNMnrLl/dvIe57fFONtAA
         AZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607683; x=1782212483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hNCLiq2R1A64amHMahQM+GwV30l7MB1tNUS7iWCGm34=;
        b=qB0qvNsP1OZaR3Exs6aa8Vct0JSHKhT6GAZVvTe0j5YvscHZgGcRR4UQFHyFNakQV9
         oItdqhddlg31JHZlVTvSnFrYyCh+VUFVYk41r3PiK/jYNS4h54GcZD21+SHQOuBKn4nD
         xoSgf7yE8CdZ43XsLJHr7hypg54e+v3+eUb985jhurCc8wxdkILmpgYTmwmzem4YohRO
         oJxMZr/1k5/LL1JSlMiYFFuQ2YaD6jeVs2IWRjMMa1hQyGSH/dPGw5CDbON7l3EF/Hrt
         pZY2HZCUkOLZy80WcJvFuwaPSfhKYhilAsDOCbmnxVLZ6WfHa8IdRtAan9R/7rCowRRO
         5xEg==
X-Gm-Message-State: AOJu0Yyin2bV8RjK8LsZUYthyKnq4y5zw7lMdwsqgiL5dsrGfBOm2I0S
	xyvnocfDL7HL52464/R8ZlhcncLTWy4x9YL0zVyOY7OtE/OReUANdQ1r
X-Gm-Gg: Acq92OEBxNwupdr9AJPNaSL4PpbP4+9FNZJmyhqzn/i+UZJXyfS5HioFNZmjYl/vGZP
	FC21OiE7k6uVcKV8qqQ32aeDVphTahEPk2fAttXPQx6CHiOvguISJmgLyl4evZsDdhJZoWiiIcY
	Lw8p/wKc99sYxspz8e7cJ6hENc7d+kWGdHwYRpO9+ljy+PLDSscDTwftRG+iVgYnCSz8NmRJZ8V
	dqWx9tI19a9Hu/0Ii3HoTOe7LUg9lI6kF+I9Q3IW0Y9OrQsgtGqlEK7FqqowFZi9ImYi1jj5vX9
	LtafROfUYRrbaYr12PlzGXm61j0hMRqBq/4Ilwx2BhX4c/FVAPeV46LirHH8DcHy4Id743/3gUX
	ia4fEyvLiqz7mmjm/LOfbPTEQROeyceLxoR9zxRdzD9JGdJ99d4WVatjKfYR4H4Nj4asrDnhFTM
	EMcpw44Ocbk76XApcOfLK8y0M=
X-Received: by 2002:a17:903:4405:b0:2c0:baaa:db94 with SMTP id d9443c01a7336-2c664272077mr158825595ad.22.1781607683103;
        Tue, 16 Jun 2026 04:01:23 -0700 (PDT)
Received: from fedora ([103.51.149.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e52a9sm132561995ad.11.2026.06.16.04.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:01:22 -0700 (PDT)
From: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Subhrojyoti Bala <subhrojyoti0609@gmail.com>
Subject: [PATCH 3/5] staging: rtl8723bs: Fix block comment style in rtw_mlme.h
Date: Tue, 16 Jun 2026 16:30:46 +0530
Message-ID: <20260616110048.45541-4-subhrojyoti0609@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616110048.45541-1-subhrojyoti0609@gmail.com>
References: <20260616110048.45541-1-subhrojyoti0609@gmail.com>
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

