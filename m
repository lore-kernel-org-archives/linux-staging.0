Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4CE39867;
	Wed, 13 Mar 2024 10:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710325425; cv=none; b=YubJ2fdNAJeBLldMBQDzTDPjxFsrXmyqaUUr/nS83ZCJJ1bbxG4Z6AaDm0CIcLnWrPtvImG6N7pXSP7cCQtOxJ5VxUgPIIwX+QuyFZmQ/MIxS0o8fUYtmXS9ACpmfGgzf1FeMLDjhLRFMmzlTUVrOUi5P/bQPZ+YaUfctlB1KpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710325425; c=relaxed/simple;
	bh=7HxkYOHdvLa3vDWYcxeLYbaF/zPaQQMSyz4PwtWYdlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i9fXOVchZWpIni199GvsMWydbHHzIhgSuBnw0sfoPoPafitzuLS3bOIEnBxkGCbN29Xi151WBlH+Pu8uCPcwbx3hA6vP7pfxPnlFwBQewOlLSdUC346bJwchpZCclx70eru/xRmyIQNR3hT4H6l01sU6tcR8diw/nt37Fv+p8ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZupKiyQ; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZupKiyQ"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-221ca677834so419562fac.2;
        Wed, 13 Mar 2024 03:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710325423; x=1710930223; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bg+zFCejMNEntTHWqdq6Zt216uKhJFYmi4RiiUYU3I8=;
        b=TZupKiyQ1EgOTGTKnjNQwS9ZZeCgHbHJuGuALXuLjym5c3qXwWRFLlqGjFS0F39VfA
         USCzbCf9Pqq5McYlUvr18qx/xKSozy8SifPjE1PZqCxkkYzanKcHnNZp/yoBQkRUPoTh
         BmYA6vTFgguNm8AlHzvSFXQfbtwH3fuOdBL5mhf602bLXrgegnXhLsU/95pCQLKxq8Ui
         SW1vwxrn4fFDwAtF3WtzP/tvnTFUnKOFWBRTJXsFGdmN568KDK52Bk4mSCJWHyhCv8Yg
         hPMNXNzz5o3w0BoR+gpmjiwRaaZgj03J8D1lEbXqJa2XsyRpoeyw4gZ2cF6EFVm+Fu34
         QBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710325423; x=1710930223;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bg+zFCejMNEntTHWqdq6Zt216uKhJFYmi4RiiUYU3I8=;
        b=sv3SANGuXYWv3g4mC697a9jpQCJM5TXMsTaaBk2fD0np8CMdgoqWQwGR5j5zpYEa36
         U3Q9KajHczWVz+CVyC5Yt78An+ZZWNrO7Lz9oJEAgDugvQz2QJzBEi07blTuCy5tHSka
         RLpI8kjOQb1pgveB8bTZ24ctcXzpN5uLGP7e4omUxxlJOEIYkgHX8yDH7lfi7iV/r4Ux
         y4NSGudpF1y0/AP9vBP0h6h0z2Ce3ot5rOzJb4v993g6uPc6ch4moe29X/1haT0Q8mxC
         2dwyRCkxCl4fA1ZVW7ZzxwTHd/ZuJj2hClIdJJauUF4+wiUj5m5207TVTQUygHi0ZMN4
         NR9w==
X-Forwarded-Encrypted: i=1; AJvYcCWThj41+2eFYrKXA2tvaZlBdfUU2MlG5oAIpWI2nIxPBhYNdvk48hDtMZnrgjnpKofasTAz6Kt6bPSDxXAv5yBT5SQo+ICNdiL5QcfzJQ==
X-Gm-Message-State: AOJu0Yw2VBtaKCVkYVdcU92ZzuGAkq7OA97OpJjDpyAYhU6kInP/0iaw
	cFPTIxffRcsA8eldLDIxcfb7yKFTNtV83w+0deWcIabhhIS8Ft4/UXUyJZ4Ry+E=
X-Google-Smtp-Source: AGHT+IEzvOD7FNKQGGcWoTqnHsGpNrL0vp+14BGND2U9/27MeFjrArd97tKs/A3AgD8Ii7l5esAXsQ==
X-Received: by 2002:a05:6870:1643:b0:220:8cc7:253e with SMTP id c3-20020a056870164300b002208cc7253emr6651488oae.22.1710325422770;
        Wed, 13 Mar 2024 03:23:42 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.67])
        by smtp.gmail.com with ESMTPSA id d8-20020a056a0010c800b006e685c36d41sm6178544pfu.55.2024.03.13.03.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 03:23:42 -0700 (PDT)
Date: Wed, 13 Mar 2024 15:53:38 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v6] staging: rtl8712: rename tmpVal to avg_val
Message-ID: <ZfF+qu+CGHlpHrtY@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename tmpVal to avg_val in process_link_qual() to reflect the intended use of
the variable and conform to the kernel coding style.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---

Changes in v6: changed variable name tmpVal to avg_val against a clean
staging tree
Changes in v5: changed variable name pct_val back to avg_val, as agreed by
Julia and Dan
Changes in v4: changed variable name avg_val to pct_val, as suggested by
Dan
Changes in v3: changed variable name tmpVal to avg_val
Changes in v2: added a period in message

 drivers/staging/rtl8712/rtl8712_recv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_recv.c b/drivers/staging/rtl8712/rtl8712_recv.c
index a3c4713c59b3..1fabc5137a4c 100644
--- a/drivers/staging/rtl8712/rtl8712_recv.c
+++ b/drivers/staging/rtl8712/rtl8712_recv.c
@@ -861,7 +861,7 @@ static void query_rx_phy_status(struct _adapter *padapter,
 static void process_link_qual(struct _adapter *padapter,
 			      union recv_frame *prframe)
 {
-	u32	last_evm = 0, tmpVal;
+	u32	last_evm = 0, avg_val;
 	struct rx_pkt_attrib *pattrib;
 	struct smooth_rssi_data *sqd = &padapter->recvpriv.signal_qual_data;
 
@@ -883,8 +883,8 @@ static void process_link_qual(struct _adapter *padapter,
 			sqd->index = 0;
 
 		/* <1> Showed on UI for user, in percentage. */
-		tmpVal = sqd->total_val / sqd->total_num;
-		padapter->recvpriv.signal = (u8)tmpVal;
+		avg_val = sqd->total_val / sqd->total_num;
+		padapter->recvpriv.signal = (u8)avg_val;
 	}
 }
 
-- 
2.40.1

