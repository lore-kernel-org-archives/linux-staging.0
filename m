Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E325241697;
	Wed,  2 Apr 2025 12:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598092; cv=none; b=ZcVm7M3VlzDYLF3iNyfe3IC4LWmWGuoMje0Eh/I3v3xC1WzH+jpmJ+NczQyrz5EU+roUgfuy6eU8hgnFn4U6ivmJ2eJ8muTKxZ2lT13dvLGUHPbVV1uWIBBsyQ3giKQbZrDsg4yZ8qWhhZ8pzMtkTUsdi9A7Vi4bQcznSmfKPII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598092; c=relaxed/simple;
	bh=gJR2vqorpVwZErAmb3XaISI/AYZE12CiUuRkCzdjxxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i8g3GRNI4Y23KkwGrt8nz5kED+zApI00pm84a/2mjtFp7FUfXUjvV30QFa85jog8jWrj0NNH37YK0/PQXjbmLhE6cN37FKU+dH8q9YqGhT/7mALK/o7XhSDcnSvAnPIFh1NGMl7JlhDx6hZcopeqSDyzUzySEuH59i8ClVqcx24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQMEp3vd; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQMEp3vd"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3913958ebf2so5094668f8f.3;
        Wed, 02 Apr 2025 05:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743598089; x=1744202889; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sT+yvPMemtPOR/HKjNs6XD5v3Nsj8KVdns4dq/Y7ql8=;
        b=NQMEp3vdSGwM0TkK0LmwzU/sOulQB+bIZY9x1DQB7ZkrMzlynnLN/8XfPmXp5t/mxH
         2mDpCvU0VvQ48nuXuUzgKUmU1i/9f91PMHWZBXtlq9WVOCmNahYMRYkwv8l0Ij6ObHjj
         GE8vGfhuTTuHbNBr4J+xRW6gSG+qsjuv+uz5dAGbptqcUQRMCXWqxteogb1Z0XSJyhpK
         r4WNu7OSQRGRWoHxRLpp+MtpvOnBYyGNyLIckNVR20zxF7r+YUaYtXtkPwCrP8X1f16e
         F41rpYGAE3wJEG6rYpVkZwrLlnliyawSUVgYZ8vky8Yr0GhaJX5gJsENvuIRPeqbbi4H
         IkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598089; x=1744202889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sT+yvPMemtPOR/HKjNs6XD5v3Nsj8KVdns4dq/Y7ql8=;
        b=RNL8VVcdDIjp3alSE3YNHhq4szc23KKWSR4bnQ7XNvdDHnh6sdjJE429Rk8eob+4/g
         n7S2XsUlm3zk7gluPoDp1igTR5xbrwS5AV7wOF+GtfWgaaRqcR7/hDgAENpgpeQCuAJl
         LMLBWLUBYpCTirkODGtOV0BVUZFQHjA9YVvZ+r3oaQtClT7A4YocjPF/Q9yWI3JUIkDG
         izRphwCgRWFd7TH9yBkAmCCu3cbHuLMiDitfbEdA49BdRYsuaMvWGcu2KamN6BrmYaEX
         vbhXIeeqXZlC1W1avC19J3o0VLI1htpXEgFWGdSZeCRMgOKwGPISCcn83SK0o3byBmQ6
         mwFg==
X-Forwarded-Encrypted: i=1; AJvYcCWUhKjHjyVIUv7zCl1ZWOxURN6+QHVox+xjwvNFAmTYHqZLKOj95PBiqxgEGl9vCfiXxLhQ1WVINcOhRNtM@lists.linux.dev, AJvYcCXVGOADc9ILmenRz2zvTJ8pZ3QNs0yMiwSqGpt5nL//6xvogo0H2HiBk9iLeEUX7sWKRn2HmL/9XJwt@lists.linux.dev
X-Gm-Message-State: AOJu0Yxmt+KoMFPMz3Ao8NjNEKovwCOR3gwcV4oIXHLWqcuBM/hATG3O
	sTmxpav6OGn2dyONcgSqU7bqDa/YMEIoVZDh2ByX9fHwHOqNbl4RGsylIqdCGSM=
X-Gm-Gg: ASbGncta1X9uZz7sXsRH9RK3QQyKtvmyUx+b+qam/Ye0PPmZI+M7Iq04c7qOIR2ADS7
	anauIagc8c5GsJGL0VOE/iopfOzXcmdHtc24P4zW6FiQ1Jk2VR0/tDwLRgwp919KnnLrNyz/5Nj
	Px2Em5lxLDx+iodSbFuFW/69PJkAhZttPV7eH8PlWLV0m98pbBnP4X8NFQJsT9CGhsUTvs5CnsD
	BOmSTKw1EqSepe0X7Uwl4cucvkCaUKhBc7os2deT64KxJCC/qBT5NdXJbVZw4COGrDfA9avFM9c
	L8iRlIGb9WrwIb3ck1yvWHA+Oo4zmNyzdq4MJalQlUisSocAEiZs
X-Google-Smtp-Source: AGHT+IGnc011EOBPeB/NrESCecedPvm684BUXOiL+FPzCD08PsPKT4rS32n6UjnY5bJR1s9NfzrUdA==
X-Received: by 2002:a05:6000:22c6:b0:39c:1efc:1c1c with SMTP id ffacd0b85a97d-39c2976984emr2071008f8f.34.1743598088696;
        Wed, 02 Apr 2025 05:48:08 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb61b6cd2sm19675985e9.39.2025.04.02.05.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:48:08 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: rtl8723bs: Use true/false instead of 1/0
Date: Wed,  2 Apr 2025 15:47:43 +0300
Message-ID: <2d7f7db67520fa127b81cb200a67304dfff2eaf7.1743596287.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743596287.git.karanja99erick@gmail.com>
References: <cover.1743596287.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

    standardize boolean representation by replacing 1/0
    with true/false in cases where boolean logic is implied.
    This improves code clarity and aligns with the kernel’s bool type usage.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index a389ba5ecc6f..fd04dbacb50f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1358,7 +1358,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 			u8 *mgmt_DATA;
 			u32 data_len = 0;
 
-			pattrib->bdecrypted = 0;
+			pattrib->bdecrypted = false;
 			pattrib->encrypt = _AES_;
 			pattrib->hdrlen = sizeof(struct ieee80211_hdr_3addr);
 			/* set iv and icv length */
-- 
2.43.0

