Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A17173
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:24:15 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id o6so139608587edc.4
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6PIrQPLzzYrXHWeVd5lSUKfGhD6kFJ1ANBJzthJuRKE=;
        b=pFyJ5F3YSvW17gT5flhVS1xG2IuU2rByEkK7eH7gwYLqQ0bFvr7lY1i4UFx5LLAlrw
         PaCkNnGH0ycEtSrz/r3LsWbjDhlAgOIsWz0NzYLF2vzKjO6fXdnNkndkk0iT8qxRHgWP
         akoqUv/ywhrV3DMxJrfN5yXExI8tuoq50JkXcHJIGIKabE5KirestuZMxB2IeRxyHq1Y
         jKb66ks3kgLraKOCYf6qYES/WjSr6WtmH4oIJieWE64zyLHzj4ILmFt3ZqqlA3kcI+3W
         RjRvj+y+okAfwO/B3QpgV/PBZc58/ubi6g5Nzg8UvkKX9e7GL6npCMIL1hTNiQaD7mc/
         Y2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6PIrQPLzzYrXHWeVd5lSUKfGhD6kFJ1ANBJzthJuRKE=;
        b=OZ0Y8tI2y/t0BPiugagfHrceaToLyefiCx5yQUXN5/NfFcXxr+u3EbrDjvkYEW2dgK
         ULvzjsDPYzAbLERSbZGkol5cp2OH49K8+hYeH/9XeaklfVMfQCAM2AIVTVyoEtoKuPcV
         sqSq+Cf8wveJ+KUZJ2B1wN3qzl/OxLyflsNPb4SRlHetbVlvUxu/XrgMK7P9smEl2MUf
         PdKIfmUiug6fXwtWXcEsa9XSCnTUWFV43NrT/z1pqefLT+t0np0TD3iITS8OBZInlxcQ
         E/yMJEhuFhiMoJq3ScboweA0t4AMg3F+X7vctvU6Vblf5hwlzE2xhGro2cn78RR7J7sE
         YZEA==
X-Gm-Message-State: AOAM531/tJL2tGFO4v5oHkWFFSoopxLjnRl5oH508dm6N+uJYIQ2BSj1
	VFKuxRkeN1Q8lv8bfTyqyew=
X-Google-Smtp-Source: ABdhPJxg1ql5yWvyb5n4pZyLpfjqU2vahADqYrA3AX7cNblIOa5UDox8zogzbYwkDiPywt7lCPtx9A==
X-Received: by 2002:a50:e608:: with SMTP id y8mr45050974edm.39.1641237853525;
        Mon, 03 Jan 2022 11:24:13 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:24:13 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: 
Cc: alb3rt0.m3rciai@gmail.com,
	linuxfancy@googlegroups.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 20/56] staging: r8188eu: remove dead macro ClearPwrMgt
Date: Mon,  3 Jan 2022 20:01:55 +0100
Message-Id: <20220103190326.363960-21-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
References: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove dead macro ClearPwrMgt.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 10f7c2b6e138..c6b9cd37219a 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -190,9 +190,6 @@ enum WIFI_REG_DOMAIN {
 
 #define get_pwr_mgt(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_PWRMGT_)) != 0)
 
-#define ClearPwrMgt(pbuf)	\
-	*(__le16 *)(pbuf) &= (~cpu_to_le16(_PWRMGT_))
-
 #define SetMData(pbuf)	\
 	*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_DATA_)
 
-- 
2.25.1

