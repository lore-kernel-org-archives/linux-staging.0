Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028B5811E7
	for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 21:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708551896; cv=none; b=BnBn4vjfbCZhsdUuewiVWIJhwpg2PbC4QeJ7cb1z5Un8PbZ0sol6VYufG4n5VLquQUrD4Hlhx/xXokYxW5ElUaIC5mFPcg/3ORMJ5suqiDFEWmGlBttY4mESnp10yTyKhp1aMWMxaPVIajtBbTjiF67yB9sufRS6El63SDlCxjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708551896; c=relaxed/simple;
	bh=aA4Gy6/ZaYz4uFrJ/NMt48u1DHVuC+PyHyZgzp065GY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYptzfI2ujvb+EDrMAiiEwfqLTgMzrFzVCIS7vL5DzaGBrlLh1Bli53ZnuftelGvt5KJaDzj9lOI4LqbwX09mxEx+yGaGWbwBEFJ2U1Sp2ijGdZ27Up9p/149ltuqqDPAG/w26Kt18gflSMZa9AutAaefbU8Uzg6cbeD+TeZ6TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSgkT8w0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSgkT8w0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33d817b3c0cso236605f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 13:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708551893; x=1709156693; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lkDHZ0S83xtn+c72wEW0bI98J9xkgLKPq4ec2sPDp98=;
        b=PSgkT8w087K+EpZNb2Tqxrdai7ooGYTw+aFGc0ZHCfGIZ3JAGMjfzzqnGA9k1yPiuh
         hnpT0k21e9R74sAL7Ph4FC9lNyIOYSnhbxtO4DX/FdVFc3+t4psaWMCaWGlA0DhwvAjy
         fCI9pYhNo2CJSzh4D13OFw5WsLgozgwj8yP5wXFfV7lPNm5Mjet/mpwDFClNr68Eqn+o
         7gqi4V4U1vop+IXrMuuriUoeIP0UsYRysdNgLAXzmY/saIGYgHzZUavO6DiwkcLzLqFO
         rRjYxwRMznaEmEbO7QniJR+QKPqHtbN8dsAX2e9k7Ax200Ah79AsqnhqLlJZ0KP682CR
         xQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708551893; x=1709156693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkDHZ0S83xtn+c72wEW0bI98J9xkgLKPq4ec2sPDp98=;
        b=vNI99l5hbDJe2sSTSsmYX22MkTLvjwzmoihLxa+rtre271zChv6nUymlIFMhMA5QR3
         txD97EnPcCdWF2HXHKKluJhWlgPHAeaKA8+zhc4lA1Acf9hQrH3tZcUWpS5DlhccsHAO
         jHQD5dJRTplRM87UzNquPPoyVH7rfaCiDOJHfAfDOT1ABwq9dU3igjvd9wXw4jYTBMj3
         Lg3LLxlz6qKqP76IFo5dtAhsXxqw/d8uxPg+e2yGSHnaw0uGvbVRLRwQkAFSOpb1Oe3I
         J4qofy99eIkU1uDzolywu15El2yQUbuErzf2nEE9g7MSQjlu5EgVvcZ4/cgFgWbwfmkh
         GDjA==
X-Forwarded-Encrypted: i=1; AJvYcCVX79WNn+wX3Sl5U2QUdvgkdxvjVLNICGsnoUHOnXlLtnW2vZtqPxZw7VKoBLUEAsA1Z+Sk9GrkULI6D7dRrL7/CDwGCs457IxO7oHUXQ==
X-Gm-Message-State: AOJu0YwaZNwZxHH+ERgiwMUmTQMQKTYWlEnKY/fWBML2OZsoMTP6UwNA
	yaPnCSBPgCO4fMEATRnoPq1iA6NR8yGZ6Mm3g98WZHrzddqlBIfzL9wArq50/vA=
X-Google-Smtp-Source: AGHT+IEJF23POes/HJ593ZB4NM8Ylgv1aapcgQcDcaOl/NVHEklg1wOcfPg2Bdb8oYt/DPIuYgraNw==
X-Received: by 2002:a05:6000:a15:b0:33c:fa05:68b with SMTP id co21-20020a0560000a1500b0033cfa05068bmr11757428wrb.0.1708551893278;
        Wed, 21 Feb 2024 13:44:53 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id j14-20020a05600c1c0e00b00412680b270csm3982837wms.5.2024.02.21.13.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 13:44:49 -0800 (PST)
Date: Wed, 21 Feb 2024 22:44:47 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] staging: rtl8192e: Remove variables tsf, beacon_time and
 Antenna
Message-ID: <8f400e46ed16ec7a226284c42654855b2aba6502.1708461563.git.philipp.g.hortmann@gmail.com>
References: <cover.1708461563.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1708461563.git.philipp.g.hortmann@gmail.com>

Remove unused variables tsf, beacon_time and Antenna.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 348644998744..945874c1495d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -474,8 +474,6 @@ struct rtllib_rx_stats {
 	u8  control;
 	u8  mask;
 	u16 len;
-	u64 tsf;
-	u32 beacon_time;
 	u8  nic_type;
 	u16 Length;
 	u8  SignalQuality;
@@ -486,7 +484,6 @@ struct rtllib_rx_stats {
 	u16 bCRC:1;
 	u16 bICV:1;
 	u16 bShortPreamble:1;
-	u16 Antenna:1;
 	u16 Decrypted:1;
 	u16 Wakeup:1;
 	u16 Reserved0:1;
-- 
2.43.2

