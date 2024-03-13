Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649D912E76;
	Wed, 13 Mar 2024 06:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710311846; cv=none; b=ngRTivm9bBaWRiMnGZ6gh/V6/0Gu5/z0gZH+bzv6jh+Q4IXqCtUSXN7kOBcIo76ct0KIWcx2wSi/NHDeCkxXQsaVEXevUxMYMYbL214ukavT34dH0zifIRmKK0lTuBljTALgO4N1FTaltfZYf719ujQr9kgf6ccE3u2CWzlAtM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710311846; c=relaxed/simple;
	bh=Or2WBw6YX+IV5xSEQOQCL8yhX3fsths6Q0NUzC55HSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bu49rBCd1wygWzPNZMTmxURy7llhmUh2s7Bfvr1/sOlzJ70I7fanan5fEN/Q5KbQkU1J6mGI/ipdKFusxetkDK6GlVxEopx8Qloljz28IJ/c3Ys60srHA9uKq2CDeIGgvbniP/DX3KXG+Zm1+aSAkL6peZviCbKHUZt33BQz4LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3I3T63m; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3I3T63m"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1dda8e5fa8dso20895625ad.2;
        Tue, 12 Mar 2024 23:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710311844; x=1710916644; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XMaXmk4HmWbUzjVR3qh9Tt2QkYGm0OxfkEbHr+IeT1o=;
        b=U3I3T63myjLHFJy2RMoGuYJTuigbLXFRS6noyHLXwZrYK/Y9W7DdqVFDg4mdnsTLNT
         iqcuBVGY+6tkjMhfu0AZXkGq2YLYzQU4NLZaYrplRGuhCq8qaqZK+RGKPFzl89MH+MqO
         q9WBWCUVZAr02PLH/iySYsQHBRlKYhkqShlecOqb6kTnserNQpJJMFlkHRtYA5btoJ8o
         CIVSTOA7vcK1WQsNYdbgsdtT0fivX4YMM/3ts3eYOQVMqjgy5dSZiLnnroLPtdXFNtF6
         nBdUcL3xrpasZbmCvNQYScp8wJFMms0NI4/OdoIQhyM0aYxP/baZdlP5yz7ABbosvs+C
         DWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710311844; x=1710916644;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XMaXmk4HmWbUzjVR3qh9Tt2QkYGm0OxfkEbHr+IeT1o=;
        b=Saoy8cIpYYOorEsWbDXIZds+RIYKLHSQlZG7Y4HjqA22uiQdN9wBFtFfSVErSvnTxt
         OqNvb6drlmfV5CFKg1V1voxRlGj1BUYGGHx6VwnCenLYV7z8Pj/2Iznd+Xpf2vrm5oQr
         rUi9uKBh5E3u4WM4/oatmv8jHvgFLj0X91esK/TTtGRbMtnUZ2OiwoWJ1blUPRToVyUt
         RM2vtfHRgg79jMLzixgP0MrpKklSKf9o4NOn8U5w7qOQVvNvsWamgfS4n+nw2Qy5y5XM
         fZwdVI40zugD7zzmSfpBd9UuqM0lqVj5B1W5C3c0T7UMVD6/3oea98FyR1c1JdufXJy3
         wj2w==
X-Forwarded-Encrypted: i=1; AJvYcCUlRSgivMtqG4/GjStXMKr3vIwWeWS15/pnZPX0syyLK73fdmlQ93au6bi+zVPKpieFDOzmmd19CUNXYCu6u5nk+N4ufFsrmXfp9d4Ygw==
X-Gm-Message-State: AOJu0Yxp0XSa0PeAVMEwFGyyihIhxmhEQVDTj1EPGfuh9hPgpO7juvml
	9/0Cp5s68GO1Jmzd1A/p3A1xppKVDeEx3ZyO9/9SSQulHwWzUrSGt0PYPIY7SfM=
X-Google-Smtp-Source: AGHT+IHSBF/+uzvX9U2ZYfAO+2838arE+6lGwa1EqQmBoQnYcSrzbS1DAOthlhWvDqnPpZ8pPal/0w==
X-Received: by 2002:a17:902:f689:b0:1dd:9250:2d26 with SMTP id l9-20020a170902f68900b001dd92502d26mr11241330plg.47.1710311844309;
        Tue, 12 Mar 2024 23:37:24 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.67])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902d50800b001dcb18cd22esm5828256plg.141.2024.03.12.23.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 23:37:24 -0700 (PDT)
Date: Wed, 13 Mar 2024 12:07:21 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v2] staging: rtl8712: rename tempVal to temp_val
Message-ID: <ZfFJoZWURDM+Uin4@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename variable tempVal to temp_val
to address checkpatch warning 'Avoid
Camelcase' and to ensure adherence
to coding style guidelines.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>

Changes in v2: added a period
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

