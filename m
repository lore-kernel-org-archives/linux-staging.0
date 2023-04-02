Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688B5442F;
	Sun,  2 Apr 2023 14:32:58 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id eg48so107592192edb.13;
        Sun, 02 Apr 2023 07:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680445976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VpvWUtWbJT8YstgxikOx5Ko60XPMRGflN6BioEOG+4=;
        b=ngsGSh04fpEbkCAXlhuCz29S2OlIPQSejpYIDqmJbKHn1FEmdF03cvkclWt3dPBHi1
         98aY2pMKuj8DoAHJ0HWplNPLn+IUNOAi01Dq984xBxz0RARgpHzDRb/mRTQ0zvAfmzWg
         8gmGdnhYCl93yp6mr3qfohLkU1EcT0MzPjDToh6HXCRyclUXNK22oUEPDTbx7JxDCms3
         5BlTmmTTJu7pGeT4hyKSoNL2JMNWjDEtlyQWQ6dQSIeY7IcHZ72F1oJgh4C4nG8PtJCf
         OlvtfhSUxWTKDP7yhDq0HRMn4LoMZt+qTAIfLXd4KNqdaN2oG/Az9xMt3bz7MC0FK3nM
         8CmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680445976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VpvWUtWbJT8YstgxikOx5Ko60XPMRGflN6BioEOG+4=;
        b=xY7oqKbhbYuy7kpblDNi35ShH6yfSAi1zUfOEPf65VFKbM2cyAsKqwjdRan8Y/ZpdI
         3GY17RWyBlPZgeNH4GuLa32tmY2/x5+TkfCbE9ExI60ukXY91oM05kdZ1eoHkEpD10Q6
         6l1XlZW7pVjSCIZ5IHiCjN0pnPTuLF7NGj8qIbMN5yd5gJU9CSJ2+IkTdzVJD+FKWwk4
         oymVMbeXjgEHgLBlfPah45Zv8vKoeV4SH4AIe0tZYFEyvIdmFNNFTvp5x2Afr+MgYgb5
         Imiq/2cLghFQchiU01FD4x5cEw0BxCQSRekdlPcXymuvdr2EGtw9S+WSv1OBzUy2ZBod
         d7pA==
X-Gm-Message-State: AAQBX9eott3wHvbO9Qb3Vb73VNXa53wowiYYo3bLtwzkdLTB2Dde4AIm
	ri9bwnHxmgCqSNUoe+7InPGke+l6Rg16uw==
X-Google-Smtp-Source: AKy350YoVEg93SRXWO5VhAFf+Xwl7hwi9aKziysxUjr10GN679/Ilr/6a4pr5bnpC0W+Lvq2lxSOqw==
X-Received: by 2002:a17:906:f190:b0:931:a321:7640 with SMTP id gs16-20020a170906f19000b00931a3217640mr35829287ejb.74.1680445976368;
        Sun, 02 Apr 2023 07:32:56 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id p18-20020a170906839200b009476dafa705sm3273292ejx.193.2023.04.02.07.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 07:32:56 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] staging: rtl8192e: avoid CamelCase <dot11RSNAStatsCCMPReplays>
Date: Sun,  2 Apr 2023 19:32:45 +0500
Message-Id: <7166160c0face9e32dbb28c44727eb8856173f0a.1680445545.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680445545.git.kamrankhadijadj@gmail.com>
References: <cover.1680445545.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux kernel coding-style suggests to not use mixed-case names. Fix
checkpatch issue by changing the variable name from camel case to snake
case.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_crypt_ccmp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
index d37ca72678c8..448c0a931c78 100644
--- a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
+++ b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
@@ -35,7 +35,7 @@ struct rtllib_ccmp_data {
 	u8 rx_pn[CCMP_PN_LEN];
 
 	u32 dot11rsna_stats_ccmp_format_errors;
-	u32 dot11RSNAStatsCCMPReplays;
+	u32 dot11rsna_stats_ccmp_replays;
 	u32 dot11RSNAStatsCCMPDecryptErrors;
 
 	int key_idx;
@@ -263,7 +263,7 @@ static int rtllib_ccmp_decrypt(struct sk_buff *skb, int hdr_len, void *priv)
 	pn[5] = pos[0];
 	pos += 8;
 	if (memcmp(pn, key->rx_pn, CCMP_PN_LEN) <= 0) {
-		key->dot11RSNAStatsCCMPReplays++;
+		key->dot11rsna_stats_ccmp_replays++;
 		return -4;
 	}
 	if (!tcb_desc->bHwSec) {
@@ -375,7 +375,7 @@ static void rtllib_ccmp_print_stats(struct seq_file *m, void *priv)
 		   ccmp->key_idx, ccmp->key_set,
 		   ccmp->tx_pn, ccmp->rx_pn,
 		   ccmp->dot11rsna_stats_ccmp_format_errors,
-		   ccmp->dot11RSNAStatsCCMPReplays,
+		   ccmp->dot11rsna_stats_ccmp_replays,
 		   ccmp->dot11RSNAStatsCCMPDecryptErrors);
 }
 
-- 
2.34.1

