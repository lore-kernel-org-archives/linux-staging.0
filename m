Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7942A20E31C
	for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 23:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769296596; cv=none; b=HSUXC/f3GH/znhQUxP3IEPgj7NUlyYZo8hggaIV2CD8zshYol1AcfHFyqs2lTCv+7tNlRFn517MVJH9gHtRcg+PHPuLItStSCbVb7mlZ8hJ+R90fcCvcy47AWGgzPjq6hb7wIeVFvCfYAA0op5eCFtobPuxGdXtmuRBtI9AYi4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769296596; c=relaxed/simple;
	bh=U6FV6OT4PQiRUm56Inp6t+K0+Sfwfg2FDQHxXu3MNqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MpRcubKM7HGBTWvEN7Zq3XYt/FXfZmT5xO9S8vweULCpnGjovDPerBS92mGU53lk7ozrTmKbwxTpb3lxjNmZpSFzg9nLXI03vEn5zO3b0UWo7FoQBxv6hvRDC1pVD2zGz++UGh1XsadVjEDOwgCfYBmdSEuYoz1XMQGod1nGtVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRBZvDMO; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRBZvDMO"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82311f4070cso1345790b3a.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 15:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769296595; x=1769901395; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbclRbs2OCY5aHAQmtuF/u+yZH9sZhj2+wmsuH91wSA=;
        b=gRBZvDMOjQTs7KdzKSK4n1Hrnae1ahf9hE0csTn0RYUsFbUZ/C0dPF7W5W5QlVHxQ+
         re3qKtpwR2qcE5eKqrrLOU0vQ35Dk3XjP2gDJYpKf3GNUWbfJ3TPTFAbXunwmAI4JKek
         2cQCcBy4DnlxAFP7LOvz6cR+vLX6oWNfeRJHxTLTNXBRvemNm8WFEPGvrGaCsEQRwEtb
         1AayBC6qTpNvNDqtYt41nHm6HkgjBc6kmSezPs1JhA/syGr1vmdPP23HqNFrGL/DnVyW
         K+C+YHB2kVG0lj1P7BDvztPkYQ7IUYHR+Yr93Hof2OPAETfpK5qgkTrzKklnAVvY57gy
         bafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769296595; x=1769901395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dbclRbs2OCY5aHAQmtuF/u+yZH9sZhj2+wmsuH91wSA=;
        b=TGiaEw3aEIeMx8ZVlPKiNHn06lkPY6d60wuhIlcQl/i79JtvnYNhsZhd3iD9h9EZrc
         6U0KT1yjlBGJ4Ow0nhcm2XFCUUf0IGkUVdV9u0ynh+xCriURySe7iyfI3XFUFOmMdbjp
         1FmWK5usWIrRGrKdrhXR2ORddOjJKHXbAZo4KdWwFpR8ivIeeTjSBX5LmwxggFH1F79y
         KcztdGOKpYtqqVoKEeJ/r7F/9DwXdCA8yhc/Pey5h7nweyghzOn6lm9Pqw4e5crOP02R
         4f4WafwM9gYJkG69JnV7TyXAKzltBWLl0h8mNYPpvRtYkWrR586K2geJzqEvSNsu9BRt
         69/g==
X-Forwarded-Encrypted: i=1; AJvYcCWNvvsUPkJzupRkTHBzd+fFcyJodMuLBNUFcr/H2x2Ks1r9txxSWEVD+v4CpuuvCYdIU0rnHu7/R8hN1C2r@lists.linux.dev
X-Gm-Message-State: AOJu0YwMn046rV1ucwz/FEIqUKtoqCiauUEmSQf5hxAgPhJwTOkFiKMb
	UEp63OKgZzQ+ZgMcZ28cz/Q0fj85ThNqKrNO1dHQUgrPg22LOCmPCarc
X-Gm-Gg: AZuq6aIfpd8/R7JgXNdlSBguzrSfifuOUIaJy31V+YeN5Bc7Uc7kH3qEV2DOExEG25d
	2YwK4nZJco3/zi/o8VkCs3CKrPpZUdFdZGAVsE8QIhLl+eCsNQAdH8t9Ih+c3XJZDHqxrYsXl9s
	fYUYMjNe/MAAIuU+Rulu15gW1nCP9Rjt1dUWtnXhsvorBwOPB0SZE6RxNPW+TE4K+9RK5kn8qbI
	B+RaeMPKzsimMkb3XcsEnbtm+RFqgepYrThgqNd2Q46MzDGr+c42QwEtyVuVu04fKI7SE/3dKDM
	XXAYirC6hb/K/5QqtobPO88DIGZRqsWMwHXpXyfSAJTGM/aB9dvTZQYIp1jAhN/IGt14iFycXRO
	3c3opoL0L+f9MAhwuTzsMLFDryawczxbf7KjOYVXllLehp0bLbPp+xs7twiou0nbSdtXI+wAiPZ
	+IAKWb4j6x0T1dbSVpw1KNlG2e8p0Htvnmiq99FH2ekpM=
X-Received: by 2002:a05:6a00:929e:b0:81f:c6d1:5608 with SMTP id d2e1a72fcca58-8234114e209mr142781b3a.1.1769296594722;
        Sat, 24 Jan 2026 15:16:34 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873bf53sm5604506b3a.45.2026.01.24.15.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 15:16:34 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH v5 6/7] staging: rtl8723bs: remove unnecessary braces
Date: Sat, 24 Jan 2026 15:15:56 -0800
Message-ID: <20260124231557.18189-7-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260124231557.18189-1-tehsiu.huang@gmail.com>
References: <20260124104920.5721-1-tehsiu.huang@gmail.com>
 <20260124231557.18189-1-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove braces from single-line conditional statements.

Signed-off-by: Michael Huang <tehsiu.huang@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5277267e9ef1..4ba4f85be02d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1120,11 +1120,10 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 	pstat->flags &= ~(WLAN_STA_WPS | WLAN_STA_MAYBE_WPS);
 	if (!wpa_ie) {
-		if (elems.wps_ie) {
+		if (elems.wps_ie)
 			pstat->flags |= WLAN_STA_WPS;
-		} else {
+		else
 			pstat->flags |= WLAN_STA_MAYBE_WPS;
-		}
 
 
 		/*  AP support WPA/RSN, and sta is going to do WPS, but AP is not ready */
-- 
2.43.0

