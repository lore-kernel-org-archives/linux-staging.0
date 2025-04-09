Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1511E51F5
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178361; cv=none; b=spXXMM988CmQ0QC1ES0vTOJqOxb7jfEK5oXyUkgglOZSh3t3GyHVJasSVNHEhD7BtpbGiJQdhAxkSrCq43bbd9OavuX29ZaLgTLHPYGDlTpgF1A6nm4u2AWQcQOOrM/nte1lv2wpztBJ1fqv8tkVTwiSNl42UCrNwqPlzfsvRbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178361; c=relaxed/simple;
	bh=ZYocG4WpW2v0G18PypaL/RWNtd0f+kY6Gh7yo5tCZXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXGGfGKc8TgLEgY9CH8x8tTf6S5TdTBwgmFu8BCGER4Ub4YMW/baBkCuMPpFNuGJ73wNLHTyq/0GhJffmlLIoYfIC/Typd/Ij0VhwrTxbr8QexYQEZKVvQ8oXbZzZJU6eIgmD0XvqVVMhOt1PpQWOswX1fkia4VD7Ju2wIhOCpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=S405EC+M; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="S405EC+M"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ad51f427054so4292812a12.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178359; x=1744783159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsHO17LnKKqQLTT7VMA/aJzN4PsTAXWxtYSCZZAyv7Y=;
        b=S405EC+MAoOZDxwXAdc6bi+7qZXgEyKOrS8CYloqKOYkKaOfSpoPwKmasQa4OUfkBC
         INXzU7+UyNMQCfd3ex69SfQaHN0wXJsOY+ENu5TZhcyb5hOw5iMdXYZqEHiHnI+E5Cq/
         viktkwf6gIHJqd6nH8znReV92Ne9N7LEWQnycBfdR/8en1u8wVtkg66HVRGSqzeHVR8o
         QLqd5S9XgHXAXgyCiQ1Two1j9sd6FmK/kUAbCgG72URkJqDRCyEIE0Fues0AP/iEc8on
         164JQVF08P1Ca4Z2lFdPb//Z7kfZkKJj8i5GzdiLkl1CjLDkFjIiA/ya8DflaMssvyI3
         rrqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178359; x=1744783159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsHO17LnKKqQLTT7VMA/aJzN4PsTAXWxtYSCZZAyv7Y=;
        b=Eig6IiN+AjMn1eOsOgHu9dqM+64/9f7mcC4uAmRyvGGUZG7kVrDnrD7hrDxRxGdpU4
         yCLLax3gQOa9lNLpKa7pwNIlW4R1yFCQ9oncp7BMvICMxnqlsk37Gp0VExXLo48WGph/
         MWUjFuSbViYhCpgsIeLFRLkTLIMLHuhWtsvZsz/uF0IiaL7n/0sIafl1T3gc+eycL1M5
         qgRjkmmb5Y8aPEo+eUivteXxP5G1cOmr5Ba637nfldhyqxlhSBU9TSiVZ9bciHpfSloG
         uzF/oXNoIl+BiiR/2BrXmj/dzl55b6W6puSLnke9oDYHmCvqFWyrD4XiJ+llh6l1T0WZ
         Poyw==
X-Gm-Message-State: AOJu0Yw1S3Iu80vjVBn3cc9/iA4xuvnCf0aDxPl2OziLNwR079sLHZUN
	grmllqYUAsG9k15haLQoe1luUMzwMTiSVloz1hFivhMYtHG/uhkNixS954HHHw==
X-Gm-Gg: ASbGnctYMIpzVsAhppSO5gSl9CGuPT3X2HqDL9LaEtbhHsYP1rTkx+sUPW6QvRd49Lz
	m5k7fp9roqS6tarKntsfCfWL+H0Wjo90Tzlg6LeP0oNIAGmuWYwGOpuozVe8pJ8LBZy4VfBGbqH
	HfpLrB6Tq2aOWGXgTfwLtgPmP3478jVa2/z10GpBvS8T8NDIg8IhyhQq4TzYZJaKWuJFkxakske
	Qz+Nlp8WdURZipRcdYDVnPYTNynoY24gFdKcpHrjNWJIJzBIEIELzfAwS47UK4OLce73H3qm9sA
	cC2UU9V+yh9dlyHlbTtxkB8OAuAGfHfnp7N6cCWpodMwYZEfkCwObnHMHBPEkXHt2GPRHjDCWVj
	+JOULcw==
X-Google-Smtp-Source: AGHT+IGxInF1tlWAEb5ecTeN3SbQ4ysc4Fo+Y8D2nJkd/pWinm4Tv/gquLdEGrWGnjCy7RBPBMLM+A==
X-Received: by 2002:a17:90b:528e:b0:2f1:3355:4a8f with SMTP id 98e67ed59e1d1-306dd3247camr1986546a91.4.1744178359515;
        Tue, 08 Apr 2025 22:59:19 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df2fb171sm493574a91.34.2025.04.08.22.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:19 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 11/21] staging: gpib: Using struct gpib_select_pci_ioctl
Date: Wed,  9 Apr 2025 05:58:53 +0000
Message-ID: <20250409055903.321438-12-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409055903.321438-1-matchstick@neverthere.org>
References: <20250409055903.321438-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for 'struct gpib_select_pci_ioctl' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index ce2184c5de03..5cf425fdcd89 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1797,7 +1797,7 @@ static int interface_clear_ioctl(struct gpib_board *board, unsigned long arg)
 
 static int select_pci_ioctl(struct gpib_board_config *config, unsigned long arg)
 {
-	select_pci_ioctl_t selection;
+	struct gpib_select_pci_ioctl selection;
 	int retval;
 
 	if (!capable(CAP_SYS_ADMIN))
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 041b0a1593e9..5681a66483a8 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -81,10 +81,10 @@ struct gpib_board_info_ioctl {
 	unsigned no_7_bit_eos : 1;
 };
 
-typedef struct {
+struct gpib_select_pci_ioctl {
 	int pci_bus;
 	int pci_slot;
-} select_pci_ioctl_t;
+};
 
 typedef struct {
 	uint8_t config;
@@ -151,7 +151,7 @@ enum gpib_ioctl {
 	IBBOARD_INFO = _IOR(GPIB_CODE, 29, struct gpib_board_info_ioctl),
 
 	IBQUERY_BOARD_RSV = _IOR(GPIB_CODE, 31, int),
-	IBSELECT_PCI = _IOWR(GPIB_CODE, 32, select_pci_ioctl_t),
+	IBSELECT_PCI = _IOWR(GPIB_CODE, 32, struct gpib_select_pci_ioctl),
 	IBEVENT = _IOR(GPIB_CODE, 33, event_ioctl_t),
 	IBRSC = _IOW(GPIB_CODE, 34, rsc_ioctl_t),
 	IB_T1_DELAY = _IOW(GPIB_CODE, 35, t1_delay_ioctl_t),
-- 
2.43.0

