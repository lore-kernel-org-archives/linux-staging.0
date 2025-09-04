Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31101F3B89
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 01:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949365; cv=none; b=EMaot6spW7fCyQZ85gGOSMNhKkkbcwpG109GxeaRgUfrNWRWOsJx1CjPynuSjNYTHRNAqQVmBJhSbFYCZ4byc3tKj9WmwyTTZ2xn76zmfdNbi1Db7j4NhsRgnlVGdYkzwJox35BTJiuEbcBHP+hQIjtEgwsSLSyo/9V6CQcZLpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949365; c=relaxed/simple;
	bh=jBqMxmVAmMDEYYiw51Q/Ns7mTaKe1/YemzM5cwPGyQM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RUf8FMxSrjKJslcNVyqBm13NRrNqsBWv3fL7rfDmg1GVR70nZuJOAr6Ft7NX6djzbZKAlV6+uAX9uBKVgNaAoMLViDRggKFGgE3xQJ3YgPl+b+g5udzUGIN3rxQh1eGgihjZsrynC+on8ErAbtMP9MnRwAh3IrTpZadZ0X8FkBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9tln+8l; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9tln+8l"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7fe9eea0d21so59433485a.2
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 18:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756949362; x=1757554162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z93vsxuF9UuLH4nsNHNXy3fXQ+B/Eo/YGql6jpQcpLE=;
        b=e9tln+8lHlXIgoGte+ycwuvQRYkpmk6LQVJ4enQ/EqdYvkQRgEYuvAeyf9yQk+ME54
         AHlTwsH+2K3KJnD11JKMEPeyb/1DlfgJ55+gbRz7OLY33wOKmtHct9MPpohaYBbs3qwG
         lGrNalczB9Ay+BmnAQH0Zy9DHgDMjNgCugvCSeTq5LSFnTJ3CicjRQl3OUGYkPgGNn8W
         jgu+aRtOaxDwzRuXJWFSyygbOA28HX8zxlsOyThsNYS8DFHgfGZ9ZhlR2sDQJwwONtr7
         FDnAEBcvVWlGDoIKRCfBlrPGWE1sMSQhG0RL/cjeh/AoCcXuGMzUVfjPebpkcA+I/e4X
         MJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756949362; x=1757554162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z93vsxuF9UuLH4nsNHNXy3fXQ+B/Eo/YGql6jpQcpLE=;
        b=QlZGk8REby3ruLwqwumGyFLbnblR7TIxes4HqOGN1eeI/mav6enTPVl0wObjp5kzpV
         8trUJo/1WOV+osJAegd3TQwnpac8wzDCi5yZkwZOQcSXhA77y2CfoTwF+IJ+2fCxP6Hx
         kfQVkSNOlvbpKhxKtMcePiVF2yxdYfQc4PkCIJpE9YCzi0Sv+RyK7Uk4q1YOlFTHvVvs
         ZRE08Rb1rmCGidGPcFBozFsW/fjbBHWAsB9aaqW2BhDKoeOEsisGOoU2Ezl0KBNLMIe+
         Tm7CdTrDTDsyb6fIIDM0i5GiEZLlyHjoYpnqpB9ICPzE2vt8xXqW7H51K2b61OLEqNUA
         0SAA==
X-Gm-Message-State: AOJu0YwP1zOhte3yCo0y1rVbnjD2nrvM/DzvgXEflLfrnzdd7Mx8FuDN
	Ud7gf/HhkIf/OncKK/OJ+nNKeCiOGyh5gpr3aa2BsWh+2KdufQ1VJ8Qi
X-Gm-Gg: ASbGncvP3jKsMcHL+BCEoBLuanWsT1ripJtF5UTamUBzYaTqL9rDfLNYW4KTp+fMkPb
	I90aCmZcGPhYXGvO/bythxhckHI0aP72AP/KafIXyzeJ0f/M3WJwmLW0oEqug1OxbXlErSviJ25
	kGpzbuC2quhOXEKGI88GdDGO6XSCGX539gjqB4kiIqILWWN5z/Qav7RNxB96bmL+XjNsrCY2/69
	jv9LUOQwtSLxcaqgAgaVM3AabvmPdXxrUAbSSMwHv4zcY8fav3dVcbEpjYm9QKPYqTdpgnV+mY7
	QC4jcY2MliESGmKnqvxdYXhm/4I6LHP4zs7U81dNRgIc3xCWAgMcorVoG0QUFTQsXBnYttRRhrC
	FdiPO3ErM8aqMsn/QZ9BgCuo8kq1qs1gqO4ucStELWng8J/jJriQ=
X-Google-Smtp-Source: AGHT+IHL5ISs3lk4VpTxVz+4/orKOhI5WA6KtKgm+/luS+ccrNNMAmM8TBZY7qkiFR7fdyCfE31c0A==
X-Received: by 2002:a05:620a:29cc:b0:7e8:23c1:f472 with SMTP id af79cd13be357-7ff26eab1ccmr1820662885a.3.1756949362372;
        Wed, 03 Sep 2025 18:29:22 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f78757fsm20378921cf.43.2025.09.03.18.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:29:22 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH 15/16] staging: rtl8723bs: place constant on right side of comparison
Date: Thu,  4 Sep 2025 01:28:58 +0000
Message-Id: <20250904012859.215565-6-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904012859.215565-1-vivek.balachandhar@gmail.com>
References: <20250904012859.215565-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder comparison to place the constant on the right side, in
conformance with kernel coding style.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 2c34b68f1d60..80b4dd1e8353 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -775,9 +775,10 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			} else {
 				if (rtw_to_roam(adapter) != 0) {
 					if (rtw_dec_to_roam(adapter) == 0 ||
-					    _SUCCESS != rtw_sitesurvey_cmd(adapter,
-								&pmlmepriv->assoc_ssid, 1, NULL, 0)
-					) {
+					    rtw_sitesurvey_cmd(adapter,
+							       &pmlmepriv->assoc_ssid,
+							       1,
+							       NULL, 0) != _SUCCESS) {
 						rtw_set_to_roam(adapter, 0);
 						rtw_free_assoc_resources(adapter, 1);
 						rtw_indicate_disconnect(adapter);
-- 
2.39.5

