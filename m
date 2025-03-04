Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EFD259CA0
	for <linux-staging@lists.linux.dev>; Tue,  4 Mar 2025 19:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741116417; cv=none; b=andUMImXGsm5RvwyxAeHt7q1Jq/m4F2DoRFSI0803YqBSuzS/RNgoRJRa9OEH9BIctpVrdkSqgPS/gu1rhg7f0vfARdgskcIviqGg63BBQbEb/I+TIRXZ7ZoWMlv/CKWesx0Vl+ai9LTjxYAap+V+orOrDs/oGUuHWeLtQWOgHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741116417; c=relaxed/simple;
	bh=DAdX4OpccQ4N/WOgqzCYspVQp1sfDjoox8PLWuX0yz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jWDu8mI5KvVMwjFtIYT1p2VvECCu6xgAgpB8ebpYs/jsHqR5EIGPl564kTs7cbeF9LJWmxmgZqulXZIYnotzcf8rQ1JBySGl8m5HhKXh0r3UoJMAmcCs5IPS//WrfDtmhHh1LfR09z6yPApLonNLNVeRH/5snTUP65sOIV5pIEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEXPFGzK; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEXPFGzK"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22367eba6f5so12898875ad.2
        for <linux-staging@lists.linux.dev>; Tue, 04 Mar 2025 11:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741116414; x=1741721214; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0a3i+UFmRGSl/m+YRIPURF4olKZ+jWt/8woe5airEEw=;
        b=IEXPFGzKs42rfqUJYJeXq4rzuU3GKCyZaMDhXygbqlg+h6J20oXeyChdC3gBKbnBku
         oZNZngZsrd5BBmOjSgT+TUd/YIvwls1C9/4DxMzZKBAuaydiJAtBcaWxzGMmBnEkuJSw
         5ygQ7rbMGxrg84YdVA/KA5pAtu05VgZ4Vj2onQT5Xx3c+p3taUd/Gi7rqNPXSHCf1ZOp
         OXdgRCrIzJ0EkxBqnSLikZMnawCLPyScGURR8jMzjDvuFx8LBOBXR2EOPIdXLF28AegO
         lpdW7iXQpHW9PVs+PB2CtwMrv05fXfqgby2GWxdhCNvj+aft4hz9uMr9Ed0evmE9roqS
         6JdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741116414; x=1741721214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0a3i+UFmRGSl/m+YRIPURF4olKZ+jWt/8woe5airEEw=;
        b=vffy+pZBSUx2LzZl6F5sENPxENvMhPDIU04DdKWCpXDC9ioY5iZDlZufgPSUiXkcLu
         dEFoORkgH4I6Z3sZYUL8MYB16HnaQ7HFdDvB38+ejPJcISMgpBIMRl5joQC1UL9SPCH5
         WgaSdSj+UlERZiCqkZZIzwfdXSlpTThvpFrz+WFmnu1Og8VgThRfQOhIEs9scEpPINYd
         N35SmytehLrlmzFl8GnosfY6bfFqRM7y59ShII+Osjb8MRsEfSMysMIQjPwBd5CCsXv9
         sO3WjgmKH5gDYYU2qEcoxGWIuzKJ1/kfE5YO+iYQFNL4Or/kv3iVx+kNSCHw8vDBaPn0
         hQMQ==
X-Gm-Message-State: AOJu0Yy/+CrZO3N+y54L7w+UV36HrQEnPXm4IGb3WdBCW1LKHFvhoFfs
	rkzM3hFLdCmHLnE3Vp+NLM8z6BBu+wC52sdpF+goMohjM+8d/I1jz6f+wQ==
X-Gm-Gg: ASbGncuIM8d2gmobU5r+UMTNEEARli1c+Ftf2ggbgQqWCv+y8aPYYV6X6WhCtfRt8a5
	1lG+BdqIMtuYo6JmGaW9XvhLx2gaTrosPI8jZRHgHbSdgHLS1sah9WCiGH1sQSZNCK2ZMPXiET/
	s6mIk8997MbAwPBmaGphkzh3p/E4B0GUIBNbsyMv675Hw/zXgtqWL5Nk0ar1jHzmv5oCOgDm4DH
	20ycjBVpeYVFVh3JLWq0xn5hbBCS2UuCMu484f/XQ9mck1CmhaTIu/0/zT8CQBBhoE8MXneu9Xy
	aCQPuuqOEB8E3Lce1TzmfRcdr1FzDDG+3RGJ0BEUs0YVOL3tyx6kz2Misw==
X-Google-Smtp-Source: AGHT+IHsR5Gyj3IQ6WCJBUcHLaPvJEGRp0u+lrdzKgsHJz4jWIFjmVkczlI+pasHGBKFEHhUmAp9cQ==
X-Received: by 2002:a05:6a00:21cc:b0:730:915c:b77 with SMTP id d2e1a72fcca58-73682b5b913mr54849b3a.1.1741116414537;
        Tue, 04 Mar 2025 11:26:54 -0800 (PST)
Received: from localhost.localdomain ([2802:8012:1f:3200:f1d1:c186:ba5b:8f06])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734d444a9fasm9341920b3a.60.2025.03.04.11.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 11:26:54 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	arnd@arndb.de,
	niharchaithanya@gmail.com,
	jiapeng.chong@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	Gaston Gonzalez <gascoar@gmail.com>
Subject: [PATCH 2/4] staging: gpib: fix kernel-doc section for function usb_gpib_interface_clear()
Date: Tue,  4 Mar 2025 16:25:39 -0300
Message-ID: <20250304192603.40565-5-gascoar@gmail.com>
X-Mailer: git-send-email 2.49.0.rc0
In-Reply-To: <20250304192603.40565-1-gascoar@gmail.com>
References: <20250304192603.40565-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add '@' character in kernel-doc comment in order 'assert' to be picked as
argument by the kernel-doc compiler.

This change fix the following warning:

warning: Function parameter or struct member 'assert' not described in
'usb_gpib_interface_clear'

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index eeabbdb39057..090857824d07 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -621,7 +621,7 @@ static int usb_gpib_go_to_standby(gpib_board_t *board)
  * usb_gpib_interface_clear() - Assert or de-assert IFC
  *
  * @board:    the gpib_board data area for this gpib interface
- * assert:    1: assert IFC;  0: de-assert IFC
+ * @assert:   1: assert IFC;  0: de-assert IFC
  *
  *    Currently on the assert request we issue the lpvo IBZ
  *    command that cycles IFC low for 100 usec, then we ignore
-- 
2.49.0.rc0

