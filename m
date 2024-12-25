Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2042217591
	for <linux-staging@lists.linux.dev>; Wed, 25 Dec 2024 15:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735141846; cv=none; b=FTq6sdLUVglRNNksDU+Nlf5sbspO2g24XCcKX79yz1nAfeNiTWBa/l7bdpOBqbYc0DkiDKEf3mtOPTnJpo9C1AGbTNjCY1/8xxSB/NlTA6kmejVWcgexwwNLfxO794xTdnj3t6HWEAzv4a5wzG59OOB7zZ7dJh0l+XL7+reM/ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735141846; c=relaxed/simple;
	bh=So07i7TsRc8MZo97SNl3OBIKdmzGjmYOs15PooVy7f0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pHl/VHdmBVRZ7LMIwSsnjnbKf7h7Do3oenoW/oD+q3WuP70055lvP3YPYizn8jpnK8rZAMC0yxiD5t+W/Gx59nMhqcVYDaELjcubOqmuIJJDVrvueqgmYM4m8EtLXAnDMTh09ZnbfgrmcAWqKPRLz4wHe5RPsx6DojqTxaHGrFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AC8+zDAd; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AC8+zDAd"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21631789fcdso52426855ad.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Dec 2024 07:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735141844; x=1735746644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hhd15APbcYRqWh+wXaifbceYc7BmeJiVjQiC8yBJW2Y=;
        b=AC8+zDAdKJY7DwYibGQncpcq66jRo84a/3DchQvEyX2n6agS5Y2E8c7HwZg665nquP
         hNrMnsrfVqDqO+G6g9aShGeLkzOa+Sp+n+wIZNlfe4TYYmYVQjYVIVrI6ARtrhDJmU8I
         1sA29bMc7mrpcNWEu2KXt07xfLne339z6+/WDsfou/x2GLwjAlZcJWkV3SLZNjHCiNi4
         MAUcr7Oo9yRta3lOsnUFSg9sZhLWpnEjy2KK+pdsM2P1pZwwIJA7jSKsuIF4648UwmRs
         u49VNKPE/UVh+RnqAFeiW5P5l4pWcv+61Y519Aln/ExGQVJGeW/S3ju44sGMZeCSI5pS
         3Pdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735141844; x=1735746644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhd15APbcYRqWh+wXaifbceYc7BmeJiVjQiC8yBJW2Y=;
        b=QNosGDGTTRWgY45A+A1uVuwQAwIfMbGZQGPEOmzP68/V4thGYoi42viUfus1BcqRK/
         oj0wKG9XkaSvVkSADAS4HrPZu+6D/ZgdEbcPXjkAcwVtAEJdsTqbqVQpON8s8peAmNSh
         WzJZ+Ki9cjwEwjVcTGIgc8CYaSd2Rj6158Sa1XTMBzVDjKVMqtd01XAtlYQKoWyWGqSe
         ioaocJkLgEDlNvFS/spRlztNvWPrQpdIwCcdThYAsrwmHzdVwR6B3A0V1V2SmMK0YJk6
         MT3YhHDosNsDecFuPd+Dn/nB7/7wUes97FSQaoobvY8Lf8gqaUtMZ1fal8xg8f/clSx2
         +uaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6rJAtde66TmVM3KRhg++cvDFPlK6Kf2JtRPOPAjDlSVWp5LVsWVaoAL7sZzzz/VGpgOmES7V8/0AtPLcI@lists.linux.dev
X-Gm-Message-State: AOJu0YwFr0ODSlOAmL8mlpgAB5IIQGwwmO1ouqCEnbvTHtQJeWiwpcGe
	3H4o8ebQocw3vZY4hXaNStTzwnGkW/TxuI25H4hgYKfo83RvNyxP
X-Gm-Gg: ASbGnctjVMhJCeRwuro3kFqK+RNXxpiwE12fjOqXYeSVzHgHxGni4JmOvgxV5x2M70v
	l0vCUl0ITWmDW1PdCFvk+ryKuJEQbMqPJVRJjZsWZNtOWxbjXs3oN/13Pa/D7+E64CIIDSnecXU
	3LkrePFC9RW0KSLhIkFZQMnj0AADIENVTnF5Pmyc5O/DBewl9AZQlL8v2O2o8nsDYYogM+1cUoG
	MJ4e8zSIYSxn2D7UoQel3Tyrm0hRVsAALat2WUEHNvnkV6n/I1aq/e+CMYh87K19NExDUan5A==
X-Google-Smtp-Source: AGHT+IHk4VCFATM1zibsiLswORFtbMaiQwipNLDFy4J1ilbiYjqVxttiXpAxKNQJyz5/2PmPmD0EnA==
X-Received: by 2002:a05:6a21:9994:b0:1e1:a75a:c43e with SMTP id adf61e73a8af0-1e5e1fa1f46mr30696996637.22.1735141844377;
        Wed, 25 Dec 2024 07:50:44 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:5ab8:35e9:ef1:8e18:d059:3434])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fb83asm11319776b3a.138.2024.12.25.07.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Dec 2024 07:50:43 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Meir Elisha <meir6264@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: fix network selection in rtw_mlme.c (completing todo)
Date: Wed, 25 Dec 2024 21:20:31 +0530
Message-Id: <20241225155034.1154-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this patch fixes the network selection logic to avoid selecting a network
with the same ESSID as the olddest scanned network if it was scanned
within the last 500 millisecounds

and please give a specific value for "new enough" on line 481,
i have estimated 500 millisecound but inform me if the value
needs to be changed

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
---
Changes since v1:
- Changed the "new enough" value from 1000 millisecounds to 500
- fixed some styling issue

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 5ded183aa08c..6604619d1b99 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -481,8 +481,11 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 		}
 
 		if (rtw_roam_flags(adapter)) {
-			/* TODO: don't select network in the same ess as oldest if it's new enough*/
-		}
+			if (is_same_ess(&pnetwork->network, &oldest->network) &&
+				time_after(pnetwork->last_scanned,
+					(unsigned long)msecs_to_jiffies(500)))
+				continue;
+			}
 
 		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
 			oldest = pnetwork;
-- 
2.39.5

