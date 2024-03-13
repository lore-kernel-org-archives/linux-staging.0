Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5397117575;
	Wed, 13 Mar 2024 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710317409; cv=none; b=Gizwc9kCRvdmv3feWbum5+lL9nxmBe64QdNHMetMNAQCnujgDsueS7p29nhjUqBOALsB2Z7lpMKWuLTrpRCXjhOY6DjUy825u6ymKSq2/4EpUVN3SoCjl2v/NLPU6kIneuvunTbKY607Eke9DbtbNyKGv6kjbHcKqYpVtBDHmlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710317409; c=relaxed/simple;
	bh=1aYyUdHs6ZNxEgcuq5MwJfbs7Xlvs1l7H2OJs44P3yY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C7/ZnJHnGe/Q3TC3ezXIG16ngz8/xAPS7iuINwwIwl/RpQ9s2rvpOBsJV0CJPgv/kR4KQtitX+Iuw3lQivh6PNOD+A+qUSYPzPS+OfMix8o+UzwOyOObUQLf7LA9JUpPnz2fVQZYYnfkf8SrRb8f6GZXX5iLjvm0zUUgy5sOa6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8QMbyKo; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8QMbyKo"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dd9066b7c3so5913055ad.2;
        Wed, 13 Mar 2024 01:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710317407; x=1710922207; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g6yCtmQnPN+6brcAwJa8z6E4LEDE9/Vo9fKfAhNa+eE=;
        b=j8QMbyKo9UJ7+sN0b95w2w4JfsO1oz7t8uOs5hwBVpTCmmttgsf0cmNoKCQ4qoRLHr
         DiN74I7O1hN9WcDuE5GngXs7WXpbnQZdGa1JqnO2wAxgIgk6fAwtHNnH2+VSmEkCYr3G
         YA/IB2K1nLHi+lFpreUnrsMeI318Lev2SjpyVAj3+sh2MmzW0ys7ixRxylCHzTNigKqB
         qOb5tViGnZWPdFBdR7JlQEE09LSzZ7YCDYx5v7oAqiaSXFNS19oODaPWoDQlrlUqzwk/
         yhHaL93bEmz0J2o84jpO1QbElx9c0DFWlK98EMoNtNw8x7hfRvXt14Z+8Lg2QQOp4jbd
         kt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710317407; x=1710922207;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6yCtmQnPN+6brcAwJa8z6E4LEDE9/Vo9fKfAhNa+eE=;
        b=glQHpwPTEyJjb46ah/y3AJf6OsxJZAs/EVo7RZ0orjoEgdDVhI53gn3HIZapNZDlGG
         wBcG8Q95zRl3j59na5vEg1patnbhGJrXemOwW9KMpPsJRPCqENUXZmkSx2Z47cCys/b6
         3etZ0HCaR3DZKUlTKzAYpD/Xgcl2xBG/H0XmqOlqmhTtwR06Y+dVjDdSykIV2A/Yp/Ms
         OSl6cU5+iUv7+XBoXzqb216FhIcgiuq7MWtyQ5CtQG8uKKw2nMvkTphrkG6aMdL08XXI
         Uw/M482i+SKYi0Zy06mJh/8+WVix6VIF3jmizCO2AMkse67nrqoEXVlOZhvznQLSY1id
         FdUw==
X-Forwarded-Encrypted: i=1; AJvYcCU/eU+8TN/kuqbGqcQ/HRmLp/lKImv3NCTP1CYCGsuXOojZAQky2y+qliS94GqiOsIvWRrksjcxfEoOX9LjetT1lfmKty0ePewIPTdPZg==
X-Gm-Message-State: AOJu0YwjoebrylzGLovcZz5p65wzynJpScQZQIxvIdnN8rthFi1Lm9AW
	Pa7fxprItCwfHUJewZ9nbCnmTM499AoXVjYN2vaiib1HsEVcP3xCb6HWA/e2rXw=
X-Google-Smtp-Source: AGHT+IFJwo1OVOqPGdb5xr/cgP80uk2tuy0i1wdpm8F5K4+yOVlNna1jWXfKm/E+qOTECQhHzL2lzg==
X-Received: by 2002:a17:902:76c2:b0:1dc:7fb4:20cb with SMTP id j2-20020a17090276c200b001dc7fb420cbmr5568617plt.62.1710317407414;
        Wed, 13 Mar 2024 01:10:07 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.67])
        by smtp.gmail.com with ESMTPSA id l8-20020a170902f68800b001d92a58330csm8053473plg.145.2024.03.13.01.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 01:10:06 -0700 (PDT)
Date: Wed, 13 Mar 2024 13:40:03 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v4] staging: rtl8712: rename tmpVal to pct_val
Message-ID: <ZfFfW/Flrlzb0+UI@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename local variable tmpVal to pct_val in function process_link_qual
to give intuitive meaning to variable and match the common kernel
coding style.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
Changes in v3: changed variable name avg_val to pct_val
Changes in v3: changed variable name tmpVal to avg_val
Changes in v2: added a period in message

 drivers/staging/rtl8712/rtl8712_recv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_recv.c b/drivers/staging/rtl8712/rtl8712_recv.c
index 1fabc5137a4c..0b13d0a04304 100644
--- a/drivers/staging/rtl8712/rtl8712_recv.c
+++ b/drivers/staging/rtl8712/rtl8712_recv.c
@@ -861,7 +861,7 @@ static void query_rx_phy_status(struct _adapter *padapter,
 static void process_link_qual(struct _adapter *padapter,
 			      union recv_frame *prframe)
 {
-	u32	last_evm = 0, avg_val;
+	u32	last_evm = 0, pct_val;
 	struct rx_pkt_attrib *pattrib;
 	struct smooth_rssi_data *sqd = &padapter->recvpriv.signal_qual_data;
 
@@ -883,8 +883,8 @@ static void process_link_qual(struct _adapter *padapter,
 			sqd->index = 0;
 
 		/* <1> Showed on UI for user, in percentage. */
-		avg_val = sqd->total_val / sqd->total_num;
-		padapter->recvpriv.signal = (u8)avg_val;
+		pct_val = sqd->total_val / sqd->total_num;
+		padapter->recvpriv.signal = (u8)pct_val;
 	}
 }
 
-- 
2.40.1

