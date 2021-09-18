Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E027D72
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 06:59:14 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id p12-20020a17090adf8c00b0019c959bc795so3383266pjv.1
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 23:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pwr8YX18G5sM3rMEHlqvF4zfqHnt+BYzRfgaDWyefDg=;
        b=AbC7bh3JoGElFxwKdP2z0kCPv794uJB9sZbgRoLdfuaDXThL+fqeO9FipFvwUfkG8q
         UalCkEMNeGXGdUu3C6eZz7aX86RDQT4xqtzKDwijc0j0YfHRxgD15g/vUtYTu1Z8DoV5
         6cN5xd/1qTFvUBLEawDto6SvImGzA0onuvz/npqFrCqYrDoB/a0woijeBzJ3f1YcuY65
         srZNfbvrq2N4fqlacwD2dq1sBTL53zynXtb6b2WGGhcDQUhKIof0jfXXpUYk1f1RyiYv
         fPcbPEXWVolXfCyoIe05RmSg4iFjYhj+5+m5ldPKkm6GluJEV1AXOk79XNg9lPQSBXZz
         kR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pwr8YX18G5sM3rMEHlqvF4zfqHnt+BYzRfgaDWyefDg=;
        b=ArEc+AcrUUihmTF5Nkt8lNV9tYBe4FvCW75qPAbwprI/djwrHHV27ZxX4oHTtmlKKb
         H7ScfUIMMG4RssUijoK01+ly9uIkRpAdQe/ieDYxjrJtdFrwwjIHHz7s8JnT1z2PsBay
         ZGsHM9rWxaSElJ3bL13gcBXhU0J0W+iVMg0KJzcGC7PiTOdJa29ZSsrZc6o4C1YOyG+s
         FkdFRRbfQggHrblx55Z+Un++7YhgmPsq59fGExpxViyg/IQPhJpp6iqCw2wr7HJqpI0F
         J+poO+mrOHHNhn/j+SXQTnqhfZakX4lUFo3RZ38mgpkgholfOVsSBb4NatQK2lOdjT52
         2Daw==
X-Gm-Message-State: AOAM5339K/EIUEG2FPbIlBuQW8EtYRrHq0rxx/pMHTYBYlkOcXEOhxhV
	uPT+//pmiwiSrMnwrwJe2C8=
X-Google-Smtp-Source: ABdhPJxB8i6k8CtDM69ch7D4s/pTKprEfbMbUcd5t5Y+h+crptjf0FQ138N8kfegwGbU3gKNM0WNwA==
X-Received: by 2002:a17:90a:f18f:: with SMTP id bv15mr16577996pjb.93.1631948354352;
        Fri, 17 Sep 2021 23:59:14 -0700 (PDT)
Received: from localhost.localdomain ([2402:e280:2130:198:9b25:1cfb:9ff3:2a8f])
        by smtp.gmail.com with ESMTPSA id lj7sm7261763pjb.18.2021.09.17.23.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 23:59:14 -0700 (PDT)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benjamin Philip <benjamin.philip495@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rts5208: remove unnecessary parentheses in ms.c
Date: Sat, 18 Sep 2021 12:27:44 +0530
Message-Id: <20210918065744.26304-1-benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit removes unnecessary parentheses, that have been flagged
by checkpatch.pl in ms.c

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 drivers/staging/rts5208/ms.c | 42 ++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rts5208/ms.c b/drivers/staging/rts5208/ms.c
index c6ad34a7fa33..2a6fab5c117a 100644
--- a/drivers/staging/rts5208/ms.c
+++ b/drivers/staging/rts5208/ms.c
@@ -165,7 +165,7 @@ static int ms_write_bytes(struct rtsx_chip *chip,
 	struct ms_info *ms_card = &chip->ms_card;
 	int retval, i;
 
-	if (!data || (data_len < cnt))
+	if (!data || data_len < cnt)
 		return STATUS_ERROR;
 
 	rtsx_init_cmd(chip);
@@ -290,7 +290,7 @@ static int ms_read_bytes(struct rtsx_chip *chip,
 	for (i = 0; i < data_len; i++)
 		data[i] = ptr[i];
 
-	if ((tpc == PRO_READ_SHORT_DATA) && (data_len == 8)) {
+	if (tpc == PRO_READ_SHORT_DATA && data_len == 8) {
 		dev_dbg(rtsx_dev(chip), "Read format progress:\n");
 		print_hex_dump_bytes(KBUILD_MODNAME ": ", DUMP_PREFIX_NONE, ptr,
 				     cnt);
@@ -964,13 +964,13 @@ static int ms_read_attribute_info(struct rtsx_chip *chip)
 		i++;
 	} while (i < 1024);
 
-	if ((buf[0] != 0xa5) && (buf[1] != 0xc3)) {
+	if (buf[0] != 0xa5 && buf[1] != 0xc3) {
 		/* Signature code is wrong */
 		kfree(buf);
 		return STATUS_FAIL;
 	}
 
-	if ((buf[4] < 1) || (buf[4] > 12)) {
+	if (buf[4] < 1 || buf[4] > 12) {
 		kfree(buf);
 		return STATUS_FAIL;
 	}
@@ -979,8 +979,8 @@ static int ms_read_attribute_info(struct rtsx_chip *chip)
 		int cur_addr_off = 16 + i * 12;
 
 #ifdef SUPPORT_MSXC
-		if ((buf[cur_addr_off + 8] == 0x10) ||
-		    (buf[cur_addr_off + 8] == 0x13)) {
+		if (buf[cur_addr_off + 8] == 0x10 ||
+		    buf[cur_addr_off + 8] == 0x13) {
 #else
 		if (buf[cur_addr_off + 8] == 0x10) {
 #endif
@@ -1109,8 +1109,8 @@ static int ms_read_attribute_info(struct rtsx_chip *chip)
 #endif
 
 	if (device_type != 0x00) {
-		if ((device_type == 0x01) || (device_type == 0x02) ||
-		    (device_type == 0x03)) {
+		if (device_type == 0x01 || device_type == 0x02 ||
+		    device_type == 0x03) {
 			chip->card_wp |= MS_CARD;
 		} else {
 			return STATUS_FAIL;
@@ -1336,7 +1336,7 @@ static int ms_write_extra_data(struct rtsx_chip *chip, u16 block_addr,
 	int retval, i;
 	u8 val, data[16];
 
-	if (!buf || (buf_len < MS_EXTRA_SIZE))
+	if (!buf || buf_len < MS_EXTRA_SIZE)
 		return STATUS_FAIL;
 
 	retval = ms_set_rw_reg_addr(chip, OVERWRITE_FLAG, MS_EXTRA_SIZE,
@@ -1574,7 +1574,7 @@ static int ms_erase_block(struct rtsx_chip *chip, u16 phy_blk)
 
 static void ms_set_page_status(u16 log_blk, u8 type, u8 *extra, int extra_len)
 {
-	if (!extra || (extra_len < MS_EXTRA_SIZE))
+	if (!extra || extra_len < MS_EXTRA_SIZE)
 		return;
 
 	memset(extra, 0xFF, MS_EXTRA_SIZE);
@@ -2008,7 +2008,7 @@ static int reset_ms(struct rtsx_chip *chip)
 		goto RE_SEARCH;
 	}
 
-	if ((ptr[14] == 1) || (ptr[14] == 3))
+	if (ptr[14] == 1 || ptr[14] == 3)
 		chip->card_wp |= MS_CARD;
 
 	/* BLOCK_SIZE_0, BLOCK_SIZE_1 */
@@ -2378,8 +2378,8 @@ static int ms_build_l2p_tbl(struct rtsx_chip *chip, int seg_no)
 			continue;
 		}
 
-		if ((log_blk < ms_start_idx[seg_no]) ||
-		    (log_blk >= ms_start_idx[seg_no + 1])) {
+		if (log_blk < ms_start_idx[seg_no] ||
+		    log_blk >= ms_start_idx[seg_no + 1]) {
 			if (!(chip->card_wp & MS_CARD)) {
 				retval = ms_erase_block(chip, phy_blk);
 				if (retval != STATUS_SUCCESS)
@@ -2662,7 +2662,7 @@ static int mspro_rw_multi_sector(struct scsi_cmnd *srb,
 		return retval;
 
 	if (ms_card->seq_mode) {
-		if ((ms_card->pre_dir != srb->sc_data_direction) ||
+		if (ms_card->pre_dir != srb->sc_data_direction ||
 		    ((ms_card->pre_sec_addr + ms_card->pre_sec_cnt) !=
 		     start_sector) ||
 		    (mode_2k && (ms_card->seq_mode & MODE_512_SEQ)) ||
@@ -3294,8 +3294,8 @@ static int ms_write_multiple_pages(struct rtsx_chip *chip, u16 old_blk,
 					return STATUS_FAIL;
 			}
 
-			if ((page_addr == (end_page - 1)) ||
-			    (page_addr == ms_card->page_off)) {
+			if (page_addr == (end_page - 1) ||
+			    page_addr == ms_card->page_off) {
 				if (!(val & INT_REG_CED)) {
 					ms_set_err_code(chip,
 							MS_FLASH_WRITE_ERROR);
@@ -3434,8 +3434,8 @@ static int ms_rw_multi_sector(struct scsi_cmnd *srb, struct rtsx_chip *chip,
 	if (srb->sc_data_direction == DMA_TO_DEVICE) {
 #ifdef MS_DELAY_WRITE
 		if (delay_write->delay_write_flag &&
-		    (delay_write->logblock == log_blk) &&
-		    (start_page > delay_write->pageoff)) {
+		    delay_write->logblock == log_blk &&
+		    start_page > delay_write->pageoff) {
 			delay_write->delay_write_flag = 0;
 			retval = ms_copy_page(chip,
 					      delay_write->old_phyblock,
@@ -3467,7 +3467,7 @@ static int ms_rw_multi_sector(struct scsi_cmnd *srb, struct rtsx_chip *chip,
 					(chip, seg_no,
 					 log_blk - ms_start_idx[seg_no]);
 			new_blk  = ms_get_unused_block(chip, seg_no);
-			if ((old_blk == 0xFFFF) || (new_blk == 0xFFFF)) {
+			if (old_blk == 0xFFFF || new_blk == 0xFFFF) {
 				set_sense_type(chip, lun,
 					       SENSE_TYPE_MEDIA_WRITE_ERR);
 				return STATUS_FAIL;
@@ -4179,7 +4179,7 @@ int mg_set_ICV(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 
 		retval = rtsx_transfer_data(chip, MS_CARD, buf + 4 + i * 512,
 					    512, 0, DMA_TO_DEVICE, 3000);
-		if ((retval < 0) || check_ms_err(chip)) {
+		if (retval < 0 || check_ms_err(chip)) {
 			rtsx_clear_ms_error(chip);
 			if (ms_card->mg_auth == 0) {
 				if ((buf[5] & 0xC0) != 0)
@@ -4200,7 +4200,7 @@ int mg_set_ICV(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 #else
 	retval = ms_transfer_data(chip, MS_TM_AUTO_WRITE, PRO_WRITE_LONG_DATA,
 				  2, WAIT_INT, 0, 0, buf + 4, 1024);
-	if ((retval != STATUS_SUCCESS) || check_ms_err(chip)) {
+	if (retval != STATUS_SUCCESS || check_ms_err(chip)) {
 		rtsx_clear_ms_error(chip);
 		if (ms_card->mg_auth == 0) {
 			if ((buf[5] & 0xC0) != 0)
-- 
2.31.1

