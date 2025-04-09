Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D72D27933D
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222210; cv=none; b=GTb0BiJu2WCouirkFmJqua1rpMW1m6hg7wnLC/0qChtS+Z+Hjd/w8C21y9gTBSxCHH5YGYTNeBF8aFKpaD+1kfGk7EF6aRz08EmkXc1FeVwadmhvQUhKZMiS4+1uTYgXCTNosCVxdC/KLb4mYfDWdqU9d/0Qs2JqHN6r6+6YoHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222210; c=relaxed/simple;
	bh=3aL+YmiC+SS2Eb9QJHfwgiTSyIEZCDR+E6UJpe0GC8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jAniyhcQLF+gAfwipf2lQkE+blzpdKA4iAYpoeOEv/Wzj3UHPoP3dzS1ucUZhBY9SDaZGsbtDSu9lDXUc9BdYqoOQjB67zk4y8qDp/homSqAOXhgWRLuV6VeUtjk2kPLhcKbhdTBiZMz7KNyckZozKYyIalX1V335fdRo2T1uVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=apApvUMV; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="apApvUMV"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-73972a54919so6930827b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222208; x=1744827008; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkTqioEDhh+jPgNizGJ1BGNiQAOUU2HAAFBf1hjLXTw=;
        b=apApvUMVQwa2kD1KmpGJKwEMcNDrB4uuAM4qXMppnQWvN7RzXTE/NFG3ujZ9yGy++o
         1rmBEqYZ52eTOcx4FJizxxt7FniC7vNzZqzupX1vYgkOrlSZD+rrTYJutCE9X7Obs0/A
         og8m3A5d89vUioIsvZr9nRrGk/lfyCDkVY+pP3xEjXlMv/dpWiu4Bzdl9qKzhbDOFIN+
         Km4l6/3s6GlwrsVYMHEeONlB9849DIlyYJTHE4WEQA09fDWakHWQGKDvbjN7thoDPaAb
         TDMyBRYLc2o85LyHXu5XVXe6QMBBYB9K5GXk00Wb4HvOBW14Xp9eKGFHtM6xPibzSrSr
         PjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222208; x=1744827008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkTqioEDhh+jPgNizGJ1BGNiQAOUU2HAAFBf1hjLXTw=;
        b=PzybSos15mvZvzuRXLSX9jdWbvtunC37pD5qK6zYgyFzf2w+R+r7pGg3fGs53AkgJj
         t316S7cJeK70ZSeUFsAT13iapiVpAVyrZ4pEG9QqQkoEN2f/Xn9degZDITJzKzSF8uYy
         6t8SLd7VzI0GMdFeZZ9EBnmkiKBQYXVLBMuzg7CXkiWlcN9OLHKOntcF1L8C82487rc4
         6HMr0ZmcUKCT+fs8gQhTx2Jd0AA0G6AkwWhaRcqrcws7hQCRUad1va38SO+oHX4/Kn80
         J087M0xQAnNzMW/37dHZGBh/Kjb08pC93I/Ogx0hBIIbTL5WeqdYntqEarqed2BEB5ou
         Xu1w==
X-Gm-Message-State: AOJu0Yz+3SBCbzbTriAeBeQfP9/n8UEG3GRYENb7aFwtN0qjTBQxZUYQ
	+VnFSzbocJFDf66rUAUZaRC8/xAY0fMGn10pS0RODqiRHtjzx9oEf2rfnG3csg==
X-Gm-Gg: ASbGnctBWwD/T1tdp8TpvILdBxqG+ZCh8SGuChuRGXy4a7q+f0tbjKjSOmGO/tTA2wA
	/TviO0o1wWN1DcXA72UXvcZrxmPq2jUN18JnI0JjQYhbNT9v5Kt5yx+6Zand/K007Gi9ck9h8Wv
	XrIrRlT+0A9G9wsBXXOyJ76W8rs4/h2t978+XMDFXPEM4IMZwpy+S0UVcDbyr+zPu4ty0ojvABU
	Q7/RhmGXTjI5eO9pDtxcwPAJmFZ013PvuQc/TA43+ZknDFCqz67Mz8S0tv3myZdd4XZuluotjfP
	Hylnw94gsvAmz5TrAKK71fKq4uPnMcHj0lrmCy4BFvZcJ40UzzIMrWMTQYud+GNhlCRckNIra8d
	Xbd/0aQ==
X-Google-Smtp-Source: AGHT+IGzVtKhuBPRRIe1GJNwyRU4ZmtCGrNGkZk4BG/oYcqnZ8WrYNJ47cvuylIe9m/P46TDSnZGog==
X-Received: by 2002:a05:6a00:2292:b0:730:95a6:375f with SMTP id d2e1a72fcca58-73bae490ff7mr4786676b3a.3.1744222207657;
        Wed, 09 Apr 2025 11:10:07 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a322116bsm1540144a12.63.2025.04.09.11.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:07 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 10/23] staging: gpib: gpib_ioctl: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:40 +0000
Message-ID: <20250409180953.398686-11-matchstick@neverthere.org>
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
 drivers/staging/gpib/uapi/gpib_ioctl.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index e903ec1fe274..2d2a268d8573 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -39,7 +39,7 @@ struct gpib_close_dev_ioctl {
 struct gpib_serial_poll_ioctl {
 	unsigned int pad;
 	int sad;
-	uint8_t status_byte;
+	__u8 status_byte;
 };
 
 struct gpib_eos_ioctl {
@@ -87,7 +87,7 @@ struct gpib_select_pci_ioctl {
 };
 
 struct gpib_ppoll_config_ioctl {
-	uint8_t config;
+	__u8 config;
 	unsigned set_ist : 1;
 	unsigned clear_ist : 1;
 };
@@ -109,7 +109,7 @@ struct gpib_select_device_path_ioctl {
 
 // update status byte and request service
 struct gpib_request_service2 {
-	uint8_t status_byte;
+	__u8 status_byte;
 	int new_reason_for_service;
 };
 
@@ -121,7 +121,7 @@ enum gpib_ioctl {
 	IBOPENDEV = _IOWR(GPIB_CODE, 3, struct gpib_open_dev_ioctl),
 	IBCLOSEDEV = _IOW(GPIB_CODE, 4, struct gpib_close_dev_ioctl),
 	IBWAIT = _IOWR(GPIB_CODE, 5, struct gpib_wait_ioctl),
-	IBRPP = _IOWR(GPIB_CODE, 6, uint8_t),
+	IBRPP = _IOWR(GPIB_CODE, 6, __u8),
 
 	IBSIC = _IOW(GPIB_CODE, 9, unsigned int),
 	IBSRE = _IOW(GPIB_CODE, 10, int),
@@ -133,7 +133,7 @@ enum gpib_ioctl {
 	IBTMO = _IOW(GPIB_CODE, 17, unsigned int),
 	IBRSP = _IOWR(GPIB_CODE, 18, struct gpib_serial_poll_ioctl),
 	IBEOS = _IOW(GPIB_CODE, 19, struct gpib_eos_ioctl),
-	IBRSV = _IOW(GPIB_CODE, 20, uint8_t),
+	IBRSV = _IOW(GPIB_CODE, 20, __u8),
 	CFCBASE = _IOW(GPIB_CODE, 21, uint64_t),
 	CFCIRQ = _IOW(GPIB_CODE, 22, unsigned int),
 	CFCDMA = _IOW(GPIB_CODE, 23, unsigned int),
-- 
2.43.0

