Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE94277819
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222205; cv=none; b=lPJEbxplc/E4xhiFl0H4PhN+d21ZQvijyIn3It4XpKQpnDvcehtpob8JHwtiQl75p/gJYdRGnUzYb5DSAYRY3hlbiLR8knmt8GXSP8uWSZBhSdWn9o8qJhBYpROG/1ccvPYjsbWJYX3TIxjFrZUqxClEOQg3B8XPcE9n0PksgiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222205; c=relaxed/simple;
	bh=WKGQLQ8uKnhMI9EH4e62lLojaDPqj+X/W5fvspV/Zag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FmGxLKfEH7+JIKOv+593SVNSUxXDIwQYGcusRJp/ZeNdpjzMPW408WOBXKSmW0Q2yKyeop+kF3cBHQLakWO487NVIrseMxqc+nDHTe3CUmujHoPDZI/WqS/NJQitu/I52C3zp2odPXSwStkNJWvWLuyiRIicWNVIypPN5Ed4uEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=agjl15jq; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="agjl15jq"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-225477548e1so69487555ad.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222203; x=1744827003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86UnuWjYlTVxrrkzcrJNMvzVNwopMkwh2WAJusAycOM=;
        b=agjl15jqwqem8qFvIDBttwhUJSwqt2ZiznJrWpghRYTU4ZKfIeGp8J4uj0IRkiZTrP
         mFLFEzZATXkieMCOoBGfkbtgmyHPhrVNXvudeZ+DVw7sTIJ27l84LZuioxtrtvAaCGtv
         lfCZXQ299nsSYZswlRVTbBaMYNwA/8wHyREMtqBK7W/b5fyTyighLrGBFo6vOrCahGiR
         VaUJXNRix4DifdqwzXVy+7j7XDsF6k95HDyEeTX6+zUxiHtgNnNHOI4WJt0onj89TB2f
         2woFPgy1OftWkeVNZ8uNPVSIQe+itvsC6XbLIHked5CYV5AVZ08RyQwNrsBmSlaMxJIQ
         2bAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222203; x=1744827003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86UnuWjYlTVxrrkzcrJNMvzVNwopMkwh2WAJusAycOM=;
        b=BwFyeXGB4VeWwp+LUMsC6JrEbf6sqYF2KvvPfcbiNB5kHGE+YKposLBFJx7LWcDTQz
         2W1SoeCMv/sAfmYqIUYKSqV7BftgSIK45OCgB9K8Bo8jLNgvPXn3DOBKud+IwZgz+JRU
         /8idUojkIhMCEpmdKPtj9zHiqwX9DZzXY+A2NmcJbSkMz3HCBWLtN/WlsJKveBTF7ib2
         U+tuFhFEUeFwGLrvbKgFrfmGeyal4a6i+F52M+jE95B08B7V/7tQ1MGO9EWwXNdjmLn9
         oD34PC3AdFx73uPlTtSCdm4xJU1Xvt6TNYxRfEyBUFGwtHVKr43lrrAr1I9N0ItKNnwW
         Vc4Q==
X-Gm-Message-State: AOJu0Yzz23rsg4BVVn3tmgKfe1Ifgtx9ON4UlBrtL76Qo8JcCHcg1iV4
	gFMevpZscJ2iv4dikzmPPsAjj183j7F+8cm0/pDkVnQmuDD8AwRwZWppJX4vIw==
X-Gm-Gg: ASbGncvHjnAtnx5HRAvmSQSViGv2jgp46OfgpIRPedujqiohD4aGoPo7vU84b0lHhbT
	W7ENQ5q2M4XmVv81u/+EsoMzadpTCiVwWUVQ0YX9RBpSRqeDt5L6X+zkGRBo/G6c22dw58bOntf
	b212kqgAWO+1qLSC1u8QnHRN46a7Lma4ulLxvi8GgeV/LmTnf2dLkdTuPvJXghFPFm4fxuA4Cvs
	wWOj3PKINPWXhDbKBCtd1x6DPYtmU5vLmfE2YsjhQbtHe4dl9+BiAz8z0qTMZUGb4HqTYkfsmly
	fpLFPctZ1Bes95KG2fSYdBFvCid/4tAn/Pls9nH/8aQEqleXkGmAScNwdUyEdY+bUumrRGSQJLS
	iL3rB6A==
X-Google-Smtp-Source: AGHT+IG8qkF1Uw8XmcGYr33JHXfRWW6q2cGV/crwzmUUNsSH5c23+zVKIM1PSePYQVCLBSS9MHxSTA==
X-Received: by 2002:a17:902:f683:b0:21f:4649:fd49 with SMTP id d9443c01a7336-22ac2c3446fmr53950415ad.49.1744222202870;
        Wed, 09 Apr 2025 11:10:02 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cbdfe7sm15168405ad.207.2025.04.09.11.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:02 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 06/23] staging: gpib: gpib_types: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:36 +0000
Message-ID: <20250409180953.398686-7-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409180953.398686-1-matchstick@neverthere.org>
References: <20250409180953.398686-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u8' over 'uint8_t'

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_types.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 0dbe45894884..62ce174add85 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -67,19 +67,19 @@ struct gpib_interface {
 	 * return indicates error.
 	 * nbytes returns number of bytes read
 	 */
-	int (*read)(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+	int (*read)(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 		    size_t *bytes_read);
 	/* write() should write 'length' bytes from buffer to the bus.
 	 * If the boolean value send_eoi is nonzero, then EOI should
 	 * be sent along with the last byte.  Returns number of bytes
 	 * written or negative value on error.
 	 */
-	int (*write)(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+	int (*write)(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 		     size_t *bytes_written);
 	/* command() writes the command bytes in 'buffer' to the bus
 	 * Returns zero on success or negative value on error.
 	 */
-	int (*command)(struct gpib_board *board, uint8_t *buffer, size_t length,
+	int (*command)(struct gpib_board *board, u8 *buffer, size_t length,
 		       size_t *bytes_written);
 	/* Take control (assert ATN).  If 'asyncronous' is nonzero, take
 	 * control asyncronously (assert ATN immediately without waiting
@@ -106,13 +106,13 @@ struct gpib_interface {
 	 * with the eos bytes.	Otherwise only the 7 least significant
 	 * bits are compared.
 	 */
-	int (*enable_eos)(struct gpib_board *board, uint8_t eos, int compare_8_bits);
+	int (*enable_eos)(struct gpib_board *board, u8 eos, int compare_8_bits);
 	/* disable END on eos byte (END on EOI only)*/
 	void (*disable_eos)(struct gpib_board *board);
 	/* configure parallel poll */
-	void (*parallel_poll_configure)(struct gpib_board *board, uint8_t configuration);
+	void (*parallel_poll_configure)(struct gpib_board *board, u8 configuration);
 	/* conduct parallel poll */
-	int (*parallel_poll)(struct gpib_board *board, uint8_t *result);
+	int (*parallel_poll)(struct gpib_board *board, u8 *result);
 	/* set/clear ist (individual status bit) */
 	void (*parallel_poll_response)(struct gpib_board *board, int ist);
 	/* select local parallel poll configuration mode PP2 versus remote PP1 */
@@ -148,7 +148,7 @@ struct gpib_interface {
 	 * by IEEE 488.2 section 11.3.3.4.3 "Allowed Coupled Control of
 	 * STB, reqt, and reqf".
 	 */
-	void (*serial_poll_response)(struct gpib_board *board, uint8_t status_byte);
+	void (*serial_poll_response)(struct gpib_board *board, u8 status_byte);
 	/* Sets the byte the board should send in response to a serial poll.
 	 * This function should also request service via IEEE 488.2 reqt/reqf
 	 * based on MSS (bit 6 of the status_byte) and new_reason_for_service.
@@ -163,11 +163,11 @@ struct gpib_interface {
 	 * If this method is left NULL by the driver, then the user library
 	 * function ibrsv2 will not work.
 	 */
-	void (*serial_poll_response2)(struct gpib_board *board, uint8_t status_byte,
+	void (*serial_poll_response2)(struct gpib_board *board, u8 status_byte,
 				      int new_reason_for_service);
 	/* returns the byte the board will send in response to a serial poll.
 	 */
-	uint8_t (*serial_poll_status)(struct gpib_board *board);
+	u8 (*serial_poll_status)(struct gpib_board *board);
 	/* adjust T1 delay */
 	int (*t1_delay)(struct gpib_board *board, unsigned int nano_sec);
 	/* go to local mode */
-- 
2.43.0

