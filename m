Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5A428369A
	for <linux-staging@lists.linux.dev>; Thu,  2 Oct 2025 17:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759425857; cv=none; b=fWpjE9VLPjAQph4JS89trRAKzbpaOzDUs/IVKCjLJeyx3/FgUNLhul0zjtpATgNzyuWjZdRtSv/P6Rm1k6FOGa7I2BIkAyWBkQCE7JG2W0dm9Y/LWSk65ulojPYEx4wKP9whg2bUUvmdoMmSvr8mijvVFlfeeqkZTbbyF1yIsJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759425857; c=relaxed/simple;
	bh=PDtDyr8IIupAynE7vIrcqsK9hHfnFyukjPp37oDvOyg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qU4OVPF/ptcFWZK3TCtpOImknaxsGT6/LHy9PXBsUY5gTUI8PTmC8hwipIvU83Yc2vu+0w7BVk5muppSNUv8IQdRHmTTOqZCjSqckVG/M4tPe0FKt1gaB4pF9twFvCtxydvCzeLRyxnURyX+WQzfJUyiuR0Gxot8bY7wTUMHOKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLPBqP4U; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLPBqP4U"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4e56cd8502aso12655381cf.0
        for <linux-staging@lists.linux.dev>; Thu, 02 Oct 2025 10:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425854; x=1760030654; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUKn8LT5S2wIt+aKDb8/VF+5KlByoVIfcbDQAP2FidY=;
        b=WLPBqP4UND+Cw15ib/DgmYeYN/nLID40YUZ2JJTceTSygbUZmJ4RR4RO4zKVVPu8tj
         6WFaX7Eepkh0VI1cnjb3nSDBx4zFeoZdBVwQApuAEKLqdZ91ma0kqQxNNv+qP4lCigGs
         AaOuU75v0BkrKnCSnANT4oZJoPNzYpjKAUYexRlStecXoJOkz/RsSEc2m2gce6sjidN3
         UXlCgv+0AoZz5NtyomeWuGWX+pfv1bCtfK5+Nbx0u0Y+ortUit93f/OtnRpa6Nmg1//5
         KoboNcQjfWJ9KDnkpaqzdL+clzKIl/tbIpeVrjwFbSrxEkuFx6N9U8zxAutyN/XQRLlt
         ldTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425854; x=1760030654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUKn8LT5S2wIt+aKDb8/VF+5KlByoVIfcbDQAP2FidY=;
        b=lAokBWGWLD/SdXbx/oPaeMHF4gwQ7hpUjjVz3+8Xcfc6VuOUEOoh10FEea/k4v+H3k
         f0gBZDMOZYcfmu3ytYOc/b3I8wiNd4nRq/hAePpQfOkrn0sNG5V8cYtfysLbvK/WlKxn
         Erti+TBVyKX4sVvqXlP2J+iS5t4WfutjYLm/vQc8pAxReyZX+LEVgcMj6ksxwx0Dx6CZ
         aTA/PyZdb3ofLBBFsTFsgmGiO1NH2RRg0dtx7GJHHR4T/FE2uqAPtK3VytmgwHmjPzBy
         K2vEUosS2vSCMc+HdHirtN+PfRdpbeclgitrRSfVUUxXCjaLHJqYeFxzVG8pgozgcWDZ
         wfQg==
X-Gm-Message-State: AOJu0Yzru1/7wsu7wqf00reZcK+epThqp0LwVPHkC6tRXJ1bdwY7KEs6
	JbgGFPIJSCLVJxLZAr/mU5bIK/OOBdi/Uxl8izYHzRohwyTvA8qXwxbT
X-Gm-Gg: ASbGncvACmqx8uDIihttokM9gDGuTZonsWEoe9acZpQRgdD4jj0YKgIcsyn33jVBHi1
	y/W2r9LjcVP2Bshly6wPKlo4kRNXyd9wR3kBMxOnN1ms3YGXYzVZHCqDZwGbkJhqYyYLawGsa3w
	Mk8uf/PClt0OWKzGG61M+eqnHxIQLPyJdLW+AX2AyrYGQeS8E6ssuCBLWw6zcKuU6C5LUGcwXwW
	r1NMx7SnXsqoVIzbSddcyuBFM7OTMsUjxm5yytyGVN4iwkyXLmirTVtpLM9llB1NAS2KFvP3sC7
	VThMoQgHsHaPSUsfutmHR/TY8FB+YIOhCg2apotK8tgSTeJvtdgWPXvbXAKPDs68W3sA7x+6/NF
	QAQQvbwcGOjkuEklpglmgA0uH6r0gvMaHgk1G2DM5rJ/ZdaNL0zEIkAdOAHfO3UfXY5P2rgcNBf
	h1J9y8yl67qA==
X-Google-Smtp-Source: AGHT+IFIFp08Ap7tHWi5VknBquq7SaJcKzDh2TQQuSw9g0VbvyUapfVdPhU48hZZRJTrV1nOQUyyNA==
X-Received: by 2002:ac8:5fce:0:b0:4d8:afdb:1264 with SMTP id d75a77b69052e-4e576ae6edbmr1225611cf.51.1759425854266;
        Thu, 02 Oct 2025 10:24:14 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55cbd3d9fsm24504971cf.32.2025.10.02.10.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:24:13 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v4 14/16] staging: rtl8723bs: place constant on right side of comparison
Date: Thu,  2 Oct 2025 17:23:02 +0000
Message-Id: <20251002172304.1083601-15-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
References: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
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
index c4d203c824f0..aa842905a467 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -776,9 +776,10 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
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

