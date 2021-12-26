Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ADC168
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 18:42:23 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t26so28332730wrb.4
        for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 10:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j1aFnyHFUtPdBZotM5iBED56xT2FvKcAtJi+DzbG5wA=;
        b=KdpXsUBvXceMlS3BbbivfGX38reWvw/ataU6adl3aWWSdA0MMAeYpnG/EgMZ6+vdUj
         D3HZgQF/Vd2gcjsGO77PDmV5n8e5xQKImGcwlcDDg5EvQNVDH3KIbHD7DdYRuiGDpFql
         1yVswVelaXTskyge3EfGoOQy3NA/lapbL5zCiBz26ycww8I5xpSMZHG/zPGt6Pj2fnYy
         Mbo2Wxa2gH0gyP7hfhzoT34KtMZ9Eg8A/Sc9qEA2qz1oIsvoKONcj75J+NBHOmy3+Bvi
         Lp2S2+cE9RdTRwDMR1c/gbscYQbR21JD0pwtnow/a0Dqs9fbVAbHndoSyP+cb2etQTL9
         bPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j1aFnyHFUtPdBZotM5iBED56xT2FvKcAtJi+DzbG5wA=;
        b=iZMmiPupBeDgpPKSTHqF8gc+N9i9Nc/qGgZyblnJrvjEeupLi7QcAUX9PBtv3Ujr7c
         XtS1poryQt1k9vvZMKuSdJ4aWVmL2z8ccCddDyuz20YurOWQLu2HEpgRVjtc+r/DHo2t
         22PJaHI9c5hqFAydJ/uJkYLDJp00GWv9SCJYpzkI7vy7tXoMX4i+rhZ28lIOi2ZbxSII
         nAQI/OFsulA76mkTHgqm0RRfgmm3eiCRIdficcQkrphrGt7EQCGe9Uq3gy5PoVxqOgbL
         qckLomWKIp9gU3/rtO8cIJ0z9f1/ASte6CXQCqIOQg5bY84Hs8hf7PCfKsCJPagx766f
         f4aA==
X-Gm-Message-State: AOAM530Ss5fb6JmWmhHbm0n8K+/bxBghzh54C4lQBK9yq5k9Ol3S/5qa
	UKxW0mGp+RVPZWBuWvPj5y4=
X-Google-Smtp-Source: ABdhPJwDY7Ucruwn5gzXi8gy4EPXbNU+4YBcDRBXoC7wULgEfe0NyHFGWdiUFjJPpEF7NIfueAB1Rg==
X-Received: by 2002:adf:ecc3:: with SMTP id s3mr10351148wro.713.1640544142264;
        Sun, 26 Dec 2021 10:42:22 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::abe6])
        by smtp.gmail.com with ESMTPSA id u10sm13809421wrs.28.2021.12.26.10.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Dec 2021 10:42:22 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove GET_CVID_ROM_VERSION
Date: Sun, 26 Dec 2021 19:42:17 +0100
Message-Id: <20211226184217.9726-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro GET_CVID_ROM_VERSION is not used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/HalVerDef.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/HalVerDef.h b/drivers/staging/r8188eu/include/HalVerDef.h
index 1d96657e6a98..62b94c993f0d 100644
--- a/drivers/staging/r8188eu/include/HalVerDef.h
+++ b/drivers/staging/r8188eu/include/HalVerDef.h
@@ -35,7 +35,6 @@ struct HAL_VERSION {
 #define GET_CVID_CHIP_TYPE(version)	(((version).ChipType))
 #define GET_CVID_MANUFACTUER(version)	(((version).VendorType))
 #define GET_CVID_CUT_VERSION(version)	(((version).CUTVersion))
-#define GET_CVID_ROM_VERSION(version)	(((version).ROMVer) & ROM_VERSION_MASK)
 
 /* Common Macro. -- */
 /* HAL_VERSION VersionID */
-- 
2.34.1

