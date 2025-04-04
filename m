Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C497A10A1F;
	Fri,  4 Apr 2025 08:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743754861; cv=none; b=qDebM7ch4gdKJDcqGVYW9hv7o5zB0RT5LR7WD0LxdpO6g+Z9esGhbsvtjXM5FTvdEMxozYtQZ63JIrrVqHfIFHt8KhbbqqDuV8T/DOFifgA7gBt6iAOoN1CkutN96hVFatGiL3B0iRcxlL0iFIBZVyI/Ol5qW2RT10HwSVx/XdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743754861; c=relaxed/simple;
	bh=wIF523BR7ZWB9s9bPU3+WZJ/dOWtjgz9I0IYz1QIIiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QqvCijDir+h+bHGi1AwVRBemSedGlalAGg/P1yFeqe9V5RBrTTaTsXXxTFZ/pWSt7/lvOXn8b2lYEu5nrc+eDLmSp9Aixb5aT1vuROmGWMBWmhzwHgd4CukYQE9VgPr1EukaEPqYAVSEH/V2sNIoGmKpXAgb34xAi4oz5/90Kdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2h5oG8i; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2h5oG8i"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so3170748a12.0;
        Fri, 04 Apr 2025 01:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743754858; x=1744359658; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhUM97i81TLucKbh3HwO8eUS6b7GpEjII2KUINX9Nsk=;
        b=l2h5oG8i6i2IPgRTqLFqTGCwJSplG4HD5HOXMF5FYLLxJo/Ql3rizv7EuAvzpY0FFR
         wBo/RRC4ekGB9SZijNGEnCI+Adbj/iD5mjWyeDX2xJM9rBgnKrpNv6rTuHoDbwo292wI
         gXy48AcrTLzr+gBpodY6UAzev0BWkVFFQvWf3RvLbEDLEJuWfZ6Ms12SDAALTbFfOcH+
         klBjfVXE71BkKP5mikgSo41oqhhENvwpq36TcmuUhjUx/HdfHrz36wEMTJXwq+ICT0Pc
         Bbx9JUcOSNRLD/Kzk7KEgiiTr+T72v1I7ISGDTor8TiHq14sCdqWF05rzVlGvq2ATVRp
         Dz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743754858; x=1744359658;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhUM97i81TLucKbh3HwO8eUS6b7GpEjII2KUINX9Nsk=;
        b=qV6Wz5ZpXhX7RdmAd2Qq/t4aftekh9hynYZE/JLvWgkdwuA36oWUMQEIWzaB3Ij3rv
         ngPXOPDscV/N1Er8fqDcLSyXRZsx6KabS6xIrsZX30I3SVFK0VaxTNqaQlgxprx8C4vp
         4qNL7P7DpZEYriHaubtzpepWJTPaqYbY+AYT9x6dgiOhtfAH2XmHJp5lnANPo+hnsigR
         crCxm0VXoDr/YV6qZIprjriOV4DiHQM9xmrFe5UX7AwFM+WjIxqkpTULmwvcdZiGYo/9
         HVeo+E+vc48eR00AbGgxlSi6l1p9KFy/oQgSF5LurPYGh7xbS9LqoXxr1I+kiKa08F/V
         35vw==
X-Forwarded-Encrypted: i=1; AJvYcCUCOWWdQWEEZlilTjcKERMEj9+Lr+/JT0gCkPVP0hp2wTIB73HAMaDBst1zbykZT2V6L78pHb+dwwY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc3SVWeAX5W+f7ICl7bpExCHeZ7+feAbagmI9JiarCAvmmqDvp
	FThKVEDeHBvmFCTlYoMkmo0Tm/5r6M54VWGpLQYoT2wdke3T+DuV
X-Gm-Gg: ASbGnctdyBNpPr8AihDqHKG7cGRd2YrplsN+JmGMPPfse+YvFrBOKuRYZ6gM9lSmlnR
	mUPtJ984Xi+JQFpzubifN2hhqdj2tCFLtrk1Y9mfaEf7ufi08iTe28IaWXUTrPqC8GUtK38YAGu
	OKAdsjEMpJDJwbHX2PPVG1yDfwj8nGhxgFS3LRAJVzFbJrpdKPLgrVCtZ8jTwogZkI617j+WwaJ
	nCSHhoI/jVRov7j3dmJGivzJYXE3NbuOBV+aP28V3z4O9FQrNS4aDQEFre+muB35t2BIyV8K/qm
	M09W5tvpbIpZYRvdWxJQuQYnTzXMPx51NyliCXxuzXtbXmTv
X-Google-Smtp-Source: AGHT+IEE+qGYF91L1G7WyX/Xu4M0wabQdp1ZelqhnIo9zgbc86xHNjI0nM7t+1w2KmNl8tb0uAKwLA==
X-Received: by 2002:a05:6402:1ec8:b0:5e5:b388:2a0d with SMTP id 4fb4d7f45d1cf-5f0b6576eacmr1582063a12.15.1743754857656;
        Fri, 04 Apr 2025 01:20:57 -0700 (PDT)
Received: from HP-650 ([105.112.123.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087eedf61sm1939768a12.32.2025.04.04.01.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:20:57 -0700 (PDT)
Date: Fri, 4 Apr 2025 09:20:39 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Julia.Lawall" <julia.lawall@inria.fr>, outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org
Subject: [PATCH v5] staging: rtl8723bs: modify struct field to use standard
 bool type
Message-ID: <Z++WV1132FCULn+0@HP-650>
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

Reported by Coccinelle.

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Changes in v5:
	- Added "PATCH" omitted in v4 to Subject title as observed by Greg.
Changes in v4:
	- Added information about chnaging size of struct field in commit.
	 message and why it is safe to do so as suggested by Julia Lawall.
Changes in v3:
	- Added more patch recipients.
Changes in v2:
	- Improved commit message based on suggestion from Julia Lawall
	- Clarity was provided to Greg Kroah-Hartman by Dan Carpenter on why
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

