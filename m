Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D701DDC04
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178362; cv=none; b=CRALRFdDL56uwHvk0aB4DIPtn6nRjZ/V6oxq+OW0C2iVZnnWatfJVLoAHdfNoOqjKrzEDaMP30MnSiLhBkrKZOYcFWGLHPZ/E+K4E0+QGOhlecAKq9Ddtikp56xVuIUK22GGGSBQgA+G7pEVrz7+Zm2QFXpcAlH/YpcGXov36cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178362; c=relaxed/simple;
	bh=VhGRDqY449KRQVE2h/g/Djcp/iR0bi4t4g+O7wKSgRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eox7pIwOS0nmG3eTgXF0Hsc7iX53fzkbYdDL3O5An+STNTo6imfxjfSVvkGIZkgLFkwpEQSkC61wRg9AedVZb/yt0H0XfWXC+JHHJU9dyP9Gc1SdSDmWNU4micJchDfMi0EV98sYoB4OzNi3n/xpRTDODzj067UDYV5+ytC3RzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=YBoUfvKR; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="YBoUfvKR"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso6242288a12.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178360; x=1744783160; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WR47q75TB8WlKStVt6RaeaJCRBW1DtpNGupRPZBuw0E=;
        b=YBoUfvKRi5PbjY/7IEhTyCQpgO6MXauPEx/a43ZyW55g4DmDw4gjA8Q4yw3tb2+DdT
         mbM5ZeSxY6avLz2/n9SA4cFEgdfGf4JqVDltD60brplTBL3iRdsroC/F8xPJbrDbnPb6
         IOBtdZ57iOPSbJlTL/3HRlEfiEuV3790Z4551ivCUmO0Zq4bGLsDzIOeUdpLKfc/V/Qb
         WLYRXmv4u5nxfPljshPY4/vz76wzkg9Fvmhukecwot8nS5zx2PK8hyqcfjv9X1q25Ta8
         TYfilW50e/otSjxt9mXU2ed1EQ3Ud5q7yELE26wJZ4zXe9ukDeXrI+4ps/dVlswVam35
         2fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178360; x=1744783160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WR47q75TB8WlKStVt6RaeaJCRBW1DtpNGupRPZBuw0E=;
        b=PEblw8v/sNphPa4Td1S+NRJExQdr1Ft7TPeM6Op8fj4lJ+fW1Y0xbb5dIiVS3SXpf2
         jQb6TbkKXSv8OnMtNXK9KKmxQ2astrcb0U0VqiaRtDtWQJ87/FZTQs7vq+Al2qd48+6T
         AgfR5795GT8psGHMb9uDyD4C22Fhw0sJxcHZxmjyK7jHrGvCJ2ecYd22Atsaef4E4VzD
         q54Ly+nYyi5/lqQpztuRypUWXuG8t+Cd6Oa2H+SMbB8XOtA2i95EdJPjw/uoi6qXDOUW
         f32FGrdB+kZhd+TWMwI6kBbteYOhrGtpyKnghaVADy7yg5Gd8/lQXX1+d8LQLCewbaxg
         I44g==
X-Gm-Message-State: AOJu0YzR6GUrlKIUDUb4/eXI92BP3OiZYyPzID1esIv4zJocSvj28h7X
	tdqKGmAGqV+M2mJnn9txukHeWh32Pjca7t01qae0g9N3wPhEd1oKxOIYCU7zn25SYTHOvXhIyI8
	=
X-Gm-Gg: ASbGnctwIGf9PE5JJ9X7yhiRBPuvqrfEiX3xjX9lAo1KB4gRuW9Nb+TLxLvRdOyLIGE
	XPcpgV8y4h1kR2A7YZ9X7NRHpxlNR3rNXEiyh7hC/Wq+gV4n2yFg0yvLvRL316SkZvFcAMOa7Em
	assGJROdmEcEzPl9JKjy6i+6a7PagJcB/9EXZzRKDTSv/syHJ4VGFip19/pgfioLcIRs/HWc2Qf
	DNPXDrt1Stxy0N4TkdRfpcvZqUnf9m41pqzegHOZkr5yVNe2PKM527G7xd5MJ5Q2horqmjItX4P
	01f3vfVVeSHOTkj4Q4AFsFTjASplixvQUrB0moV8ZWsZoSd3GGx6QKZ0eQDXMjCUhc8RpKbnc6b
	b/TB6CosfnJxr0R91
X-Google-Smtp-Source: AGHT+IExEWskvgtiKO9mBzNMlc2ICB2I1FMAJdgV+rMkRicDN2Cj9J8GNUfQCE7IF563bsAAsa7e/A==
X-Received: by 2002:a17:90b:2748:b0:2ff:6a5f:9b39 with SMTP id 98e67ed59e1d1-306dd529aadmr2409545a91.18.1744178360746;
        Tue, 08 Apr 2025 22:59:20 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306def4e800sm511348a91.0.2025.04.08.22.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:20 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 12/21] staging: gpib: Using struct gpib_ppoll_config_ioctl`
Date: Wed,  9 Apr 2025 05:58:54 +0000
Message-ID: <20250409055903.321438-13-matchstick@neverthere.org>
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

Using Linux code style for 'struct gpib_ppoll_config_ioctl' to remove typedef.

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
index 5cf425fdcd89..3939c85fb533 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1692,7 +1692,7 @@ static int timeout_ioctl(struct gpib_board *board, unsigned long arg)
 
 static int ppc_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	ppoll_config_ioctl_t cmd;
+	struct gpib_ppoll_config_ioctl cmd;
 	int retval;
 
 	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(cmd));
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 5681a66483a8..df428899ba3f 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -86,11 +86,11 @@ struct gpib_select_pci_ioctl {
 	int pci_slot;
 };
 
-typedef struct {
+struct gpib_ppoll_config_ioctl {
 	uint8_t config;
 	unsigned set_ist : 1;
 	unsigned clear_ist : 1;
-}	ppoll_config_ioctl_t;
+};
 
 typedef struct {
 	unsigned int handle;
@@ -147,7 +147,7 @@ enum gpib_ioctl {
 
 	IBMUTEX = _IOW(GPIB_CODE, 26, int),
 	IBSPOLL_BYTES = _IOWR(GPIB_CODE, 27, struct gpib_spoll_bytes_ioctl),
-	IBPPC = _IOW(GPIB_CODE, 28, ppoll_config_ioctl_t),
+	IBPPC = _IOW(GPIB_CODE, 28, struct gpib_ppoll_config_ioctl),
 	IBBOARD_INFO = _IOR(GPIB_CODE, 29, struct gpib_board_info_ioctl),
 
 	IBQUERY_BOARD_RSV = _IOR(GPIB_CODE, 31, int),
-- 
2.43.0

