Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D801CAA3;
	Wed, 13 Mar 2024 07:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314002; cv=none; b=jnmFRuXt1vB9TKUQFA9lph2cQytwTQRWlCl3WcmdtrpEB45A9SmTzXL8huH++N4ESdlmdiTMa/XhD+T9I+sAd+Dsavp3CHtlqd+LigeeBpEdb+1kNwL/8wWyg/JamalW+QTFe1CsJ9k2sJBI32PEwHJOjxAX6ewl1VexZXJwsCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314002; c=relaxed/simple;
	bh=NswmWCAg+kMRO6U9D0wl7waRlD6nXsRyQ2PxmrtRxow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ljuXHFnJgMzlB48Xd7FibR+C+qbcrofgI9HqM/rnczttcXcDBMlxZpyIfQ+vD1oFPv05OXVjslkBXZtkKpIN1/n4E6QgCZyd8xeUGeCJ71Vo1a/8WbUziZXg0NNtQgYLSi/E9ODAGTY3nRQ0AFfmvNHStEdFckoKC5Zh1phRD3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnFcAfp8; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnFcAfp8"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1dd59b95677so37966855ad.1;
        Wed, 13 Mar 2024 00:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710314000; x=1710918800; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oBO1QyjEKgY+z+cbFw6h6LK60G04OlYaLIToSeOvUhY=;
        b=jnFcAfp8SvmCxPLWro6st/UZRMzRHU22jBlTbq8ub1DKBbjXI8YefwNV5HLYOHAmEt
         EibaJbQcpAkEex019h2e4ijjZ1DWMyh+BlrhmcUuPNmcMCgTbyU9Yh8FwubbvJ/UPKMx
         V5xpFqOfEGs2jNHKR8eCBOT0mW0zFQCFSxzPPdpZ660KHuSWCXolLfIjngCoIucqaEyx
         E0+koi1/MNmUO+l9tdJPjX6A0fWHzDcuAA2EjuUMj/Q2qhyNJNH2XgBFnHW8qGenZe9t
         o8StW6H3O0p2bvhsauioAhlQx6U+MuP0j8x82bkfaJ2vuqyxcXngsssK1DHj8EKqcFyq
         nWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710314000; x=1710918800;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oBO1QyjEKgY+z+cbFw6h6LK60G04OlYaLIToSeOvUhY=;
        b=jG+oAKn5/8UEljzo8EtO9wqlDFlXatfj3lyrvFMGD3NQtX2jX70+xNVbHKTF5Gh+J3
         h/jvoSxczN0e2HhVNEcXxnuxpHvh7ZWBC3hs+ocC1WUMWmqu3fP5V+hMMDZX35OMIdYv
         IGBszwtYj4IXNW1CoL/fxrhy1C+Jo1pJArm1kZ97vG7XTemFmhT5hEO0aTkNmp7lG7C1
         KfgeKRYbuXwf+7gQmZw5FQMPH8CJWJEp3pVt46zISeAzMBejeHwqSvPhgK8hnYWQSyGe
         1qoQOqJ85Fj7Lf/oeRA1k6YmBVq/gjkoZoChSE8K0gsL85/9xN3uu3C9gmurKyaAH4nv
         61Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVckTsG4RGZmrinmjjGH5rS/+ajpFz3ZXJ6yjPVX9k5QDPFfK6qPj2RQIDHu/EYg1+E8kAGJU6tgtSDByF4QH2PGaV0wY+HYhzGXrHWjg==
X-Gm-Message-State: AOJu0Yy2Ba+UThWBwyihClPy8KxkNfx88vKgQSedAWw8Gfv5X17k3MJY
	hucYubQdT3UT6krBmJBir42AkNdunrYT9pT+uuCz0v5pfQY7HLd50adHfSTsZeQ=
X-Google-Smtp-Source: AGHT+IFblix/LUHDLSUUvpaHyyUSlGJQl+RzQPyKcxgsHFzN57XwW20vnlxtvFbGF30VidNwlzsWzg==
X-Received: by 2002:a17:902:b691:b0:1dd:6eba:c592 with SMTP id c17-20020a170902b69100b001dd6ebac592mr8500687pls.56.1710314000537;
        Wed, 13 Mar 2024 00:13:20 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.67])
        by smtp.gmail.com with ESMTPSA id s2-20020a170902ea0200b001dc6b99af70sm7806180plg.108.2024.03.13.00.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 00:13:20 -0700 (PDT)
Date: Wed, 13 Mar 2024 12:43:18 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v3] staging: rtl8712: rename tmpVal to avg_val
Message-ID: <ZfFSDoNPjQypC829@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename local variable tmpVal to avg_val in function process_link_qual
to give intuitive meaning to variable and match the common kernel
coding style.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>

Changes in v3: changed variable name tmpVal to avg_val
Changes in v2: added a period in message
---
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

