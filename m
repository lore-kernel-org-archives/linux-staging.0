Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E5D1ACE00
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 04:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725855322; cv=none; b=lOgTvtdDJIUYjKSTpkTqM+aYbnLVdujv9uK3dw2SDOdz4LZxfDaSomILloJF7rEDbh/uYxPslHgv4J2rmEwFQurEueswzchhTFmkofe3YiZ7HivPycxyEz/DK4f/kiUNWFGaKDeZfOqSKu2SGwLMM2UMMxv4N7KOUBPqcDn1K9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725855322; c=relaxed/simple;
	bh=x+8U0C7QkL36TPoIe1zSzWamAm0OR18bcKXmz27+cRs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zv2Y3jCWyU8lr7a5L2aiVy7AZGJOJKMgXFEM9SV0vmke9vNqQ6fxb4nKStcuolbMoyzY4iVYoXQPTNLPH2gT4V4yjZC7fPM92LQ8IYoaEn1MSmHUSYHD9Ch85Q+IUXIX1hRK3aSwYKQV16LRiCHWIa3PmB18CAoloaA+SJmEaxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ilx85Y4K; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ilx85Y4K"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3db3763e924so533748b6e.2
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 21:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725855319; x=1726460119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nqaKTzOQEAoCmLVc5fe9PS9plUk/uiL0j+yMVGU74Ek=;
        b=Ilx85Y4KjPu7+H9p/yQxIGNw0wbCALAVeeQwTlqzENHIKQoNGGk+Wq9XTpj1Caxup7
         mG3oB6qaoXPBYE7hVx/GI1wRzOx4fzobrvXHMTZAVbM8ZrXrnrH0YhfyV8DafvbFcdGJ
         YOaOAvwCdKI+TKepluxVfzOc4a6utxmST72FQvSeAE3D6GKGcw7wq5UUI3/y6cuDRnSG
         hgOeyZ5kWocqr1vw7LSlSimi6sNdCOnNm2XGVxctQZoXKp6ifOfEKRtyFsqSQ7WGB0C3
         j5mTztoZfV6wW6B7iQoP9b0fs89+ehrFYLx+4VmSQ2Icc1SE7OpPUmGj2R+TSe1wgsEl
         +EHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725855319; x=1726460119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nqaKTzOQEAoCmLVc5fe9PS9plUk/uiL0j+yMVGU74Ek=;
        b=dzFN7tBLDIzCI46/fPVg8nrlvTLrisgkbfnpPn5SxK7mERbDgpQaFnDY79gslpVPn2
         H4Vo34FzQvJEp90RMuEUxtgynQhOeD+66sZvsnnCHXbuHEYxLMuhBeHNGHWjvF+YL+aR
         bShcRWDLwW1bDRWcr2E5xwzoRXI5plCUJh6syl1cbq4INHAg0ad7CbMRFOvmddE2N0LP
         SO/8Rynog+a75/geP5e/jsetxVH4QKxRs59BIGMwmTXJ/cVmEOAdQ4MQFx8A/f8NW6Fw
         p6/RslUgpXMx9fhLzJdg7Faxc32iULPbGu7WtqKO4xBDWjoPLl0KUp8oW8U34X8hotXA
         I5tA==
X-Forwarded-Encrypted: i=1; AJvYcCVt/bOhO4dpujjsuZonAQS84FTjwXNDroCNo5cZUskCoGU9R8V2uSDSJqWIgEP2cpNHJrypgYpiIjWmrtnx@lists.linux.dev
X-Gm-Message-State: AOJu0Yws1xr/9Y2V61gATtthTfyPRD6ShThrkYwqTckITK9ODZyV/Iru
	U33wdhs2FsmlH8PKG/LCx02zikhJjceWMIp6nAE1x/b1fp76ikeM
X-Google-Smtp-Source: AGHT+IFebW/lH6JfzbyrfIXsthW9Pkx7kSX8A+kRX83nIqcl2Tpia01HTOGiXVJSGI3Ka459SzTxhw==
X-Received: by 2002:a05:6808:bd5:b0:3db:4367:c05 with SMTP id 5614622812f47-3e02a037536mr4987168b6e.7.1725855319241;
        Sun, 08 Sep 2024 21:15:19 -0700 (PDT)
Received: from ubuntukernelserver.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e5991331sm2651901b3a.196.2024.09.08.21.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 21:15:18 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] staging: rtl8723bs: include: Fix spelling mistake in rtw_io.h
Date: Mon,  9 Sep 2024 10:00:08 +0545
Message-Id: <20240909041508.2412-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes spelling mistake to increase code readability
and searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
v2: Created patch series as suggested by Phillip
v1: https://lore.kernel.org/all/20240906141104.10076-1-topofeverest8848@gmail.com/

 drivers/staging/rtl8723bs/include/rtw_io.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index be9741a056e5..0ee87be6dc4f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -13,7 +13,7 @@
 	Otherwise, io_handler will free io_req
 */
 
-/* below is for the intf_option bit defition... */
+/* below is for the intf_option bit definition... */
 
 struct intf_priv;
 struct intf_hdl;
-- 
2.34.1

