Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7324120E033
	for <linux-staging@lists.linux.dev>; Sat, 26 Jul 2025 04:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753504424; cv=none; b=TWRXq6C4Y7ah6kuhNuLTSQSMDSW3SXcE3ozLxzCc4HBVZbAnb+9tjx3mzOL7ZWUT6HM8MLlTqnUkqkbiZiTZQU/VxswbBBBFmzr6AX6gwmMj93Kshuc9rXmUVg0XCD4aikE90f3QT18iHDP6ZfAGNKAm6I6rRmrLzsWzipU1gCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753504424; c=relaxed/simple;
	bh=1YE2UOp6wXhpwFE/MVztUoGBMbU36yVaKY1t9lc7KrY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gf9JkGb6TJgJJmh76cRBWrQaD/bOHKhTqbDeTsNS0yOYbq1vb0FsNVoj3GGYkG9nm1YtHrXu66ovoI4wOuVsLjBGa7m8oQPBetZMXjdMeAMxpmFrV9T2PgrCeJPUpVBKk5BzfnQaiLq+oaOnIdgiZ4fgsTFwvCJfPuwxVK3Ievs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWLhTRNi; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWLhTRNi"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e29d5f7672so248363685a.3
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 21:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753504421; x=1754109221; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ranevgSJeBzK24ZwK0Y6Bfek06oJTvOetUee3n/vCQE=;
        b=ZWLhTRNibnhHFy0FYrzQl8s5MDCN59DBuoOqgo5X4t0G8NFHzoP6ckFDoItX8wNzxb
         VnOvnyF1+ynUE+FzDxsOktN/0woYAt18tihkGPZAWALjyc9RZR5y9RAfld5dNxjHCX5g
         IpNq5RMgfw0Qho7Xljsx743ZDG8QjAdxbmK07c5y8MSSRpyfpgWhWsA2TkYVbIHfeWH2
         Tgnhi5OguQ9XXbhi82l8kV3UFyzqGKm7x2vHypgUFNC1AENtXYqZapUUAu4dgHbb1ZM6
         PjHLTucZ1kCNL0QemuhUWkLWbh6viS5JzQ5F/fZU2G3sJW9otJMhmmQ5UzXR75Mt/eEA
         h2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753504421; x=1754109221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ranevgSJeBzK24ZwK0Y6Bfek06oJTvOetUee3n/vCQE=;
        b=Y1/eY+nN9yth35iNrpsv4i1lM1YBcRkioOgHUkoTYOcnfOChTo0Sm69vgBRe/lfEl8
         H2zwFVcdqrkb0/69s5tXldWsStqaNW/wa33sUEO+4L8btWsuNXL3OgQnbQSmWyfX7nQy
         aCFQsUOmPheDtgCU7wYDxURdXAiTtCMXLKy7mOPODP0YRiJ2QlSi+zfKjaYNjG97gN4A
         0zt3Kvj2HxJ41nBZHD+nldbp0h7CgGcSldsc/UavTblBF3RefrAQ8ZchgKmoNdJO2i5O
         mxDDjd4pyKLj1zdJBtY9ShlTot7mUZPb8TO5HE6K3jPme1NS1eDl+lw2UVoCq7nVyDJ5
         uaYg==
X-Gm-Message-State: AOJu0YzzTUkiTJm6/adJnsN6jKWLWXVCmYPkvQTmV2mYEV+Z27b35LUb
	dxJgsSdpM/+7o0BBW7qqyrRLrBOhslJ2d6Z/w3Cn67gRWcA2QzL7oHfT
X-Gm-Gg: ASbGncvEWVSzqKwsjulkyHINHNmHGPlLqxc78YOLbNn8ln+gIKPDAb1TkzIbVezpsmR
	Qf77ha9lOaUq+4kHon9BdLpYWLXPdsvKJZ+lw/WHHcn16f/ewbRbmkrGY0jEQ8liAb8TxAEcWfL
	IxcZFToOxzyULaRILVjK2MGHbPajyHwKNWqATb7913dXKeIIwC3EzxuCn1AWriIw98i6wXneIOM
	b7/iQmL4QSFLf/PFBhf+u9YsVDxtZJWxeR/Duhi+IqtaOtloyP3sK+ch+3bgVIIbzfArb3RGwjN
	zO2GDhSrUNMDFUj/VGinQTQoYio8/P68aoNNfe8UbJ33BrCJvPNxEUXoMcA8OfpuQ+uk/284+F4
	mZXJqxrD+M5vfk5nlB73y7edUiRCya8/KlLIaCKGrNP8Ca35SD10=
X-Google-Smtp-Source: AGHT+IEQhpxP5sR16IKQwYkgzpXNVxpWWrQ4zHrWQnWyvrEu0FMk2B/Vn0y3xpS6mdSBtlKmmVHKCw==
X-Received: by 2002:a05:620a:2915:b0:7d4:653a:e9a8 with SMTP id af79cd13be357-7e63bfa2698mr606426285a.48.1753504421425;
        Fri, 25 Jul 2025 21:33:41 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6432a885asm70322185a.36.2025.07.25.21.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 21:33:41 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 07/20] staging: rtl8723bs: align asterisk in block comment to fix formatting
Date: Sat, 26 Jul 2025 04:32:05 +0000
Message-Id: <20250726043218.386738-8-vivek.balachandhar@gmail.com>
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

Aligned the leading asterisks in a multi-line block comment to maintain
consistent formatting and improve readability. This aligns with kernel
coding style guidelines for comment formatting.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 40 +++++++++++------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index fb1768284c2e..0c985593ff0c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -842,8 +842,8 @@ static void find_network(struct adapter *adapter)
 }
 
 /*
-*rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock
-*/
+ *rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock
+ */
 void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 {
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
@@ -878,8 +878,8 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 }
 
 /*
-*rtw_indicate_connect: the caller has to lock pmlmepriv->lock
-*/
+ *rtw_indicate_connect: the caller has to lock pmlmepriv->lock
+ */
 void rtw_indicate_connect(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -897,8 +897,8 @@ void rtw_indicate_connect(struct adapter *padapter)
 }
 
 /*
-*rtw_indicate_disconnect: the caller has to lock pmlmepriv->lock
-*/
+ *rtw_indicate_disconnect: the caller has to lock pmlmepriv->lock
+ */
 void rtw_indicate_disconnect(struct adapter *padapter)
 {
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -1501,9 +1501,9 @@ void rtw_wmm_event_callback(struct adapter *padapter, u8 *pbuf)
 }
 
 /*
-* _rtw_join_timeout_handler - Timeout/failure handler for CMD JoinBss
-* @adapter: pointer to struct adapter structure
-*/
+ * _rtw_join_timeout_handler - Timeout/failure handler for CMD JoinBss
+ * @adapter: pointer to struct adapter structure
+ */
 void _rtw_join_timeout_handler(struct timer_list *t)
 {
 	struct adapter *adapter = timer_container_of(adapter, t,
@@ -1546,9 +1546,9 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 }
 
 /*
-* rtw_scan_timeout_handler - Timeout/Failure handler for CMD SiteSurvey
-* @adapter: pointer to struct adapter structure
-*/
+ * rtw_scan_timeout_handler - Timeout/Failure handler for CMD SiteSurvey
+ * @adapter: pointer to struct adapter structure
+ */
 void rtw_scan_timeout_handler(struct timer_list *t)
 {
 	struct adapter *adapter = timer_container_of(adapter, t,
@@ -1666,10 +1666,10 @@ void rtw_set_scan_deny(struct adapter *adapter, u32 ms)
 }
 
 /*
-* Select a new roaming candidate from the original @param candidate and @param competitor
-* @return true: candidate is updated
-* @return false: candidate is not updated
-*/
+ * Select a new roaming candidate from the original @param candidate and @param competitor
+ * @return true: candidate is updated
+ * @return false: candidate is not updated
+ */
 static int rtw_check_roaming_candidate(struct mlme_priv *mlme
 	, struct wlan_network **candidate, struct wlan_network *competitor)
 {
@@ -1748,10 +1748,10 @@ int rtw_select_roaming_candidate(struct mlme_priv *mlme)
 }
 
 /*
-* Select a new join candidate from the original @param candidate and @param competitor
-* @return true: candidate is updated
-* @return false: candidate is not updated
-*/
+ * Select a new join candidate from the original @param candidate and @param competitor
+ * @return true: candidate is updated
+ * @return false: candidate is not updated
+ */
 static int rtw_check_join_candidate(struct mlme_priv *mlme
 	, struct wlan_network **candidate, struct wlan_network *competitor)
 {
-- 
2.39.5

