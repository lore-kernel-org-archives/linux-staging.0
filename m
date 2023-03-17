Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD0E79C5
	for <linux-staging@lists.linux.dev>; Fri, 17 Mar 2023 19:13:24 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id z21so24298149edb.4
        for <linux-staging@lists.linux.dev>; Fri, 17 Mar 2023 12:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679080402; x=1681672402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0/tOVTwHPYMxKxFkN8GBzVBBS/KLVnVcYggCNSJXFWM=;
        b=RVjSi1xlwcd297KIx/onBcV5sHO7ipIEUYocW6s5jq8wBgoF7WpY3fT0US4SJbZrJm
         lkRUFWPSwqtNp92YqK8FMO5Hycg/irXxfVG4YWNsIZsbKjBvEHNxJfNZ3lLvWFZRBJ4q
         YSOFPhGI6bzwww/0gUS2lWrtQXeBL6PhHwpDaNyj5cpdinc6iuKpcHmTvGrIeDXq9IFL
         oLjSpL11E2RjS8XJe8aWBwi70KmxaYKpzJcD+TMwPMs6tavePcQ8v2pU54phJn8UU0cE
         YiHvY3vuw4p9A+iqGXBU6EHjm0Ya8c/pRtFTAGgiFcbkX3YqFzHfHSJ0SsVm+T0a2OiH
         bh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679080402; x=1681672402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/tOVTwHPYMxKxFkN8GBzVBBS/KLVnVcYggCNSJXFWM=;
        b=5/BpydPcrIZnfvcc2r1egBC4Dj9Z0rByV714QwG4TGdqvYOKxsotLC9QzEaw/RGmRh
         QCJQzbqQ2vUE39IlbRkGOrC4pgblf52qdPZwzHQJPfMifZH+Vc8RK/7aUvy5wSnYQIas
         3Ph0uKvni6Ty5v5DZn2nVrzsvtmQywl5CICb4pE3e0/4gkFdPf1MNCErKv69hp1cu+JW
         Na6EThQThBbno7HCBxghXPDHKnTTcnXP/QCDDKOOn0SZhayNuUZT0qVcd88S5kY5A2Zb
         /RsvE56VNv5Fpby7Cx2fRTTYCZ3tSxMYhc1TD8eZWj3i0C45F1mwOEsl3huA2ORzpgdk
         Bc0A==
X-Gm-Message-State: AO0yUKW/ytooQ9d80RJfcYNIuzkQuPiQvdFgZvn7CkqpUilydmGgOwX8
	5g7iV6H8ZlRBgKn9KSP5PBXjxVqezIU=
X-Google-Smtp-Source: AK7set/NM5I8jwU6OK/iN27zYtM/IBsgcURe652ZEyUFDnx2xN4V4Xgjs4Tqvcl8yhFPoLCqT5TT3A==
X-Received: by 2002:a17:906:518e:b0:929:b101:937d with SMTP id y14-20020a170906518e00b00929b101937dmr6646857ejk.1.1679080402391;
        Fri, 17 Mar 2023 12:13:22 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id lx12-20020a170906af0c00b008e57b5e0ce9sm1272413ejb.108.2023.03.17.12.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 12:13:21 -0700 (PDT)
Date: Fri, 17 Mar 2023 20:13:20 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] staging: rtl8192e: Remove double defined constants
 bMaskBytex and bMask..
Message-ID: <b12364a090a0ff2fd717cfe0e93eefc839cce937.1679077522.git.philipp.g.hortmann@gmail.com>
References: <cover.1679077522.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679077522.git.philipp.g.hortmann@gmail.com>

Remove double defined constants.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index fd34756e450f..498da6be3e4e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -25,14 +25,6 @@ enum rf90_radio_path {
 	RF90_PATH_MAX
 };
 
-#define bMaskByte0                0xff
-#define bMaskByte1                0xff00
-#define bMaskByte2                0xff0000
-#define bMaskByte3                0xff000000
-#define bMaskHWord                0xffff0000
-#define bMaskLWord                0x0000ffff
-#define bMaskDWord                0xffffffff
-
 void rtl92e_set_bb_reg(struct net_device *dev, u32 dwRegAddr,
 		       u32 dwBitMask, u32 dwData);
 u32 rtl92e_get_bb_reg(struct net_device *dev, u32 dwRegAddr, u32 dwBitMask);
-- 
2.39.2

