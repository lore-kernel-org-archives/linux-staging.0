Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3D1222575
	for <linux-staging@lists.linux.dev>; Sat, 26 Jul 2025 04:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753504456; cv=none; b=a0cNTklo4dfFcw/sgEAEtA2kBDmDMc1OH7FRD+iKUlzZVWUZe/p1YzMl+mCBHQSYkOsE7j6AJ7K2yWeExuPMS2kh3u138GAu96/rrBl+EcbDAarXQPLda1NtqqzZYonO6BF5g2dvXiceZAsSik74hEPTzKt0xRdZdskQyCgdHe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753504456; c=relaxed/simple;
	bh=A9D78ix7GLbEAqRACr7Ln9fr5ydJNxAa+ETZFuRoLY8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QTogfMZpJNi4gcSdQqGwRxh+xEx+gmWiRI1EbIyJpwkK+4moJnjjr62mqMeVby5AAP9v7NSMnaInnrxZ/457mniZdXl+I3X0GeEKlXmL4+tK0eUqgvCGpu7XqZ3L5WCfEd1Xb0q974l8UHgMyfmxhiwGZETbXEd/LXg/1qDMRQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WowgY7Un; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WowgY7Un"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7e1f3b95449so394342585a.1
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 21:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753504454; x=1754109254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E73v83Bn/ceqqEKIqnNpd+kYBPLgkp0XI+V5cR5WrdY=;
        b=WowgY7Un9RpPCqX237Zhr4N/nQ/DyHWDb/LXtSRTuRUyOiP+e0cqJtIo7VIJ6edE75
         6Ab5qU47lWsvhorQCBddX2H4ez5FQMF7H9KT5Y8PIGf9uYL/QOOpoeWI7E/LMtVj7GQy
         4sXAjWyxQRVQFqcztwExlFHXRcvpSipA4vZh6Qiw1+DqfyFmd/InpLH6D6s5TnEu40M4
         B3BoMecBEnX9o79H4HcWGNmJKyArQcQTLF75ngvcXctpPBHUBZE3Zwsr1DA9dBB10f7H
         zhJITMN+iL4TVQQ3s5saDKG6teRV3YQZ0IxnAeYrpcvZ9EwfcAbjRF+T7lpFCUJHyX2J
         FA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753504454; x=1754109254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E73v83Bn/ceqqEKIqnNpd+kYBPLgkp0XI+V5cR5WrdY=;
        b=Tepl/gHQHAq10z66WpK0RBzsd3CZv1v0dkJ9EaOkr+AzUt36TzgIEM7qAKZAa+L+An
         c89uJ82QZUY5Hg1iveOKs1pthRjVsn38o5TIyf3VMdOQO6zyacNWDX7vrc5Y+merYkQJ
         tz/Cua71/vGx6tdAFKozSDCmDm21Fc6wXZ4n7pUN+tNTzmwaCKaSFBn04HyZhIt3pfHm
         WxISnr6tuIDMujm6UZhLvhIZZsEwjOBqcSAodw5qxGOHbn7YsZXEc143f9CnNFJmjYDF
         /aGpFg9SsA1CGR6v9v2e5mVwc5WNIJ8UNbeO5Aod1kryDaMCTHEjGCLspwXyNhtSk4NY
         Arlw==
X-Gm-Message-State: AOJu0Yy6GdQ35cKEMAfNPvjke0gLqgC8WMhf5rw2aYz8BIqGgHcvxvWW
	eQ6kbNMQ6hLxUPVAZlJSoSEvRppsTYk3DXafhpIjFatk04zhSrGHPSRU
X-Gm-Gg: ASbGncuPs30qDu6CMpdoARhYt2qdnfRqxiVuJvTxGsAevFMDpEtmszBX1exw60eJATp
	0SDP64IS2zYXbttP9DElHGgEmJmWQn9GR3plA2r6IpWgTIhGjz2c5IMAQFpDEhAAxbFAhsV9y63
	drBFKkNhLvD7qrKBbQcp5BzIltG37zXi2LBe75gjnzT3RT1Gu1HIWscBVG7uk+Mn8NX18OXHSoM
	HDzRBrVvHp9g5buA5029t5452SOXUfXIi7uq+c56W+e01zYr+MtIWZ9miv6B8KSpwB6N0oufz3P
	DU4WCApGLWvqURuRfGkS99Xz2xX6zisBjnK1YOEL6jJZgLkf3foryyS778xuFurNBtwwVOJDKa7
	qWMEuJlWc/dZNO3/Emmtx+g0/9jfnm04m2nRPN7QsQMO//Cq0XbrkPXeZ3tEojQ==
X-Google-Smtp-Source: AGHT+IHHjE/vicHbTmy5H0DfyQviy6c6NHPxVnv7m9s0aAmGt/gwdfRLBiwM4RPsHvsWk2OBieK+aw==
X-Received: by 2002:a05:620a:1905:b0:7e0:e2d7:e03 with SMTP id af79cd13be357-7e63ba6f332mr530200085a.7.1753504453916;
        Fri, 25 Jul 2025 21:34:13 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6432a885asm70322185a.36.2025.07.25.21.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 21:34:13 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 19/20] staging: rtl8723bs: place constant on right side of comparison
Date: Sat, 26 Jul 2025 04:32:17 +0000
Message-Id: <20250726043218.386738-20-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
References: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Placed constant on right side of comparison in one instance to conform
to kernel coding style. No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ecb7b3823010..dbaaa2357ee5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -746,11 +746,10 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			} else {
 				if (rtw_to_roam(adapter) != 0) {
 					if (rtw_dec_to_roam(adapter) == 0 ||
-					    _SUCCESS != rtw_sitesurvey_cmd(adapter,
-									   &pmlmepriv->assoc_ssid,
-									   1,
-									   NULL, 0)
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

