Received: from sonic314-19.consmr.mail.gq1.yahoo.com (sonic314-19.consmr.mail.gq1.yahoo.com [98.137.69.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B26918FC84
	for <linux-staging@lists.linux.dev>; Tue, 15 Apr 2025 15:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.69.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731198; cv=none; b=jAryOHf6Qqjjgbdl1ei1PFP4SFpH/OQFee9IRAwAxFETnSulvbyjCfaSVY0sEM+mkGNJGL36KFy9RhIIXGtVqrPfuMG8vrUo6OMRd2cwm9lxSqlPk75UGdZS27xQKyT0yUa0lAsyjimFNX7AJO7qqEI+56C8WuBeFlZTie+SWBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731198; c=relaxed/simple;
	bh=gqhpMXqEtYxnuNb1mv2bjA1bEkhwuDRwDtvLe/n5W3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=SwSlk/Zjo3pExPx7bmauxSZyv76N/3RJXkmYi7qJwULxLMPf+cxql9b4jcOeGuSx/WsncLvbcqjXeynGa9M/ccyCKBI8kuKt6RR+nYxqObj+n8v0ijGiugvLjXkZ5HU2hljgrfhpeERZGB+8iHAQt8/7N00OFpiG+8ZD6fbeU8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=keZR1FNu; arc=none smtp.client-ip=98.137.69.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="keZR1FNu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1744731195; bh=qfg9qQkFurOZKhDxAPz8DEp3HiYU0E+JNnp9vWIzD88=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=keZR1FNu5UDZz/jdpWGZ/ZluPzM1E2AQl3SQ4kRBGb31fzQ7/ol2EkidczO0q9d/ci6wrGmej9lkw4/MP++YEmFibuaX+EgWFMTjxDj9j1DHFCQT/3+U13964eIo1rzNu/nJgX1WJz1A+ExQ8s+JA8EetGvyij4zwsqmHZ0G+bKFbFx4IfZoggbp9OQaJswLxmW8pQiD6G1N5oh8xMTOkP6SqI//FhnneU7IBkehRz3NVk5EhFlPoLbZhDZNGtswOQk3j+zMnst06UYaC+sdJf5BqmchBLDcLHhb3W4P7rk6alLjTv+GCqVl9HgoE52IVgNuFqsTUqCo6eyxvd9Gng==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1744731195; bh=JRJxmBACS7ilVMLHpdW7/x9PrFNjwq81VmhaVLu15Pg=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=ieFEHjyU7dV+nrTv1RFPEtDK7w3x7lwwVHVX6oGJRH83Bgv1se/8/Yyprydbix6gZYA631sDBp6rlpCD8TeAXjT8qTVQQj8sE64NHBAOCNfSipPrZrMugvPz7wp3vEzWqsX8efrZQyX3G0OPD7DHNDypk/KhpHlqLe1g7eZJ6ywP0IFqqsOxkqUB+QiRkH4qH1PicqeTmfwv88jpcWaCacxGNIToQj+b11HP/kNXNloO1bea+eGx2eMbMHGZJ1+OMRHmCKKpdh9ToiMSp4IaAxSZvPDlrboXOkaouVDJ7eTItcPGi3nvL6F2kpgWL6M5AI7b5+wENPgyHvBjt+ykRQ==
X-YMail-OSG: 0ks68.UVM1ltndOqqQpd.pfO2l2T7Wltd8mMc8pU2cfjUMWzXr3r3EmHm5EHZDE
 43eRnQzeN9yoHEmQ1XJi0h21G4Lj8GVjHOoss4n3gbT68otNubFTRou6eLgz1hVfijoRGNo8JJex
 eAKI6T77kuLbhaFSKzGKXMgTcgZjMN4S1LeDMxa_zgz1..ZhmOKp9amkSydoM1kdt6FYkL.PMRi4
 FiaX0NQEhfHjpfn_WdiMVoxM7QWxX6sYdypZ3Y57fD9xMghMDRZJX8LCd_aKvkOmEey5Eje1wCF1
 dQ02wZPLm0ScblA.B.wE4WTd3KMFjvD05bGVzHxsqnB_a3_hqPezGeFAe_jzTGbP8LI0LYq4xguv
 5OZCdeisi4P7saPz17mbNhzWdVFLnwuSd3D24tZoHnjf34h9XO1G1kvqb_ugRqWaKGTUXCZz8WXX
 Ky7kEWbW5wtEC_R2ePiT6uIY28Euh8.._CSF11qHcG7X1JPugA4UQkec98GQ2eKFiHIVzFQ_8a09
 BgC37hczspgnWFRj5BYyBJR_NHN69HgUcAA79HUPybp09oQals2Nhu4owxES9mFN6l4__qiNvI8E
 WKiCx7WmyYoWNKy4eVCr.R4z1JhD0tm9JW62CsRc5bNf_crNDedZA0BuYBElApOuYvVm27Q2Jnmu
 bmGzrBizUXrXERKA7Y8L4Np3eY8TYtDrr19ApzWO60feUA11.1MKt3iamCxeU6ZrLFjbyDDzo8Eu
 aR2.tH2KPU.lkS.kGJuCYQ12gEuCT1i18yG4e7nhquJtz1PU3mL6NnO9OdPSLhLOzKmXcpFqbHYp
 LkeD.wAB.ARNAs_7hvP4XbvaWKISqU8VSuh89GpREXwTzT9I1Ew7blGQAM6hbDcIjCl5VcwMkh5O
 7zijWZ.iZ270JRy08yhogIpp9eSrW..PRisDrs026KKdVr4toykKwtksI94g0FAZk6tWFPz6jqcg
 bC7Ji7uMDLDyerT8bHGVoXt_aSXIXRnCiCtRkphJ4PwzIojGaISDnV1SSRWVv2YLTDkALwbM0tzx
 ZjqFJuWAVlZAljROjmK1yH14VqaWb8wWNtTajCTyKagQbEKn5pqj5KIQNgKkX..dmiDlAqEdqGl5
 uObFdCjYVVuJvIb1m6No8shkxaX_CwUcl_YolsXH8IeFQA4KA4pDHfo6aIIo.LdCMozAHP1.7AYL
 w4GoO.XrrhRjzZFyhKvzRxIT73LShyoag_Sfn6NSwNEaMAdZ7uW2hHn53JtGLp213S0CNkDjdU7z
 Z1mFYS5rgDG2y2G0KQjCf1R0JNG0FVxjd.ZuC1vDBzMv2CXP23YEGkNSLL2yuGOHfLB_elleqTfP
 jYY5rEzprA9UE7wjpGsasjYVHLrom126Q8HpLW4p.nl63agfJwza_drvqgIGWHsQIDZ3ax1YrKqT
 yanQIQ5fG2Ua_CjKx5e43cjwLlsSWpg_pzNXWGixtVRUu16GjrFqX1XUM4wRnUcUj1TPAvXEt5q9
 z2Mzc0nuJSgHR5K4cqN8k3D1HTlGtcpPSwoA7jkoMb5B.GpbutyNhsZtkMnS.iZ5aAI8CXSJpEQX
 KXpht3QVFGUldvAFodkKJLr9tamgsttRCntrEp8KGqDRAZcvX5nSNCzQMu6TpXfizrZmtGezfqji
 IKC0lZ1Fkm5Q7pkhTj.71.HNo.dhx1DkUP7E3b8fGw6bXwnhenT1cXwLRgR_nyxmcjFMch2Stg6g
 P46lCu158yBB0_OO3hqEbPPh3UPb2Inu4BhMdZ8Md0VjAXn.c3BN9U7EMRbkqg7UQyHFA6RZ81YU
 itszCcsTNyqUKkmsRONuhzfaMsT5.zfQqevt8jOctD59ELN0Sw9J5.nSCLECopbafhyn1ZvROPrT
 istRysErBt.i8gxl4N1ryYL70b2nrwjmp0Nj1lovbgWTBpU1jOSSCVHZr38O0TDq_pSjDG.rm83I
 ywI5maNdePKo0ybSUngqVnfT5FszwtZ0SNiEaMq2pgAWk5nSPKgpQGPr_DILQQyxzv6IaZqBi.Lj
 L7LwrIGCfwoHF3zXtvsp811s7VwyXYzljGZKeXG_crDy1KIUsb9edNgXDf4doB6CtAg91uY1iMsm
 v0oMV5d8m0Tzedv8akluSF24cVXQHGZkoZ3RoBvfMzXWiy9m4kuLsEMJCeM9f1yXBW3vJrZtWCgV
 XcPLwjg9_SyFdxi.8wqbRKRGAD8a0oBHdwCg11_45jS9AW5B79CDHJtYcN6Mf0REBsHVwbfq_DX6
 kTQ2fUZw23J_fnWzBtjonH7m0gy7RjbJJDhhILwZu5D3_O7W1NzsnsVGRc0X2_A--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 3b254d75-3985-4a21-abda-f0c5ad541986
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.gq1.yahoo.com with HTTP; Tue, 15 Apr 2025 15:33:15 +0000
Received: by hermes--production-ir2-858bd4ff7b-rsjdf (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID c8aa6ea2af1d32f54e2e66974eabf6b2;
          Tue, 15 Apr 2025 15:12:55 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ruben Wauters <rubenru09@aol.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: gpib: agilent_02350b: cleanup comments
Date: Tue, 15 Apr 2025 16:11:38 +0100
Message-ID: <20250415151246.30337-1-rubenru09@aol.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250415151246.30337-1-rubenru09.ref@aol.com>

Cleans up the comments in both the c and the h file.
Standardises the comment type (/* */) and the indentation.

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
 .../gpib/agilent_82350b/agilent_82350b.c      | 46 ++++++++++---------
 .../gpib/agilent_82350b/agilent_82350b.h      | 28 +++++------
 2 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 445b9380ff98..9726a8b61c99 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -39,7 +39,7 @@ static int agilent_82350b_accel_read(struct gpib_board *board, uint8_t *buffer,
 	int retval = 0;
 	unsigned short event_status;
 	int i, num_fifo_bytes;
-	//hardware doesn't support checking for end-of-string character when using fifo
+	/* hardware doesn't support checking for end-of-string character when using fifo */
 	if (tms_priv->eos_flags & REOS)
 		return tms9914_read(board, tms_priv, buffer, length, end, bytes_read);
 
@@ -50,9 +50,9 @@ static int agilent_82350b_accel_read(struct gpib_board *board, uint8_t *buffer,
 	*bytes_read = 0;
 	if (length == 0)
 		return 0;
-	//disable fifo for the moment
+	/* disable fifo for the moment */
 	writeb(DIRECTION_GPIB_TO_HOST, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
-	// handle corner case of board not in holdoff and one byte might slip in early
+	/* handle corner case of board not in holdoff and one byte might slip in early */
 	if (tms_priv->holdoff_active == 0 && length > 1) {
 		size_t num_bytes;
 
@@ -67,7 +67,8 @@ static int agilent_82350b_accel_read(struct gpib_board *board, uint8_t *buffer,
 	tms9914_release_holdoff(tms_priv);
 	i = 0;
 	num_fifo_bytes = length - 1;
-	write_byte(tms_priv, tms_priv->imr0_bits & ~HR_BIIE, IMR0); // disable BI interrupts
+	/* disable BI interrupts */
+	write_byte(tms_priv, tms_priv->imr0_bits & ~HR_BIIE, IMR0);
 	while (i < num_fifo_bytes && *end == 0) {
 		int block_size;
 		int j;
@@ -111,17 +112,18 @@ static int agilent_82350b_accel_read(struct gpib_board *board, uint8_t *buffer,
 			break;
 		}
 	}
-	write_byte(tms_priv, tms_priv->imr0_bits, IMR0); // re-enable BI interrupts
+	/* re-enable BI interrupts */
+	write_byte(tms_priv, tms_priv->imr0_bits, IMR0);
 	*bytes_read += i;
 	buffer += i;
 	length -= i;
 	writeb(DIRECTION_GPIB_TO_HOST, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
 	if (retval < 0)
 		return retval;
-	// read last bytes if we havn't received an END yet
+	/* read last bytes if we havn't received an END yet */
 	if (*end == 0) {
 		size_t num_bytes;
-		// try to make sure we holdoff after last byte read
+		/* try to make sure we holdoff after last byte read */
 		retval = tms9914_read(board, tms_priv, buffer, length, end, &num_bytes);
 		*bytes_read += num_bytes;
 		if (retval < 0)
@@ -169,7 +171,7 @@ static int agilent_82350b_accel_write(struct gpib_board *board, uint8_t *buffer,
 	event_status = read_and_clear_event_status(board);
 
 #ifdef EXPERIMENTAL
-	// wait for previous BO to complete if any
+	/* wait for previous BO to complete if any */
 	retval = wait_event_interruptible(board->wait,
 					  test_bit(DEV_CLEAR_BN, &tms_priv->state) ||
 					  test_bit(WRITE_READY_BN, &tms_priv->state) ||
@@ -192,7 +194,7 @@ static int agilent_82350b_accel_write(struct gpib_board *board, uint8_t *buffer,
 		block_size = min(fifotransferlength - i, agilent_82350b_fifo_size);
 		set_transfer_counter(a_priv, block_size);
 		for (j = 0; j < block_size; ++j, ++i) {
-			// load data into board's sram
+			/* load data into board's sram */
 			writeb(buffer[i], a_priv->sram_base + j);
 		}
 		writeb(ENABLE_TI_TO_SRAM, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
@@ -262,7 +264,7 @@ static irqreturn_t agilent_82350b_interrupt(int irq, void *arg)
 		tms9914_interrupt_have_status(board, &a_priv->tms9914_priv, tms9914_status1,
 					      tms9914_status2);
 	}
-//write-clear status bits
+	/* write-clear status bits */
 	if (event_status & (BUFFER_END_STATUS_BIT | TERM_COUNT_STATUS_BIT)) {
 		writeb(event_status & (BUFFER_END_STATUS_BIT | TERM_COUNT_STATUS_BIT),
 		       a_priv->gpib_base + EVENT_STATUS_REG);
@@ -292,11 +294,11 @@ static void set_transfer_counter(struct agilent_82350b_priv *a_priv, int count)
 
 	writeb(complement & 0xff, a_priv->gpib_base + XFER_COUNT_LO_REG);
 	writeb((complement >> 8) & 0xff, a_priv->gpib_base + XFER_COUNT_MID_REG);
-	//I don't think the hi count reg is even used, but oh well
+	/* I don't think the hi count reg is even used, but oh well */
 	writeb((complement >> 16) & 0xf, a_priv->gpib_base + XFER_COUNT_HI_REG);
 }
 
-// wrappers for interface functions
+/* wrappers for interface functions */
 static int agilent_82350b_read(struct gpib_board *board, uint8_t *buffer,
 			       size_t length, int *end, size_t *bytes_read)
 {
@@ -511,18 +513,18 @@ static int init_82350a_hardware(struct gpib_board *board,
 		PLX9050_PCI_RETRY_DELAY_BITS(64) |
 		PLX9050_DIRECT_SLAVE_LOCK_ENABLE_BIT;
 
-// load borg data
+	/* load borg data */
 	borg_status = readb(a_priv->borg_base);
 	if ((borg_status & BORG_DONE_BIT))
 		return 0;
-	// need to programme borg
+	/* need to programme borg */
 	if (!config->init_data || config->init_data_length != firmware_length) {
 		dev_err(board->gpib_dev, "the 82350A board requires firmware after powering on.\n");
 		return -EIO;
 	}
 	dev_dbg(board->gpib_dev, "Loading firmware...\n");
 
-	// tickle the borg
+	/* tickle the borg */
 	writel(plx_cntrl_static_bits | PLX9050_USER3_DATA_BIT,
 	       a_priv->plx_base + PLX9050_CNTRL_REG);
 	usleep_range(1000, 2000);
@@ -563,7 +565,7 @@ static int test_sram(struct gpib_board *board)
 	struct agilent_82350b_priv *a_priv = board->private_data;
 	unsigned int i;
 	const unsigned int sram_length = pci_resource_len(a_priv->pci_device, SRAM_82350A_REGION);
-	// test SRAM
+	/* test SRAM */
 	const unsigned int byte_mask = 0xff;
 
 	for (i = 0; i < sram_length; ++i) {
@@ -606,7 +608,7 @@ static int agilent_82350b_generic_attach(struct gpib_board *board,
 	tms_priv->write_byte = tms9914_iomem_write_byte;
 	tms_priv->offset = 1;
 
-	// find board
+	/* find board */
 	a_priv->pci_device = gpib_pci_get_device(config, PCI_VENDOR_ID_AGILENT,
 						 PCI_DEVICE_ID_82350B, NULL);
 	if (a_priv->pci_device) {
@@ -702,7 +704,7 @@ static int agilent_82350b_generic_attach(struct gpib_board *board,
 	writeb(a_priv->card_mode_bits, a_priv->gpib_base + CARD_MODE_REG);
 
 	if (a_priv->model == MODEL_82350A) {
-		// enable PCI interrupts for 82350a
+		/* enable PCI interrupts for 82350a */
 		writel(PLX9050_LINTR1_EN_BIT | PLX9050_LINTR2_POLARITY_BIT |
 		       PLX9050_PCI_INTR_EN_BIT,
 		       a_priv->plx_base + PLX9050_INTCSR_REG);
@@ -713,7 +715,7 @@ static int agilent_82350b_generic_attach(struct gpib_board *board,
 		       a_priv->gpib_base + EVENT_ENABLE_REG);
 		writeb(ENABLE_TERM_COUNT_INTERRUPT_BIT | ENABLE_BUFFER_END_INTERRUPT_BIT |
 		       ENABLE_TMS9914_INTERRUPTS_BIT, a_priv->gpib_base + INTERRUPT_ENABLE_REG);
-		//write-clear event status bits
+		/* write-clear event status bits */
 		writeb(BUFFER_END_STATUS_BIT | TERM_COUNT_STATUS_BIT,
 		       a_priv->gpib_base + EVENT_STATUS_REG);
 	} else {
@@ -747,7 +749,7 @@ static void agilent_82350b_detach(struct gpib_board *board)
 	struct tms9914_priv *tms_priv;
 
 	if (a_priv) {
-		if (a_priv->plx_base) // disable interrupts
+		if (a_priv->plx_base) /* disable interrupts */
 			writel(0, a_priv->plx_base + PLX9050_INTCSR_REG);
 
 		tms_priv = &a_priv->tms9914_priv;
@@ -790,7 +792,7 @@ static gpib_interface_t agilent_82350b_unaccel_interface = {
 	.parallel_poll = agilent_82350b_parallel_poll,
 	.parallel_poll_configure = agilent_82350b_parallel_poll_configure,
 	.parallel_poll_response = agilent_82350b_parallel_poll_response,
-	.local_parallel_poll_mode = NULL, // XXX
+	.local_parallel_poll_mode = NULL, /* XXX */
 	.line_status = agilent_82350b_line_status,
 	.update_status = agilent_82350b_update_status,
 	.primary_address = agilent_82350b_primary_address,
@@ -818,7 +820,7 @@ static gpib_interface_t agilent_82350b_interface = {
 	.parallel_poll = agilent_82350b_parallel_poll,
 	.parallel_poll_configure = agilent_82350b_parallel_poll_configure,
 	.parallel_poll_response = agilent_82350b_parallel_poll_response,
-	.local_parallel_poll_mode = NULL, // XXX
+	.local_parallel_poll_mode = NULL, /* XXX */
 	.line_status = agilent_82350b_line_status,
 	.update_status = agilent_82350b_update_status,
 	.primary_address = agilent_82350b_primary_address,
diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.h b/drivers/staging/gpib/agilent_82350b/agilent_82350b.h
index 1573230c619d..ef841957297f 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.h
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.h
@@ -41,11 +41,11 @@ enum board_model {
 	MODEL_82351A
 };
 
-// struct which defines private_data for board
+/* struct which defines private_data for board */
 struct agilent_82350b_priv {
 	struct tms9914_priv tms9914_priv;
 	struct pci_dev *pci_device;
-	void __iomem *plx_base;	//82350a only
+	void __iomem *plx_base;	/* 82350a only */
 	void __iomem *gpib_base;
 	void __iomem *sram_base;
 	void __iomem *misc_base;
@@ -57,12 +57,12 @@ struct agilent_82350b_priv {
 	bool using_fifos;
 };
 
-//registers
+/* registers */
 enum agilent_82350b_gpib_registers
 
 {
 	CARD_MODE_REG = 0x1,
-	CONFIG_DATA_REG = 0x2, // 82350A specific
+	CONFIG_DATA_REG = 0x2, /* 82350A specific */
 	INTERRUPT_ENABLE_REG = 0x3,
 	EVENT_STATUS_REG = 0x4,
 	EVENT_ENABLE_REG = 0x5,
@@ -76,8 +76,8 @@ enum agilent_82350b_gpib_registers
 	XFER_COUNT_HI_REG = 0xe,
 	TMS9914_BASE_REG = 0x10,
 	INTERNAL_CONFIG_REG = 0x18,
-	IMR0_READ_REG = 0x19, //read
-	T1_DELAY_REG = 0x19, // write
+	IMR0_READ_REG = 0x19, /* read */
+	T1_DELAY_REG = 0x19, /* write */
 	IMR1_READ_REG = 0x1a,
 	ADR_READ_REG = 0x1b,
 	SPMR_READ_REG = 0x1c,
@@ -89,7 +89,7 @@ enum agilent_82350b_gpib_registers
 enum card_mode_bits
 
 {
-	ACTIVE_CONTROLLER_BIT = 0x2,	// read-only
+	ACTIVE_CONTROLLER_BIT = 0x2, /* read-only */
 	CM_SYSTEM_CONTROLLER_BIT = 0x8,
 	ENABLE_BUS_MONITOR_BIT = 0x10,
 	ENABLE_PCI_IRQ_BIT = 0x20,
@@ -115,15 +115,15 @@ enum event_status_bits
 {
 	TMS9914_IRQ_STATUS_BIT = 0x1,
 	IRQ_STATUS_BIT = 0x2,
-	BUFFER_END_STATUS_BIT = 0x10,	// write-clear
-	TERM_COUNT_STATUS_BIT = 0x20,	// write-clear
+	BUFFER_END_STATUS_BIT = 0x10, /* write-clear */
+	TERM_COUNT_STATUS_BIT = 0x20, /* write-clear */
 };
 
 enum stream_status_bits
 
 {
-	HALTED_STATUS_BIT = 0x1,	//read
-	RESTART_STREAM_BIT = 0x1,	//write
+	HALTED_STATUS_BIT = 0x1, /* read */
+	RESTART_STREAM_BIT = 0x1, /* write */
 };
 
 enum internal_config_bits
@@ -135,9 +135,9 @@ enum internal_config_bits
 enum sram_access_control_bits
 
 {
-	DIRECTION_GPIB_TO_HOST = 0x20,	// transfer direction
-	ENABLE_TI_TO_SRAM = 0x40,	// enable fifo
-	ENABLE_FAST_TALKER = 0x80	// added for 82350A (not used)
+	DIRECTION_GPIB_TO_HOST = 0x20, /* transfer direction */
+	ENABLE_TI_TO_SRAM = 0x40, /* enable fifo */
+	ENABLE_FAST_TALKER = 0x80 /* added for 82350A (not used) */
 };
 
 enum borg_bits
-- 
2.45.2

