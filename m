Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD9B230BCE
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 02:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952120; cv=none; b=MMGIh8YBqrbD4bPlvaJe3kSvKm4hw+dtEhMJeLh7f2mI/r0npa5r2khpwzJjZ9LxCAf3NtYAfzqR2Lp7QzqySE43K8qtplTXJBObkCNecLBZkMTn3l55OgahUL5rG0VClgX8w0ThEB+Ojm9iLXuK0FewdOKOfAXbf6zoOaiSyh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952120; c=relaxed/simple;
	bh=h1Ogs/KI+mapGEJM/7burIP1V8we40RoeBp8e9GSjc4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PuN5fsJO6bD4e0hzeVa+Dm2Pzt6+LIBhkbb7sZ8lGA2VCQ1zNRU2ep3ObHxOhIyeI6eCB6NzhAMjmmvNGDPJvC3fBuuP2mopfGQlY1A84ZdnmO6Gbnhl6hasG4lyIoCyMGeR9rr+bLG/9FyCHefdyGZOnC5hD0bh8rNgLCT9Lo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWKI4KFH; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWKI4KFH"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-720f0dd2809so2621536d6.3
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 19:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756952116; x=1757556916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBZIhFsCm/lIrzVsuaOeokkxM+T+BWKeNExcKXnDrMw=;
        b=gWKI4KFH8W0xYeKhHJU3MNggh3F93UDhrttTA9hqJfvHoHEm3w5XNNEyNZylZt1UHj
         i0KZ8nlA0ZWu8uJUOGhpt7hVsV2kH6mBYwhB/HQYFWvGpP8etvO1AySMhAKwitcIeCwz
         cEEv56+BDzId0mHB4TAMLrcFhq80nW+6Ww4X42BXDyKOu08w8nob6uGJlGn9Sw/T8Bfx
         qbtkSv8TsMRH6Cnvd0Jh0wyI5T1GnwOoaNA1K2x/f9iRj2rx9+zz+tPILijx091ZSlVf
         T+CJE/TZqhUyYQHePOZ6VNxTBy4ICtKD1fp6ANQsnDR6eTzS5dJgguXYOGGU4BDRox18
         1NLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756952116; x=1757556916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBZIhFsCm/lIrzVsuaOeokkxM+T+BWKeNExcKXnDrMw=;
        b=BfZ0nBzAcw1RmrXZavCVnDWmnmjDoc7Brm6+KfLOST1U1/x+n0b09CUcOTllPdunF0
         V+n8lodON+SUCYot+yoVw074/o1DTxc1uG+RH3OuBf/4PtknGvXNwIP/kE4zwgGpiBkg
         9wMvQUwWTVv/pdSLRN6JRNVjOlj1hmve6xnvXumn2ffH6vbPILMDtydHFnmf33RkcQRi
         yZV6Ipt+pnG7N20yEweAUywUVA9EfEY5YZy3/MV3ddBPDsRSDRbOM5Nx/HaJwF8GiiGJ
         icT3tREaHfZXKlEgA+HEENGnueLIwvxCsIWqyNK0Oiz4U3xyVM6iKkYj4Yun6Z3sk2Et
         HHgQ==
X-Gm-Message-State: AOJu0YzthDje7gJWZXgjlMqK8+YqcvxTV8Cl1aWDajvngy++rXK4JaAA
	ofnrVgYYavO6GW0QZlKAygZ9IG7QAN4FlRJ+DoGRbH+B96QKTIz+dI6o
X-Gm-Gg: ASbGncv1PkL0rvE1A7mg+pZuTpkmDjyG+mxESOaZaZ63RnNJXzMUvJYY8sjm6GnzlkY
	EyfFF4IHRtC+Pq471GfSF86EJtjImjfVT8RVQIBaBa8Nm7fHPRgdGmZ3c3bLdBC6c9IkgkL6jkn
	MPoIyyw0Y3sMFG+1MOmtAQ0L9Zp+3WJDmKfjbtoz11kFpJ61rMa81B/NetankJnAvWn5iX5ID98
	szoK7ekLQQim5HMG27cwbIlVAn6h7ypHBOIG8FWsmJ4jHqeXqW4AOsEFosTrbcTWo7I6IsmkIsJ
	YHJYf1btbnpto7wqx27rwa99kqxMAW8JmhMnT9J5z9F7p5+Jig53QhryHptE9jV+1kIR2VseuHh
	kmN7siNiNaYxJKuOBIweQxOKgHt0VAfESPy1yhflBrFocEEQwksc=
X-Google-Smtp-Source: AGHT+IGkOHzlIL+n3sXFU8O+vcWJahFE3ez+2DE2NlgIXaycaSRoKiSm0hUQEiQtWGU8UK4YdVgpFQ==
X-Received: by 2002:a05:6214:dc5:b0:70d:97e7:9900 with SMTP id 6a1803df08f44-70fac96ebd3mr208476686d6.63.1756952116065;
        Wed, 03 Sep 2025 19:15:16 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ad2cb78csm37714076d6.19.2025.09.03.19.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 19:15:15 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH v2 11/16] staging: rtl8723bs: remove unnecessary parentheses in conditional
Date: Thu,  4 Sep 2025 02:14:43 +0000
Message-Id: <20250904021448.216461-12-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
References: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
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

