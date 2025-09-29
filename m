Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27672C21D4
	for <linux-staging@lists.linux.dev>; Mon, 29 Sep 2025 06:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128655; cv=none; b=A08DAWgq1NLpRcf3z1rqzpdYInKgU3M3sngZjQ56Q0n8gDTEc9Q6sdW4mbeVDxt2TAB6ECWgdnLh+77Xs5zVIJA5ZYZurK0E0SK78dExqiMM8PRI8SDYCvNRkHl+rGmSdjCqzqqeVpIfWIoXfj3ntUCcTBwYkQUk3ICyqSCQfHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128655; c=relaxed/simple;
	bh=h1Ogs/KI+mapGEJM/7burIP1V8we40RoeBp8e9GSjc4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ElPhwMeLXFQIJr3Icvx+WZN8GZ8yHSwGILBRFcbDJpCAiHvxe6LijVi/0FZYtzqIUhavhkIEbGNWxNPW3b6YmLSaI3eipOSOpItU9kla8RxZxiedoLZtwuA5NoyxEC33L6PDa+4G2OeZiqyaEgmCxyR8z2MX3kEn1bMtu1oXZfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lD4m6Pdx; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lD4m6Pdx"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-859b2ec0556so433010385a.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 23:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759128653; x=1759733453; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBZIhFsCm/lIrzVsuaOeokkxM+T+BWKeNExcKXnDrMw=;
        b=lD4m6PdxXegi1NSjakZMc4QU5T4wHtLY425zHSqjspokcyEA+Y0v41E++Zfj2ZBack
         01W10Yh67oW1pLka1rkYJit87bu1gmqkHJMzB7oxferw1sX4Tt/INqYws+qK7zuSYFAf
         pXr+HccNYnXC5/P8HU/hTfRgbM4lntmdn3FIEHOS68VdVZCR1CdDBSV3EHflAaQpadSV
         JeiU53PiGOhMHdPLqSwetP664Ur0emxK8ibR/TSjXOC6ayMA1jVk3QoN/+1Eg6lcvTSE
         WN0Gm142sULB6nqwV0q2g00BCVuNpO1054DM4HTHG7LJcbgbw5BJnpveqYLkRJ4Zwq/y
         rCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759128653; x=1759733453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBZIhFsCm/lIrzVsuaOeokkxM+T+BWKeNExcKXnDrMw=;
        b=fiSFkZij5sXD1YBDaMAeu2qT3UuzvsAblWpjWIOBpfQkd0ai7xQuXgBeXidQA0Kq4y
         JkfzhuXxfv/p88hp61QCK13EhxX8kea/gcOwUaCyjIqsh+xsoQPvMTLksBqAr+ODW6ns
         90oW1ppxk6MEAkwf7F7fA6hJgN0CwjZ+df9fHyHrS6Whfvb4AdhP2ICLLt5MFsPn2Y3w
         Vt1sH2D0WZjuIYv7Ca+Fd8QSoBhTeapK32d/ko5FgC23CGPjvtPniZKTlgka9OtEfZqi
         8FFtS7BFbsV6sSbdbSqG074Pw7Kfr9rMjgd8vpqT644Sf00uexuoyur8098Rhzzb/v2Z
         C3Ug==
X-Gm-Message-State: AOJu0YxT5bag+CAsd4UtOFAn413hp0vffc44YOW4UJTf/ynIkyhpaZlW
	dTaoSpbABxCYd2uIyf7fumqiuYgT8DJ61sQ7NW7pTMerI6Vf1BXvFD0XHwEM4A==
X-Gm-Gg: ASbGncuXbcmUhtWn8ufOSUThlQuT0Pw6tPSPyjXW4aMV+pMzbOeVhOTL/mBktmcn8Z1
	UZWMkDGFN6HZkmksPxAqqLs9u5O0IuubIVzt6iYEUMVvJEGoIblkYUuOfC0MJstSEp6PRa4xxRQ
	OGuvMeOKeXTQg7Cpx5OvRMJKhmMUiN09+qlz+wKLUwrA4z+J/f5M3Sq5JRnnSK12qOFva23Xx1g
	d0WPIMQ0Yw1Rvmcf+AscVWPQ+4sE/vHSjMNH+mBSkZeLvRCb89oJ5M/qNx992ee+RPXr9RNHgz0
	DTVfz8yNeo73mNFgLYGjaPOuL5PT7BAVEhuA4+coW+IBxbOGoO6hVM24AhRJ2wDI9uKhPxuU6Y4
	9JokJ5/ettOEjHnnlUUcKXWPQCVVOw0BTKbvG26agNE8fClSR2jHVklvpXVma5g==
X-Google-Smtp-Source: AGHT+IHRf9bRRETfP3zaBeMX0VuK6ls8dNMtBz6nnwSYXGmTkR/7gI32pW/5F2TzES/+86UTx18tJw==
X-Received: by 2002:a05:620a:444f:b0:848:a4b7:cb12 with SMTP id af79cd13be357-85ae0ccdb07mr1877843685a.25.1759128652684;
        Sun, 28 Sep 2025 23:50:52 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db10874bb9sm69517671cf.24.2025.09.28.23.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 23:50:52 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v3 11/15] staging: rtl8723bs: remove unnecessary parentheses in conditional
Date: Mon, 29 Sep 2025 06:49:56 +0000
Message-Id: <20250929065000.1010848-12-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
References: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant parentheses from a function in an if-condition.

These parentheses are not required and violate the kernel coding style.
Dropping them simplifies the expression without changing its logic.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 050fc54e251b..ef9057456768 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -730,7 +730,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 	rtw_set_signal_stat_timer(&adapter->recvpriv);
 
 	if (pmlmepriv->to_join) {
-		if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED) == false) {
 				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
 
-- 
2.39.5

