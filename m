Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7D263AE
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 15:06:36 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id q102so34233998pjq.3
        for <linux-staging@lists.linux.dev>; Wed, 05 Apr 2023 08:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680707196;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TbxAv6aziwJf5ehtLswK5tUZ8Qlh/PvhMi5/mWMls0U=;
        b=Q4+ANuvry0JHpjdJjgy484Y1UWVcUObagILLmHzqDruuXB7ZfS175LfH5CHwLSOcGR
         ciUEz1AAEQEUv3LuJuA3uBlTWXIQidSFCht0eY3UjQ480xp164gVnE9WOkG/USpXkSa1
         R9LIKah58bdMO/pXhdp8XLGva65tXpbsjH3jIl/5KbZNuRVeBKk0aPZSM/A9RmU2o+Uo
         ACD+1T3ZwvxIDOULj42bjh/l50varUC+F9FhHhaca7OWNWaZgohTS39MRtuRiPNYmKu/
         fhsEVxlk+a2IiReY5coPQRHNH8DwD8FnKYItfWel+gThrwlOpdqfgENRowOq8Oo4tXnB
         z44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680707196;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TbxAv6aziwJf5ehtLswK5tUZ8Qlh/PvhMi5/mWMls0U=;
        b=dNu6B4IYI/meONE9uDSAcbta7svcqVL3XrCTiKpmNPGKnx120BykGnB7fIUQff4RZT
         2Md8sf3eQ0uF50k8PpYeABrJbekRrVzdWNGbZr+DiutxwHEL7s/OHbccqj+aYcblhNrG
         DYuD++90s45OAMAI6Hqu+Hh8XaJbrguQ5M6wfhkMFmNM4Pru+CXzKhY5kI6y2qMV5Wv8
         5tOQcu+XWUayG2LE/hFhu1Xq/fC4mk89nIGj+ZzSdicQIjzQlOBdrQqk4tVNeA1rMxmA
         ChCARzRE+jN5L7BtoUTlcr1tSS5CNIfI8zpL2KyKKBPMCy66hoi/7zqpGVOlpinhMhKr
         Q1pQ==
X-Gm-Message-State: AAQBX9cRmwBYAniEGjNAoOTTbXE0dPdcCG00PFrTFUX0jjKvKE9ArYnv
	tCI3fxRUfYTOmv0hAZDcCVY=
X-Google-Smtp-Source: AKy350ZD7UC1SuYihpq0Mz4vpVjRSCrzxdXPq1NY86sDBrgcemna6nSlRLdVjS5PbXfg6dX6TZpOZA==
X-Received: by 2002:a17:903:283:b0:1a2:a284:d3bf with SMTP id j3-20020a170903028300b001a2a284d3bfmr6430666plr.17.1680707195582;
        Wed, 05 Apr 2023 08:06:35 -0700 (PDT)
Received: from sumitra.com ([117.199.165.210])
        by smtp.gmail.com with ESMTPSA id u5-20020a656705000000b00502e6bfedc0sm9790193pgf.0.2023.04.05.08.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 08:06:35 -0700 (PDT)
Date: Wed, 5 Apr 2023 08:06:27 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: qlge: Remove macro FILL_SEG
Message-ID: <20230405150627.GA227254@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove macro FILL_SEG to fix the checkpatch warning:

WARNING: Macros with flow control statements should be avoided

Macros with flow control statements must be avoided as they
break the flow of the calling function and make it harder to
test the code.

Replace all FILL_SEG() macro calls with:

err = err || qlge_fill_seg_(...);

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/staging/qlge/qlge_devlink.c | 109 ++++++++++++----------------
 1 file changed, 47 insertions(+), 62 deletions(-)

diff --git a/drivers/staging/qlge/qlge_devlink.c b/drivers/staging/qlge/qlge_devlink.c
index 0ab02d6d3817..96328207f685 100644
--- a/drivers/staging/qlge/qlge_devlink.c
+++ b/drivers/staging/qlge/qlge_devlink.c
@@ -39,15 +39,6 @@ static int qlge_fill_seg_(struct devlink_fmsg *fmsg,
 	return err;
 }
 
-#define FILL_SEG(seg_hdr, seg_regs)			                    \
-	do {                                                                \
-		err = qlge_fill_seg_(fmsg, &dump->seg_hdr, dump->seg_regs); \
-		if (err) {					            \
-			kvfree(dump);                                       \
-			return err;				            \
-		}                                                           \
-	} while (0)
-
 static int qlge_reporter_coredump(struct devlink_health_reporter *reporter,
 				  struct devlink_fmsg *fmsg, void *priv_ctx,
 				  struct netlink_ext_ack *extack)
@@ -85,59 +76,53 @@ static int qlge_reporter_coredump(struct devlink_health_reporter *reporter,
 
 	qlge_soft_reset_mpi_risc(qdev);
 
-	FILL_SEG(core_regs_seg_hdr, mpi_core_regs);
-	FILL_SEG(test_logic_regs_seg_hdr, test_logic_regs);
-	FILL_SEG(rmii_regs_seg_hdr, rmii_regs);
-	FILL_SEG(fcmac1_regs_seg_hdr, fcmac1_regs);
-	FILL_SEG(fcmac2_regs_seg_hdr, fcmac2_regs);
-	FILL_SEG(fc1_mbx_regs_seg_hdr, fc1_mbx_regs);
-	FILL_SEG(ide_regs_seg_hdr, ide_regs);
-	FILL_SEG(nic1_mbx_regs_seg_hdr, nic1_mbx_regs);
-	FILL_SEG(smbus_regs_seg_hdr, smbus_regs);
-	FILL_SEG(fc2_mbx_regs_seg_hdr, fc2_mbx_regs);
-	FILL_SEG(nic2_mbx_regs_seg_hdr, nic2_mbx_regs);
-	FILL_SEG(i2c_regs_seg_hdr, i2c_regs);
-	FILL_SEG(memc_regs_seg_hdr, memc_regs);
-	FILL_SEG(pbus_regs_seg_hdr, pbus_regs);
-	FILL_SEG(mde_regs_seg_hdr, mde_regs);
-	FILL_SEG(nic_regs_seg_hdr, nic_regs);
-	FILL_SEG(nic2_regs_seg_hdr, nic2_regs);
-	FILL_SEG(xgmac1_seg_hdr, xgmac1);
-	FILL_SEG(xgmac2_seg_hdr, xgmac2);
-	FILL_SEG(code_ram_seg_hdr, code_ram);
-	FILL_SEG(memc_ram_seg_hdr, memc_ram);
-	FILL_SEG(xaui_an_hdr, serdes_xaui_an);
-	FILL_SEG(xaui_hss_pcs_hdr, serdes_xaui_hss_pcs);
-	FILL_SEG(xfi_an_hdr, serdes_xfi_an);
-	FILL_SEG(xfi_train_hdr, serdes_xfi_train);
-	FILL_SEG(xfi_hss_pcs_hdr, serdes_xfi_hss_pcs);
-	FILL_SEG(xfi_hss_tx_hdr, serdes_xfi_hss_tx);
-	FILL_SEG(xfi_hss_rx_hdr, serdes_xfi_hss_rx);
-	FILL_SEG(xfi_hss_pll_hdr, serdes_xfi_hss_pll);
-
-	err = qlge_fill_seg_(fmsg, &dump->misc_nic_seg_hdr,
-			     (u32 *)&dump->misc_nic_info);
-	if (err) {
-		kvfree(dump);
-		return err;
-	}
-
-	FILL_SEG(intr_states_seg_hdr, intr_states);
-	FILL_SEG(cam_entries_seg_hdr, cam_entries);
-	FILL_SEG(nic_routing_words_seg_hdr, nic_routing_words);
-	FILL_SEG(ets_seg_hdr, ets);
-	FILL_SEG(probe_dump_seg_hdr, probe_dump);
-	FILL_SEG(routing_reg_seg_hdr, routing_regs);
-	FILL_SEG(mac_prot_reg_seg_hdr, mac_prot_regs);
-	FILL_SEG(xaui2_an_hdr, serdes2_xaui_an);
-	FILL_SEG(xaui2_hss_pcs_hdr, serdes2_xaui_hss_pcs);
-	FILL_SEG(xfi2_an_hdr, serdes2_xfi_an);
-	FILL_SEG(xfi2_train_hdr, serdes2_xfi_train);
-	FILL_SEG(xfi2_hss_pcs_hdr, serdes2_xfi_hss_pcs);
-	FILL_SEG(xfi2_hss_tx_hdr, serdes2_xfi_hss_tx);
-	FILL_SEG(xfi2_hss_rx_hdr, serdes2_xfi_hss_rx);
-	FILL_SEG(xfi2_hss_pll_hdr, serdes2_xfi_hss_pll);
-	FILL_SEG(sem_regs_seg_hdr, sem_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->core_regs_seg_hdr, dump->mpi_core_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->test_logic_regs_seg_hdr, dump->test_logic_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->rmii_regs_seg_hdr, dump->rmii_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->fcmac1_regs_seg_hdr, dump->fcmac1_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->fcmac2_regs_seg_hdr, dump->fcmac2_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->fc1_mbx_regs_seg_hdr, dump->fc1_mbx_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->ide_regs_seg_hdr, dump->ide_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->nic1_mbx_regs_seg_hdr, dump->nic1_mbx_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->smbus_regs_seg_hdr, dump->smbus_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->fc2_mbx_regs_seg_hdr, dump->fc2_mbx_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->nic2_mbx_regs_seg_hdr, dump->nic2_mbx_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->i2c_regs_seg_hdr, dump->i2c_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->memc_regs_seg_hdr, dump->memc_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->pbus_regs_seg_hdr, dump->pbus_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->mde_regs_seg_hdr, dump->mde_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->nic_regs_seg_hdr, dump->nic_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->nic2_regs_seg_hdr, dump->nic2_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->xgmac1_seg_hdr, dump->xgmac1);
+	err = err || qlge_fill_seg_(fmsg, &dump->xgmac2_seg_hdr, dump->xgmac2);
+	err = err || qlge_fill_seg_(fmsg, &dump->code_ram_seg_hdr, dump->code_ram);
+	err = err || qlge_fill_seg_(fmsg, &dump->memc_ram_seg_hdr, dump->memc_ram);
+	err = err || qlge_fill_seg_(fmsg, &dump->xaui_an_hdr, dump->serdes_xaui_an);
+	err = err || qlge_fill_seg_(fmsg, &dump->xaui_hss_pcs_hdr, dump->serdes_xaui_hss_pcs);
+	err = err || qlge_fill_seg_(fmsg, &dump->xfi_an_hdr, dump->serdes_xfi_an);
+	err = err || qlge_fill_seg_(fmsg, &dump->xfi_train_hdr, dump->serdes_xfi_train);
+	err = err || qlge_fill_seg_(fmsg, &dump->xfi_hss_pcs_hdr, dump->serdes_xfi_hss_pcs);
+	err = err || qlge_fill_seg_(fmsg, &dump->xfi_hss_tx_hdr, dump->serdes_xfi_hss_tx);
+	err = err || qlge_fill_seg_(fmsg, &dump->xfi_hss_rx_hdr, dump->serdes_xfi_hss_rx);
+	err = err || qlge_fill_seg_(fmsg, &dump->xfi_hss_pll_hdr, dump->serdes_xfi_hss_pll);
+	err = err || qlge_fill_seg_(fmsg, &dump->misc_nic_seg_hdr, (u32 *)&dump->misc_nic_info);
+	err = err || qlge_fill_seg_(fmsg, &dump->intr_states_seg_hdr, dump->intr_states);
+	err = err || qlge_fill_seg_(fmsg, &dump->cam_entries_seg_hdr, dump->cam_entries);
+	err = err || qlge_fill_seg_(fmsg, &dump->nic_routing_words_seg_hdr,
+				    dump->nic_routing_words);
+	err = err || qlge_fill_seg_(fmsg, &dump->ets_seg_hdr, dump->ets);
+	err = err || qlge_fill_seg_(fmsg, &dump->probe_dump_seg_hdr, dump->probe_dump);
+	err = err || qlge_fill_seg_(fmsg, &dump->routing_reg_seg_hdr, dump->routing_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->mac_prot_reg_seg_hdr, dump->mac_prot_regs);
+	err = err || qlge_fill_seg_(fmsg, &dump->xaui2_an_hdr, dump->serdes2_xaui_an);
+	err = err || qlge_fill_seg_(fmsg, &dump->xaui2_hss_pcs_hdr, dump->serdes2_xaui_hss_pcs);
+	err = err || qlge_fill_seg_(fmsg, &dump->xfi2_an_hdr, dump->serdes2_xfi_an);
+	err = err || qlge_fill_seg_(fmsg, &dump->xfi2_train_hdr, dump->serdes2_xfi_train);
+	err = err || qlge_fill_seg_(fmsg, &dump->xfi2_hss_pcs_hdr, dump->serdes2_xfi_hss_pcs);
+	err = err || qlge_fill_seg_(fmsg, &dump->xfi2_hss_tx_hdr, dump->serdes2_xfi_hss_tx);
+	err = err || qlge_fill_seg_(fmsg, &dump->xfi2_hss_rx_hdr, dump->serdes2_xfi_hss_rx);
+	err = err || qlge_fill_seg_(fmsg, &dump->xfi2_hss_pll_hdr, dump->serdes2_xfi_hss_pll);
+	err = err || qlge_fill_seg_(fmsg, &dump->sem_regs_seg_hdr, dump->sem_regs);
 
 	kvfree(dump);
 	return err;
-- 
2.25.1

