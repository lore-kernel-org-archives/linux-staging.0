Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCA51170A;
	Wed, 13 Mar 2024 05:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710307469; cv=none; b=NgAvuDzNtDZhRux4+l97ifa7KLO7xjwFTJkCyNS9sJzF1y03YmtOTimSvN56nHfn1nxt3rP7Gp4gjkYskRHwWLJMa23YQT6xrndtuztv2vG3EM502/Oy9sRPNq+FEbj0b7C+RFff/Ams+ZJMsZurjxRIb6ZtCyz2oVkh2W9bHRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710307469; c=relaxed/simple;
	bh=qpIypB8WcF7kHWP8sQXT/y04bsj8awY5629fpJsi5bg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J15AHRwlZyGMjSrEePw9312mA0qmaBEP8gXMqq6KAkW/z/O1VEqWiES9J9REcYmgHlA10VqOlThWVoEszeZe0O0qYoUfyoMxj9FkRnpK25MdbsXVFUkuszdSykRcTZxLDo+GF+JvbR4TJ9KIvk99F1iqlQS+ARAHbKrWQipxfP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhNOXTxC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhNOXTxC"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ddbad11823so11982435ad.0;
        Tue, 12 Mar 2024 22:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710307467; x=1710912267; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G8Ujbc0uorKR7iJQIvU/pWAtBegJQ/IssHdTYPNNDzE=;
        b=bhNOXTxCC3ovITjCGsEpaT/eR4sKEYbmp3JNRFZKWXe+KHWARfqUHoCPb7IKowmmGF
         27kAY+n4LpNL5fNA8Wzt0lAKCrxZZGEqxhzy32AlqGmC613sPkQh+x5Rt3aPH5Sd0Oxa
         blKKVcloKZEcUFcNjHoe2TXfDxduTxmF7pS5jxtlGnV1rKFcjSxh3N6+SLX3+HbKatfz
         TgR+pcSj8tkIeWnCEH1vQQBvN4bHqcYteyE/g9PiEOcHCweSoZGefuPYzelUsYNzTSp2
         a/ygk0WEnhMGyyvRUSelHAsVy6g9Ay/q97BrAExK4hqyPRGOyv+MXJaue52uQIGuUg/w
         xK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710307467; x=1710912267;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G8Ujbc0uorKR7iJQIvU/pWAtBegJQ/IssHdTYPNNDzE=;
        b=foGZ8oB9Ly0bspuHxSC/v8vIpZ5vE/d3HNDhQywbv1pepklb+VJvOY+5ZQ0F4OUe1D
         v4geejJIBmBcRY945YaPdj3uJ2W+JUt83Yidmm6It/LPsgig1RlsanhTZSJrvTiyGc7P
         Irl/NwHKVmU8tjCdlakJ0BotPtvKd9glbLVZW77gaSYu5CONBxbTjR8qmsSBsS55SDMK
         vJNycwj/L00k33lgB7NB7Mc+6xPsHJswHi8STqNea4snqQ2HETmiRMp3jB9o7smtzRHq
         IP5vp0bcgQk46rr9QIgWswwcGRruc6Mx7lrFsF/LyTZAK4b3FPYBdEFCvhQWEK4EXokY
         fqtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3FCq9FuuPEavHjdZ+RU3S3DdYvGOh60Xe/+38Jdi8jXdhHDjbxR+g13eT2oU2yW09VX3G5xkAirDjOUj6XN0kzsNOsJ/LGF/aPifWdA==
X-Gm-Message-State: AOJu0YwguMRVCpH+yTmvNa+fiY++baIip9HxnGq9m+C2GdzHLXzXJPgV
	ViSJDd6aNqCKIyQPo9TswUt1zEDyvvfIkx0MgWt2hocCD/nIdCxDbWOMzBxURYE=
X-Google-Smtp-Source: AGHT+IGF71tvtFMzeowtGndCZgs8bsvRaTbVptGpopMBIMFMaSEsFb17m5ypAyW3ZqI7ev9FO0xt8w==
X-Received: by 2002:a17:902:d2c1:b0:1dd:a616:820a with SMTP id n1-20020a170902d2c100b001dda616820amr7108857plc.8.1710307466970;
        Tue, 12 Mar 2024 22:24:26 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.67])
        by smtp.gmail.com with ESMTPSA id ko13-20020a17090307cd00b001dcc7795524sm7673178plb.24.2024.03.12.22.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 22:24:26 -0700 (PDT)
Date: Wed, 13 Mar 2024 10:54:24 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8712: renaming tempVal to temp_val
Message-ID: <ZfE4iDfGUyq/C9s4@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Renaming variable tempVal to temp_val to address
checkpath warning 'Avoid Camelcase' and to
ensure adherence to coding style guidelines

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl8712_recv.c b/drivers/staging/rtl8712/rtl8712_recv.c
index a3c4713c59b3..7fb9dfaa7448 100644
--- a/drivers/staging/rtl8712/rtl8712_recv.c
+++ b/drivers/staging/rtl8712/rtl8712_recv.c
@@ -861,7 +861,7 @@ static void query_rx_phy_status(struct _adapter *padapter,
 static void process_link_qual(struct _adapter *padapter,
 			      union recv_frame *prframe)
 {
-	u32	last_evm = 0, tmpVal;
+	u32	last_evm = 0, tmp_val;
 	struct rx_pkt_attrib *pattrib;
 	struct smooth_rssi_data *sqd = &padapter->recvpriv.signal_qual_data;
 
-- 
2.40.1

