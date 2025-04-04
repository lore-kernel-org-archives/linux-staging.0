Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315DD25776;
	Fri,  4 Apr 2025 07:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743753143; cv=none; b=iX4KSaY/X1jY1Fy3Q/CKIINYSmCA5SsTy2lTlJmBk7+k6SLAAZhfLJ42sMeX9zLru6I9NHUO4S9uNTAj3axMMN8gycufwqcDVJbbQvruaSFOY9LWUslNtJ4YEGKTKzFrZIG1h1XOHC2I3C9cY8haadsdPPn+fTOuZvrOf02Gb1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743753143; c=relaxed/simple;
	bh=PUvqvlPxRPSyXrxu0K2XV4no9uI8EXIW+zUgHjQNf14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RwZS912MQuE5o2Gfexv+VW5peAJjvYjvTrDq7KNq3QRWpeN+MlU/x9C/52KNOZrGY8q+4uqrQSTBB5GQhfUYiPKH/uBhsqrxJfn1krLw3P5LpU62rOs4HrKksjdUbVfcJjv+lea4/1OPUaXarXDNu2FVemK16ORRSFb7mnGHevA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T38qro+o; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T38qro+o"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac7bd86f637so276710466b.1;
        Fri, 04 Apr 2025 00:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743753140; x=1744357940; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYCEbsmpkeS3Q60maCjHVoB56blZ91ijmtQzE0zRKHI=;
        b=T38qro+oGRN+9QNHYDJ/+/fN4FnPCFxR0q3CKafqyKme2EPESM5ruANKy7XvyNFS8L
         zIKg39JtvfBS5I5hmFBw+G/wG0yr/sbr9os+OZUcoYLo4L5tYwUqOZ9eEq4YVHzFPVBF
         +Ppg2GhVd28lv3DBxlvj4ez/pM1Jo7TN6RBH8Y9ufIxl4JEKGvi9tm5K7UNgsyq2Hq01
         BWTiLGTZKtzbfAYRrVLeLZ0TWO9TyMajKAxP5g+CFZJoYNwEG3MtDnpAmf3oCShtwRv5
         qtJkLJ0dXyMeaFMnnZlyLjXsiEsVyCvtAQPIE3aPdbLkfURKaBXrTzuwqc4EpBDK+Ese
         CLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743753140; x=1744357940;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYCEbsmpkeS3Q60maCjHVoB56blZ91ijmtQzE0zRKHI=;
        b=aYAUae5ktzCAoFhJ/3C9E65xPf/ruBuH/LI87EKttqh+XqyRHGF5S5KLp/v+s1HbYI
         cRm9viV5BeP+rGC0z2d9RStheYQz9+SrD4G7liqDvhnJrkmc9zb9mkppdzQ8og1vT4lW
         sJwiEzoOXXyUkPQZr8HJlcaSmAq9qDcovKpZhKPqJmJQafMrFalpSR85i2+eVmkcCkoM
         S7+qnFyyyCoPXEj1SQdG+4mkui7cWzSniuCZ+ZBHIWrqWB9fJPyg8cR1CkgjKzP3BhmH
         7D2zPV7AJjBnu+s4IWxeWmh4ZGnnrNIsoBDaUyIxsp8i7InYvLHDZEHWmxp4MHf5T86P
         VWTg==
X-Forwarded-Encrypted: i=1; AJvYcCUwCOu9nzvDDec4HjAEQH/gVtqZT/HvZM9SwUc+nP6J6QbE+66HoVL6CYqtBE+Rb1wFx0pDf4RNPtb/OeoB@lists.linux.dev
X-Gm-Message-State: AOJu0YyBDwapA78KntAk5JoS8mVJBRcNr9K6vQlfzQN3oeLPwdOM93VC
	69jqy3xyLP3yh0u7rGipCB06P1RI3zKgisycaAvqJtmFeCp85kPR
X-Gm-Gg: ASbGncusb8C02UyG07uvGT/Eok3cGe890eP8XWZJ6Xf2zJdHKPjxDcJ+zIaow79zIF5
	OpmLOcIhHYO/rsZtpu9fJ/kq6TPwx4R8qklpcl0CEMjB5yWOHFYL4fY4ei4KOXnet4Wa/bi6F9g
	AGctOoHxu/npYX7s1DdE41oAVj4nvG9NgBUFvDtiYRKtX4LptxhgMyOdHyJ5yccwg3e7X0XcFUJ
	ajkb8ESNHSI4L2Y4Ija1dZLjoelav6pedRDzks+aWfYRAHMuSy3xPG8c1+ynyAmbk+W/3qMtayh
	uCCJ190+Mo3iFxKOmJ7C8WRaD1L+rpjHvL85+RHHT+ZwvzFX
X-Google-Smtp-Source: AGHT+IF7X9qGSvYgcfZKBIkNjGsZ8LP0gsSa+mmiw4Sgg2By0sPj+T5TnGntgva+aPuD0xBUHc57Zg==
X-Received: by 2002:a17:907:96a7:b0:ac6:f5b5:36e0 with SMTP id a640c23a62f3a-ac7b7128261mr570432966b.19.1743753140054;
        Fri, 04 Apr 2025 00:52:20 -0700 (PDT)
Received: from HP-650 ([105.112.123.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c0186250sm205997666b.155.2025.04.04.00.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 00:52:19 -0700 (PDT)
Date: Fri, 4 Apr 2025 08:51:59 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev, julia.lawall@inria.fr,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org
Subject: [v4] staging: rtl8723bs: modify struct field to use standard bool
 type
Message-ID: <Z++PnxFQFe+IexUi@HP-650>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The struct sta_info field ieee8021x_blocked uses the uint values
0 and 1 to represent false and true values respectively.

Convert cases to use the bool type instead to ensure consistency
with other parts of the containing code where true or false have
been used.

This change causes the struct field to change size from a 32bit to
an 8bit. However, the change is safe to make because the sta_info
struct is not read from the hardware.

reported by Coccinelle:

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Changes in v4:
	- Added information about changing size of struct field in commit
	message and why it is safe to do so as suggested by Julia Lawall
Changes in v3:
	- Added more patch recipients
Changes in v2:
	- Improved commit message based on suggestion from Julia Lawall
	- Clarity was provided to Greg kroah-Hartman by Dan Carpenter on why
	it is safe to make the change to the struct field.

 drivers/staging/rtl8723bs/core/rtw_ap.c      | 2 +-
 drivers/staging/rtl8723bs/include/sta_info.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index ed6942e289a5..82f54f769ed1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -389,7 +389,7 @@ void update_bmc_sta(struct adapter *padapter)
 		psta->qos_option = 0;
 		psta->htpriv.ht_option = false;
 
-		psta->ieee8021x_blocked = 0;
+		psta->ieee8021x_blocked = false;
 
 		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index b3535fed3de7..63343998266a 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -86,7 +86,7 @@ struct sta_info {
 	uint qos_option;
 	u8 hwaddr[ETH_ALEN];
 
-	uint	ieee8021x_blocked;	/* 0: allowed, 1:blocked */
+	bool ieee8021x_blocked;
 	uint	dot118021XPrivacy; /* aes, tkip... */
 	union Keytype	dot11tkiptxmickey;
 	union Keytype	dot11tkiprxmickey;
-- 
2.34.1

