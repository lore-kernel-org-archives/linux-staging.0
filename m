Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B6D45944
	for <linux-staging@lists.linux.dev>; Wed, 27 Dec 2023 15:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hr8yUjJy"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d408c2908cso11928125ad.1
        for <linux-staging@lists.linux.dev>; Wed, 27 Dec 2023 07:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703692131; x=1704296931; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pjCjvopsMmkUpLDLIhAy1zw+uPNcbrvoa5/5u1pFsD0=;
        b=Hr8yUjJylKFknkGJjQIO8OT0jkKvxG7ckJtunZvRV3vlQbSqZHMPd6c/jdpEz/V+Mm
         jp8kWIvcZxcU/ZVta7mhBkwuYq5ngMsPGT+WY7QbQB6rX30lg9T8Zn4TzMwJ8oaAFtEY
         p2DBU9nhPUJQpW3uanSApdzK+ArcAUHW+c0LVOzf/HEEKvwiA0fOWq2OcuQ5mWXlHuBc
         hA3lQ6uw1/NTG9TrZNM+i2n+mDzZw/uwRIP/B0+dwtHieRv5habDcGTK6S5KS9MDLr5O
         ug2vpxoFS2ZIyRb9Qi1Nl3LZD2q8e6yNp81Dimqo1fRwH8S64U34puRFkms5jQWIO8fh
         wvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703692131; x=1704296931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjCjvopsMmkUpLDLIhAy1zw+uPNcbrvoa5/5u1pFsD0=;
        b=Hf4BmELN0WBqOLiYui4+3wSRzf1V6eUiTruwPdiDeYWW4lLGNHaEtOy3ibZVyWser2
         jhTsqf+7QWiV+oh60SbxNIjWe/9iDgx82tQr6xtFGOEreXIiaaitfd4CA7KGi8sUMJTj
         J+aYcNGdRYbInfW/Npt1sbVqKUrGPizADPEqoIPH2vHFsAuednAvPCtv6E5MzGiIyD4T
         6O57VwiI2XP2tQbeDrbc4p3QqALc300T0qyUaShAZjU3sSFc05C/wGsWoIWdSgfTXL9D
         rDyfLPEDvDbwcfpNlRymT1uAnsxhXNf918548Q7l4RfzOgaLHmW0pn+yVyYNRTTIIZxA
         AUQw==
X-Gm-Message-State: AOJu0YxhA4mwikyTJyp2a4Ka21z0/HLfwoMPAq0mQFG/71kdy7Kz8n6i
	cSAodRRVHk6LwhI26aKTViU=
X-Google-Smtp-Source: AGHT+IErIuK7z+cNQhfvbCTyhrFnvWXpLG430En0nbHissSAMSNx0J/ZQ/N8h0a8jX89+AR+RBLc0w==
X-Received: by 2002:a17:902:dac5:b0:1d3:fb6e:f39b with SMTP id q5-20020a170902dac500b001d3fb6ef39bmr4494741plx.51.1703692131237;
        Wed, 27 Dec 2023 07:48:51 -0800 (PST)
Received: from yqt-VirtualBox ([223.166.246.87])
        by smtp.gmail.com with ESMTPSA id x3-20020a170902fe8300b001d408c45e19sm11725922plm.109.2023.12.27.07.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 07:48:50 -0800 (PST)
From: Piro Yang <piroyangg@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>
Cc: Piro Yang <piroyangg@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vme_user: print more detailed infomation when an error occurs
Date: Wed, 27 Dec 2023 23:47:39 +0800
Message-Id: <20231227154739.6951-1-piroyangg@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

when the slave_get function pointer belongs to the struct vme_bridge
member is NULL, it prompts that the detailed function name
"vme_slave_set" equivalent to __func__ not supported.

it is similar to the vme_slave_get function:
when vme_bridge->slave_set function pointer is NULL to print detailed
function name by using __func__.

Signed-off-by: Piro Yang <piroyangg@gmail.com>
---
 drivers/staging/vme_user/vme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 9bc2d35405af..e9461a7a7ab8 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -340,7 +340,7 @@ int vme_slave_set(struct vme_resource *resource, int enabled,
 	image = list_entry(resource->entry, struct vme_slave_resource, list);
 
 	if (!bridge->slave_set) {
-		dev_err(bridge->parent, "Function not supported\n");
+		dev_err(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
-- 
2.25.1

