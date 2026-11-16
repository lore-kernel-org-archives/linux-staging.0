Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829409;
	b=KhODmjzGWpm+Lw9tesxpUMzLbr7Myu9erRcJM8hh882ei01k1qlq1C9kI37XyEfqe42c
	 wesJjtrK6HJdfcIYrNR5Izb4x7xU2V878oHfY7Mmr0oEed65ug3Sxe0gHvkpfe+zmF5Nf
	 faKk7RSeWWZLwFCx5zSLlzGGqk2DVIWTRpSOz1BP+lC+R3iL7R+SRpo/BOIk10Np3P97a
	 uFVV/c6+RAnW++UKu7gjNOFv8sTmYy5sLb+/jpdksPA60dR9jAlztj6r+AUC0ylpjZrnP
	 sccEEgqXQ0oqMOiLZWzDJfqA+2su2aUtNbRkiYZXY38kon+BrVIiabRKj2ln0zi3JLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KTQjOLscv7pBRUr3IFndTok2cp32yKjgkssaNhdisLI=;
	b=4fY2HvJzOqNE3kyaa0pZjLg3cI4n8AQmZecgV/5O+8gxTSBXSCRAuIj+gEFgecVJrgNt
	 gYJTFqv1Rpypj/+v5GCAWqV8wGpCswqrTedjkt/WyybgV+xg8j9XYrY+bmksLgUDRkFuI
	 MMZbJE0LNDqTDgHkO82Hv3ug6uvlR46ot5WFtK4PFN9AMMZwkpftZvmK4l0X61yxgxidP
	 DCj5GuL3oApwHQCg/8ikxvx+3d3U2SC5SoOREmfkiw3naaEMIpHkiGKEo00uzq8hQMvb/
	 XnLChiBNZ0xjBTe4bN28n6KOzJJjSivrBJtaJjcQMdv/vDw3eUC/Ug0nr5HdMg/220w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rxoow6Rb;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EE3606A329
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 11:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73EE3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rxoow6Rb
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdab938dc83so1507470a12.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 03:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794829408; x=1795434208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTQjOLscv7pBRUr3IFndTok2cp32yKjgkssaNhdisLI=;
        b=rxoow6Rbf/HCVK3WJ1JrQrZ/+LjWSSSinX4vG/E7/fRYiblcESWKmIIZ3E8Wf6YlTL
         DELEIqwRWMFU3JgOYdsSEZ5NjL06ngbVdEYmdAM2MDMl/SNX8QnkEKBP0Lwdcmoj7l7r
         //ObzH6NO03Jzfd2jhm3qRbVJ1lRzC5NQa9ga2ISSFmClgk3K3cVCquBN/TY8KfW9RN3
         ZE2YVoxMr6gN9YV6MfsKNDJ2uaep1e0gkYVqt58LIfrYRdkn0awBNIwJ6EsX94YYnjs0
         YJKNDNR1JBgh4RiXdx83fpvyxWZqszwNQWuz3oxlPaf5XtMP6bEYqIk7uylfBo5IQ9zZ
         zcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829408; x=1795434208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTQjOLscv7pBRUr3IFndTok2cp32yKjgkssaNhdisLI=;
        b=hSDix7UwtLxnHdL2HmZq28Xjm5Dinhp9t9sfFa1hcsEksXAcNqtFhFKF1r/HYWyjvK
         QGbnsepNkkSJrGwYilTZXMTqxris5TCznmxMMw8BZQtHHvqpMDqlDn6e+gg/ESYpdWAn
         NeLCYk8vvSg4oFpAmvRFr1nC+S6eFktLaiZCamIq/pi8+Y3DZm7zZyrpahdt/adoLgx7
         f83mzbJj/ZmpopUcssgbV563Els43iB4aUwlqyW++0H9H7P9z86jVTK1v/8XOeTBtMGw
         t7fSY4DBxY3E5/zIZOvHP9WMt7w4ga+uCmbYnCzXOE5bWc4WGtPRNgdrCLlSvcazRHCy
         54Bg==
X-Forwarded-Encrypted: i=1; AL+hErHqFh7hs0yvJw15pLZt3Bo7nDWAJhKAewQkO113mCrH8Cbk6sIw3OTqyd+/DelgqWy57nA+YTReUBPjbtpe@lists.linux.dev
X-Gm-Message-State: APuU4Z+msvtDlqO/cjorzGwaKFAgrDCdl5+9ix23/XgYEyKE9/Laz8PZ
	vgnWk1BFmqi0WtRFhcok2yZDlFiLkRIduokglJIIs46KTRhrqWTXSJeo
X-Gm-Gg: AZFdTZeGRNWFydPnDvNoLWGrTwjPmAx3kse75yKzjwZhetdmqbMf5VLzd12NvwYiGQB
	5y+14V6ltUe71SuEoOBRG5ANRc5KDRzmL6G7qvbVpu3N2KZQJ88nUr+tu+b6yTwjuRXjN2Ec0fU
	1TtGD0yKb4+4/TKT/lvaPIN9qiB6Lf/jJISE7mV1CveqmcwqM3Z8pQnCbqApDva8zHSlSuDQeZV
	1iNuqjUuzeHh8yEriAJgFxaKYP8Omz/1iFPkMookVxhEPsY0U6RM9SpMGAHKcPa+kDB+POudTg4
	hpxrZrJvKlnbPP9do/dD3Xb6KLjrOP0v+RAgFGJvF6mkhQgwgQEfojHPO57LR+ipDrlzcmHGlG+
	pnlDAZesnqFg6a4aoO6VUgvASea4IfZMOGEjvhLSj7X0jf1rjgWZ77BzRGSW2TyXjleUPoSeecb
	pDVqMABvj8Xw+MWv4OrBDVGQL0u3vf/yRuFod6ceCZWm8r9eY0KFpcbXW/fmTWFw1AKSS+IS7NQ
	rNcOT19zDGYDP+YdA6VT2lZkEJEpapv1WTgSI7sI2iDRErAiXweUfzSoVFo0onRplBqioM7qos9
	3nuSIH44nRRD7EsRpW42E3cUFennZpIoBUn5Iys1DH/RcDERx1X6ZcuGysUTrcRm5coUH+jD3Q=
	=
X-Received: by 2002:a17:90b:49:b0:3ac:bfa7:b079 with SMTP id 98e67ed59e1d1-3b1b081bbd8mr9740865a91.7.1794829407614;
        Mon, 16 Nov 2026 03:43:27 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1baaafdadsm14089519a91.13.2026.11.16.03.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:43:27 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH 0/3] media: atomisp: remove unused functions
Date: Mon, 16 Nov 2026 11:42:42 +0000
Message-ID: <20261116114250.6587-1-chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These three functions have no callers anywhere in the tree. Remove
them along with their declarations.

Found via a tree-wide search for functions whose name appears only in
their definition and prototype, and compile-tested under allmodconfig.

Avishek Chaulagain (3):
  media: atomisp: Remove unused any_virq_signal()
  media: atomisp: Remove unused get_sp_code_addr()
  media: atomisp: Remove unused hmm_flush()

 drivers/staging/media/atomisp/include/hmm/hmm.h           | 1 -
 .../media/atomisp/pci/hive_isp_css_common/host/irq.c      | 8 --------
 .../atomisp/pci/hive_isp_css_include/host/irq_public.h    | 1 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c               | 5 -----
 .../atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h  | 1 -
 .../staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c | 5 -----
 6 files changed, 21 deletions(-)

-- 
2.43.0

