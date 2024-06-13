Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D386C149C54
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 15:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718291864; cv=none; b=gS3tKZdV3izPV1i3k3WsaFRJa2RJ3TCxuFM/4xBwY+c1P/hUIc4fR4EAeoSBszUnZTNZ3PGEfHgG1Cmfb7Z6kR94H9Y07VYxhoY/MVqjOThWU8v581FaC5kLXwMnnbeQj+566oDYvXO6G9k8Zx+gzcpM+ScO3CwRQ0UIw3DO19I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718291864; c=relaxed/simple;
	bh=viq19hhLwhgCawmtWkzUKxe8/CYDTKmX+TRGv9BSlT4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WynELYU/+2w7NcUONcWHeCB0oyoAyd2flzqGm9klTpnv+vdx9+Ok12uNN5HzwEEJm+six39LpQ3jvD0uddim3Wsha62VQ8YSZprB13klV+aF9I7E70ObvCElJOa2kTv9AhPGpPfwivvTqgljLs5EU3+LMGySwwIp8qTM939VcYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fU1t6mb3; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fU1t6mb3"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-356c4e926a3so1228053f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 08:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718291861; x=1718896661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4BpMyOlWJiT/+4vsN8G1skGb7QkBQSrOKk0zqDdotM=;
        b=fU1t6mb33k6eKAHGCqYye/qwUQJDajobJGq8BdTgph0o09u/oBD0yr64BwVy1UnyJV
         mPIMIJSN0VqRaSD7ALYNB+n68fc/dtcZ4VIErenk0Xi6y/T6v9oBxOHgrGExJJR/FoYA
         e9UabVasF1eT9Y+36w4uxDZTgm4e1U2Rq4lMvtbzBhiPojUFqZG9sAcUEo3CU9qJzBvP
         KQ3Yam6YRMN7KmnZsrlOMP+pGAoclpuH6MUmFIKDbbBE81LZNPHrEwaN4kM+gV6K9eka
         Zk66GiiEVrB6VMi2CAUn0qRzUQk02/SyeJKjKaCnbYVL6VeneREushpNtewNmyNy9R9t
         dDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718291861; x=1718896661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4BpMyOlWJiT/+4vsN8G1skGb7QkBQSrOKk0zqDdotM=;
        b=bypBUtZSw9oV4Prj+pYd/MXxXk0/XQnT6z/nCDi0dKDJdouZP/aghwGi0U1ro9flNi
         Or3nMOCMtYLGWYDYOrIWXMqvjWR51Xgz5tb6/P3GW2IPT6U2pTR+BUs/swlX1drDf+cO
         zEBVCjGSqafCf+NE4xZtlyC6aGxuwvCxHatc7I2WIV84vdn/N3j4hfqJyTpAIhcxmYBa
         KzzLUmz62WY7jcLEnHispyCTzJxLn0R58kSPfrWd4XXIky7bN53vZZeUleGlc/eTsWDc
         ldPpbQMjWCmtgJEu1hZ97V+5oq+xNRY4DHviAHV7vl0uLNt8rqALES1OdW8P17+F9g9c
         A+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUpzqYJ1DBDNlHQ0sPxdManvaxkA+CT71wBQJbKbt4I9BRZ/5EHEmXMATm0+vbeMsPUE4rpoIe7nW6Gol4YjZpk8TX0/ZIgX3TCTPxMdA==
X-Gm-Message-State: AOJu0YzqtWwc7SoRyMoXILePZ6PoMks1dmwu0bizEZJ3WZKUegYmdUWy
	BUHXjKOeaIkTz5LeEvEUHM8ibiXIrkFAxQkiF18HXfWP3C0XRtDdAcyedexRNs4=
X-Google-Smtp-Source: AGHT+IFLD8m5DZRs9ZRUmqijP357ewAEo2QVMJ9bXhryLn6W/cUEN8GnugdHVnhVG80uioWxZ9bTkQ==
X-Received: by 2002:a05:6000:1563:b0:360:7773:4f76 with SMTP id ffacd0b85a97d-3607773506fmr1543326f8f.12.1718291860992;
        Thu, 13 Jun 2024 08:17:40 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm1856978f8f.76.2024.06.13.08.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 08:17:40 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>
Subject: [PATCH 2/6] staging: rtl8192e: Remove unused struct phy_ofdm_rx_status_rxsc
Date: Thu, 13 Jun 2024 16:16:33 +0100
Message-Id: <0e75df4157806f9acdeaa327dcb7d2d88ad219e2.1718291024.git.engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1718291024.git.engel.teddy@gmail.com>
References: <cover.1718291024.git.engel.teddy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused struct declaration.

Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8190P_def.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
index 486397d7db84..d87bace0a19b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
@@ -136,13 +136,6 @@ struct tx_fwinfo_8190pci {
 	u32			PacketID:13;
 };
 
-struct phy_ofdm_rx_status_rxsc_sgien_exintfflag {
-	u8			reserved:4;
-	u8			rxsc:2;
-	u8			sgi_en:1;
-	u8			ex_intf_flag:1;
-};
-
 struct phy_sts_ofdm_819xpci {
 	u8	trsw_gain_X[4];
 	u8	pwdb_all;
-- 
2.39.2

