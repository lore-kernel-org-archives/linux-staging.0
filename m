Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B236F211476
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178371; cv=none; b=KgOPhQXfG0fVMArvO20a/CyneEgM9NIxt6YkaYxhtLFkqZHi/Ywi1hnsNOvtUq4Bxkh8U1HlhSGNpu4w5DdYND++J5GSuBKHdmbkxs0AlegUWjNGXyddPdIG+oETrye8QiT0N4YnQpue4asjroM83P5Ehr94sCdgri2pW1YoOJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178371; c=relaxed/simple;
	bh=6f9bCFgv3OgziEcu2USnaorTdNY1Gp/dioA6Ikmn/zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3cD3OUz/pLh3VYhXXX5/PIf2kKr+pVMy10amH6g8NqSv0Xv3x5T3f/i33Ke4tVLOqa8h1+DOGHDZWQ2pfI/1m7z4kulvXo2lAT9JyMdkETLSGOJtyLZUu/15UaX0rPe8pKHk8uyToC7W+PLahTVirS6RunqtSf4kIYO3/cwkYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=P6ClmSJy; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="P6ClmSJy"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2260c91576aso53595695ad.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178369; x=1744783169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rp1Mnr/Ppbq5hd9yNv+1/H1q/VZaXkXrpCMjU4yauo4=;
        b=P6ClmSJy9Dn9V6d5mOc5a8FCzF2Agem3UJTHbf9BGfigu7OyZib1UhcAVt4UopJytn
         Abg/H9P80tmZlwBPuyqzKovU6m4Eek7iZ/3W3YXRkhhm9PYS/n/8HqytaYFfmrIN1wa4
         goMzX6F4+B4umGH+NDve77lLgs41S02V/RPwW632l8EgBGrG9rqsteLaWN9bNxYquZoT
         TelXpXtLMvEd6IMKwgYs9+Ut1nBI8XgtGu4XF7ka53u20k+1W1Y9keUVrkyF8Hh11Lvh
         ckREW9pRWnY+6y1p/dnfl9Mm2tvfgfJqI9NF0A4iDcWJm26LkyW7xa+Msml9H+N1ZZiU
         wU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178369; x=1744783169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rp1Mnr/Ppbq5hd9yNv+1/H1q/VZaXkXrpCMjU4yauo4=;
        b=PXceoaihRfQ8PmWgZd2Sos4FxTSFFNxusZVREMNTpUWxq4OTquTxeB1bICfbpvvl/t
         Xao3nPQ8zxpNgRNP69AkT4va6IuWxyd4QfMdaYUclS2ism1MQziDgv1s25xt6E0HOpSy
         MjWrLt19UhtLKyZ3UNLD94Usbfc1+Ndr3MA/7e3gE6HsbxdDsy8O+bEJ4+EYCHYTUULc
         gW6sC7NlRtZBUJd1mDiwu+Xv359ahIuLTXhv2cC/UPlOSJpfK9TL7UThwHFBx9UAtri9
         Tq3u3QtCeXb2kAwebVALjVeaKyrnMiaGA9W7kYP0/2Ow+1uD/EcewRQA5Yu1OeXU09Fi
         7Zhg==
X-Gm-Message-State: AOJu0YxA/ra3TxXOL7Bjpipt6HGO523PFTe93y/VyxUqWA/zRomY4SxL
	4x5JrftFXqhuRrDsHYkKAMQmC179t6nD6lN2jX3LVogrT8YUGj0PiZFqxVDOaQ==
X-Gm-Gg: ASbGncvj5DbK+4NN0UhogaulTSlRB0D52mWuGqODCdnsr0OxqyBbXsT0GZeQNbZVPEq
	IawPD1kPlvhknxYT9/YGkWd/4wQDi5UdsVRj66weblRhkedA55mg7heavsm1K0pg7Bxe3RDVc8y
	E3p1vdP5TNts8Vrwin8SBFrkojglTYlXch/pFlmDqGNrW9HEvOKfEhthnEp6Xy9A01zRQrUx8E3
	h1bH//la9Crd+Xo8yFT7XTZNC/b8hIYAuYI2a0gaP/V/YZNdNbdgdB8/qQWyll5WA7IlFpme1xd
	Y/kce4ZMPw5Are8M8w26RByWtuEoLYLvor0mRWnjRLUAvHkLFG593iXksoB4eQbcoFONOMm/Wdr
	Lp28arA==
X-Google-Smtp-Source: AGHT+IE/ChE6ZmnKHJDN/gdBW7rtlyY8iE7c889RlAKDvJomQgnBVhLKQ9OiwQiY0oUYePyahmH/IQ==
X-Received: by 2002:a17:902:ccc8:b0:227:e7c7:d451 with SMTP id d9443c01a7336-22ac3f9a8fcmr25005435ad.29.1744178369126;
        Tue, 08 Apr 2025 22:59:29 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df400ab7sm488012a91.47.2025.04.08.22.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:28 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 19/21] staging: gpib: t1_delay_ioctl_t now unsigned int
Date: Wed,  9 Apr 2025 05:59:01 +0000
Message-ID: <20250409055903.321438-20-matchstick@neverthere.org>
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

Using Linux code style to replace typedef t1_delay_ioctl_t with type
unsigned int.

Adhering to Linux code style.

Reported by checkpatch.pl

WARNING: do not add new typedefs

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 6a2ceb7b0b59..d32f39ddea28 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1984,7 +1984,7 @@ static int request_system_control_ioctl(struct gpib_board *board, unsigned long
 
 static int t1_delay_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	t1_delay_ioctl_t cmd;
+	unsigned int cmd;
 	unsigned int delay;
 	int retval;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index c3d82b627210..0403e285eed4 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -107,7 +107,6 @@ struct gpib_select_device_path_ioctl {
 	char device_path[0x1000];
 };
 
-typedef unsigned int t1_delay_ioctl_t;
 typedef short autospoll_ioctl_t;
 typedef short local_ppoll_mode_ioctl_t;
 
@@ -152,7 +151,7 @@ enum gpib_ioctl {
 	IBSELECT_PCI = _IOWR(GPIB_CODE, 32, struct gpib_select_pci_ioctl),
 	IBEVENT = _IOR(GPIB_CODE, 33, short),
 	IBRSC = _IOW(GPIB_CODE, 34, int),
-	IB_T1_DELAY = _IOW(GPIB_CODE, 35, t1_delay_ioctl_t),
+	IB_T1_DELAY = _IOW(GPIB_CODE, 35, unsigned int),
 	IBLOC = _IO(GPIB_CODE, 36),
 
 	IBAUTOSPOLL = _IOW(GPIB_CODE, 38, autospoll_ioctl_t),
-- 
2.43.0

